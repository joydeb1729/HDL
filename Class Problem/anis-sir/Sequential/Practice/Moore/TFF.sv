// T fl ip-fl op from D fl ip-fl op and gates
`include "DFF.sv"
module TFF (Q, T, Clk, rst);
 	output Q;
	input T, Clk, rst;
	wire DT;
	 
	 assign DT = Q ^ T ; // Continuous assignment
	 DFF TF1 (Q, DT, Clk, rst); 	// Instantiate the D fl ip-fl op
endmodule
