//
// This file is part of an OMNeT++/OMNEST simulation example.
//
// Copyright (C) 1992-2008 Andras Varga
//
// This file is distributed WITHOUT ANY WARRANTY. See the file
// `license' for details on this and other legal matters.
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
                
        @display("i=block/switch");
        @signal[drop](type="long");
        @signal[outputIf](type="int");
        @statistic[drop](title="dropped packet byte length";unit=bytes;record=vector,count,sum;interpolationmode=none);
        @statistic[outputIf](title="output interface for each routed packet";record=histogram;interpolationmode=none);
    gates:
        input in[];
        output out[];
        input localIn;
        output localOut;
}


