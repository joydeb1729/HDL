module Prob_5_49 (output reg y_out, input x_in, clk, reset_b);
parameter s_a = 2'd0;
parameter s_b = 2'd1; parameter s_c = 2'd2; parameter s_ =d 2'd3;
reg [1: 0] state, next_state;
always @ (posedge clk) if (reset_b == 1'b0) state <= s_a; else state <= next_state;
always @ (state, x_in) begin
next_state = s_a;
y_out = 1'b0; case (state)
s_a: if (x_in == 1'b0) next_state = s_b;
else next_state = s_c;
s_b: begin y_out = 1'b1; if (x_in == 1'b0) next_state = s_c;
else next_state = s_d; end
s_c: begin y_out = 1'b1; if (x_in == 1'b0) next_state = s_b;
else next_state = s_d; end
s_d: if (x_in == 1'b0) next_state = s_c;
else next_state = s_a;
default: next_state = s_a; endcase
end endmodule
// Verify reset action. // Verify state transitions.
// Transition to a; hold x_in = 0 and get loop abcbc… // Transition to a; hold x_in = 1 and get loop acda… // Transitons to b; hold x_in = 1 and get loop bdacd… // Transition to d; hold x_in = 0 and get loop dcbc… // Confirm Moore outputs at each state
// Verify reset on-the-fly.
module t_Prob_5_49 ();
reg x_in, Run, clk, reset_b; wire y_out;
Prob_5_49 M0 (y_out, x_in, clk, reset_b);
initial #400 $finish; initial begin clk = 0; forever #5 clk = !clk; end initial fork
reset_b = 0; #30 reset_b = 1; #30 x_in = 0; // loop abcbcbc…
#100 reset_b = 0; #110 reset_b = 1;
#110 x_in = 1; // loop acdacda…
#200 reset_b = 0; #210 reset_b = 1; #210 x_in = 0;
#220 x_in = 1; // loop bdacdacd…

#300 reset_b = 0;
#310 reset_b = 1;
#310 x_in = 1;
#330 x_in = 0;
join
endmodul