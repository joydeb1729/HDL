module F_NAND(output F, input w, x, y, z);

    wire w_not, x_not, y_not, z_not, w1, w2, w3, w4, w5;

    nand n1(w_not, w, w);
    nand n2(x_not, x, x);
    nand n3(y_not, y, y);
    nand n4(z_not, z, z);

    nand n5(w1, w, x_not);
    nand n6(w2, w_not, z_not);
    nand n7(w3, y_not, z_not);

    nand n8(w4, w1, w2);
    nand n9(w5, w4, w4);
    nand n10(F, w3, w5);

endmodule

module test_NAND;

    wire F;
    reg w, x, y, z;
    F_NAND uut (F, w, x, y, z);

    initial begin
        $dumpfile("NAND.vcd");
        $dumpvars(0, test_NAND);

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