// Gate-level description of circuit of Fig. 4.2 
// D fl ip-fl op with asynchronous reset (V2001, V2005)
module DFF ( output reg Q, input D, Clk, rst);
	always @( posedge Clk, negedge rst)
	 if (!rst) Q <= 1'b0; // Same as: if (rst == 0)
	else Q <= D;
endmodule
