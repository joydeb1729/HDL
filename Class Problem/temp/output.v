module half_adder_mod(input X, Y, output Sum_out, Carry_out);

    xor (Sum_out, X, Y);
    and (Carry_out, X, Y);

endmodule


module full_adder_mod(input X, Y, Cin, output Sum_out, Carry_out);

    wire Carry1, X_xor_Y, Carry2;
    half_adder_mod ha1(X, Y, X_xor_Y, Carry1);
    half_adder_mod ha2(X_xor_Y, Cin, Sum_out, Carry2);

    or (Carry_out, Carry1, Carry2);

endmodule


module three_bit_add_sub_mod(a, b, m, Sum_out, Carry_out);

    input [2:0]a, b;
    input m;
    output [2:0]Sum_out;
    output Carry_out;

    wire [2:0]b_xor_m, carry_wire;

    xor bx1(b_xor_m[0], b[0], m);
    xor bx2(b_xor_m[1], b[1], m);
    xor bx3(b_xor_m[2], b[2], m);

    full_adder_mod fa1(a[0], b_xor_m[0], m, Sum_out[0], carry_wire[0]);
    full_adder_mod fa2(a[1], b_xor_m[1], carry_wire[0], Sum_out[1], carry_wire[1]);
    full_adder_mod fa3(a[2], b_xor_m[2], carry_wire[1], Sum_out[2], Carry_out);

endmodule


module test_three_bit_add_sub_mod;

    reg [2:0]A_in, B_in;
    reg m;
    wire [2:0]Sum_out;
    wire Carry_out;

    three_bit_add_sub_mod add_sub_inst(A_in, B_in, m, Sum_out, Carry_out);

    initial begin
        $dumpfile("output.vcd");
        $dumpvars(0, test_three_bit_add_sub_mod);

        A_in = 3'b101; B_in = 3'b011; m = 1'b0; #10;  
        A_in = 3'b101; B_in = 3'b011; m = 1'b1; #10;  
        A_in = 3'b011; B_in = 3'b101; m = 1'b1; #10;    

        A_in = 3'b111; B_in = 3'b000; m = 1'b0; #10;    
        A_in = 3'b111; B_in = 3'b000; m = 1'b1; #10;   
        A_in = 3'b000; B_in = 3'b111; m = 1'b1; #10;    

        A_in = 3'b101; B_in = 3'b101; m = 1'b0; #10;  
        A_in = 3'b101; B_in = 3'b101; m = 1'b1; #10;    

        $finish;

    end

    initial begin
        
        $monitor("| A_in = %b, B_in = %b , m = %b | Carry_out = %b, Sum_out = %b |", A_in, B_in, m, Carry_out, Sum_out);

    end

endmodule
