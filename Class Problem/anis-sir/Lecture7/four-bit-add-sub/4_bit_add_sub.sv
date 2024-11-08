module half_adder ( output S, C, input x, y);
	xor (S, x, y);
	and (C, x, y);
endmodule

module full_adder ( output S, C, input x, y, z); 
	wire S1, C1, C2;
	half_adder HA1 (S1, C1, x, y);
	half_adder HA2 (S, C2, S1, z);
	or G1 (C, C2, C1);
endmodule 

module B_xor_M(output [3:0] C, input [3:0] B, input M);
	xor 
	   X3 (C[3],B[3],M),
	   X2 (C[2],B[2],M),
	   X1 (C[1],B[1],M),
	   X0 (C[0],B[0],M);
endmodule 

module _4_bit_add_sub ( output [3:0] Sum, output C,V, input [3:0] A, B, input M);
	wire C1, C2, C3,C4; // Intermediate carries
	wire [3:0] D;
	B_xor_M bxm (D,B,M);
	full_adder 
		FA0 (Sum[0], C1, A[0], D[0], M),
		FA1 (Sum[1], C2, A[1], D[1], C1),
		FA2 (Sum[2], C3, A[2], D[2], C2),
		FA3 (Sum[3], C,  A[3], D[3], C3);
	xor X (V, C3, C);
endmodule