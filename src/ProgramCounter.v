//-------------------------------------------------------
// File Name: ProgramCounter.sv
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
// Keywords:   counter, clock, count
//-------------------------------------------------------
// Purpose:    Counter

module ProgramCounter(
    outPCNext,
    PCNext,
    reset,
    clock
);

    output reg[31:0] outPCNext; // PC next to the instruction memory

    input[31:0] PCNext;         // PC next from the and multplexer
    input reset;                // Reset signal from datapath
    input clock;                // CLock from the datapath

    initial
        begin
            outPCNext <= 32'b0;
        end

    // Check if the PC needs to reset or reads the next pc
    always @(posedge clock)
        begin
            if (reset) // If reset signal is activated, we set the PC back to 0.
                begin
                    outPCNext <= 32'b0;
                end
            else
                begin
                    outPCNext <= PCNext;
                end
        end

endmodule