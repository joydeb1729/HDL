`include "decoder_2x4_gates.v"
module t_decoder_2x4_gates;
	wire [0 : 3] D;
	reg A, B, enable;
	decoder_2x4_gates D1 (D,A, B,enable); // Instance name required
	initial
	begin 
		$dumpfile("decoder_2x4_gates.vcd");
		$dumpvars(0,t_decoder_2x4_gates);
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
