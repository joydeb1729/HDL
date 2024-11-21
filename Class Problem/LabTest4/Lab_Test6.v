module Lab_Test6_Up (A2, A1, A0, Count, Reset);
    output A2, A1, A0;
    input Count, Reset;

    // Instantiate complementing D flip-flops for the up counter
    Comp_D_flip_flop F0 (A0, Count, Reset);
    Comp_D_flip_flop F1 (A1, A0, Reset);
    Comp_D_flip_flop F2 (A2, A1, Reset);
endmodule

module Lab_Test6_Down (A2, A1, A0, Count, Reset);
    output A2, A1, A0;
    input Count, Reset;

    // Instantiate regular D flip-flops for the down counter
    D_flip_flop F0 (A0, Count, Reset);
    D_flip_flop F1 (A1, A0, Reset);
    D_flip_flop F2 (A2, A1, Reset);
endmodule

module Comp_D_flip_flop (Q, CLK, Reset);
    output reg Q;
    input CLK, Reset;

    always @(negedge CLK or posedge Reset) begin
        if (Reset) 
            Q <= 1'b0; 
        else 
            Q <= ~Q; 
    end
endmodule

module D_flip_flop (Q, CLK, Reset);
    output reg Q;
    input CLK, Reset;

    always @(posedge CLK or posedge Reset) begin
        if (Reset) 
            Q <= 1'b0; 
        else 
            Q <= ~Q; 
    end
endmodule

module t_Lab_Test6;
 	reg CLK;
	reg Reset;
	wire [2:0] A;
	wire [2:0] B;
	
	 Lab_Test6_Up N (A[2], A[1], A[0], CLK, Reset);
	 Lab_Test6_Down P (B[2], B[1], B[0], CLK, Reset);  
	
	initial 
		begin
			$dumpfile("Lab_Test6.vcd");
			$dumpvars(0, t_Lab_Test6);
		end 
	 initial #170 $finish;   
     initial
       begin
         CLK = 1'b0;
         repeat(33)
   		    #5 CLK = ~CLK; 
   	   end
	initial
	 begin
	 	#4 Reset = 1'b0;
		#4 Reset = 1'b1;
        #4 Reset = 1'b0; 
	 end
endmodule
