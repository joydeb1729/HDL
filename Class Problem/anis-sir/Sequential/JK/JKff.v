// Functional description of JK fl ip-fl op (V2001, 2005)
module JK_FF ( input J, K, Clk, output reg Q, output Q_b);
assign Q_b = ~ Q ;
always @ ( posedge Clk)
case ({J,K})
 2'b00: Q <= Q;
 2'b01: Q <= 1'b0;
 2'b10: Q <= 1'b1;
 2'b11: Q <= !Q;
endcase
endmodule

module t_JK_FF;
	wire t_Q, t_Q_b;
	reg t_J,t_K, t_Clk;
	JK_FF  JK ( t_J,t_K, t_Clk, t_Q, t_Q_b );
	initial 
		begin
		   $dumpfile("Jkff.vcd");
	       $dumpvars(0, t_JK_FF);
		end
	initial #110 $finish;
	initial begin t_Clk = 0; forever #5 t_Clk = ~t_Clk; end
	initial fork
	     		 
		 #2 t_J = 1;
		 #2 t_K = 0;
		 
		 #22 t_J = 0;
		 #22 t_K = 1;
		 
		 //#32 t_J = 0;
		 #32 t_K = 0;  
		 
		 #42 t_J = 1;
		 #42 t_K = 1;
		 
		 
		 #52 t_J = 0;
		 #52 t_K = 0; 
		 
		 #62 t_J = 1;
		 #62 t_K = 1;	 
	 join
endmodule