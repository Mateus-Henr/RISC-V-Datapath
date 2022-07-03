//-------------------------------------------------------
// File Name: InstructionMemory.v
// Type: module
// Department: Ciencias da computação - UFV-Florestal
// Author: João Victor, Vitor Ribeiro, Mateus Henrique
// Author's Email: joao.andrade1@ufv.br, mateus.h.figueredo@ufv.br, vitor.lacerda@ufv.br
//-------------------------------------------------------
// Release history
// Version Date            Description
// 0.1     01/07/2022      Archive creation
// 0.2     02/07/2022      Version with code
//-------------------------------------------------------
// Keywords:   instructions, memory
//-------------------------------------------------------
// Purpose:    Stores the instructions

module InstructionMemory(
    out,
    PC,
    reset
);

    output reg[31:0] out;               // Instruction to the Datapath

    input[31:0] PC;                     // Program counter from the PC module
    input reset;                        // Reset signal from the datapath

    reg[31:0] instructionArray[31:0];   // Instruction memory


    // start the codelines
    initial begin
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
/*
            #20 instruction = 00000000000000001000000100110011;
            #20 instruction = 00000000001000001000000010110011;
            #20 instruction = 00000000001000001000000010110011;
            #20 instruction = 01000000001000001000000010110011;
            #20 instruction = 01000000001000001000000010110011;
            #20 instruction = 00000000000100001000000010110011;
            #20 instruction = 00000000000000001010000000100011;
            #20 reset = 1'b1;
            #20 instruction = 00000000000000001010000000100011;
*/
    //read the codeline, check if reset and reset
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
            out <= instructionArray[PC/4];
        end

endmodule