// Ripple counter (See Fig. 6.8 (b))
// `timescale 1ns / 100 ps
//`timescale 1ns / 1000ps
module Ripple_Counter_4bit (A3, A2, A1, A0, Count, Reset);
	output A3, A2, A1, A0;
	input Count, Reset;
	// Instantiate complementing fl ip-fl op
	 Comp_D_flip_flop F0 (A0, Count, Reset);
	 Comp_D_flip_flop F1 (A1, A0, Reset);
	 Comp_D_flip_flop F2 (A2, A1, Reset);
	 Comp_D_flip_flop F3 (A3, A2, Reset);
endmodule
// Complementing flip-flop with delay
// Input to D flip-flop = Q'
module Comp_D_flip_flop (Q, CLK, Reset);
	 output Q;
	 input CLK, Reset;
	 reg Q;
	 always @ ( negedge CLK, posedge Reset)
	 if (Reset) 
	 	Q <= 1'b0;
	 else
	 	//Q <= #2 ~Q; // intra-assignment delay 
	 	Q <= #2 ~Q;
endmodule