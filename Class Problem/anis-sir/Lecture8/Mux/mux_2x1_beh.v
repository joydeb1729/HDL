// Behavioral description of two-to-one-line multiplexer
module mux_2x1_beh (m_out, A, B, select);
 	output m_out;
	input A, B, select;
	reg m_out;
	always @(A or B or select)
	 if (select == 1) m_out = A;
	 else m_out=B;
endmodule

module t_mux_2x1_beh;
   wire m_out;
   reg A, B, select;
   mux_2x1_beh M1 (m_out, A, B, select); 
	initial
	begin 
		//$dumpfile("mux_2x1_beh.vcd");
		//$dumpvars(0,t_mux_2x1_beh);
		A = 1'b0; B = 1'b1; select = 1'b0;
		#100 A = 1'b0; B = 1'b1; select = 1'b1;
	end
	initial #200 $finish;
	initial
	  $monitor("A=%b  B=%b S=%b Output=%b ",A,B,select,m_out);
endmodule