// Stimulus for testing ripple counter
`include "Ripple_Counter_4bit.sv"
module t_Ripple_Counter_4bit;
 	reg Count;
	reg Reset;
	//wire [3:0] A0, A1, A2, A3;
	wire [3:0] A;
		// Instantiate ripple counter
	Ripple_Counter_4bit M0 (A[3], A[2], A[1], A[0], Count, Reset); 
	//Ripple_Counter_4bit M0 (A3, A2, A1, A0, Count, Reset);
	initial 
		begin
			$dumpfile("t_Ripple_Counter_4bit.vcd");
			$dumpvars(0, t_Ripple_Counter_4bit);
		end 
	 initial #170 $finish;   
     initial
       begin
         Count = 1'b0;
         repeat(33)
   		    #5 Count = ~Count; 
   	   end
	initial
	 begin
	 	#4 Reset = 1'b0;
		#4 Reset = 1'b1;
        #4 Reset = 1'b0; 
        //#4 Reset = 1'b1;
	 end
	 always @ (posedge Count)
		 $monitor("Time = ",$time,"  Output =  %h ",A);
endmodule
