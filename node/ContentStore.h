/*
 * IContentStore.h
 *
 *  Created on: 04-12-2011
 *      Author: Wojtek
 */

#ifndef CONTENTSTORE_H_
#define CONTENTSTORE_H_

#include <csimplemodule.h>
#include <limits.h>
#include <cmessage.h>
#include <cqueue.h>
#include "Packet_m.h"

class ContentStore : public cSimpleModule {

    protected:

        class ObjectValue {

            private:
                Packet* packet;
                long tab_value;

            public:

                ObjectValue(Packet* p, int v) :
                        packet(p), tab_value(v) {
                }

                ~ObjectValue() {
                    delete packet;
                }

                void incrementValue() {
                    if (tab_value < LONG_MAX)
                        tab_value++;
                }

                void setValue(int v) {
                    if (tab_value < LONG_MAX)
                        tab_value = v;
                }

                Packet* getObject() {
                    return packet;
                }

                long getValue() {
                    return tab_value;
                }

                void updatePacket(const Packet* packet) {
                    delete this->packet;
                    this->packet = new Packet(*packet);
                }

        };

        typedef std::map<int, ObjectValue*> ObjectValues;
        ObjectValues objectValues;

        int capacity;
        int curr_counter;
        int contentLookupDelay;

        cQueue queue;
        cMessage* delayMessage;
        const char* msgContentLookupDelay;
        simsignal_t dataHitSignal;
        simsignal_t dataMissSignal;
        simsignal_t csDataStoreSignal;
        simsignal_t csDataExchangeSignal;

        int getNumberObjectsInStore();

    public:
        ContentStore();
        void initialize();
        void handleMessage(cMessage *msg);
        void store(const Packet* packet);
        bool check(const int contentId);
        virtual ~ContentStore();

        virtual void addToStore(const Packet* packet) = 0;
        virtual void removeObject() = 0;
        virtual Packet* find(const int contentId) = 0;

//    public:
//
//        virtual Packet* find(const int contentId)= 0;
//        virtual void store(const Packet* packet)= 0;
//        virtual ~ContentStore() {
//        }
//        ;

};

#endif /* ICONTENTSTORE_H_ */
