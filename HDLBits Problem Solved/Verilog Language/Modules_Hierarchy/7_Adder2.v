module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire out1, out2, in;

    add16 y1(.a(a[15:0]), .b(b[15:0]), .cin(in), .sum(sum[15:0]), .cout(out1));
    add16 y2(.a(a[31:16]), .b(b[31:16]), .cin(out1), .sum(sum[31:16]), .cout(out2));

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

    assign sum = a^b^cin;
    assign cout = a&b | cin & (a^b);  //from geeksforgeeks

endmodule
