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

module p2_tff(output A, B, input x, clk, res);

    wire Ta, Tb;

    assign Ta = (A ^ x);
    assign Tb = (~A && x);

    TFF t1(A, Ta, clk, res);
    TFF t2(B, Tb, clk, res);

endmodule

module t_p2_tff;

    reg x, clk, res;
    wire [1:0]state;

    p2_tff p(A, B, x, clk, res);
    assign state = {A,B};

    initial begin
        $dumpfile("p2_tff.vcd");
        $dumpvars(0, t_p2_tff);
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