module mux_tri (output m_out, input A, B, select);
	tri m_out;
	bufif1 (m_out, A, select);
	bufif0 (m_out, B, select);
endmodule

module t_mux_tri;
	//wire m_out;
	reg A, B, select;
	tri m_out;
	mux_tri M1 ( m_out, A, B, select); 
	
	initial
	begin 
		$dumpfile("mux_tri.vcd");
		$dumpvars(0,t_mux_tri);
		A = 1'b0; B = 1'b0; select = 1'b1;
		#10 A = 1'b1; B = 1'b1; select = 1'b1;
		//#10 A = 1'b0; B = 1'b0; select = 1'b1;
	end
	initial #30 $finish;
endmodule