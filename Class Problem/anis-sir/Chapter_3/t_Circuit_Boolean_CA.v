module t_Circuit_Boolean_CA;
	wire E, F;
	reg A, B, C, D;
	Circuit_Boolean_CA M1 (E,F,A, B, C, D); // Instance name required
	initial
	begin 
		$dumpfile("Circuit_Boolean_CA.vcd");
		$dumpvars(0,t_Circuit_Boolean_CA);
		A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b0;
		#10 A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b1;
		#10 A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b0;
		#10 A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b1;
		#10 A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b1;
	end
	initial #50 $finish;
endmodule
