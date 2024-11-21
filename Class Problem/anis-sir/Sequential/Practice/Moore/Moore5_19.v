`include "TFF.sv"

module Moore5_19 (output y_out, A, B, input x_in, clk, res);

    wire Ta, Tb;

    // State transition logic for T flip-flops
    assign Ta = ~x_in & B;
    assign Tb = (~x_in & ~B) | (~x_in & A) | (x_in & ~A & B);
    assign y_out=x_in;

    // T flip-flops for state bits A and B
    TFF t11(A, Ta, clk, res);
    TFF t22(B, Tb, clk, res);

endmodule

module t_Moore5_19;
    wire A, B, y_out;
    reg t_x_in, t_clock, t_reset;

    // Module instantiation with corrected port mapping
    Moore5_19 MM (y_out, A, B, t_x_in, t_clock, t_reset);

    initial begin
        $dumpfile("Moore5_19.vcd");
        $dumpvars(0, t_Moore5_19);
    end

    initial #200 $finish;
	initial begin t_clock = 0; forever #5 t_clock = ~t_clock; end
	initial fork    
	 t_reset = 0;
	 #2 t_reset = 1;
	 #87 t_reset = 0;
	 #89 t_reset = 1;
	 
	 #10 t_x_in = 1;
	 #30 t_x_in = 0;
	 #40 t_x_in = 1;
	 #50 t_x_in = 0;
	 #52 t_x_in = 1;
	 #54 t_x_in = 0;
	 #70 t_x_in = 1;
	 #80 t_x_in = 1;
	 #70 t_x_in = 0;
	 #90 t_x_in = 1;
	 #100 t_x_in = 0;
	 #120 t_x_in = 1;
	 #160 t_x_in = 0;
	 #170 t_x_in = 1;
   join
endmodule
