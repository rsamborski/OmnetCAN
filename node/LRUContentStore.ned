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

package omnetcan.node;


simple LRUContentStore like ContentStore {
	parameters:
	    int csSize; // max content store size
	    int contentLookupDelay; //content lookup delay
		@display("i=device/memory");
		@signal[dataHit](type="int");
		@signal[dataMiss](type="int");
		//@signal[csDataLookup](type="int");
		@signal[csDataStore](type="int");
		@signal[csDataExchange](type="int");
		@statistic[dataHit](title="packet found in content store";record=vector,count,sum;interpolationmode=none);
		@statistic[dataMiss](title="packet NOT found in content store";record=vector,count,sum;interpolationmode=none);
		//@statistic[csDataLookup](title="searching packet in content store";record=vector,count,sum;interpolationmode=none);
		@statistic[csDataStore](title="data stored in content store";record=vector,count,sum;interpolationmode=none);
		@statistic[csDataExchange](title="data replaced in content store";record=vector,count,sum;interpolationmode=none);
		
	gates:
	    input in;
	    output out;   
}