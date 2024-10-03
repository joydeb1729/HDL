module NAND(w,x,y,z,r1);
output r1;
input w,x,y,z;
wire w1,w2,w3,w4,w5,w6,w7;
nand G1(w1,w);
nand G2(w2,x);
nand G3(w3,y);
nand G4(w4,z);
nand G5(w5,w,w2);
nand G6(w6,w3,w4);
nand G7(w7,w1,w4);
nand G8(r1,w5,w6,w7);
endmodule

module NOR(w,x,y,z,r2);
output r2;
input w,x,y,z;
wire w1,w2,w3,w4,w5,w6,w7;
nor G1(w1,w);
nor G2(w2,x);
nor G3(w3,y);
nor G4(w4,z);
nor G5(w5,w,w4);
nor G6(w6,w2,w4);
nor G7(w7,w1,w2,w3);
nor G8(r2,w5,w6,w7);
endmodule

module t_230233;
    wire r1,r2;
    reg w,x,y,z;
    NAND Nand(w,x,y,z,r1);
    NOR Nor(w,x,y,z,r2);
    initial
    begin
     $dumpfile("230233.vcd");
     $dumpvars(0,t_230233);
      w = 1'b0; x = 1'b0; y = 1'b0; z=1'b0;
      #10 w = 1'b0; x = 1'b0; y = 1'b0; z=1'b1;
      #10 w = 1'b0; x = 1'b0; y = 1'b1; z=1'b0;
      #10 w = 1'b0; x = 1'b0; y = 1'b1; z=1'b1;
      #10 w = 1'b0; x = 1'b1; y = 1'b0; z=1'b0;
      #10 w = 1'b0; x = 1'b1; y = 1'b0; z=1'b1;
      #10 w = 1'b0; x = 1'b1; y = 1'b1; z=1'b0;
      #10 w = 1'b0; x = 1'b1; y = 1'b1; z=1'b1;
      #10 w = 1'b1; x = 1'b0; y = 1'b0; z=1'b0;
      #10 w = 1'b1; x = 1'b0; y = 1'b0; z=1'b1;
      #10 w = 1'b1; x = 1'b0; y = 1'b1; z=1'b0;
      #10 w = 1'b1; x = 1'b0; y = 1'b1; z=1'b1;
      #10 w = 1'b1; x = 1'b1; y = 1'b0; z=1'b0;
      #10 w = 1'b1; x = 1'b1; y = 1'b0; z=1'b1;
      #10 w = 1'b1; x = 1'b1; y = 1'b1; z=1'b0;
      #10 w = 1'b1; x = 1'b1; y = 1'b1; z=1'b1;
    end
    initial #200 $finish;
endmodule