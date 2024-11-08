// Structural model
module Moore_Model_STR_Fig_5_20 (
	output y_out, A, B,
	input x_in, clock, reset);
	wire TA, TB;
	// Flip-fl op input equations
	assign TA = x_in & B;
	assign TB = x_in;
	// Output equation
	assign y_out = A & B;
	// Instantiate Toggle fl ip-fl ops
	 Toggle_flip_flop M_A (A, TA, clock, reset);
	 Toggle_flip_flop M_B (B, TB, clock, reset);
endmodule
          
module Toggle_flip_flop (Q, T, CLK, RST_b);
	output Q;
	input T, CLK, RST_b;
	reg Q;
	always @ ( posedge CLK, negedge RST_b)
	 if (RST_b == 0)
	    Q <= 1'b0;
	 else if (T)   // alternative else Q <= Q ^ T 
	    Q <= ~Q; 
endmodule