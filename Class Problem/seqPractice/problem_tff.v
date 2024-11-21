module DFF ( output reg Q, input D, Clk, rst);
	always @( posedge Clk, negedge rst)
	 if (!rst) Q <= 1'b0; // Same as: if (rst == 0)
	else Q <= D;
endmodule

module TFF (Q, T, Clk, rst);
 	output Q;
	input T, Clk, rst;
	wire DT;
	 
	 assign DT = Q ^ T ; // Continuous assignment
	 DFF TF1 (Q, DT, Clk, rst); 	// Instantiate the D fl ip-fl op
endmodule

module problem_tff(output A, B, input x, clk, res);

    wire Ta, Tb;

    assign Ta = (~A && ~B && ~x) | (A && B && ~x);
    assign Tb = (A && ~B && ~x) | (~A && B && ~x);

    TFF t1(A, Ta, clk, res);
    TFF t2(B, Tb, clk, res);

endmodule

module t_problem_tff;

    reg x, clk, res;
    wire [1:0]state;

    problem_tff t(A, B, x, clk, res);

    assign state = {A,B};

    initial begin
        $dumpfile("problem_tff.vcd");
        $dumpvars(0, t_problem_tff);
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