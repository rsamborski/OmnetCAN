//
// Project: OmnetCAN
// Description: Content Aware Network simulation for Omnet++, based on CCN architecture
// Author: Remigiusz Samborski
//

#ifndef CCN_H_
#define CCN_H_

/* Configuration constants */
#define LOCAL_STORE_SIZE	10
#define CONTENT_STORE_SIZE	10

#define MAX_FACES			10		// maximum number of faces attached to a node


// Packet types
#define PACKET_INTEREST		0x1
#define PACKET_DATA			0x2

// ContentObject class

class ContentObject {
	public:
		int contentId;
		char contentData[100];
};


// FaceList class
class FaceList {
	public:
		int faces[MAX_FACES];
		bool local_delivery;
		double lastUpdate;

		FaceList ();
};

#endif /* CCN_H_ */
