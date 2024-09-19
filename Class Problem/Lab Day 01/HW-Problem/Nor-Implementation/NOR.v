module F_NOR(output F, input w, x, y, z);

    wire w_not, w1, w2, w3, w4, w5, w6;

    nor n1(w_not, w, w);
    nor n2(w1, w_not, x);
    nor n3(w2, w, z);
    nor n4(w3, y, z);

    nor n5(w4, w1, w2);
    nor n6(w5, w4, w4);
    nor n7(w6, w5, w3);

    nor n8(F, w6, w6);


endmodule

module test_NOR;

    wire F;
    reg w, x, y, z;
    F_NOR uut (F, w, x, y, z);

    initial begin
        $dumpfile("NOR.vcd");
        $dumpvars(0, test_NOR);

        w = 0; x = 0; y = 0; z = 0; #10;
        w = 0; x = 0; y = 0; z = 1; #10;
        w = 0; x = 0; y = 1; z = 0; #10;
        w = 0; x = 0; y = 1; z = 1; #10;
        w = 0; x = 1; y = 0; z = 0; #10;
        w = 0; x = 1; y = 0; z = 1; #10;
        w = 0; x = 1; y = 1; z = 0; #10;
        w = 0; x = 1; y = 1; z = 1; #10;
        w = 1; x = 0; y = 0; z = 0; #10;
        w = 1; x = 0; y = 0; z = 1; #10;
        w = 1; x = 0; y = 1; z = 0; #10;
        w = 1; x = 0; y = 1; z = 1; #10;
        w = 1; x = 1; y = 0; z = 0; #10;
        w = 1; x = 1; y = 0; z = 1; #10;
        w = 1; x = 1; y = 1; z = 0; #10;
        w = 1; x = 1; y = 1; z = 1; #10;
    end
    initial #200 $finish;

endmodule