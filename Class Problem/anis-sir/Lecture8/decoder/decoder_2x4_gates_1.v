module decoder_2x4_gates (D, A, B, enable);
	output [0: 3] D;
	input A, B;
	input enable;
	wire A_not,B_not, enable_not;
	not
	 G1 (A_not, A),
	 G2 (B_not, B),
	 G3 (enable_not, enable);
	and
	 G4 (D[0], A_not, B_not, enable),
	 G5 (D[1], A_not, B, enable),
	 G6 (D[2], A, B_not, enable),
	 G7 (D[3], A, B, enable);
endmodule