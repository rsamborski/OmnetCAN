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

//module Node {
//    parameters:
//       @display("i=misc/node_vs");
//    gates:
//        inout parent;
//        inout child[];
//  connections allowunconnected:
//}

//
// A generated network with k-ary tree topology.
//
network Simple_tree
{
    types:
        channel C extends DatarateChannel
        {
            parameters:
                delay = 0.1ms;
                datarate = 1Mbps;
        }
    
    submodules:
        node_0_0: Node { parameters: address = 0; }

        node_1_0: Node { parameters: address = 10; }
        node_1_1: Node { parameters: address = 11; }
        node_1_2: Node { parameters: address = 12; }

        node_2_0: Node { parameters: address = 20; }
        node_2_1: Node { parameters: address = 21; }
        node_2_2: Node { parameters: address = 22; }
        node_2_3: Node { parameters: address = 23; }
        node_2_4: Node { parameters: address = 24; }
        node_2_5: Node { parameters: address = 25; }
        node_2_6: Node { parameters: address = 26; }
        node_2_7: Node { parameters: address = 27; }
        node_2_8: Node { parameters: address = 28; }

    connections allowunconnected:
        node_1_0.face++ <--> C <--> node_0_0.face++;
        node_1_1.face++ <--> C <--> node_0_0.face++;
        node_1_2.face++ <--> C <--> node_0_0.face++;

        node_2_0.face++ <--> C <--> node_1_0.face++;
        node_2_1.face++ <--> C <--> node_1_0.face++;
        node_2_2.face++ <--> C <--> node_1_0.face++;
        node_2_3.face++ <--> C <--> node_1_1.face++;
        node_2_4.face++ <--> C <--> node_1_1.face++;
        node_2_5.face++ <--> C <--> node_1_1.face++;
        node_2_6.face++ <--> C <--> node_1_2.face++;
        node_2_7.face++ <--> C <--> node_1_2.face++;
        node_2_8.face++ <--> C <--> node_1_2.face++;

}
