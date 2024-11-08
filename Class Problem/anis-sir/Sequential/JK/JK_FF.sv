// Functional description of JK fl ip-fl op (V2001, 2005)
module JK_FF ( input J, K, Clk, output reg Q, output Q_b);
assign Q_b = ~ Q ;
always @ ( posedge Clk)
case ({J,K})
 2'b00: Q <= Q;
 2'b01: Q <= 1'b0;
 2'b10: Q <= 1'b1;
 2'b11: Q <= !Q;
endcase
endmodule