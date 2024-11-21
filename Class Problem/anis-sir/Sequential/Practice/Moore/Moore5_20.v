`include "TFF.sv"

module Moore5_20(output y_out, A,B, input x_in, clk, res);

    wire TA, TB;

    assign TA = x_in & B;
    assign TB = x_in;
    assign y_out = A & B;

    TFF t1(A, TA, clk, res);
    TFF t2(B, TB, clk, res);

endmodule

module t_Moore5_20;
	wire t_y_out, A, B;
 	reg t_x_in, t_clock, t_reset;
	//Moore_Model_Fig_5_20 M1 (t_y_out_1, t_x_in, t_clock, t_reset);
	Moore5_20 M2 (t_y_out, A, B, t_x_in, t_clock, t_reset);
	initial 
		begin
		   $dumpfile("Moore5_20.vcd");
	       $dumpvars(0, t_Moore5_20);
		end
	initial #100 $finish;
	initial 
	  begin 
	  	  t_reset = 0;
	      t_clock = 0;
	      #5 t_reset = 1;
	      repeat (16)
	        #5 t_clock = ~t_clock; 
      end
	initial 
	 begin
 		t_x_in = 0;
		#15 t_x_in = 1;
		repeat (8)
		   #10 t_x_in = ~t_x_in;
	end
endmodule