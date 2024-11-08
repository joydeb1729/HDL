// Behavioral description of four-to-one line multiplexer
// Verilog 2001, 2005 port syntax
module mux_4x1_beh(
	output reg m_out,
	input in_0, in_1, in_2, in_3,
	input [1: 0] select);
	
	always @(in_0, in_1, in_2, in_3, select) 
	 case (select)
	 	 2'b00: m_out = in_0;
		 2'b01: m_out = in_1;
		 2'b10: m_out = in_2;
		 2'b11: m_out = in_3;
	 endcase
endmodule 

module mux_adder(input A,B,C_in, output Sum, C_out);
	wire [1:0] select;
	assign select = {A,B};
	mux_4x1_beh m_Sum (Sum,C_in,~C_in,~C_in, C_in, select);
	mux_4x1_beh m_C_out (C_out,1'b0,C_in,C_in,1'b1, select);
endmodule

module t_mux_adder;
   wire Sum,C_out;
   reg A,B,C_in;
   mux_adder M1 (A,B,C_in, Sum, C_out); 
   initial
	begin 
		//$dumpfile("mux_adder.vcd");
		//$dumpvars(0,t_mux_adder);
		    A = 1'b0; B = 1'b0; C_in = 1'b0;
		#10 A = 1'b0; B = 1'b0; C_in = 1'b1;
		#10 A = 1'b0; B = 1'b1; C_in = 1'b0;
		#10 A = 1'b0; B = 1'b1; C_in = 1'b1;
		#10 A = 1'b1; B = 1'b0; C_in = 1'b0;
		#10 A = 1'b1; B = 1'b0; C_in = 1'b1;
		#10 A = 1'b1; B = 1'b1; C_in = 1'b0;
		#10 A = 1'b1; B = 1'b1; C_in = 1'b1;
	end
	initial #100 $finish; 
	initial
	begin
	    $monitor("A=%b B=%b C_in=%b Sum=%b C_out=%b",A,B,C_in,Sum,C_out );
	end
endmodule