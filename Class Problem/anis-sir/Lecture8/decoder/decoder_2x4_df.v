// Dataflow description of two-to-four-line decoder
// See Fig. 4.19 . Note: The figure uses symbol E, but the
// Verilog model uses enable to clearly indicate functionality.
module decoder_2x4_df ( 
 output [0: 3] D,
 input A, B, enable);
 
 assign D[0] = !((!A) && (!B) && (!enable)),
        D[1] = !((!A) && B && (!enable)),
        D[2] = !(A && (!B) && (!enable)),
        D[3] = !(A && B && (!enable)); 
	 
endmodule

module t_decoder_2x4_df;
	wire [0 : 3] D;
	reg A, B, enable;
	decoder_2x4_df D1 (D,A, B,enable); // Instance name required
	initial
	begin 
		$dumpfile("decoder_2x4_df.vcd");
		$dumpvars(0,t_decoder_2x4_df);
		A = 1'b0; B = 1'b0; enable = 1'b0;
		#50 A = 1'b0; B = 1'b1; enable = 1'b0;
	    #50 A = 1'b1; B = 1'b0; enable = 1'b0;
	    #50 A = 1'b1; B = 1'b1; enable = 1'b0;
	    #50 A = 1'b1; B = 1'b1; enable = 1'b1;
	end
	initial #250 $finish;           
	initial 
	  $monitor("A=%b B=%b E=%b D=%4b",A,B,enable,D);
endmodule