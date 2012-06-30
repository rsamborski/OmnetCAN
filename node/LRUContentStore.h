/*
 * ContentStore.h
 *
 *  Created on: 04-12-2011
 *      Author: Wojtek
 */

#ifndef LRUCONTENTSTORE_H_
#define LRUCONTENTSTORE_H_

#include "ContentStore.h"

class LRUContentStore : public ContentStore {

    public:
        void addToStore(const Packet* packet);
        void removeObject();
        Packet* find(const int contentId);

};

#endif /* CONTENTSTORE_H_ */

