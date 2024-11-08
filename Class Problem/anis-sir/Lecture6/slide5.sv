module slide5_str(input A,B,C, output F1,F2);
	wire T1,T2,T3,T4,T5,T6,T7,T8; // intermediate
	
	or  G1(T1,A,B,C);
	and G2(T2,A,B,C);
	and G3(T3,A,B);
	and G4(T4,A,C);
	and G5(T5,B,C);
	or  G6(F2,T3,T4,T5);
	not G7(T7,F2);
	and G8(T8, T7, T1);
	or  G9(F1,T8,T2); 
endmodule

module slide5_beh(input A,B,C, output F1,F2);
	assign F2 = (A&B)|(A&C)|(B&C);
	assign F1 = (~F2&(A|B|C))|(A&B&C);
endmodule       

primitive slide5_TTF2(F2,A,B,C);
  input A,B,C;
  output F2;
  table
  	0 0 0 : 0;
  	0 0 1 : 0;
  	0 1 0 : 0;
  	0 1 1 : 1;
  	1 0 0 : 0;  
  	1 0 1 : 0;
  	1 1 0 : 1;
  	1 1 1 : 1;
  endtable
endprimitive 

primitive slide5_TTF1(F1,A,B,C);
  input A,B,C;
  output F1;
  table
  	0 0 0 : 0;
  	0 0 1 : 1;
  	0 1 0 : 1;
  	0 1 1 : 0;
  	1 0 0 : 1;  
  	1 0 1 : 1;
  	1 1 0 : 0;
  	1 1 1 : 1;
  endtable
endprimitive


module t_slide5_str;
	reg A,B,C;
	wire F1,F2; 
	//slide5_str Inst1 (A,B,C,F1,F2);
	//slide5_beh Inst1 (A,B,C,F1,F2);
	slide5_TTF1 Inst1 (F1,A,B,C); 
	slide5_TTF2 Inst2 (F2,A,B,C);
	initial  #90 $finish;
	initial
	begin : initialize
	  $dumpfile("t_slide5_str.vcd");
	  $dumpvars(0,t_slide5_str);
	      A=1'b0; B=1'b0; C=1'b0;
	  #10 A=1'b0; B=1'b0; C=1'b1;
	  #10 A=1'b0; B=1'b1; C=1'b0;
	  #10 A=1'b0; B=1'b1; C=1'b1;
	  #10 A=1'b1; B=1'b0; C=1'b0;
	  #10 A=1'b1; B=1'b0; C=1'b1;
	  #10 A=1'b1; B=1'b1; C=1'b0;
	  #10 A=1'b1; B=1'b1; C=1'b1;
	end  // initialize
	
	initial
	  $monitor("Time=",$time," A=%b B=%b C=%b F1=%b F2=%b",A,B,C,F1,F2); 
	  //$monitor("Time=",$time," A=%b B=%b C=%b F1=%b",A,B,C,F1);
endmodule	
	
	
	
