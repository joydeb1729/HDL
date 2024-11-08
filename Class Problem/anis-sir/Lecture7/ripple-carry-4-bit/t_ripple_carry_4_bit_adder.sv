`include "ripple_carry_4_bit_adder.sv"
module t_ripple_carry_4_bit_adder;
	wire C1,C2,C3,C4;
	wire [3:0] S;
	reg [3:0] A, B;
	reg C0;
	ripple_carry_4_bit_adder RC4bA ( S, C4, A, B, C0); // Instance name required
	initial
	begin 
		//$dumpfile("ripple_carry_4_bit_adder.vcd");
		//$dumpvars(0,t_ripple_carry_4_bit_adder);
		    A = 4'b0001; B = 4'b0111; C0 =1'b0;
		#10 A = 4'b1111; B = 4'b0111; C0 =1'b0;
	end
	initial #250 $finish;
	initial
	    $monitor ("A = %4b",A," B= %4b",B," C_out= %b",C4, " S= %4b",S); 
endmodule
