module half_adder ( output S, C, input x, y);
	xor (S, x, y);
	and (C, x, y);
endmodule

module multiplier_2x2 (output [3:0] P, input [1:0] A,B);
	wire a0b0,a0b1,a1b0,a1b1,T;
	and
	   A1 (a0b0, A[0],B[0]),
	   A2 (a0b1, A[0],B[1]),
	   A3 (a1b0, A[1],B[0]),
	   A4 (a1b1, A[1],B[1]);
	   assign P[0] = a0b0;                 
	   half_adder HA1 ( P[1], T, a0b1, a1b0);
	   half_adder HA2 ( P[2], P[3], T, a1b1);
endmodule