/*
 * ContentStore.h
 *
 *  Created on: 04-12-2011
 *      Author: Wojtek
 */

#ifndef LFUCONTENTSTORE_H_
#define LFUCONTENTSTORE_H_

#include "ContentStore.h"

class LFUContentStore : public ContentStore {

    public:
        void addToStore(const Packet* packet);
        void removeObject();
        Packet* find(const int contentId);

};

#endif /* CONTENTSTORE_H_ */

