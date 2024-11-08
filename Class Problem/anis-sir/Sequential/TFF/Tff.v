// T fl ip-fl op from D fl ip-fl op and gates
`include "DFF.sv"
module TFF (Q, T, Clk, rst);
 	output Q;
	input T, Clk, rst;
	wire DT;
	 
	 assign DT = Q ^ T ; // Continuous assignment
	 DFF TF1 (Q, DT, Clk, rst); 	// Instantiate the D fl ip-fl op
endmodule

module t_TFF;
	wire t_Q;
	reg t_T, t_Clk, t_rst;
	TFF  T ( t_Q, t_T, t_Clk, t_rst);
	initial 
		begin
		   $dumpfile("Tff.vcd");
	       $dumpvars(0, t_TFF);
		end
	initial #110 $finish;
	initial begin t_Clk = 0; forever #5 t_Clk = ~t_Clk; end
	initial fork
	     #21 t_rst = 0;
		 #22 t_rst = 1;
		 #23 t_rst = 0;
		 #24 t_rst = 1;
		 //#66 t_rst = 1;
		 //#92 t_rst = 0;
		 #12 t_T = 1;
		 #22 t_T = 0;
		 #32 t_T = 0;
		 #42 t_T = 1;
		 #52 t_T = 0;
		 #62 t_T = 1;
		 //#70 t_D = 0;
		 //#80 t_D = 0;
		 #92 t_T = 1;
		 #102 t_T = 0;	 
	 join
endmodule