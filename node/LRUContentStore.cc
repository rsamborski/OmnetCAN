/*
 * LFUContentStore.cpp
 *
 *  Created on: 04-12-2011
 *  Author: Wojtek
 *
 *  Edited on: April/May 2012
 *  Authors: Joanna Kaczmarek, Ewa Kaczmarek
 *
 */

#include "LRUContentStore.h"
#include "map"
#include "omnetpp.h"

Define_Module(LRUContentStore);

void LRUContentStore::removeObject() {

    ObjectValues::iterator to_delete;
    ObjectValues::iterator it = objectValues.begin();

    to_delete = it;
    it++;

    while (it != objectValues.end()) {

        if (it->second->getValue() < to_delete->second->getValue()) {
            to_delete = it;
        }

        it++;

    }

    EV
            << "###### Object #" << to_delete->second->getObject()->getContentId()
                    << " has been removed from store of #" << getParentModule()->par("address").longValue() << " node."
                    << endl;

    delete to_delete->second;
    objectValues.erase(to_delete);

}

void LRUContentStore::addToStore(const Packet* packet) {

    curr_counter++;

    ObjectValue* ov = new ObjectValue(new Packet(*packet), curr_counter);
    objectValues.insert(std::make_pair(packet->getContentId(), ov));

    EV
            << "###### New object #" << packet->getContentId() << " added to the content store of #"
                    << getParentModule()->par("address").longValue() << " node." << endl;
    EV
            << "###### Currently in CS of #" << getParentModule()->par("address").longValue() << " node: "
                    << objectValues.size() << "." << endl;

}

Packet* LRUContentStore::find(int contentId) {

    ObjectValues::iterator it = objectValues.find(contentId);

    if (it == objectValues.end())
        return NULL;

    ObjectValue* ov = it->second;
    curr_counter++;
    ov->setValue(curr_counter);
    it->second = ov;

    return new Packet(*(ov->getObject()));

}
