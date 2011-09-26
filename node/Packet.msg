//
// Represents a packet in the CCN network. One packet is used to represent Interest and Data packets
//

cplusplus {{
#include "ccn.h"
}}

packet Packet
{
    int contentId;
    int packetType;
    string data;
}