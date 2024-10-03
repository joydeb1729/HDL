module NAND_Gate(output F, input w, x, y, z);

    wire nw, nx, ny, nz, temp1, temp2, temp3, temp4, temp5;

    nand gate1(nw, w, w);
    nand gate2(nx, x, x);
    nand gate3(ny, y, y);
    nand gate4(nz, z, z);
    nand gate5(temp1, w, nx);
    nand gate6(temp2, nw, nz);
    nand gate7(temp3, ny, nz);
    nand gate8(temp4, temp1, temp2);
    nand gate9(temp5, temp4, temp4);
    nand gate10(F, temp3, temp5);

endmodule



module NOR_Gate(output F, input w, x, y, z);

    wire nw, temp1, temp2, temp3, temp4, temp5, temp6;

    nor gate1(nw, w, w);
    nor gate2(temp1, nw, x);
    nor gate3(temp2, w, z);
    nor gate4(temp3, y, z);
    nor gate5(temp4, temp1, temp2);
    nor gate6(temp5, temp4, temp4);
    nor gate7(temp6, temp5, temp3);
    nor gate8(F, temp6, temp6);

endmodule

module Circuit_Testbench;

    wire F_nand, F_nor;
    reg w, x, y, z;

    NAND_Gate nand_circuit (F_nand, w, x, y, z);
    NOR_Gate nor_circuit (F_nor, w, x, y, z);

    initial begin
        $dumpfile("circuit_simulation.vcd");
        $dumpvars(0, Circuit_Testbench);

        w = 0; x = 0; y = 0; z = 0; #15;
        w = 0; x = 0; y = 0; z = 1; #15;
        w = 0; x = 0; y = 1; z = 0; #15;
        w = 0; x = 0; y = 1; z = 1; #15;
        w = 0; x = 1; y = 0; z = 0; #15;
        w = 0; x = 1; y = 0; z = 1; #15;
        w = 0; x = 1; y = 1; z = 0; #15;
        w = 0; x = 1; y = 1; z = 1; #15;
        w = 1; x = 0; y = 0; z = 0; #15;
        w = 1; x = 0; y = 0; z = 1; #15;
        w = 1; x = 0; y = 1; z = 0; #15;
        w = 1; x = 0; y = 1; z = 1; #15;
        w = 1; x = 1; y = 0; z = 0; #15;
        w = 1; x = 1; y = 0; z = 1; #15;
        w = 1; x = 1; y = 1; z = 0; #15;
        w = 1; x = 1; y = 1; z = 1; #15;
    end

    initial #300 $finish;

endmodule
