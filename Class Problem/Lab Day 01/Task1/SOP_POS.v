module SOP(output FS, input x, y, z);
    assign FS = (x&y&z) | (x&y&~z) | (~x&y&z) | (~x&y&~z) | (~x&~y&z);

endmodule

module POS(output FP, input x, y, z);
    assign FP = (~x|y|z) & (~x|y|~z) & (x|y|z);
endmodule

module test_ct1q1;
    wire FSop, FPos;
    reg x, y, z;

    SOP S (FSop, x, y, z);
    POS P (FPos, x, y, z);

    initial
    begin
        $dumpfile("SOP_POS.vcd");
        $dumpvars(0, test_ct1q1);
            x = 1'b0; y = 1'b0; z = 1'b0;
        #10 x = 1'b0; y = 1'b0; z = 1'b1;
        #10 x = 1'b0; y = 1'b1; z = 1'b0;
        #10 x = 1'b0; y = 1'b1; z = 1'b1;
        #10 x = 1'b1; y = 1'b0; z = 1'b0;
        #10 x = 1'b1; y = 1'b0; z = 1'b1;
        #10 x = 1'b1; y = 1'b1; z = 1'b0;
        #10 x = 1'b1; y = 1'b1; z = 1'b1;

    end
    initial #110 $finish;

endmodule