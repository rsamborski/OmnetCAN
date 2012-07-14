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

network Irregular
{
    @display("bgb=861,641");
    types:
        channel C extends DatarateChannel
        {
            parameters:
                delay = 0.1ms;
                datarate = 1Mbps;
        }

    submodules:

        node: Node {
            parameters:
                address = 0;
                @display("p=129,104");
        }
        node1: Node {
            parameters:
                address = 1;
                @display("p=27,40");
        }
        node2: Node {
            parameters:
                address = 2;
                @display("p=42,356");
        }
        node3: Node {
            parameters:
                address = 3;
                @display("p=284,356");
        }
        node4: Node {
            parameters:
                address = 4;
                @display("p=360,89");
        }
        node5: Node {
            parameters:
                address = 5;
                @display("p=240,119");
        }
        node6: Node {
            parameters:
                address = 6;
                @display("p=200,222");
        }
        node7: Node {
            parameters:
                address = 7;
                @display("p=114,207");
        }
        node8: Node {
            parameters:
                address = 8;
                @display("p=185,14");
        }
        node9: Node {
            parameters:
                address = 9;
                @display("p=360,222");
        }
        node15: Node {
            @display("p=360,25");
        }
        node10: Node {
            @display("p=185,394");
        }
        node18: Node {
            @display("p=102,454");
        }
        node38: Node {
            @display("p=195,520");
        }
        node37: Node {
            @display("p=327,540");
        }
        node35: Node {
            @display("p=455,552");
        }
        node33: Node {
            @display("p=406,439");
        }
        node34: Node {
            @display("p=279,440");
        }
        node11: Node {
            @display("p=562,582");
        }
        node12: Node {
            @display("p=654,531");
        }
        node13: Node {
            @display("p=731,433");
        }
        node14: Node {
            @display("p=754,561");
        }
        node16: Node {
            @display("p=711,316");
        }
        node17: Node {
            @display("p=606,363");
        }
        node19: Node {
            @display("p=531,296");
        }
        node20: Node {
            @display("p=526,460");
        }
        node21: Node {
            @display("p=625,459");
        }
        node22: Node {
            @display("p=492,380");
        }
        node23: Node {
            @display("p=439,252");
        }
        node24: Node {
            @display("p=535,185");
        }
        node25: Node {
            @display("p=447,119");
        }
        node26: Node {
            @display("p=643,185");
        }
        node27: Node {
            @display("p=701,92");
        }
        node28: Node {
            @display("p=560,112");
        }
        node29: Node {
            @display("p=574,34");
        }
        node30: Node {
            @display("p=459,23");
        }
        node31: Node {
            @display("p=734,218");
        }
        node32: Node {
            @display("p=630,288");
        }
        node36: Node {
            @display("p=806,145");
        }
        node39: Node {
            @display("p=812,360");
        }
    connections allowunconnected:

        node.face++ <--> C <--> node7.face++;
        node7.face++ <--> C <--> node2.face++;
        node2.face++ <--> C <--> node9.face++;
        node9.face++ <--> C <--> node3.face++;
        node9.face++ <--> C <--> node6.face++;
        node6.face++ <--> C <--> node2.face++;
        node2.face++ <--> C <--> node1.face++;
        node1.face++ <--> C <--> node5.face++;
        node1.face++ <--> C <--> node8.face++;
        node1.face++ <--> C <--> node4.face++;
        node1.face++ <--> C <--> node.face++;
        node1.face++ <--> C <--> node7.face++;
        node9.face++ <--> C <--> node5.face++;
        node5.face++ <--> C <--> node7.face++;
        node6.face++ <--> C <--> node7.face++;
        node9.face++ <--> C <--> node4.face++;
        node15.face++ <--> node4.face++;
        node6.face++ <--> node10.face++;
        node2.face++ <--> node10.face++;
        node2.face++ <--> node18.face++;
        node18.face++ <--> node10.face++;
        node18.face++ <--> node38.face++;
        node38.face++ <--> node10.face++;
        node38.face++ <--> node34.face++;
        node34.face++ <--> node33.face++;
        node38.face++ <--> node37.face++;
        node37.face++ <--> node35.face++;
        node35.face++ <--> node11.face++;
        node11.face++ <--> node12.face++;
        node12.face++ <--> node14.face++;
        node14.face++ <--> node13.face++;
        node13.face++ <--> node16.face++;
        node17.face++ <--> node13.face++;
        node19.face++ <--> node17.face++;
        node33.face++ <--> node20.face++;
        node20.face++ <--> node22.face++;
        node22.face++ <--> node21.face++;
        node21.face++ <--> node20.face++;
        node33.face++ <--> node35.face++;
        node12.face++ <--> node21.face++;
        node9.face++ <--> node23.face++;
        node23.face++ <--> node19.face++;
        node19.face++ <--> node24.face++;
        node24.face++ <--> node25.face++;
        node25.face++ <--> node9.face++;
        node25.face++ <--> node30.face++;
        node30.face++ <--> node29.face++;
        node29.face++ <--> node28.face++;
        node28.face++ <--> node24.face++;
        node28.face++ <--> node26.face++;
        node26.face++ <--> node19.face++;
        node26.face++ <--> node27.face++;
        node26.face++ <--> node31.face++;
        node31.face++ <--> node36.face++;
        node31.face++ <--> node39.face++;
        node39.face++ <--> node13.face++;
        node32.face++ <--> node17.face++;
}
