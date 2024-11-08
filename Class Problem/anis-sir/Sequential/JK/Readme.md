# JK Flip-Flop Module (JK_FF)

A JK flip-flop is a sequential digital circuit with two inputs (J and K) and an output (Q). It’s an improvement over the D flip-flop, as it can toggle (invert) its output based on the values of J and K.

## Inputs and Outputs

### Inputs:
- **J and K**: Control inputs that determine the next state of the flip-flop.
- **Clk**: Clock signal that triggers changes in the output.

### Outputs:
- **Q**: The primary output that holds the flip-flop state.
- **Q_b**: The complement of Q (\( Q_b = \sim Q \)).

## Logic

The JK flip-flop uses case statements to control the output (Q) based on the combination of J and K when the clock signal has a positive (rising) edge.
- **J = 0, K = 0**: No change; Q retains its previous value.
- **J = 0, K = 1**: Resets Q to 0.
- **J = 1, K = 0**: Sets Q to 1.
- **J = 1, K = 1**: Toggles (inverts) Q (i.e., \( Q \) becomes \( \sim Q \)).

The asynchronous behavior (\( \text{assign } Q_b = \sim Q; \)) allows Q_b to always reflect the opposite of Q.

## Testbench Module (t_JK_FF)

The testbench simulates the JK flip-flop to verify its behavior under various input combinations for J, K, and Clk.

### Components
- **Inputs**: 
  - `t_J`, `t_K`, and `t_Clk`: Used to apply test signals to the JK flip-flop.
- **Outputs**: 
  - `t_Q` and `t_Q_b`: Capture the flip-flop’s output.

### Simulation Setup
- **Clock Generation**: The clock signal (`t_Clk`) toggles every 5 time units (`#5 t_Clk = ~t_Clk;`), providing a clock cycle for testing the synchronous response.

### Test Conditions:
Values for J and K are set at specific times to test each state of the flip-flop. For example:
- At time **#2**, `J = 1` and `K = 0`, which sets Q to 1.
- At time **#22**, `J = 0` and `K = 1`, which resets Q to 0.
- Other combinations are similarly tested to observe how Q changes or toggles.

### End Simulation:
The simulation is terminated after **110 time units** (`initial #110 $finish;`).

### Output Recording
The `$dumpfile` and `$dumpvars` commands record the output changes in a `.vcd` file, allowing visualization of how Q and Q_b change with respect to J, K, and Clk.

This setup confirms that the JK flip-flop behaves as expected for each combination of inputs, clock edge, and toggle conditions, ensuring reliable sequential operation.
