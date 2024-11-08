`include "Binary_Counter_4_Par_Load.sv"
module t_Binary_Counter_4_Par_Load;
	wire [3:0] A_count;
	wire C_out;
	reg [3:0] Data_in;
 	reg Count, Load, CLK, Clear_b;
	Binary_Counter_4_Par_Load BC4PL (A_count, C_out, Data_in, Count, Load, CLK, Clear_b);
	initial 
		begin
		   $dumpfile("Binary_Counter_4_Par_Load.vcd");
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