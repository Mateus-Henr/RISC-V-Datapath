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

    reg[31:0] instructionArray[31:0];
    reg[7:0] PCPos;

    always @(PC)
        begin
            if (reset)
                begin
                    instructionArray[0] <= 32'b0;
                    instructionArray[1] <= 32'b0;
                    instructionArray[2] <= 32'b0;
                    instructionArray[3] <= 32'b0;
                    instructionArray[4] <= 32'b0;
                    instructionArray[5] <= 32'b0;
                    instructionArray[6] <= 32'b0;
                    instructionArray[7] <= 32'b0;
                    instructionArray[8] <= 32'b0;
                    instructionArray[9] <= 32'b0;
                    instructionArray[10] <= 32'b0;
                    instructionArray[11] <= 32'b0;
                    instructionArray[12] <= 32'b0;
                    instructionArray[13] <= 32'b0;
                    instructionArray[14] <= 32'b0;
                    instructionArray[15] <= 32'b0;
                    instructionArray[16] <= 32'b0;
                    instructionArray[17] <= 32'b0;
                    instructionArray[18] <= 32'b0;
                    instructionArray[19] <= 32'b0;
                    instructionArray[20] <= 32'b0;
                    instructionArray[21] <= 32'b0;
                    instructionArray[22] <= 32'b0;
                    instructionArray[23] <= 32'b0;
                    instructionArray[24] <= 32'b0;
                    instructionArray[25] <= 32'b0;
                    instructionArray[26] <= 32'b0;
                    instructionArray[27] <= 32'b0;
                    instructionArray[28] <= 32'b0;
                    instructionArray[29] <= 32'b0;
                    instructionArray[30] <= 32'b0;
                    instructionArray[31] <= 32'b0;
                end

            PCPos <= PC/4;
            out <= instructArray[PCPos];
        end

endmodule : InstructionMemory