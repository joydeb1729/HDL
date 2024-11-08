`include "4_bit_add_sub.sv"
module t_4_bit_add_sub;
	wire C1,C2,C3,C4;
	wire [3:0] S;
	reg [3:0] A, B;
	reg M;
	_4_bit_add_sub AddSum ( S, C, V, A, B, M); // Instance name required
	initial
	begin 
		//$dumpfile("4_bit_add_sub.vcd");
		//$dumpvars(0,t_4_bit_add_sub);
		    A = 4'b0001; B = 4'b0111; M =1'b0;
		#10 A = 4'b1111; B = 4'b1001; M =1'b1;
		#10 A = 4'b1001; B = 4'b1011; M =1'b1;
	end
	initial #250 $finish;
	initial
	    $monitor ("A = %4b",A," B= %4b",B," C_out= %b",C, " S= %4b",S, " V = %b",V); 
endmodule
