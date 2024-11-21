module MooreFSM (
    input wire clk,
    input wire reset,
    input wire in,       // Input signal to control state transitions
    output reg out       // Output signal that depends only on the current state
);

// State encoding using localparam for compatibility with Verilog
localparam STATE_A = 2'b00;
localparam STATE_B = 2'b01;
localparam STATE_C = 2'b10;
localparam STATE_D = 2'b11;

// State variables
reg [1:0] current_state, next_state;

// State transition logic
always @(posedge clk or posedge reset) begin
    if (reset)
        current_state <= STATE_A; // Set to initial state
    else
        current_state <= next_state;
end

// Next state logic and output logic
always @(*) begin
    next_state = current_state;  // Default to hold state
    out = 0;                     // Default output
    case (current_state)
        STATE_A: begin
            out = 0;
            next_state = (in == 0) ? STATE_B : STATE_D;
        end
        STATE_B: begin
            out = 1;
            next_state = (in == 0) ? STATE_B : STATE_C;
        end
        STATE_C: begin
            out = 1;
            next_state = (in == 0) ? STATE_D : STATE_A;
        end
        STATE_D: begin
            out = 0;
            next_state = (in == 0) ? STATE_A : STATE_C;
        end
        default: begin
            next_state = STATE_A;
            out = 0;
        end
    endcase
end

endmodule

module MooreFSM_tb;

// Testbench signals
reg clk;
reg reset;
reg in;
wire out;

// Instantiate FSM
MooreFSM fsm (
    .clk(clk),
    .reset(reset),
    .in(in),
    .out(out)
);

// Generate VCD file for GTKWave
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, MooreFSM_tb);
end

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10-time unit clock period
end

// Test sequence for state transitions
initial begin
    reset = 1; in = 0;
    #10 reset = 0; // Release reset
    
    // Apply test input sequence with expected loops and transitions
    #10 in = 0; // Transition to STATE_B
    #10 in = 1; // Transition to STATE_C
    #10 in = 1; // Transition to STATE_A
    #10 in = 0; // Transition to STATE_B
    #10 in = 1; // Transition to STATE_C
    #10 in = 0; // Transition to STATE_D
    #10 in = 1; // Transition to STATE_C
    #10 in = 0; // Transition to STATE_D
    #10 in = 1; // Transition to STATE_A
    #10 reset = 1; // Reset FSM back to initial state
    #10 reset = 0; // Release reset again
    #10 $stop;  // End of simulation
end

// Monitor FSM output and state changes for debugging
initial begin
    $monitor("Time = %0d, Reset = %b, Input = %b, Output = %b, Current State = %b",
             $time, reset, in, out, fsm.current_state);
end

// End simulation after a set time
initial #200 $finish;

endmodule
