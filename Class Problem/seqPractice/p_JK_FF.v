module DFF (output reg Q,input D,clk,rst);
    always @(posedge clk,negedge rst)
    if(!rst) Q<=1'b0;
    else Q<=D;
    
endmodule

module JK_FF ( output Q, input J,K,clk,rst);

 wire JK;
 assign JK = (J&(~Q)) | ((~K)&Q); 
DFF JK1 (Q,JK,clk,rst);
    
endmodule

module p_JK_FF ( 
   output wire FA,FB,
   input x,clk,rst
);
wire JA,JB,KA,KB;
assign JA = ((~FB)&(~x));
assign JB = (FA&(~x));
assign KA = (FB&(~x));
assign KB = (~FA);
JK_FF J_A (.Q(FA),.J(JA),.K(KA),.clk(clk),.rst(rst));
JK_FF J_B (.Q(FB),.J(JB),.K(KB),.clk(clk),.rst(rst));

endmodule
module t_JK_FF;
reg t_x,t_clk,t_rst;
wire [1:0]state;
wire FA,FB;
p_JK_FF p(

    .FA(FA),
    .FB(FB),
    .x(t_x),
    .clk(t_clk),
    .rst(t_rst)
);

    assign state = {FA,FB};

    initial begin
        $dumpfile("p_JK_FF.vcd");
        $dumpvars( 0,t_JK_FF);
    end

initial begin
    t_rst = 1;
    repeat (2)
    #5 t_rst =~t_rst;
end

initial begin
    t_clk =0;
    repeat (28)
    #5 t_clk=~t_clk;
end

initial begin
    t_x=0;
    #10 t_x=1;
    repeat (3)
    #30 t_x=~t_x;
end

    
endmodule