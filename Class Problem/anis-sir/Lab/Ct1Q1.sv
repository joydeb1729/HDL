// Behavioral description of four-to-one line multiplexer
// Verilog 2001, 2005 port syntax
module SOP(
	output FS,
	input x,y,z);
	assign FS = y|(~x&z);
endmodule

module POS(
	output FP,
	input x,y,z);
	assign FP = (~x|y)&(y|z);
endmodule  

module t_Ct1Q1;
   wire FSop,FPos;
   reg x,y,z;
   SOP S (FSop, x, y, z); 
   POS P (FPos, x, y, z);
   
	initial
	begin 
		$dumpfile(" t_Ct1Q1.vcd");
		$dumpvars(0, t_Ct1Q1);
		    x = 1'b0; y = 1'b0; z = 1'b0;
		#10 x = 1'b0; y = 1'b0; z = 1'b1;
		#10 x = 1'b0; y = 1'b1; z = 1'b0;
		#10 x = 1'b0; y = 1'b1; z = 1'b1;
		#10 x = 1'b1; y = 1'b0; z = 1'b0;
		#10 x = 1'b1; y = 1'b0; z = 1'b1;
		#10 x = 1'b1; y = 1'b1; z = 1'b0;
		#10 x = 1'b1; y = 1'b1; z = 1'b1;
	end
	initial #110 $finish;
endmodule