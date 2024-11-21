module MooreFSM (output reg out, input in, clk, res);

    parameter state_a = 2'b00;
    parameter state_b = 2'b01;
    parameter state_c = 2'b10;
    parameter state_d = 2'b11;

    reg[1:0] present_state, next_state;

    always @ (posedge clk or negedge res)
        begin 
            if(res == 1'b0)
                present_state <= state_a;
            else
                present_state <= next_state;
        end
    
    always @ (present_state, in) 
        begin
            case(present_state)
                state_a: begin
                    out = 1'b0;
                    if(in==1'b0)
                        next_state = state_b;
                    else
                        next_state = state_c;
                end

                state_b: begin
                    out = 1'b1;
                    if(in==1'b0)
                        next_state = state_c;
                    else
                        next_state = state_d;
                end

                state_c: begin
                    out = 1'b1;
                    if(in==1'b0)
                        next_state = state_b;
                    else
                        next_state = state_d;
                end

                state_d: begin
                    out = 1'b0;
                    if(in==1'b0)
                        next_state = state_c;
                    else
                        next_state = state_a;
                end

            endcase

        end

endmodule;


module t_MooreFSM();

    reg in, clk, res;
    wire out;

    MooreFSM test1(out, in, clk, res);

    initial begin
        $dumpfile("230234.vcd");
        $dumpvars(0, t_MooreFSM);
    end

    initial #350 $finish;

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial fork

        res = 0;
        #20 res = 1;

        #20 in = 0;
        #60 in = 1;

        #100 in = 0;
        #130 in = 1;

        #120 res = 0;
        #200 res = 1;

        #150 in = 0;
        #180 in = 1;

        #230 in = 0;
        #280 in = 1;

        #300 res = 0;

        join

endmodule