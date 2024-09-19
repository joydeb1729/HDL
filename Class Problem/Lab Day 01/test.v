module test(
    input a,
    output out
);

assign out = ~a;


endmodule

module testbench;

reg a;
wire out;
test init(.(a)a, .(out)out);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, testbench);
    a = 1'b0; #10 a = 1'b1; #10;
end


endmodule