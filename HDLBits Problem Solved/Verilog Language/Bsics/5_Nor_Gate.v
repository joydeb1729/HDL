module top_module( 
    input a, 
    input b, 
    output out );

    wire or_ab;
    
    assign or_ab = a | b;
    assign out = ~ or_ab ; 
    
    
endmodule
