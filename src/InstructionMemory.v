// -------------------------------------------------------------------
// @author Mateus
// @copyright (C) 2022, <COMPANY>
//
// Created : 01. Jul 2022 13:20
//-------------------------------------------------------------------
module InstructionMemory(out, PC);
    input[31:0] PC;
    input clock;

    output[31:0] out;

    reg[31:0] instructArray[31:0];
    reg[7:0] PCPos;

    always @(PC)
        begin
            if (reset)
                begin
                    //coloca os itens no array
                end
            PCPos <= PC/4;
            out <= instructArray[PCPos];
        end
endmodule : InstructionMemory