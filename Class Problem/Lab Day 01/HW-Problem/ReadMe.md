### Problem Description:
The objective of this project is to implement a logic function using **only NOR gates** and **only NAND gates** in separate implementations in Verilog. The function is defined as:

\[ F(w, x, y, z) = wx' + y'z' + w'z' \]

This function takes four binary input variables \( w \), \( x \), \( y \), and \( z \), and computes the result using either NOR or NAND gates, without using any other type of gate. Both NOR and NAND gates will be used to handle the required logic operations like NOT, AND, and OR.

### Output:
The output of the function \( F \) is a binary value (0 or 1) based on the inputs \( w \), \( x \), \( y \), and \( z \). The testbench will test all possible combinations of the inputs (0000 to 1111), and the corresponding output for each combination will be evaluated.
