`include "JKFF.sv"
module t_JKFF;
	wire t_Q;
	reg t_J,t_K, t_Clk, t_rst;
	JKFF  JK ( t_Q, t_J,t_K, t_Clk, t_rst);
	initial 
		begin
		   $dumpfile("t_JKFF.vcd");
	       $dumpvars(0, t_JKFF);
		end
	initial #110 $finish;
	initial begin t_Clk = 0; forever #5 t_Clk = ~t_Clk; end
	initial fork
	     #0 t_rst = 0;
		 #1 t_rst = 1;
		 #3 t_rst = 0;
		 #4 t_rst = 1;
		 #87 t_rst = 0;
		 #92 t_rst = 1;
		 
		 #2 t_J = 0;
		 #2 t_K = 0;
		 
		 //#22 t_J = 0;
		 #22 t_K = 1;
		 
		 #32 t_J = 1;
		 #32 t_K = 0;  
		 
		 //#42 t_J = 1;
		 #42 t_K = 1;
		 
		 
		 #52 t_J = 0;
		 #52 t_K = 0; 
		 
		 #62 t_J = 1;
		 #62 t_K = 1;	 
	 join
endmodule