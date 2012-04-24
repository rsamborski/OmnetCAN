//
// Project: OmnetCAN
// Description: Content Aware Network simulation for Omnet++, based on CCN architecture
// Author: Remigiusz Samborski
//
// Based on an OMNeT++/OMNEST simulation example. Copyright (C) 1992-2008 Andras Varga
//
// This file is distributed WITHOUT ANY WARRANTY. See the file
// `license.txt` for details on this and other legal matters.
//

#ifdef _MSC_VER
#pragma warning(disable:4786)
#endif

#include <map>
#include <omnetpp.h>
//#include <time.h>

#include "ccn.h"
#include "Packet_m.h"

/**
 * CCN routing, utilizing the cTopology class.
 */
class Routing : public cSimpleModule
{
  private:
	int myAddress;
	int localContentId; 	// local content available from this node, TODO: change to std::map
	double pitTimeout;			// timeout for PIT entries in ms

	typedef std::map <int, ContentObject> ContentObjects;
//	ContentObjects localStore;		// table of local CCN data objects
	ContentObjects contentStore;	// table of cached CCN data objects

	/* For simplicity we use contentIds instead of names, entry with contentId=0 in FIB is considered a default route */
    typedef std::map<int, FaceList> ForwardingTable; // contentId -> face index(s)
    ForwardingTable fib;

    /* CCN - Pending Interest Table */
    typedef std::map<int, FaceList> PendingInterestTable; // contentId -> face index(s)
    PendingInterestTable pit;

    // state of data packets
    cMessage *generatePacket;
    long datapkCounter;
    cPar *packetLengthBytes;

    // event message used to schedule tasks
    cMessage* timerEvent;

    // signals used in data statistics
    simsignal_t dropSignal;
    simsignal_t dropInterestSignal;


  protected:
    virtual void initialize();
    virtual void handleMessage(cMessage *msg);
    virtual int get_incoming_face(Packet *pk);
    virtual Packet *newDataPacket(int id);
    virtual void sendToPIT(Packet *pk);
    virtual void timer();
    virtual void cleanPIT();

 };

Define_Module(Routing);


void Routing::initialize()
{
    myAddress = getParentModule()->par("address");
    localContentId = par("localContentId");
    packetLengthBytes = &par("packetLength");
    pitTimeout = par("pitTimeout");

    dropSignal = registerSignal("drop");
    dropInterestSignal = registerSignal("dropInterest");
//    contentReceivedSignal = registerSignal("contentReceived");

    generatePacket = NULL;
    datapkCounter = 0;

    //
    // We set up forwarding table default route to send out Interests on all faces
    //

    cTopology *topo = new cTopology("topo");

    std::vector<std::string> nedTypes;
    nedTypes.push_back(getParentModule()->getNedTypeName());
    topo->extractByNedTypeName(nedTypes);
    EV << "cTopology found " << topo->getNumNodes() << " nodes\n";

    cTopology::Node *thisNode = topo->getNodeFor(getParentModule());

    for (int i=0; i<MAX_FACES; i++)
    {
    	if(i<thisNode->getNumOutLinks()) {
    		fib[0].faces[i] = 1;
    		EV << "  default route to face " << i << endl;
    	} else {
    		fib[0].faces[i] = 0;
    	}
    }

    delete topo;

    // we set up a scheduler to run timers cleaning, first 0.5 is used for enviroment set up
    timerEvent= new cMessage("timerEvent");
    scheduleAt(simTime()+0.5+pitTimeout/2,timerEvent);
}

