// Stimulus to analyze the circuit
`include "Circuit_of_Fig_4_2.sv"
module test_circuit;
 	 reg [2: 0] D;
	 wire F1, F2;      
	 parameter stop_time = 80;
	 
	 Circuit_of_Fig_4_2 CF42 (D[2], D[1], D[0], F1, F2);  
	 initial # stop_time $finish;
	 
	 initial
	 	begin
	 	   $dumpfile("Circuit_of_Fig_4_2.vcd");
		   $dumpvars(0,test_circuit);
		 D = 3'b000;
		 repeat (7) #10 D = D + 1'b1;
		 end
	 initial
	 $monitor ("Time =", $time,,"  ABC = %b F1 = %b F2 = %b ", D, F1, F2);
endmodule