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

package omnetcan.networks;

import ned.DatarateChannel;
import omnetcan.builder.NetBuilder;
import omnetcan.node.Node;
import omnetcan.node.Routing;


//
// TODO auto-generated type
//
network Regular
{
    @display("bgb=1037,902");
    types:
        channel Channel extends DatarateChannel
        {
            parameters:
                delay = 0.1ms;
                datarate = 1Mbps;
        }

    submodules:
        node: Node {
            parameters:
                address = 0;
                @display("p=395,323");

        }
        node1: Node {
            parameters:
                address = 1;
                @display("p=403,435");
        }
        node2: Node {
            parameters:
                address = 2;
                @display("p=478,366");
        }
        node3: Node {
            parameters:
                address = 3;
                @display("p=546,435");
        }
        node4: Node {
            parameters:
                address = 4;
                @display("p=561,314");
        }
        node5: Node {
            parameters:
                address = 5;
                @display("p=650,274");
        }
        node6: Node {
            parameters:
                address = 6;
                @display("p=604,490");
        }
        node7: Node {
            parameters:
                address = 7;
                @display("p=344,490");
        }
        node8: Node {
            parameters:
                address = 8;
                @display("p=319,274");
        }
        node9: Node {
            parameters:
                address = 9;
                @display("p=722,351");
        }
        node10: Node {
            parameters:
                address = 10;
                @display("p=589,199");
        }
        node11: Node {
            parameters:
                address = 11;
                @display("p=714,236");
        }
        node12: Node {
            parameters:
                address = 12;
                @display("p=403,199");
        }
        node13: Node {
            parameters:
                address = 13;
                @display("p=260,351");
        }
        node14: Node {
            parameters:
                address = 14;
                @display("p=256,220");
        }
        node15: Node {
            parameters:
                address = 15;
                @display("p=779,184");
        }
        node16: Node {
            parameters:
                address = 16;
                @display("p=722,132");
        }
        node17: Node {
            parameters:
                address = 17;
                @display("p=844,132");
        }
        node18: Node {
            parameters:
                address = 18;
                @display("p=844,246");
        }
        node19: Node {
            parameters:
                address = 19;
                @display("p=222,178");
        }
        node20: Node {
            parameters:
                address = 20;
                @display("p=299,132");
        }
        node21: Node {
            parameters:
                address = 21;
                @display("p=171,236");
        }
        node22: Node {
            parameters:
                address = 22;
                @display("p=171,123");
        }
        node23: Node {
            parameters:
                address = 23;
                @display("p=344,82");
        }
        node24: Node {
            parameters:
                address = 24;
                @display("p=290,20");
        }
        node25: Node {
            parameters:
                address = 25;
                @display("p=418,20");
        }
        node26: Node {
            parameters:
                address = 26;
                @display("p=418,108");
        }
        node27: Node {
            parameters:
                address = 27;
                @display("p=115,289");
        }
        node28: Node {
            parameters:
                address = 28;
                @display("p=41,220");
        }
        node29: Node {
            parameters:
                address = 29;
                @display("p=48,351");
        }
        node30: Node {
            parameters:
                address = 30;
                @display("p=177,366");
        }
        node31: Node {
            parameters:
                address = 31;
                @display("p=124,82");
        }
        node32: Node {
            parameters:
                address = 32;
                @display("p=56,135");
        }
        node33: Node {
            parameters:
                address = 33;
                @display("p=162,30");
        }
        node34: Node {
            parameters:
                address = 34;
                @display("p=56,30");
        }
        node35: Node {
            parameters:
                address = 35;
                @display("p=604,132");
        }
        node36: Node {
            parameters:
                address = 36;
                @display("p=665,82");
        }
        node37: Node {
            parameters:
                address = 37;
                @display("p=736,20");
        }
        node38: Node {
            parameters:
                address = 38;
                @display("p=903,82");
        }
        node39: Node {
            parameters:
                address = 39;
                @display("p=990,30");
        }
        node40: Node {
            parameters:
                address = 40;
                @display("p=958,145");
        }
        node41: Node {
            parameters:
                address = 41;
                @display("p=861,20");
        }
        node42: Node {
            parameters:
                address = 42;
                @display("p=903,308");
        }
        node43: Node {
            parameters:
                address = 43;
                @display("p=973,246");
        }
        node44: Node {
            parameters:
                address = 44;
                @display("p=973,366");
        }
        node45: Node {
            parameters:
                address = 45;
                @display("p=831,381");
        }
        node46: Node {
            parameters:
                address = 46;
                @display("p=685,420");
        }
        node47: Node {
            parameters:
                address = 47;
                @display("p=650,539");
        }
        node48: Node {
            parameters:
                address = 48;
                @display("p=533,550");
        }
        node49: Node {
            parameters:
                address = 49;
                @display("p=403,565");
        }
        node50: Node {
            parameters:
                address = 50;
                @display("p=284,550");
        }
        node51: Node {
            parameters:
                address = 51;
                @display("p=264,429");
        }
        node52: Node {
            parameters:
                address = 52;
                @display("p=735,613");
        }
        node53: Node {
            parameters:
                address = 53;
                @display("p=797,565");
        }
        node54: Node {
            parameters:
                address = 54;
                @display("p=665,663");
        }
        node55: Node {
            parameters:
                address = 55;
                @display("p=797,678");
        }
        node56: Node {
            parameters:
                address = 56;
                @display("p=846,505");
        }
        node57: Node {
            parameters:
                address = 57;
                @display("p=764,435");
        }
        node58: Node {
            parameters:
                address = 58;
                @display("p=922,429");
        }
        node59: Node {
            parameters:
                address = 59;
                @display("p=922,576");
        }
        node60: Node {
            parameters:
                address = 60;
                @display("p=861,735");
        }
        node61: Node {
            parameters:
                address = 61;
                @display("p=928,655");
        }
        node62: Node {
            parameters:
                address = 62;
                @display("p=943,820");
        }
        node63: Node {
            parameters:
                address = 63;
                @display("p=764,805");
        }
        node64: Node {
            parameters:
                address = 64;
                @display("p=604,703");
        }
        node65: Node {
            parameters:
                address = 65;
                @display("p=689,790");
        }
        node66: Node {
            parameters:
                address = 66;
                @display("p=521,767");
        }
        node67: Node {
            parameters:
                address = 67;
                @display("p=546,634");
        }
        node68: Node {
            parameters:
                address = 68;
                @display("p=233,623");
        }
        node69: Node {
            parameters:
                address = 69;
                @display("p=299,678");
        }
        node70: Node {
            parameters:
                address = 70;
                @display("p=171,576");
        }
        node71: Node {
            parameters:
                address = 71;
                @display("p=177,687");
        }
        node72: Node {
            parameters:
                address = 72;
                @display("p=380,765");
        }
        node73: Node {
            parameters:
                address = 73;
                @display("p=452,703");
        }
        node74: Node {
            parameters:
                address = 74;
                @display("p=446,827");
        }
        node75: Node {
            parameters:
                address = 75;
                @display("p=299,827");
        }
        node76: Node {
            parameters:
                address = 76;
                @display("p=115,750");
        }
        node77: Node {
            parameters:
                address = 77;
                @display("p=186,812");
        }
        node78: Node {
            parameters:
                address = 78;
                @display("p=48,703");
        }
        node79: Node {
            parameters:
                address = 79;
                @display("p=48,820");
        }
        node80: Node {
            parameters:
                address = 80;
                @display("p=115,510");
        }
        node81: Node {
            parameters:
                address = 81;
                @display("p=48,565");
        }
        node82: Node {
            parameters:
                address = 82;
                @display("p=63,445");
        }
        node83: Node {
            parameters:
                address = 83;
                @display("p=191,452");
        }
        node84: Node {
            parameters:
                address = 84;
                @display("p=604,20");
        }
    connections:
        node34.face++ <--> Channel <--> node31.face++;
        node31.face++ <--> Channel <--> node32.face++;
        node31.face++ <--> Channel <--> node33.face++;
        node31.face++ <--> Channel <--> node22.face++;
        node22.face++ <--> Channel <--> node19.face++;
        node19.face++ <--> Channel <--> node21.face++;
        node21.face++ <--> Channel <--> node27.face++;
        node27.face++ <--> Channel <--> node28.face++;
        node27.face++ <--> Channel <--> node29.face++;
        node27.face++ <--> Channel <--> node30.face++;
        node19.face++ <--> Channel <--> node20.face++;
        node20.face++ <--> Channel <--> node23.face++;
        node23.face++ <--> Channel <--> node24.face++;
        node23.face++ <--> Channel <--> node25.face++;
        node23.face++ <--> Channel <--> node26.face++;
        node19.face++ <--> Channel <--> node14.face++;
        node14.face++ <--> Channel <--> node8.face++;
        node8.face++ <--> Channel <--> node12.face++;
        node8.face++ <--> Channel <--> node13.face++;
        node8.face++ <--> Channel <--> node.face++;
        node.face++ <--> Channel <--> node2.face++;
        node2.face++ <--> Channel <--> node4.face++;
        node4.face++ <--> Channel <--> node5.face++;
        node5.face++ <--> Channel <--> node10.face++;
        node5.face++ <--> Channel <--> node11.face++;
        node5.face++ <--> Channel <--> node9.face++;
        node11.face++ <--> Channel <--> node15.face++;
        node15.face++ <--> Channel <--> node18.face++;
        node18.face++ <--> Channel <--> node42.face++;
        node42.face++ <--> Channel <--> node45.face++;
        node44.face++ <--> Channel <--> node42.face++;
        node42.face++ <--> Channel <--> node43.face++;
        node15.face++ <--> Channel <--> node16.face++;
        node16.face++ <--> Channel <--> node36.face++;
        node36.face++ <--> Channel <--> node35.face++;
        node36.face++ <--> Channel <--> node84.face++;
        node36.face++ <--> Channel <--> node37.face++;
        node15.face++ <--> Channel <--> node17.face++;
        node17.face++ <--> Channel <--> node38.face++;
        node38.face++ <--> Channel <--> node41.face++;
        node38.face++ <--> Channel <--> node39.face++;
        node38.face++ <--> Channel <--> node40.face++;
        node2.face++ <--> Channel <--> node3.face++;
        node3.face++ <--> Channel <--> node6.face++;
        node6.face++ <--> Channel <--> node46.face++;
        node6.face++ <--> Channel <--> node47.face++;
        node6.face++ <--> Channel <--> node48.face++;
        node47.face++ <--> Channel <--> node52.face++;
        node52.face++ <--> Channel <--> node53.face++;
        node53.face++ <--> Channel <--> node56.face++;
        node56.face++ <--> Channel <--> node57.face++;
        node56.face++ <--> Channel <--> node58.face++;
        node56.face++ <--> Channel <--> node59.face++;
        node52.face++ <--> Channel <--> node55.face++;
        node55.face++ <--> Channel <--> node60.face++;
        node60.face++ <--> Channel <--> node62.face++;
        node60.face++ <--> Channel <--> node61.face++;
        node60.face++ <--> Channel <--> node63.face++;
        node52.face++ <--> Channel <--> node54.face++;
        node54.face++ <--> Channel <--> node64.face++;
        node64.face++ <--> Channel <--> node65.face++;
        node64.face++ <--> Channel <--> node66.face++;
        node64.face++ <--> Channel <--> node67.face++;
        node2.face++ <--> Channel <--> node1.face++;
        node1.face++ <--> Channel <--> node7.face++;
        node7.face++ <--> Channel <--> node49.face++;
        node7.face++ <--> Channel <--> node51.face++;
        node7.face++ <--> Channel <--> node50.face++;
        node50.face++ <--> Channel <--> node68.face++;
        node68.face++ <--> Channel <--> node69.face++;
        node69.face++ <--> Channel <--> node72.face++;
        node72.face++ <--> Channel <--> node74.face++;
        node72.face++ <--> Channel <--> node73.face++;
        node72.face++ <--> Channel <--> node75.face++;
        node68.face++ <--> Channel <--> node71.face++;
        node71.face++ <--> Channel <--> node76.face++;
        node76.face++ <--> Channel <--> node77.face++;
        node76.face++ <--> Channel <--> node79.face++;
        node76.face++ <--> Channel <--> node78.face++;
        node68.face++ <--> Channel <--> node70.face++;
        node70.face++ <--> Channel <--> node80.face++;
        node82.face++ <--> Channel <--> node80.face++;
        node80.face++ <--> Channel <--> node83.face++;
        node80.face++ <--> Channel <--> node81.face++;
}
