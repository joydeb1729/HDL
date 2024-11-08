// Dataflow description of a four-bit comparator 
module mag_compare
( output A_lt_B, A_eq_B, A_gt_B,
 input [3: 0] A, B);
 assign 
 	A_lt_B = (A < B),
	A_gt_B = (A > B),
	A_eq_B = (A == B);
endmodule

module t_mag_compare;
	wire  A_lt_B, A_eq_B, A_gt_B;
	reg [3:0] A, B;

	mag_compare MC ( A_lt_B, A_eq_B, A_gt_B, A, B); // Instance name required
	initial
	begin 
		$dumpfile("mag_compare.vcd");
		$dumpvars(0,t_mag_compare);
		A = 4'b0001; B = 4'b0111;
	end
	initial #100 $finish;
endmodule