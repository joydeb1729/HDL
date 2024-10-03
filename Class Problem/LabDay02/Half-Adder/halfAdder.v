module half_adder(output s, c, input a, b);

    xor sum(s, a, b);
    and carry(c, a, b);

endmodule

module t_half_adder;

    reg a, b;
    wire s, c;

    half_adder ha(s, c, a, b);

    initial begin
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;

    end

    initial begin
        $monitor("Time = %0t | a = %b, b = %b | Sum = %b | Carry = %b", $time, a, b, s, c);
    end

endmodule