module DFF (output reg Q,input D,Clk,rst);
always @(posedge Clk, negedge rst)
if(!rst) Q<=1'b0;
else Q<=D;
    
endmodule

module TFF (Q,T,Clk,rst);
output Q;
input T,Clk,rst;
wire DT;
assign DT = Q^T;
DFF TFF1(Q,DT,Clk,rst);    
endmodule

module p_TFF (
   output wire FA,FB,
   input x,Clk,rst
);
wire TA,TB;
assign TA= ((~FA)&(~FB)&(~x)) | ((FA&FB)&(~x));
assign TB= ((~FA && FB && ~x)) | ((FA&& ~x &&~FB));
TFF T_A (.Q(FA),.T(TA),.Clk(Clk),.rst(rst));
TFF T_B (.Q(FB),.T(TB),.Clk(Clk),.rst(rst));
    
endmodule

module t_TFF;
reg t_x,t_Clk,t_rst;
wire [1:0]state;
wire FA,FB;
p_TFF p(

    .FA(FA),
    .FB(FB),
    .x(t_x),
    .Clk(t_Clk),
    .rst(t_rst)
);

    assign state = {FA,FB};

    initial begin
        $dumpfile("p_TFF.vcd");
        $dumpvars( 0,t_TFF);
    end

initial begin
    t_rst = 1;
    repeat (2)
    #5 t_rst =~t_rst;
end

initial begin
    t_Clk =0;
    repeat (28)
    #5 t_Clk=~t_Clk;
end

initial begin
    t_x=0;
    #10 t_x=1;
    repeat (3)
    #30 t_x=~t_x;
end

    
endmodule