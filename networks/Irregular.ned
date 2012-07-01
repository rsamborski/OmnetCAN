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
    @display("bgb=400,400");
    types:
        channel C extends DatarateChannel
        {
            parameters:
                delay = 0.1ms;
                datarate = 1Mbps;
        }

    submodules:

        node0: Node {
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
    connections allowunconnected:

        node0.face++ <--> C <--> node7.face++;
        node7.face++ <--> C <--> node2.face++;
        node2.face++ <--> C <--> node9.face++;
        node9.face++ <--> C <--> node3.face++;
        node9.face++ <--> C <--> node6.face++;
        node6.face++ <--> C <--> node2.face++;
        node2.face++ <--> C <--> node1.face++;
        node1.face++ <--> C <--> node5.face++;
        node1.face++ <--> C <--> node8.face++;
        node1.face++ <--> C <--> node4.face++;
        node1.face++ <--> C <--> node0.face++;
        node1.face++ <--> C <--> node7.face++;
        node9.face++ <--> C <--> node5.face++;
        node5.face++ <--> C <--> node7.face++;
        node6.face++ <--> C <--> node7.face++;
        node9.face++ <--> C <--> node4.face++;
}
