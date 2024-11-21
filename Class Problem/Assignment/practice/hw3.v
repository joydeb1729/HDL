module moore_fsm (
  input clk, reset, input_signal,
  output reg output_signal
);

  parameter STATE_A = 2'b00;
  parameter STATE_B = 2'b01;
  parameter STATE_C = 2'b10;
  parameter STATE_D = 2'b11;

  reg [1:0] current_state, next_state;

  // State update logic
  always @(posedge clk or negedge reset) begin
    if (!reset)
      current_state <= STATE_A;
    else
      current_state <= next_state;
  end

  // Next state and output logic
  always @(*) begin
    case (current_state)
      STATE_A: begin
        output_signal = 1'b0;
        if (input_signal == 1'b0)
          next_state = STATE_B;
        else
          next_state = STATE_C;
      end
      STATE_B: begin
        output_signal = 1'b1;
        if (input_signal == 1'b0)
          next_state = STATE_C;
        else
          next_state = STATE_D;
      end
      STATE_C: begin
        output_signal = 1'b1;
        if (input_signal == 1'b0)
          next_state = STATE_B;
        else
          next_state = STATE_D;
      end
      STATE_D: begin
        output_signal = 1'b0;
        if (input_signal == 1'b0)
          next_state = STATE_C;
        else
          next_state = STATE_A;
      end
      
    endcase
  end
endmodule

// Testbench for the moore_fsm
module moore_fsm_tb;

  reg clk, reset, input_signal;
  wire output_signal;

  moore_fsm dut (
    .clk(clk),
    .reset(reset),
    .input_signal(input_signal),
    .output_signal(output_signal)
  );

  initial begin
    $dumpfile("hw3.vcd");
    $dumpvars(0, moore_fsm_tb);

    clk = 0;
    reset = 0;
    input_signal = 0;

    // Test sequence with initial reset
    #10 reset = 1;     // Release reset after 10 time units

    // Test the state transitions and outputs
    #20 input_signal = 0;  // A -> B
    #40 input_signal = 1;  // B -> D
    #30 input_signal = 0;  // D -> C
    #30 input_signal = 1;  // C -> D
    #20 input_signal = 0;  // D -> C

    #10 reset = 0;         // Apply reset to return to initial state
    #10 reset = 1;

    #10 input_signal = 1;  // A -> C
    #20 input_signal = 0;  // C -> B

    #10 $finish;
  end

  // Clock generation
  always #5 clk = ~clk;

endmodule
