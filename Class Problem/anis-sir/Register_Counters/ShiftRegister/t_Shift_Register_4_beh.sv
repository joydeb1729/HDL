`include "Shift_Register_4_beh.sv"
module t_Shift_Register_4_beh;
	wire [3:0] A_par;
	reg [3:0] I_par;
 	reg s1,s0, MSB_in, LSB_in, CLK, Clear_b;
	Shift_Register_4_beh UR (A_par,  I_par, s1, s0,	 MSB_in, LSB_in,  CLK, Clear_b);
	initial 
		begin
		   $dumpfile("t_Shift_Register_4_beh.vcd");
	       $dumpvars(0, t_Shift_Register_4_beh);
		end
	initial #100 $finish;
	initial 
	  begin 
	  	  Clear_b = 1;
	      CLK = 0;
	      
	      #5 Clear_b = 0;
	      #7 Clear_b = 1;
	      repeat (16)
	        #5 CLK = ~CLK; 
      end
	initial 
	 begin
 		s1 = 0;
	    s0 = 0;
	    MSB_in = 1;
	    LSB_in = 0;
	    I_par =  4'b1010;
		#10 s0 = 1;
		#30 s1 = 1;
		#40 s0 = 0;
	end
endmodule