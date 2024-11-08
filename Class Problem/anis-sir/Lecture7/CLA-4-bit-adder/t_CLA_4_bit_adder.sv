`include "CLA_4_bit_adder.sv"
module t_CLA_4_bit_adder;
	wire C1,C2,C3,C4;
	wire [3:0] S;
	wire [3:0] P,G;
	reg [3:0] A, B;
	reg C0;
	CLA_4_bit_adder CLA4bA ( A,B, C0, S,C4); // Instance name required
	//Generate_PG PG (A,B,P,G);
	initial
	begin 
		//$dumpfile("CLA_4_bit_adder.vcd");
		//$dumpvars(0,t_CLA_4_bit_adder);
		    A = 4'b0001; B = 4'b0111; C0 =1'b0; 
		#10 A = 4'b1111; B = 4'b0111; C0 =1'b0;
	end
	initial #250 $finish;
	initial
	begin : monitor
	    //$monitor ("A = %4b",A," B= %4b",B," P= %4b",P, " G= %4b",G); 
	    $monitor ("A = %4b",A," B= %4b",B," C_out= %b",C4, " S= %4b",S); 
	end  // monitor
	
endmodule
