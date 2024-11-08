`include "Moore_Model_STR_Fig_5_20.sv"
`include "Moore_Model_Fig_5_20.sv"
module t_Moore_Model_STR_Fig_5_20;
	wire t_y_out_1;
	wire t_y_out_2;
 	reg t_x_in, t_clock, t_reset;
	Moore_Model_Fig_5_20 M1 (t_y_out_1, t_x_in, t_clock, t_reset);
	Moore_Model_STR_Fig_5_20 M2 (t_y_out_2, A, B, t_x_in, t_clock, t_reset);
	initial 
		begin
		   $dumpfile("t_Moore_Model_STR_Fig_5_20.vcd");
	       $dumpvars(0, t_Moore_Model_STR_Fig_5_20);
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