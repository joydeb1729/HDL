module Four_input_encoder_with_V(input D0,D1,D2,D3, output x,y,V);
		wire w;
		and (w,D1,~D2);
		or
	     o1 (V,D0,D1,D2,D3),
	     o2 (x,D2,D3),
	     o3 (y,D3,w);                            
endmodule