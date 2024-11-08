//`include "mux_2x1_df.sv"
`include "mux_2x1_df.sv"
module t_mux_2x1_df;
	 wire t_mux_out;
	 reg t_A, t_B;
	 reg t_select;
	 parameter stop_time=50;
	
	 mux_2x1_df M1 (t_mux_out, t_A, t_B, t_select); // Instantiation of circuit to be tested
	 initial # stop_time $finish;
	
    initial begin // Stimulus generator
	 	 t_select=1; t_A=0; t_B=1;
		 #10 t_A=1; t_B=0;
		 #10 t_select=0;
		 #10 t_A=0; t_B=1;
	end 
	always @ (t_A,t_B,t_select)
			$monitor("time = ", $time, " select = ",t_select," A= ",t_A," B= ",t_B, " OUT= ", t_mux_out);
endmodule  