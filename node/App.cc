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

#include <vector>
#include <omnetpp.h>
#include "Packet_m.h"


/**
 * Generates traffic for the network.
 */
class App : public cSimpleModule
{
  private:
    // configuration
    int myAddress;
    int searchContentId;

    //    std::vector<int> destAddresses;
    cPar *sendIATime;
    cPar *packetLengthBytes;

    // state
    cMessage *generatePacket;
    long pkCounter;

    // signals
    simsignal_t endToEndDelaySignal;
    simsignal_t hopCountSignal;
    simsignal_t sourceAddressSignal;
    simsignal_t dropSignal;
    simsignal_t contentReceivedSignal;

    simtime_t czas_nadania;

  public:
    App();
    virtual ~App();

  protected:
    virtual void initialize();
    virtual void handleMessage(cMessage *msg);
};

Define_Module(App);


App::App()
{
    generatePacket = NULL;
}

App::~App()
{
    cancelAndDelete(generatePacket);
}

void App::initialize()
{
    myAddress = par("address");
    searchContentId = par("searchContentId");
    packetLengthBytes = &par("packetLength");
    sendIATime = &par("sendIaTime");  // volatile parameter
    pkCounter = 0;

    WATCH(pkCounter);
    WATCH(myAddress);

/*    const char *destAddressesPar = par("destAddresses");
    cStringTokenizer tokenizer(destAddressesPar);
    const char *token;
    while ((token = tokenizer.nextToken())!=NULL)
        destAddresses.push_back(atoi(token));

    if (destAddresses.size() == 0)
        throw cRuntimeError("At least one address must be specified in the destAddresses parameter!");
*/

    generatePacket = new cMessage("nextPacket");
    scheduleAt(sendIATime->doubleValue(), generatePacket);

    endToEndDelaySignal = registerSignal("endToEndDelay");
    hopCountSignal =  registerSignal("hopCount");
    sourceAddressSignal = registerSignal("sourceAddress");
    contentReceivedSignal = registerSignal("contentReceived");
}

void App::handleMessage(cMessage *msg)
{
    if (msg == generatePacket)
    {
        // Sending packet
        //int destAddress = destAddresses[intuniform(0, destAddresses.size()-1)];

        char pkname[40];
        sprintf(pkname,"interest-from-%d-cid-%d-#%ld", myAddress, searchContentId, pkCounter++);
        EV << "generating Interest packet: " << pkname << endl;
        czas_nadania = simTime();

        Packet *pk = new Packet(pkname);
        pk->setByteLength(packetLengthBytes->longValue());
        pk->setContentId(searchContentId);
        pk->setPacketType(PACKET_INTEREST);
//        pk->setSrcAddr(myAddress);
//        pk->setDestAddr(destAddress);
        send(pk,"out");

        scheduleAt(simTime() + sendIATime->doubleValue(), generatePacket);
        if (ev.isGUI()) getParentModule()->bubble("Generating packet...");
    }
    else
    {
        // Handle incoming packet
        Packet *pk = check_and_cast<Packet *>(msg);
        EV << "received packet " << pk->getName() << endl;

        /* We check the type of received packet */
        if(pk->getPacketType() == PACKET_INTEREST) {
			EV << "ERROR: app received an Interest packet " << pk->getName() << endl;
			emit(dropSignal, (long)pk->getByteLength());
			delete pk;

			if (ev.isGUI())
        	{
        		getParentModule()->getDisplayString().setTagArg("i",1,"red");
        		getParentModule()->bubble("ERROR: interest delivered to app!");
        	}
        } else if(pk->getPacketType() == PACKET_DATA) {
        	if(pk->getContentId() == searchContentId) {
        		emit(endToEndDelaySignal, simTime() - czas_nadania);
   	        	emit(contentReceivedSignal, searchContentId);

   	        	if (ev.isGUI())
   	        	{
   	        		getParentModule()->getDisplayString().setTagArg("i",1,"green");
   	        		getParentModule()->bubble("Content arrived!");
   	        	}
        	} else {
   	        	emit(contentReceivedSignal, -1); // wrong content

   	        	if (ev.isGUI())
   	        	{
   	        		getParentModule()->getDisplayString().setTagArg("i",1,"red");
   	        		getParentModule()->bubble("ERROR: wrong content arrived!");
   	        	}
        	}

        	delete pk;


        }
    }
}

