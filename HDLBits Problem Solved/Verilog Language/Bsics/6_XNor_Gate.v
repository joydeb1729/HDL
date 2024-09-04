module top_module( 
    input a, 
    input b, 
    output out );

    wire xor_ab;
    
    assign xor_ab = a ^ b;
    assign out = ~ xor_ab;
    
endmodule
