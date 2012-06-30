
package omnetcan.node;

//
// A "Node" consists of a Routing plus an App module which represents the
// aggregate traffic of the subnets connected to that router.
//
module Node
{
    parameters:
        int address; 
        string appType;
        @display("i=misc/node_vs,gold");
    gates:
        inout face[];
    submodules:
        app: <appType> like IApp {
            parameters:
                address = address;
                @display("p=140,60");
        }
        routing: Routing {
            parameters:
                @display("p=140,130");
            gates:
                in[sizeof(face)];
                out[sizeof(face)];
        }
        queue[sizeof(face)]: L2Queue {
            parameters:
                @display("p=80,200,row");
        }

        lfuContentStore: LRUContentStore {
            parameters:
                @display("p=229,130");
        }

    connections:
        routing.localOut --> app.in;
        routing.localIn <-- app.out;

		// connection with content store
        routing.storeIn <-- lfuContentStore.out;
        routing.storeOut --> lfuContentStore.in;

        for i=0..sizeof(face)-1 {
            routing.out[i] --> queue[i].in;
            routing.in[i] <-- queue[i].out;
            queue[i].line <--> face[i];
        }
}