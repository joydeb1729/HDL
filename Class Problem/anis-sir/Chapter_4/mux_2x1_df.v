// Dataflow description of two-to-one-line multiplexer
module mux_2x1_df(m_out, A, B, select);
     output m_out;
	 input A, B;
	 input select;
	 assign m_out = (select)? A : B;
endmodule

module t_mux_2x1_df;
   wire m_out;
   reg A, B, select;
   mux_2x1_df M1 (m_out, A, B, select); 
	initial
	begin 
		$dumpfile("mux_2x1_df.vcd");
		$dumpvars(0,t_mux_2x1_df);
		A = 1'b0; B = 1'b1; select = 1'b0;
		#100 A = 1'b0; B = 1'b1; select = 1'b1;
	end
	initial #200 $finish;
endmodule