void Routing::handleMessage(cMessage *msg)
{
	/* Variables */
	FaceList fl;
	int incoming_face;		// number of face the packet came from

	// if the message is our timer, we run the function and return
	if(strcmp(msg->getName(), "timerEvent") == 0) {
		timer();
		return;
	}

	// get the Packet
    Packet *pk = check_and_cast<Packet *>(msg);
    int contentId = pk->getContentId();
    int packetType = pk->getPacketType();

    // get the incoming face number
	incoming_face = get_incoming_face(pk);

    if (packetType == PACKET_INTEREST)
    {
    	/* Interest packet behavior */
        EV << "Interest packet received " << pk->getName() << " on face " << incoming_face << endl;


        /* Check the PendingInterestTable */
        PendingInterestTable::iterator itp = pit.find(contentId);

        if(itp!=pit.end())
        {
        	EV << "contentId " << contentId << " found in PendingInterestTable" << endl;

        	fl = (*itp).second;

        	if(incoming_face == -1) {
        		// set to local delivery
        		fl.local_delivery = true;
            	EV << "setting local_delivery to PendindInterestTable for contentId " << contentId << endl;
        	} else if(! fl.faces[incoming_face]) {
           		fl.faces[incoming_face] = true;
            	EV << "setting face " << incoming_face << " in PendindInterestTable for contentId " << contentId << endl;
           	} else {
           		EV << "face " << incoming_face << " already in PendindInterestTable for contentId " << contentId << endl;
        	}

        	fl.lastUpdate = simTime().dbl();
			itp->second = fl;

        	// we don't forward the interest - it has been already forwarded
        	emit(dropInterestSignal, (long)pk->getByteLength());
        	delete pk;
        	return;
        } else {
        	EV << "contentId " << contentId << " NOT found in PendingInterestTable, adding new entry" << endl;

        	if(incoming_face == -1) {
        		fl.local_delivery = true;
        		EV << "setting local_delivery to PendindInterestTable for contentId " << contentId << endl;
        	} else {
        		fl.faces[incoming_face] = true;
        		EV << "setting face " << incoming_face << " in PendindInterestTable for contentId " << contentId << endl;
        	}

        	fl.lastUpdate = simTime().dbl();
         	pit.insert(std::pair<int, FaceList>(contentId, fl));
        }


        /* We check if the content is available locally */
		if(contentId == localContentId) {
        	EV << "contentId " << contentId << " available locally, we generate Data Packet in response" << endl;

        	if (ev.isGUI()) {
        		getParentModule()->bubble("Content available at this node! Sending to faces from PIT.");
        	}

        	/* Send the content */
        	Packet *datapk = newDataPacket(contentId);
        	sendToPIT(datapk);
        	delete(datapk);

        	/* Drop interest packet */
        	delete pk;
        	return;
		}


        /* Check local cache (Content Store) */
        /* TODO */


		/* Check the Forwarding Table */
        ForwardingTable::iterator itf = fib.find(contentId);
        if (itf==fib.end())
        {
            EV << "contentId " << contentId << " not in Forwarding Table (FIB), using default route" << endl;
			itf = fib.find(0);	// zero represents default route
			if(itf==fib.end()) {
				/* No default route, drop the packet */
				EV << "default route not found, dropping packet" << endl;
				emit(dropSignal, (long)pk->getByteLength());
				delete pk;
				return;
			}
        }

        fl = (*itf).second;
        bool forwarded = false;

        for(int i=0;i<MAX_FACES;i++) {
        	/* We skip the gate from which the packet came */
        	if(i == incoming_face) continue;

        	if(fl.faces[i]) {
        		EV << "Forwarding Interest Packet: " << pk->getName() << " on face " << i << endl;
        		//emit(outputIfSignal, i);

        		/* We create a copy of pk and send it out on face i */
                Packet *newpk = new Packet(*pk);
        		send(newpk, "out", i);
        		forwarded = true;
        	}
        }

        // FIX - if the packet was not forwarded we remove the PIT entry and drop it - this situation happens
        // when we are an edge node (only one face)
        if(! forwarded) {
        	EV << "no routes available (edge node), dropping packet and removing PIT entries" << endl;
        	pit.erase(pit.find(contentId));

        	emit(dropSignal, (long)pk->getByteLength());
        }

        delete pk; // fix do bledu
    }
    else if (packetType == PACKET_DATA)
    {
    	/* Data packet behavior */
        EV << "Data Packet received: " << pk->getName() << endl;

    	/* Send the content further */
        sendToPIT(pk);

    	/* Drop the original packet */
    	delete pk;
    }
}

void Routing::timer() {
	// Set the default Node color
	getParentModule()->getDisplayString().setTagArg("i",1,"gold");

	// clean PIT table
	cleanPIT();

	// schedule next run
	scheduleAt(simTime()+pitTimeout/2,timerEvent);
}

// Function cleans PIT table by removing entries, which reached timeOut
void Routing::cleanPIT() {
	PendingInterestTable::iterator p;
	FaceList fl;
	double matchOlder = simTime().dbl() - pitTimeout;

	for(p = pit.begin(); p!=pit.end(); ++p)
	{
		fl = p->second;

		if(fl.lastUpdate < matchOlder) {
			// we remove this entry
			EV << "erasing PIT entry for contentID: " << p->first << endl;
			pit.erase(p);

			// after erasing we run another instance of cleanPIT and return - this is to avoid
			// core dump due to p removal
			cleanPIT();
			return;
		}
	}
}

// Returns number of the incoming face for the attached packet
int Routing::get_incoming_face(Packet *pk)
{
	int num_gates = gateSize("in");
	for(int i=0;i<num_gates;i++) {
    	cGate *g = gate("in", i);
    	if(g->getId() == pk->getArrivalGateId()) return i;
    }

	/* If not found in 'in' gates then probably it comes from local interface (app) */
    return -1;
}

/*
 * This function creates a new Data Packet
 */
Packet *Routing::newDataPacket(int contentId)
{
    char pkname[40];

    sprintf(pkname,"data-from-%d-cid-%d-#%ld", myAddress, contentId, datapkCounter++);
    EV << "generating Data Packet: " << pkname << endl;

    Packet *datapk = new Packet(pkname);
    datapk->setByteLength(packetLengthBytes->longValue());
    datapk->setContentId(contentId);
    datapk->setPacketType(PACKET_DATA);

    return datapk;
}

/*
 * Sends a packet to all faces from PIT, which are waiting for it.
 * It also removes faces from PIT, so it doesn't get sent next time.
 */
void Routing::sendToPIT(Packet *pk)
{
    PendingInterestTable::iterator itp = pit.find(pk->getContentId());

    if(itp!=pit.end())
    {
    	EV << "contentId " << pk->getContentId() << " found in PendingInterestTable" << endl;

    	FaceList fl = (*itp).second;

    	for(int i=0;i<MAX_FACES;i++) {
    		if(fl.faces[i]) {
    			EV << "sending Data Packet " << pk->getName() << " to face " << i << endl;
    			//emit(outputIfSignal, i);

    			/* We create a copy of pk and send it out on face i */
    			Packet *newpk = new Packet(*pk);
    			send(newpk, "out", i);
    		}
    	}

    	/* If local_delivery is set then we send the content to APP */
    	if(fl.local_delivery) {
            EV << "local delivery of Data Packet " << pk->getName() << endl;
            Packet *newpk = new Packet(*pk);
            send(newpk, "localOut");
        }

    	/* Remove this entry from pit */
    	pit.erase(itp);
    }
}
