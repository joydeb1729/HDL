// Gate-level description of circuit of Fig. 4.2 
// D fl ip-fl op with asynchronous reset (V2001, V2005)
module DFF ( output reg Q, input D, Clk, rst);
	always @( posedge Clk, negedge rst)
	 if (!rst) Q <= 1'b0; // Same as: if (rst == 0)
	else Q <= D;
endmodule

module Homework9(output A, B,input x, A_P,B_P,Clk,rst);
	wire A_in,B_in;
	//reg x, A_P,B_P;
	assign  A_in = ((~x)&A_P)|(A_P&(~B_P))|(x&(~A_P)&B_P);
	assign B_in = (x^B_P);
	DFF DA (A,A_in,Clk,rst); 
	DFF DB (B,B_in,Clk,rst);
endmodule

module t_Homework9;
	wire A,B,A_in,B_in;
	reg x, t_Clk, t_rst;
	Homework9 h9 ( A,B, x,A,B, t_Clk, t_rst);
	initial 
		begin
		   $dumpfile("t_Homework9.vcd");
	       $dumpvars(0, t_Homework9);
		end
	initial #110 $finish;
	initial 
	   begin 
	      t_Clk = 0; 
	      forever 
	         #5 t_Clk = ~t_Clk; 
	   end
	initial fork     
	     #1 x=1;
	     #1 t_rst = 0;
		 #2 t_rst = 1;
		 #87 t_rst = 0;
		 #92 t_rst = 1;
		 #10 x = 1;
		 #20 x = 0;
		 #30 x = 1;  
		 #35 x = 1;
		 #40 x = 1;
		 #60 x = 0;
		 //#60 x = 1;
		 //#65 x = 0;
		 #80 x = 1;
		 #90 x = 0;
		 #100 x = 0;	 
	 join
endmodule