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

module t_mux_4x1_beh;
   wire m_out;
   reg in_0, in_1, in_2, in_3;
   reg [1: 0] select;
   mux_4x1_beh M1 (m_out, in_0, in_1, in_2, in_3, select); 
	initial
	begin 
		$dumpfile("mux_4x1_beh.vcd");
		$dumpvars(0,t_mux_4x1_beh);
		in_0 = 1'b0; in_1 = 1'b1; in_2 = 1'b0; in_3 = 1'b1; select = 2'b00;
		#50 select = 2'b01;
		#50 select = 2'b10;
		#50 select = 2'b11;
		#50 in_3 = 1'b0;
	end
	initial #300 $finish;
endmodule