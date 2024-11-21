// Four-bit binary counter with parallel load (V2001, 2005)
// See Figure 6.14and Table 6.6 
module Binary_Counter_4_Par_Load (
 output reg [3:0] A_count, // Data output
 output C_out, // Output carry
 input [3:0] Data_in, // Data input
 input Count, // Active high to count
 Load, // Active high to load
 CLK, // Positive-edge sensitive
 Clear_b // Active low
);
assign C_out = Count && (~Load) && (A_count == 4'b1111);
always @ ( posedge CLK, negedge Clear_b)
 if (~Clear_b) A_count <= 4'b0000;
 else if (Load) A_count <= Data_in;
 else if (Count) A_count <= A_count + 1'b1;
 else A_count <= A_count; // redundant statement
endmodule

module t_Binary_Counter_4_Par_Load;
	wire [3:0] A_count;
	wire C_out;
	reg [3:0] Data_in;
 	reg Count, Load, CLK, Clear_b;
	Binary_Counter_4_Par_Load BC4PL (A_count, C_out, Data_in, Count, Load, CLK, Clear_b);
	initial 
		begin
		   $dumpfile("BC4PL.vcd");
	       $dumpvars(0, t_Binary_Counter_4_Par_Load);
		end
	initial #150 $finish;
	initial 
	  begin 
	  	  Clear_b = 1;
	      CLK = 0;
	      #5 Clear_b = 0;
	      #7 Clear_b = 1;
	      repeat (25)
	        #5 CLK = ~CLK; 
      end
	initial 
	 begin
 		Load = 0;
	    Data_in =  4'b1010;
		#10 Load = 1;
		#12 Load = 0;
		#2 Count = 1;
		#12 Clear_b =0;
		#22 Clear_b =1;
	 end
endmodule