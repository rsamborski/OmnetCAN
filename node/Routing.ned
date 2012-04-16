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

package omnetcan.node;

//
// Models a router.
//
simple Routing
{
    parameters:
        int localContentId;
        volatile int packetLength @unit(byte);  // length of one message (fixed! no "volatile" modifier)
        double pitTimeout;
                        
        @display("i=block/switch");
        @signal[drop](type="long");				// emited when packet is droped
        @signal[dropInterest](type="long");		// emited when an Interest packet is dropped (another one was already sent)
        @statistic[drop](title="dropped packet byte length";unit=bytes;record=vector,count,sum;interpolationmode=none);
        @statistic[dropInterest](title="dropped Interest packets byte length";unit=bytes;record=vector,count,sum,histogram;interpolationmode=none);
//        @statistic[outputIf](title="packet content receiver";record=histogram;interpolationmode=none);
  
    gates:
        input in[];
        output out[];
        input localIn;
        output localOut;
}


