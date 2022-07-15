//-------------------------------------------------------
// File Name: PCAdderShift.sv
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
// Keywords:   PC, adder, shift
//-------------------------------------------------------
// Purpose:    Receives the PC and sums the PC and the immediate

module PCAdderShift(
    PCAddShift,
    PC,
    immediate,
    clock
);

    output reg[31:0] PCAddShift;    // PC adds and shift to the and multiplexer

    input[31:0] outPCNext;                 // PC from the PC module
    input[31:0] immediate;          // Immediate from the immediate generator
    input reset, clock;

    //add the immediate to the PC
    always @(posedge clock)
        begin
            if (reset)
                begin
                    PCAddShift = 32'd0;
                end
            else
                begin
                    PCAddShift = outPCNext+immediate;
                end
        end

endmodule