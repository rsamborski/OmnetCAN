#include "ccn.h"

/*
 * Constructor - zero faces and set local_delivery to false
 */
FaceList::FaceList() {
	for(int i=0;i<MAX_FACES;i++) {
		faces[i] = 0;
	}

	local_delivery = false;
}
