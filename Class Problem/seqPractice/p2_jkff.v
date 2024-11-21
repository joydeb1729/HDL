module DFF ( output reg Q, input D, Clk, rst);
	always @( posedge Clk, negedge rst)
	 if (!rst) Q <= 1'b0; // Same as: if (rst == 0)
	else Q <= D;
endmodule

module JKFF (output Q, input J, K, Clk, rst);
	wire JK;
	assign JK = (J & ~Q) | (~K & Q);
	// Instantiate D fl ip-fl op
	 DFF JK1 (Q, JK, Clk, rst);
endmodule

module p2_jkff(output A, B, input x, clk, res);

    wire Ja, Ka, Jb, Kb;

    assign Ja = x;
    assign Jb = ~A && x;
    assign Ka = ~x;
    assign Kb = ~A && x;

    JKFF jk1(A, Ja, Ka, clk, res);
    JKFF jk2(B, Jb, Kb, clk, res);

endmodule

module t_p2_jkff;

    reg x, clk, res;
    wire [1:0]state;

    p2_jkff p(A, B, x, clk, res);
    assign state = {A,B};

    initial begin
        $dumpfile("p2_jkff.vcd");
        $dumpvars(0, t_p2_jkff);
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