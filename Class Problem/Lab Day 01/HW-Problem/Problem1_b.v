module F_NAND (
    output F,
    input w, x, y, z);

    wire w_not, x_not, y_not, z_not;
    nand G1(w_not, w, w);
    nand G2(x_not, x, x);
    nand g3(y_not, y, y);
    nand g4(z_not, z, z);

    wire w5, w6, w7;
    nand G5(w5, w, x_not);
    nand G6(w6, y_not, z_not);
    nand G7(w7, w_not, z_not);

    nand G8(F, w5, w6, w7);
    
endmodule

module Problem1_b;
    wire F;
    reg w, x, y, z;

    F_NAND FN (F, w, x, y, z);

    initial
    begin
        $dumpfile("Problem1_b");
        $dumpvars(0, Problem1_b);

        w = 1'b0; x = 1'b0; y = 1'b0; z = 1'b0;
        #10 w = 1'b0; x = 1'b0; y = 1'b0; z = 1'b1;
        #10 w = 1'b0; x = 1'b0; y = 1'b1; z = 1'b0;
        #10 w = 1'b0; x = 1'b0; y = 1'b1; z = 1'b1;
        #10 w = 1'b0; x = 1'b1; y = 1'b0; z = 1'b0;
        #10 w = 1'b0; x = 1'b1; y = 1'b0; z = 1'b1;
        #10 w = 1'b0; x = 1'b1; y = 1'b1; z = 1'b0;
        #10 w = 1'b0; x = 1'b1; y = 1'b1; z = 1'b1;
        #10 w = 1'b1; x = 1'b0; y = 1'b0; z = 1'b0;
        #10 w = 1'b1; x = 1'b0; y = 1'b0; z = 1'b1;
        #10 w = 1'b1; x = 1'b0; y = 1'b1; z = 1'b0;
        #10 w = 1'b1; x = 1'b0; y = 1'b1; z = 1'b1;
        #10 w = 1'b1; x = 1'b1; y = 1'b0; z = 1'b0;
        #10 w = 1'b1; x = 1'b1; y = 1'b0; z = 1'b1;
        #10 w = 1'b1; x = 1'b1; y = 1'b1; z = 1'b0;
        #10 w = 1'b1; x = 1'b1; y = 1'b1; z = 1'b1;

    end
    initial #160 $finish;

endmodule