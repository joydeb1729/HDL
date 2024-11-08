`include "Circuit_with_UDP_02467.sv"
module t_Circuit_with_UDP_02467;
	wire e, f;
	reg a, b, c, d;
	Circuit_with_UDP_02467 UDP (e,f, a, b, c,d);
	and a1 (f, e, d); // Option gate instance name omitted
	initial
	begin 
		$dumpfile("Circuit_with_UDP_02467.vcd");
		$dumpvars(0,t_Circuit_with_UDP_02467);
		    a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0;
		#10 a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1;
		#10 a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0;
		#10 a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1;
		#10 a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1;
		
	end
	
	initial #50 $finish;
	always @ (a,b,c,d)
		 $monitor("Time = ",$time," a= %b b= %b c= %b d= %b e= %b f= %b",a,b,c,d,e,f);
endmodule
