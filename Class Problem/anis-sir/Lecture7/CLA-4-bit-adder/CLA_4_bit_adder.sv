module half_adder ( output S, C, input x, y);
	xor (S, x, y);
	and (C, x, y);
endmodule
module Generate_PG(input [3:0] A,B,output [3:0] P,G);
	half_adder 
	  HA1 ( P[0], G[0],A[0], B[0]),
	  HA2 ( P[1], G[1],A[1], B[1]),
	  HA3 ( P[2], G[2],A[2], B[2]),
	  HA4 ( P[3], G[3],A[3], B[3]);
endmodule

module Carry_Look_Ahead(output [4:0] C, input c0_in, input [3:0] G,P);
	assign C[0] = c0_in;
	assign C[1] = G[0]|(P[0]&c0_in);
	assign C[2] = G[1]|(P[1]&G[0])|(P[1]&P[0]&c0_in);
	assign C[3] = G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&c0_in);
	assign C[4] = G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&c0_in);
endmodule                              
module CLA_4_bit_adder(input [3:0] A,B, input c0_in, output [3:0] S, output c4);
	wire [3:0] G,P;
	wire [4:0] C;
	Generate_PG PG (A,B,P,G);
	Carry_Look_Ahead CLA (C,c0_in,G,P);
	assign c4 = C[4];
	xor 
	  x3 (S[3],C[3],P[3]),
	  x2 (S[2],C[2],P[2]),
	  x1 (S[1],C[1],P[1]),
	  x0 (S[0],C[0],P[0]);
endmodule                            
