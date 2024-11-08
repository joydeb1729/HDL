`include "DFF.sv"
module t_DFF;
	wire t_Q;
	reg t_D, t_Clk, t_rst;
	DFF  D ( t_Q, t_D, t_Clk, t_rst);
	initial 
		begin
		   $dumpfile("t_DFF.vcd");
	       $dumpvars(0, t_DFF);
		end
	initial #110 $finish;
	initial 
	   begin 
	      t_Clk = 0; 
	      forever 
	         #5 t_Clk = ~t_Clk; 
	   end
	initial fork
	        t_rst = 0;
		 #2 t_rst = 1;
		 #87 t_rst = 0;
		 #92 t_rst = 1;
		 #10 t_D = 1;
		 #20 t_D = 0;
		 #30 t_D = 0;
		 #40 t_D = 1;
		 #50 t_D = 0;
		 #60 t_D = 1;
		 //#70 t_D = 0;
		 //#80 t_D = 0;
		 #90 t_D = 1;
		 #100 t_D = 0;	 
	 join
endmodule