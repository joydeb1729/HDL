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

module ripple_carry_4_bit_adder ( output [3: 0] Sum, output C4, input [3: 0] A, B,input C0);
	wire C1, C2, C3; // Intermediate carries
	
	full_adder 
		FA0 (Sum[0], C1, A[0], B[0], C0),
		FA1 (Sum[1], C2, A[1], B[1], C1),
		FA2 (Sum[2], C3, A[2], B[2], C2),
		FA3 (Sum[3], C4, A[3], B[3], C3);
endmodule