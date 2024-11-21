module DFF ( output reg Q, input D, Clk, rst);
	always @( posedge Clk, negedge rst)
	 if (!rst) Q <= 1'b0; // Same as: if (rst == 0)
	else Q <= D;
endmodule

module Problem_5_16_n (output A, B,  input x_in, clk, res);

    wire Da, Db;

    // assign Da = (~x_in && ~B) | (x_in && A);
    // assign Db = (~x_in && A) | (x_in && B);

	assign Da = (x_in && ~B) | (x_in && B);
    assign Db = (~x_in && B) | (A && B) | (x_in && ~B && ~A);

    DFF D1(A, Da, clk, res);
    DFF D2(B, Db, clk, res);

endmodule

module t_Problem_5_16_n;
 	reg t_x_in, t_clock, t_reset;
 	wire [1:0] state;
 	
	Problem_5_16_n P ( FA, FB, t_x_in, t_clock, t_reset);
	assign state = {FA,FB};
	
	initial 
		begin
		   $dumpfile("mahin.vcd");
	       $dumpvars(0, t_Problem_5_16_n);
		end
	initial #250 $finish;
   
	initial 
	  begin 
	  	  t_reset = 1;
	      repeat (2)
	        #5 t_reset = ~t_reset;  
      end
     
      initial 
	  begin 
	  	  t_clock = 0;	      
	      repeat (45)
	        #5 t_clock = ~t_clock; 
      end
	
	initial 
	 begin
 		// t_x_in = 0;
		// #10 t_x_in = 1;
		// repeat (3)
		//    #30 t_x_in = ~t_x_in;
		 		t_x_in = 0;
		#10 t_x_in = 1;
		repeat (10)
		   #20 t_x_in = ~t_x_in;
	end
endmodule