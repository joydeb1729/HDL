module slide14_beh(input A,B,C,D, output w,x,y,z);
	assign z = ~D;
	assign y = (C&D)|(~C&~D);
	assign x = (~B&C)|(~B&D)|(B&(~C)&(~D));
	assign w = A|(B&C)|(B&D);
endmodule       


module t_slide14_beh;
	reg A,B,C,D;
	wire w,x,y,z;
	slide14_beh Inst1 (A,B,C,D,w,x,y,z);
	initial  #200 $finish;
	initial
	begin : initialize
	  $dumpfile("t_slide14_beh.vcd");
	  $dumpvars(0,t_slide14_beh);
	      A=1'b0; B=1'b0; C=1'b0; D=1'b0;
	  #10 A=1'b0; B=1'b0; C=1'b0; D=1'b1;
	  #10 A=1'b0; B=1'b0; C=1'b1; D=1'b0; 
	  #10 A=1'b0; B=1'b0; C=1'b1; D=1'b1;
	  #10 A=1'b0; B=1'b1; C=1'b0; D=1'b0;
	  #10 A=1'b0; B=1'b1; C=1'b0; D=1'b1;
	  #10 A=1'b0; B=1'b1; C=1'b1; D=1'b0; 
	  #10 A=1'b0; B=1'b1; C=1'b1; D=1'b1;
	  #10 A=1'b1; B=1'b0; C=1'b0; D=1'b0;
	  #10 A=1'b1; B=1'b0; C=1'b0; D=1'b1;
	  #10 A=1'b1; B=1'b0; C=1'b1; D=1'b0; 
	  #10 A=1'b1; B=1'b0; C=1'b1; D=1'b1;
	  #10 A=1'b1; B=1'b1; C=1'b0; D=1'b0;
	  #10 A=1'b1; B=1'b1; C=1'b0; D=1'b1;
	  #10 A=1'b1; B=1'b1; C=1'b1; D=1'b0; 
	  #10 A=1'b1; B=1'b1; C=1'b1; D=1'b1;
	end  // initialize
	
	initial
	  $monitor("Time=",$time," A=%b B=%b C=%b D=%b w=%b x=%b y=%b z=%b",A,B,C,D,w,x,y,z); 
endmodule	
	
	
	
