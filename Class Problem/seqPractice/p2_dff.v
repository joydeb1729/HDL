module DFF ( output reg Q, input D, Clk, rst);
	always @( posedge Clk, negedge rst)
	 if (!rst) Q <= 1'b0; // Same as: if (rst == 0)
	else Q <= D;
endmodule

module p2_dff(output A, B, input x, clk, res);

    wire Da, Db;

    assign Da = x;
    assign Db = (A && B) | (B && ~x) | (~A && ~B && x);

    DFF d1(A, Da, clk, res);
    DFF d2(B, Db, clk, res);

endmodule

module t_p2_dff;

    reg x, clk, res;
    wire [1:0]state;

    p2_dff p(A, B, x, clk, res);
    assign state = {A,B};

    initial begin
        $dumpfile("p2_dff.vcd");
        $dumpvars(0, t_p2_dff);
    end

    initial #250 $finish;

    initial begin
        clk = 0;
        repeat(50)
            #5 clk = ~clk;
    end

    initial begin
        res = 1;
        repeat(2)
            #5 res = ~res;
    end

    initial begin
        x = 0;
        #10 x = 1;
        repeat(12)
           #20 x = ~x;
    end

endmodule