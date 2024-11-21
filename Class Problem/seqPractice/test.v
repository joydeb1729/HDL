module DFF_Rimon(
  output FA,FB,
  input x_in, clock, reset
);
wire DA,DF;

assign DA = (FB & x_in) | (FA & x_in);
assign DA = (~FB & x_in) | (FA & x_in);

DFF D_A(FA, DA, clock, reset);
DFF D_B(FB, DB, clock, reset);
endmodule

module DFF ( output reg Q, input D, Clk, rst);
  always @( posedge Clk, negedge rst)
   if (!rst) Q <= 1'b0; // Same as: if (rst == 0)
  else Q <= D;
endmodule

module t_DFF_Rimon;
  //wire t_Q;
  reg t_x_in, t_clock, t_reset;
  wire [1:0] state;
  DFF_Rimon D(FA,FB,t_x_in,t_clock,t_reset);
  assign state = {FA,FB};
  //DFF  D ( t_Q, t_D, t_Clk, t_rst);
  initial 
    begin
       $dumpfile("t_DFF_Rimon.vcd");
         $dumpvars(0, t_DFF_Rimon);
    end
  initial #150 $finish;
  initial 
     begin 
       t_reset = 1;
     repeat (2)
     #5 t_reset = ~t_reset; 
     end
  initial 
   begin 
       t_clock = 1;
     repeat (28)
     #5 t_clock = ~t_clock; 
    end
  initial
  begin
    t_x_in = 0;
    #10 t_x_in = 1;
    repeat(3)
    #30 t_x_in = ~ t_x_in;
  end         
endmodule