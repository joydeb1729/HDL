// Dataflow description of four-bit adder
// Verilog 2001, 2005 module port syntax
module binary_adder (
 	 output [3: 0] Sum,
	 output C_out,
	 input [3: 0] A, B,
	 input C_in
	);
 	assign {C_out, Sum} = A + B + C_in;
endmodule

module t_binary_adder;
	wire C_out;
	wire [3:0] S;
	reg [3:0] A, B;
	reg C_in;
	binary_adder BA ( S, C_out, A, B, C_in); // Instance name required
	initial
	begin 
		$dumpfile("binary_adder.vcd");
		$dumpvars(0,t_binary_adder);
		A = 4'b1001; B = 4'b0111; C_in =1'b1;
	end
	initial #250 $finish;
endmodule