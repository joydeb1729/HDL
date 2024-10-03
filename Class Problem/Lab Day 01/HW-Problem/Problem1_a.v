module F_NOR (
    output F,
    input w, x, y, z);

    wire w_not, w2, w3, w4, w5;
    nor G1(w_not, w, w);
    nor G2(w2, w_not, x);
    nor G3(w3, y, z);
    nor G4(w4, w, z);

    nor G5(w5, w2, w3, w4);
    nor G6(F, w5, w5);

endmodule

module Problem1_a;
    wire F;
    reg w, x, y, z;

    F_NOR FN (F, w, x, y, z);

    initial
    begin
        $dumpfile("Problem1_a");
        $dumpvars(0, Problem1_a);

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