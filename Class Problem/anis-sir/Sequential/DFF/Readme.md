# D Flip-Flop (DFF Module)

## Purpose

This module defines a D flip-flop with asynchronous reset. A D flip-flop (data or delay flip-flop) stores a single bit (`Q`) and updates it according to an input value (`D`) on each clock cycle.

## Inputs and Outputs

- **Inputs**:
  - `D`: Data input.
  - `Clk`: Clock input.
  - `rst`: Reset input (active-low).
- **Output**:
  - `Q`: The stored output, declared as `reg` since it holds state.

## Asynchronous Reset

The reset (`rst`) is active-low, meaning:
- When `rst` is `0`, `Q` is immediately set to `0`, overriding the clock.
- This behavior is implemented with `if (!rst) Q <= 1'b0;`, which forces `Q` to `0` when `rst` is `0`.

## Data Capture on Clock Edge

- When `rst` is high (`1`), the flip-flop captures the value of `D` on the rising edge of `Clk`.
- This behavior is described by `else Q <= D;` — when `Clk` rises and `rst` is not asserted, `Q` is updated to match `D`.

## Operation

- **If `rst = 0`**: `Q` is immediately reset to `0`.
- **If `rst = 1` and `Clk` rises**: `Q` takes the value of `D`.

---

# Testbench (t_DFF Module)

## Purpose

The testbench (`t_DFF`) simulates the D flip-flop to verify how it behaves under different conditions, applying various values to `D`, `Clk`, and `rst`.

## Test Signals

- `t_D`, `t_Clk`, and `t_rst`: Inputs to control the D flip-flop in simulation.
- `t_Q`: A wire that captures the output from the D flip-flop instance (`D`) under test.

## Clock Generation

- The clock signal `t_Clk` toggles every 5 time units (simulated by `#5 t_Clk = ~t_Clk;`), creating a 10-time-unit clock cycle.
- This generates a continuous clock signal for testing synchronous behavior.

## Signal Control

- **Reset**: `t_rst` is set to `0` initially, activating reset, and later changes to `1` and `0` at various times to test the reset behavior.
- **Data Input (`D`)**: `t_D` changes at specified times to test how the flip-flop captures different values on each clock cycle when `rst` is not active.

## Simulation Duration

- The testbench runs for a total of 110 time units (indicated by `initial #110 $finish;`), after which the simulation ends.

## Waveform Output

- The `$dumpfile` and `$dumpvars` commands record the signal changes in a `.vcd` file, allowing you to visualize how `Q` responds to `D`, `Clk`, and `rst` over time.

---

# Test Summary

This setup tests the D flip-flop’s response to:

1. **Clock edges** (rising edge of `Clk`).
2. **Asynchronous reset** (forcing `Q` to `0` when `rst = 0`).
3. **Data input** (capturing `D` on each rising edge of `Clk` when `rst = 1`).

This testbench helps verify that the D flip-flop behaves as expected for sequential storage and reset functionality.
