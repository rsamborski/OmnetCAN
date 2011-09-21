//
// Represents an Interest Packet in the CCN network
//

cplusplus {{
#include "ccn.h"
}}

packet Interest
{
	int magic;
    int prefix_comps;
    int min_suffix_comps;
    int max_suffix_comps;
    int orderpref;
    int answerfrom;
    int scope;
    unsigned short offset[29];
}

