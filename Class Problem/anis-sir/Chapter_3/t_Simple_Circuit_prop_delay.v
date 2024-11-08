module t_Simple_Circuit_prop_delay;
	wire D, E;
	reg A, B, C;
	Simple_Circuit_prop_delay M1 (A, B, C, D, E); // Instance name required
	initial
	begin 
		$dumpfile("Simple_Circuit_prop_delay.vcd");
		$dumpvars(0,t_Simple_Circuit_prop_delay);
		A = 1'b0; B = 1'b0; C = 1'b0;
		#100 A = 1'b1; B = 1'b1; C = 1'b1;
	end
	initial #200 $finish;
endmodule
