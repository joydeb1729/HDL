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

module problem_jkff(output A, B, input x, clk, res);

    wire Ja, Ka, Jb, Kb;

    assign Ja = (~B && ~x);
    assign Jb = (A && ~x);
    assign Ka = (B && ~x);
    assign Kb = (~A && ~x);

    JKFF jk1(A, Ja, Ka, clk, res);
    JKFF jk2(B, Jb, Kb, clk, res);

endmodule


module t_problem_jkff;

    reg x, clk, res;
    wire [1:0]state;

    problem_jkff jk(A, B, x, clk, res);

    assign state = {A,B};

    initial begin
        $dumpfile("problem_jkff.vcd");
        $dumpvars(0, t_problem_jkff);
    end

    initial #150 $finish;

    initial begin
        clk = 0;

        repeat (28)
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

        repeat(3)
            #30 x = ~x;
    end


endmodule