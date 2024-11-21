// Behavioral description of a 4-bit universal shift register
// Fig. 6.7and Table 6.3 
module Shift_Register_4_beh (
	output reg [3: 0] A_par, // Register output
	input [3: 0] I_par, // Parallel input
	input s1, s0, // Select inputs
	 MSB_in, LSB_in, // Serial inputs
	 CLK, Clear_b // Clock and Clear
	);
	
	always @ ( posedge CLK, negedge Clear_b) 
	if (Clear_b == 0) 
		A_par <= 4'b0000;
	else
	 	case ({s1, s0})
		 	2'b00: A_par <= A_par; // No change
			2'b01: A_par <= {MSB_in, A_par[3: 1]}; // Shift right 
			2'b10: A_par <= {A_par[2: 0], LSB_in}; // Shift left
			2'b11: A_par <= I_par; // Parallel load of input
	    endcase
endmodule


module t_Shift_Register_4_beh;
	wire [3:0] A_par;
	reg [3:0] I_par;
 	reg s1,s0, MSB_in, LSB_in, CLK, Clear_b;
	Shift_Register_4_beh UR (A_par,  I_par, s1, s0,	 MSB_in, LSB_in,  CLK, Clear_b);
	initial 
		begin
		   $dumpfile("ShiftReg4_beh.vcd");
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