module Adder_by_Decoder(input x,y,z, output S, C);
	wire D0,D1,D2,D3,D4,D5,D6,D7;
	and
	     A0 (D0,~x,~y,~z),
	     A1 (D1,~x,~y,z),
	     A2 (D2,~x,y,~z),
	     A3 (D3,~x,y,z),
	     A4 (D4,x,~y,~z),
	     A5 (D5,x,~y,z),
	     A6 (D6,x,y,~z),
	     A7 (D7,x,y,z);
	or
	  O1 (S,D1,D2,D4,D7), 
	  O2 (C,D3,D5,D6,D7);
endmodule