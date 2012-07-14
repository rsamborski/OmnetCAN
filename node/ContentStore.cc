/*
 *  ContentStore.cpp
 *
 *  Created on: 04-12-2011
 *  Author: Wojtek
 *
 *  Edited on: April/May 2012
 *  Authors: Joanna Kaczmarek, Ewa Kaczmarek
 *
 */

#include "ContentStore.h"
#include "map"
#include "omnetpp.h"

ContentStore::ContentStore() :
        msgContentLookupDelay("msgContentLookupDelay") {

    capacity = 0;
    curr_counter = 0;

    //objectFrequences = new ObjectFrequences();

}

ContentStore::~ContentStore() {

    objectValues.clear();

    delete[] msgContentLookupDelay;
    delete delayMessage;

}

int ContentStore::getNumberObjectsInStore() {

    return objectValues.size();

}

//void ContentStore::removeObject() {

//    ObjectFrequences::iterator to_delete;
//    ObjectFrequences::iterator it = objectFrequences.begin();
//
//    to_delete = it;
//    it++;
//
//    while (it != objectFrequences.end()) {
//
//        if (it->second->getFrequency() < to_delete->second->getFrequency()) {
//            to_delete = it;
//        }
//
//        it++;
//
//    }
//
//    EV
//            << "###### Object #" << to_delete->second->getObject()->getContentId()
//                    << " has been removed from store of #" << getParentModule()->par("address").longValue() << " node."
//                    << endl;
//
//    delete to_delete->second;
//    objectFrequences.erase(to_delete);

//}

void ContentStore::store(const Packet* packet) {

    emit(csDataStoreSignal, 1);

    ObjectValues::iterator it = objectValues.find(packet->getContentId());

//  if (it != objectFrequences.end()) {
//      ObjectFrequency* of = it->second;
//      of->updatePacket(packet);
//      it->second = of;
//  }

//  if (!addToStore(packet)) {
//      emit(csDataExchangeSignal, 0);
//      removeLFUObject();
//      addToStore(packet);
//  }

    if (it == objectValues.end()) {
        // package doesn't exist in CS yet

        if (objectValues.size() == capacity) {
            // content store full, need to replace content
            emit(csDataExchangeSignal, 1);
            EV << "###### REPLACE DATA" << endl;
            removeObject();
        }

        addToStore(packet);

    }

}

//Packet* ContentStore::find(int contentId) {

//    ObjectFrequences::iterator it = objectFrequences.find(contentId);
//
//    if (it == objectFrequences.end())
//        return NULL;
//
//    ObjectFrequency* of = it->second;
//    of->incrementFrequency();
//    it->second = of;
//
//    return new Packet(*(of->getObject()));

//}

bool ContentStore::check(int contentId) {

    ObjectValues::iterator it = objectValues.find(contentId);

    if (it == objectValues.end())
        return false;

    return true;

}

void ContentStore::initialize() {

    capacity = par("csSize");
    contentLookupDelay = par("contentLookupDelay");

    delayMessage = new cMessage();
    delayMessage->setName(msgContentLookupDelay);

    dataHitSignal = registerSignal("dataHit");
    dataMissSignal = registerSignal("dataMiss");
    dataAllSignal = registerSignal("dataAll");
    csDataStoreSignal = registerSignal("csDataStore");
    csDataExchangeSignal = registerSignal("csDataExchange");

}

void ContentStore::handleMessage(cMessage* msg) {

    //if(strcmp(msg->getName(), msgContentLookupDelay) == 0){

    if (msg->isSelfMessage()) {
        if (queue.empty()) {
            return;
        }

        Packet* pk = check_and_cast<Packet*>(queue.pop());
        //emit(csDataLookupSignal, pk->getContentId());
        Packet* pkFound = find(pk->getContentId());

        emit(dataAllSignal, pk->getContentId());

        if (pkFound != NULL) {

            // package found in CS

            pkFound->setHopToContent(pk->getHopToContent());

            send(pkFound, "out"); // wyslij przez out na storeIn do node-a
            emit(dataHitSignal, pkFound->getContentId());

            EV
                    << "###### Package #" << pkFound->getContentId() << " found in the content store of #"
                            << getParentModule()->par("address").longValue() << " node." << endl;

            delete pk;

            std::ostringstream sout;
            sout << "Data packet #" << pkFound->getContentId() << " found at this node" << endl;
            if (ev.isGUI())
                getParentModule()->bubble(sout.str().c_str());

        } else {

            // package not found in CS

            send(pk, "out");  // wyslij przez out na storeIn do node-a
            emit(dataMissSignal, pk->getContentId());

            EV << "###### Package #" << pk->getContentId() << " not found in the content store." << endl;

        }

        if (!queue.empty() && !delayMessage->isScheduled())
            scheduleAt(simTime() + contentLookupDelay, delayMessage);

    } else {

        Packet* pk = check_and_cast<Packet*>(msg);

        if (pk->getPacketType() == PACKET_INTEREST) {

            queue.insert(pk);

//            EV
//                    << "Recived interest to check for data with id of " << pk->getContentId()
//                            << " in the content store. Checking." << endl;

            if (!delayMessage->isScheduled())
                scheduleAt(simTime() + contentLookupDelay, delayMessage);

            return;

        } else {

            EV
                    << "###### Adding new data #" << pk->getContentId() << " to the content store of #"
                            << getParentModule()->par("address").longValue() << " node." << endl;

            if(capacity > 0) {
                store(pk);
            }

            delete pk;

        }

    }

}
