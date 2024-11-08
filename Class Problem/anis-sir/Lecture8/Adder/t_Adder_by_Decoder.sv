`include "Adder_by_Decoder.sv"
module t_Adder_by_Decoder;
	 wire S,C;
	 reg x,y,z;
	 parameter stop_time=90;
	
	 Adder_by_Decoder ABD (x,y,z,S,C);
	 initial # stop_time $finish;
	
    initial begin // Stimulus generator
	 	     x=1'b0; y=1'b0; z=1'b0;
		 #10 x=1'b0; y=1'b0; z=1'b1;
		 #10 x=1'b0; y=1'b1; z=1'b0;
		 #10 x=1'b0; y=1'b1; z=1'b1;
		 #10 x=1'b1; y=1'b0; z=1'b0;
		 #10 x=1'b1; y=1'b0; z=1'b1;
		 #10 x=1'b1; y=1'b1; z=1'b0;
		 #10 x=1'b1; y=1'b1; z=1'b1;
	end 
	always @ (x,y,z)
			$monitor("x=%b  y=%b z=%b S=%b C=%b",x,y,z,S,C);
endmodule  