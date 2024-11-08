`include "multiplier_2x2.sv"
module t_multiplier_2x2;
	wire [3:0] P;
	reg [1:0] A, B;
	multiplier_2x2 mul ( P,A,B); // Instance name required
	initial
	begin 
		//$dumpfile("multiplier_2x2.vcd");
		//$dumpvars(0,t_multiplier_2x2);
		    A = 2'b01; B = 2'b11;
		#10 A = 2'b10; B = 2'b10; 
		#10 A = 2'b11; B = 2'b00;
	end
	initial #250 $finish;
	initial
	    $monitor ("A = %2b",A," B= %2b",B, " P= %4b",P); 
endmodule
