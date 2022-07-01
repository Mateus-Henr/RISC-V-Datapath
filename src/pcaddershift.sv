module PCAdder(PC, Imm_gen, PCAddshift);
    input[31:0] PC, Imm_gen;
    output reg[31:0] PCAddshift;

    always @(PC)
        begin
            PCAddshift <= PC+Imm_gen;
        end

endmodule