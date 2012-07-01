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

network Extended_Tree
{
    @display("bgb=585,537");
    types:
        channel C extends DatarateChannel
        {
            parameters:
                delay = 0.1ms;
                datarate = 1Mbps;
        }

    submodules:

        central_node: Node {
            parameters:
                address = 0;
                @display("p=283,269");
        }

        // subtree 1
        node_1: Node {
            parameters:
                address = 1;
                @display("p=357,327");
        }

		// subtree 1.1
        node_1_1: Node {
            parameters:
                address = 11;
                @display("p=453,312");
        }

		// subtree 1.1 leaves
        node_1_1_1: Node {
            parameters:
                address = 111;
                @display("p=514,254");
        }

        node_1_1_2: Node {
            parameters:
                address = 112;
                @display("p=529,297");
        }

        node_1_1_3: Node {
            parameters:
                address = 113;
                @display("p=529,342");
        }

        // subtree 1.2        
        node_1_2: Node {
            parameters:
                address = 12;
                @display("p=427,378");
        }

		// subtree 1.2 leaves
        node_1_2_1: Node {
            parameters:
                address = 121;
                @display("p=514,382");
        }
        node_1_2_2: Node {
            parameters:
                address = 122;
                @display("p=499,430");
        }
        node_1_2_3: Node {
            parameters:
                address = 123;
                @display("p=447,465");
        }

        // subtree 1.3
        node_1_3: Node {
            parameters:
                address = 13;
                @display("p=348,412");
        }

		// subtree 1.3 leaves
        node_1_3_3: Node {
            parameters:
                address = 131;
                @display("p=289,473");
        }
        node_1_3_2: Node {
            parameters:
                address = 132;
                @display("p=333,503");
        }
        node_1_3_1: Node {
            parameters:
                address = 133;
                @display("p=392,488");
        }

		// subtree 2
        node_2: Node {
            parameters:
                address = 2;
                @display("p=194,303");
        }

        // subtree 2.1
        node_2_1: Node {
            parameters:
                address = 21;
                @display("p=194,382");
        }

        // subtree 2.1 leaves
        node_2_1_1: Node {
            parameters:
                address = 211;
                @display("p=221,465");
        }

        node_2_1_2: Node {
            parameters:
                address = 212;
                @display("p=165,473");
        }

        node_2_1_3: Node {
            parameters:
                address = 213;
                @display("p=120,438");
        }

        // subtree 2.2
        node_2_2: Node {
            parameters:
                address = 22;
                @display("p=114,342");
        }

        // subtree 2.2 leaves
        node_2_2_1: Node {
            parameters:
                address = 221;
                @display("p=81,411");
        }

        node_2_2_2: Node {
            parameters:
                address = 222;
                @display("p=33,371");
        }

        node_2_2_3: Node {
            parameters:
                address = 223;
                @display("p=37,311");
        }

        // subtree 2.3
        node_2_3: Node {
            parameters:
                address = 23;
                @display("p=120,254");
        }

        // subtree 2.3 leaves
        node_2_3_1: Node {
            parameters:
                address = 231;
                @display("p=44,268");
        }

        node_2_3_2: Node {
            parameters:
                address = 232;
                @display("p=52,207");
        }

        node_2_3_3: Node {
            parameters:
                address = 233;
                @display("p=102,171");
        }

		// subtree 3
        node_3: Node {
            parameters:
                address = 3;
                @display("p=298,192");
        }

		// subtree 3.1
        node_3_1: Node {
            parameters:
                address = 31;
                @display("p=221,143");
        }

        // subtree 3.1 leaves
        node_3_1_1: Node {
            parameters:
                address = 311;
                @display("p=141,137");
        }

        node_3_1_2: Node {
            parameters:
                address = 312;
                @display("p=150,87");
        }

        node_3_1_3: Node {
            parameters:
                address = 313;
                @display("p=209,59");
        }

        // subtree 3.2
        node_3_2: Node {
            parameters:
                address = 32;
                @display("p=318,108");
        }

        // subtree 3.2 leaves
        node_3_2_1: Node {
            parameters:
                address = 321;
                @display("p=283,43");
        }

        node_3_2_2: Node {
            parameters:
                address = 322;
                @display("p=337,28");
        }

        node_3_2_3: Node {
            parameters:
                address = 323;
                @display("p=388,59");
        }

        // subtree 3.3
        node_3_3: Node {
            parameters:
                address = 33;
                @display("p=386,171");
        }

		// subtree 3.3 leaves
        node_3_3_1: Node {
            parameters:
                address = 331;
                @display("p=421,102");
        }

        node_3_3_2: Node {
            parameters:
                address = 332;
                @display("p=466,130");
        }

        node_3_3_3: Node {
            parameters:
                address = 333;
                @display("p=472,193");
        }

    connections allowunconnected:

        node_1.face++ <--> C <--> central_node.face++;
        node_2.face++ <--> C <--> central_node.face++;
        node_3.face++ <--> C <--> central_node.face++;

        node_1_1.face++ <--> C <--> node_1.face++;
        node_1_2.face++ <--> C <--> node_1.face++;
        node_1_3.face++ <--> C <--> node_1.face++;

        node_2_1.face++ <--> C <--> node_2.face++;
        node_2_2.face++ <--> C <--> node_2.face++;
        node_2_3.face++ <--> C <--> node_2.face++;

        node_3_1.face++ <--> C <--> node_3.face++;
        node_3_3.face++ <--> C <--> node_3.face++;
        node_3_2.face++ <--> C <--> node_3.face++;

        node_1_1.face++ <--> C <--> node_1_1_1.face++;
        node_1_1.face++ <--> C <--> node_1_1_2.face++;
        node_1_1.face++ <--> C <--> node_1_1_3.face++;
        node_1_2.face++ <--> C <--> node_1_2_1.face++;
        node_1_2.face++ <--> C <--> node_1_2_2.face++;
        node_1_2.face++ <--> C <--> node_1_2_3.face++;
        node_1_3.face++ <--> C <--> node_1_3_1.face++;
        node_1_3.face++ <--> C <--> node_1_3_2.face++;
        node_1_3.face++ <--> C <--> node_1_3_3.face++;

        node_2_1.face++ <--> C <--> node_2_1_1.face++;
        node_2_1.face++ <--> C <--> node_2_1_2.face++;
        node_2_1.face++ <--> C <--> node_2_1_3.face++;
        node_2_2.face++ <--> C <--> node_2_2_1.face++;
        node_2_2.face++ <--> C <--> node_2_2_2.face++;
        node_2_2.face++ <--> C <--> node_2_2_3.face++;
        node_2_3.face++ <--> C <--> node_2_3_1.face++;
        node_2_3.face++ <--> C <--> node_2_3_2.face++;
        node_2_3.face++ <--> C <--> node_2_3_3.face++;

        node_3_1.face++ <--> C <--> node_3_1_1.face++;
        node_3_1.face++ <--> C <--> node_3_1_2.face++;
        node_3_1.face++ <--> C <--> node_3_1_3.face++;
        node_3_2.face++ <--> C <--> node_3_2_1.face++;
        node_3_2.face++ <--> C <--> node_3_2_2.face++;
        node_3_2.face++ <--> C <--> node_3_2_3.face++;
        node_3_3.face++ <--> C <--> node_3_3_1.face++;
        node_3_3.face++ <--> C <--> node_3_3_2.face++;
        node_3_3.face++ <--> C <--> node_3_3_3.face++;
}
