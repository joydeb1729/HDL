module Sample_Circuit (output op, input x, y, z);
    wire w1, w2;
    not x_not(w1, x);
    and G1(w2, w1, z);
    or G2(op, w2,y);
endmodule

module t_Simple_Circuit;
    wire op;
    reg x, y, z;
    Sample_Circuit M1(op, x, y, z);
    initial begin
        $dumpfile("ct1q1.vcd");
        $dumpvars(0, t_Simple_Circuit);

            x = 1'b0; y = 1'b0; z = 1'b0;
        #10 x = 1'b0; y = 1'b0; z = 1'b1;
        #10 x = 1'b0; y = 1'b1; z = 1'b0;
        #10 x = 1'b0; y = 1'b1; z = 1'b1;
        #10 x = 1'b1; y = 1'b0; z = 1'b0;
        #10 x = 1'b1; y = 1'b0; z = 1'b1;
        #10 x = 1'b1; y = 1'b1; z = 1'b0;
        #10 x = 1'b1; y = 1'b1; z = 1'b1;
    end
    initial #200 $finish;
endmodule
