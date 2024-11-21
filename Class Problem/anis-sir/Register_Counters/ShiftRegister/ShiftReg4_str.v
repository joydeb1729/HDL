`include "Shift_Register_4_beh.sv"

// Structural description of a 4-bit universal shift register (see Fig. 6.7 )
module Shift_Register_4_str ( // V2001, 2005
 	 output [3: 0] A_par, // Parallel output
	 input [3: 0] I_par, // Parallel input
	 input s1, s0, // Mode select
	 input MSB_in, LSB_in, CLK, Clear_b // Serial inputs, clock, clear
	);
	// bus for mode control
	 wire [1:0] select;
	 assign select = {s1, s0};
	// Instantiate the four stages
	 stage ST0 (A_par[0], A_par[1], LSB_in, I_par[0], A_par[0], select, CLK, Clear_b);
	 stage ST1 (A_par[1], A_par[2], A_par[0], I_par[1], A_par[1], select, CLK, Clear_b);
	 stage ST2 (A_par[2], A_par[3], A_par[1], I_par[2], A_par[2], select, CLK, Clear_b);
	 stage ST3 (A_par[3], MSB_in, A_par[2], I_par[3], A_par[3], select, CLK, Clear_b);
endmodule

// One stage of shift register
module stage (i0, i1, i2, i3, Q, select, CLK, Clr_b);
 	input i0, // circulation bit selection
	 i1, // data from left neighbor or serial input for shift-right
	 i2, // data from right neighbor or serial input for shift-left
	 i3; // data from parallel input
	 output Q;
	 input [1:0] select; // stage mode control bus
	 input CLK, Clr_b; // Clock, Clear for fl ip-fl ops
	 wire mux_out;
	// instantiate mux and fl ip-fl op
	 Mux_4_x_1 M0 (mux_out, i0, i1, i2, i3, select);
	 D_flip_flop M1 (Q, mux_out, CLK, Clr_b);
endmodule

// 4x1 multiplexer // behavioral model
module Mux_4_x_1 (mux_out, i0, i1, i2, i3, select);
 	output mux_out;
	 input i0, i1, i2, i3;
	 input [1: 0] select;
	 reg mux_out;
	 always @ (select, i0, i1, i2, i3)
	 case (select)
	 	 2'b00: mux_out = i0;
		 2'b01: mux_out = i1;
		 2'b10: mux_out = i2;
		 2'b11: mux_out = i3;
	 endcase
endmodule 

// Behavioral model of D fl ip-fl op
module D_flip_flop (Q, D, CLK, Clr_b);
	output Q;
	input D, CLK, Clr_b;
	reg Q;
	always @ ( posedge CLK, negedge Clr_b)
	 if (!Clr_b) 
	 	Q <= 1'b0;
	 else 
	 	Q <= D;
endmodule

module t_Shift_Register_4_str;
	wire [3:0] A_par, B_par;
	reg [3:0] I_par;
 	reg s1,s0, MSB_in, LSB_in, CLK, Clear_b;
	Shift_Register_4_str URS (A_par,  I_par, s1, s0,MSB_in, LSB_in,  CLK, Clear_b);
	Shift_Register_4_beh URB (B_par,  I_par, s1, s0,MSB_in, LSB_in,  CLK, Clear_b);
	initial 
		begin
		   $dumpfile("ShiftReg4_str.vcd");
	       $dumpvars(0, t_Shift_Register_4_str);
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