// JK fl ip-fl op from D fl ip-fl op and gates (V2001, 2005)  
`include "DFF.sv"
module JKFF (output Q, input J, K, Clk, rst);
	wire JK;
	assign JK = (J & ~Q) | (~K & Q);
	// Instantiate D fl ip-fl op
	 DFF JK1 (Q, JK, Clk, rst);
endmodule

