//-------------------------------------------------------
// File Name: ProgramCounter.v
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

module ProgramCounter(outPCNext, PCNext, reset, clock);

    input[31:0] PCNext;
    input reset, clock;

    output reg[31:0] outPCNext;

    always @(posedge clock)
        begin
            if (reset)
                begin
                    outPCNext <= 32'b0;
                end
            else
                begin
                    outPCNext <= PCNext;
                end
        end

endmodule