//
// Represents an Interest Packet in the CCN network
//

cplusplus {{
#include "ccn.h"
}}
class noncobject ccn_content_type;

packet ContentObject
{
//    @customize(true);  // see the generated C++ header for more info
    
    int magic;
    ccn_content_type type;
    int name_ncomps;
    unsigned short offset[36];
    unsigned char digest[32];	// Computed only when needed 
    int digest_bytes;
}

