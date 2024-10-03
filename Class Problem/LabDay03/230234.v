module half_adder(input A, B, output S, Cout);

    xor Sum(S, A, B);
    and carry(Cout, A, B);
    
endmodule


module full_adder(input A, B, Cin, output S, Cout);

    wire c1, A_xor_B, c2;
    half_adder ha1(A, B, A_xor_B, c1);
    half_adder ha2(A_xor_B, Cin, S, c2);

    or G(Cout, c1, c2);

endmodule


module three_bit_adder_substractor(a, b, control, S, Cout);

    input [2:0]a,b;
    input control;
    output [2:0]S;
    output Cout;

    wire [2:0]b_final, c;

    xor b1(b_final[0], b[0], control);
    xor b2(b_final[1], b[1], control);
    xor b3(b_final[2], b[2], control);

    full_adder fa1(a[0], b_final[0], control, S[0], c[0]);
    full_adder fa2(a[1], b_final[1], c[0], S[1], c[1]);
    full_adder fa3(a[2], b_final[2], c[1], S[2], Cout);

endmodule

module t_three_bit_adder_substractor;

    reg [2:0]A, B;
    reg control;
    wire [2:0]S;
    wire Cout;

    three_bit_adder_substractor addSub(A, B, control, S, Cout);

    initial begin
        $dumpfile("230234.vcd");
        $dumpvars(0, t_three_bit_adder_substractor);

        A = 3'b101; B = 3'b011; control = 1'b0; #15;    // Addition
        A = 3'b101; B = 3'b011; control = 1'b1; #15;    // Subtraction
        A = 3'b011; B = 3'b101; control = 1'b1; #15;    // Subtraction

        A = 3'b111; B = 3'b000; control = 1'b0; #15;    // Addition
        A = 3'b111; B = 3'b000; control = 1'b1; #15;    // Subtraction
        A = 3'b000; B = 3'b111; control = 1'b1; #15;    // Subtraction

        A = 3'b101; B = 3'b101; control = 1'b0; #15;    // Addition
        A = 3'b101; B = 3'b101; control = 1'b1; #15;    // Subtraction

        $finish;

    end

    initial begin
        
        $monitor("Time = %0t | A = %b, B = %b , control = %b | Cout = %b, Sum = %b |", $time, A, B, control, Cout, S);

    end

endmodule