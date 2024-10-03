module full_adder_gate(output cout, sum, input a, b, cin);

    wire w1, w2, w3;
    xor sum1(w1, a, b);
    and and1(w2, w1, cin);
    and and2(w3, a, b);

    xor final_sum(sum, w1, cin);
    or carry(cout, w2, w3);

endmodule

module full_adder_opertor(output cout, sum, input a, b, cin);

    assign sum = a^b^cin ;
    assign cout = ((a^b)&cin) | (a&b);

endmodule

module t_full_adder;

    reg a, b, cin;
    wire sum, cout;

    full_adder_gate fag(cout, sum, a, b, cin);
    //full_adder_opertor fao(cout, sum, a, b, cin);

    initial begin
        
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        $finish;

    end

    initial begin
        $monitor("Time = %0t | a = %b, b = %b, cin = %b | Carry = %b, Sum = %b |", $time, a, b, cin, cout, sum);
    end


endmodule
