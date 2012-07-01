//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

// Created: 2011-6-23 for project omnetcan

package omnetcan.networks;

import omnetcan.node.Node;
import ned.DatarateChannel;

network Ring
{
    @display("bgb=400,400;bgl=2");
    types:
        channel C extends DatarateChannel
        {
            parameters:
                delay = 0.1ms;
                datarate = 1Mbps;
        }

    submodules:

        node_01: Node {
            parameters:
                address = 1;
                @display("p=33,173");
        }

        node_02: Node {
            parameters:
                address = 2;
                @display("p=37,147");
        }

        node_03: Node {
            parameters:
                address = 3;
                @display("p=46,123");
        }

        node_04: Node {
            parameters:
                address = 4;
                @display("p=59,100");
        }

        node_05: Node {
            parameters:
                address = 5;
                @display("p=75,80");
        }

        node_06: Node {
            parameters:
                address = 6;
                @display("p=95,63");
        }

        node_07: Node {
            parameters:
                address = 7;
                @display("p=117,49");
        }

        node_08: Node {
            parameters:
                address = 8;
                @display("p=141,39");
        }

        node_09: Node {
            parameters:
                address = 9;
                @display("p=167,33");
        }

        node_10: Node {
            parameters:
                address = 10;
                @display("p=193,32");
        }

        node_11: Node {
            parameters:
                address = 11;
                @display("p=220,35");
        }

        node_12: Node {
            parameters:
                address = 12;
                @display("p=246,41");
        }

        node_13: Node {
            parameters:
                address = 13;
                @display("p=270,52");
        }

        node_14: Node {
            parameters:
                address = 14;
                @display("p=293,66");
        }

        node_15: Node {
            parameters:
                address = 15;
                @display("p=313,83");
        }

        node_16: Node {
            parameters:
                address = 16;
                @display("p=331,103");
        }

        node_17: Node {
            parameters:
                address = 17;
                @display("p=345,125");
        }

        node_18: Node {
            parameters:
                address = 18;
                @display("p=356,149");
        }

        node_19: Node {
            parameters:
                address = 19;
                @display("p=364,174");
        }

        node_20: Node {
            parameters:
                address = 20;
                @display("p=367,200");
        }

        node_21: Node {
            parameters:
                address = 21;
                @display("p=366,226");
        }

        node_22: Node {
            parameters:
                address = 22;
                @display("p=362,252");
        }

        node_23: Node {
            parameters:
                address = 23;
                @display("p=353,276");
        }

        node_24: Node {
            parameters:
                address = 24;
                @display("p=340,299");
        }

        node_25: Node {
            parameters:
                address = 25;
                @display("p=324,319");
        }

        node_26: Node {
            parameters:
                address = 26;
                @display("p=304,336");
        }

        node_27: Node {
            parameters:
                address = 27;
                @display("p=282,350");
        }

        node_28: Node {
            parameters:
                address = 28;
                @display("p=258,360");
        }

        node_29: Node {
            parameters:
                address = 29;
                @display("p=232,366");
        }

        node_30: Node {
            parameters:
                address = 30;
                @display("p=206,367");
        }

        node_31: Node {
            parameters:
                address = 31;
                @display("p=179,364");
        }

        node_32: Node {
            parameters:
                address = 32;
                @display("p=153,358");
        }

        node_33: Node {
            parameters:
                address = 33;
                @display("p=129,347");
        }

        node_34: Node {
            parameters:
                address = 34;
                @display("p=106,333");
        }

        node_35: Node {
            parameters:
                address = 35;
                @display("p=86,316");
        }

        node_36: Node {
            parameters:
                address = 36;
                @display("p=68,296");
        }

        node_37: Node {
            parameters:
                address = 37;
                @display("p=54,274");
        }

        node_38: Node {
            parameters:
                address = 38;
                @display("p=43,250");
        }

        node_39: Node {
            parameters:
                address = 39;
                @display("p=35,225");
        }

        node_40: Node {
            parameters:
                address = 40;
                @display("p=32,199");
        }

//        node_12: Node {
//            parameters:
//                address = 12;
//                @display("p=275,75");
//        }
//
//        node_21: Node {
//            parameters:
//                address = 21;
//                @display("p=325,125");
//        }
//
//        node_2: Node {
//            parameters:
//                address = 2;
//                @display("p=350,200");
//        }
//
//        node_23: Node {
//            parameters:
//                address = 23;
//                @display("p=325,275");
//        }
//
//        node_32: Node {
//            parameters:
//                address = 32;
//                @display("p=275,325");
//        }
//
//        node_3: Node {
//            parameters:
//                address = 3;
//                @display("p=200,350");
//        }
//
//        node_34: Node {
//            parameters:
//                address = 34;
//                @display("p=125,325");
//        }
//
//        node_43: Node {
//            parameters:
//                address = 43;
//                @display("p=75,275");
//        }
//
//        node_4: Node {
//            parameters:
//                address = 4;
//                @display("p=50,200");
//        }
//
//        node_41: Node {
//            parameters:
//                address = 41;
//                @display("p=75,125");
//        }
//
//        node_14: Node {
//            parameters:
//                address = 14;
//                @display("p=130,75");
//        }

    connections allowunconnected:

        node_01.face++ <--> C <--> node_02.face++;
        node_02.face++ <--> C <--> node_03.face++;
        node_03.face++ <--> C <--> node_04.face++;
        node_04.face++ <--> C <--> node_05.face++;
        node_05.face++ <--> C <--> node_06.face++;
        node_06.face++ <--> C <--> node_07.face++;
        node_07.face++ <--> C <--> node_08.face++;
        node_08.face++ <--> C <--> node_09.face++;
        node_09.face++ <--> C <--> node_10.face++;
        node_10.face++ <--> C <--> node_11.face++;
        node_11.face++ <--> C <--> node_12.face++;
        node_12.face++ <--> C <--> node_13.face++;
        node_13.face++ <--> C <--> node_14.face++;
        node_14.face++ <--> C <--> node_15.face++;
        node_15.face++ <--> C <--> node_16.face++;
        node_16.face++ <--> C <--> node_17.face++;
        node_17.face++ <--> C <--> node_18.face++;
        node_18.face++ <--> C <--> node_19.face++;
        node_19.face++ <--> C <--> node_20.face++;
        node_20.face++ <--> C <--> node_21.face++;
        node_21.face++ <--> C <--> node_22.face++;
        node_22.face++ <--> C <--> node_23.face++;
        node_23.face++ <--> C <--> node_24.face++;
        node_24.face++ <--> C <--> node_25.face++;
        node_25.face++ <--> C <--> node_26.face++;
        node_26.face++ <--> C <--> node_27.face++;
        node_27.face++ <--> C <--> node_28.face++;
        node_28.face++ <--> C <--> node_29.face++;
        node_29.face++ <--> C <--> node_30.face++;
        node_30.face++ <--> C <--> node_31.face++;
        node_31.face++ <--> C <--> node_32.face++;
        node_32.face++ <--> C <--> node_33.face++;
        node_33.face++ <--> C <--> node_34.face++;
        node_34.face++ <--> C <--> node_35.face++;
        node_35.face++ <--> C <--> node_36.face++;
        node_36.face++ <--> C <--> node_37.face++;
        node_37.face++ <--> C <--> node_38.face++;
        node_38.face++ <--> C <--> node_39.face++;
        node_39.face++ <--> C <--> node_40.face++;
        node_40.face++ <--> C <--> node_01.face++;

}



        //
