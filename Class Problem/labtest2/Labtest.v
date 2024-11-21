module DFF (output reg Q, input D, Clk, rst);
    always @(posedge Clk or posedge rst)
        if (rst == 1)
            Q <= 1'b0; 
        else
            Q <= D;    
endmodule

module PNFF (output Q, input P, N, Clk, rst);
    wire PN;
    assign PN = (P && ~Q) | (N && Q); 

    DFF PN1 (Q, PN, Clk, rst);
endmodule

module Lab_Test5(output FA, FB, input clk, reset);
    wire Pa, Pb, Na, Nb;


    assign Pa = 1;
    assign Na = 0;
    assign Pb = ~FA;
    assign Nb = FA;

    PNFF pn1(FA, Pa, Na, clk, reset);
    PNFF pn2(FB, Pb, Nb, clk, reset);
endmodule

module t_Lab_Test5;
    reg t_clock, t_reset;
    wire [1:0] state;
    wire FA, FB;


    Lab_Test5 uut(FA, FB, t_clock, t_reset);

    assign state = {FA, FB};


    initial begin
        $dumpfile("Labtest.vcd");
        $dumpvars(0, t_Lab_Test5);
    end

    initial #150 $finish;


    initial begin
        t_reset = 0;
        #5 t_reset = 1; 
        #5 t_reset = 0; 
        t_clock = 0;    
        repeat (28)
            #5 t_clock = ~t_clock; 
    end
endmodule
