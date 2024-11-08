`include "Four_input_encoder_with_V.sv"
module t_Four_input_encoder_with_V;
	 wire x,y,V;
	 reg D0,D1,D2,D3;
	 parameter stop_time=90;
	
	 Four_input_encoder_with_V ABD (D0,D1,D2,D3,x,y,V);
	 initial # stop_time $finish;
	
    initial begin // Stimulus generator
	 	     D3=1'b0; D2=1'b0; D1=1'b0;D0=1'b0;
		 #10 D3=1'b0; D2=1'b1; D1=1'b1;D0=1'b0;
		 #10 D3=1'b0; D2=1'b0; D1=1'b0;D0=1'b1;
		 #10 D3=1'b0; D2=1'b0; D1=1'b1;D0=1'b0;  
		 #10 D3=1'b1; D2=1'b0; D1=1'b1;D0=1'b1;
		 
	end 
	always @ (D3,D2,D1,D0)
			$monitor("D3=%b  D2=%b D1=%b D0=%b x=%b y=%b V=%b",D3,D2,D1,D0,x,y,V);
endmodule  