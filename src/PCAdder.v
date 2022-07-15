//-------------------------------------------------------
// File Name: PCAdder.sv
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
// Keywords:   PC, adder
//-------------------------------------------------------
// Purpose:    Receives the PC and returns the next instruction

module PCAdder(
    outPCAdder,
    PC,
    clock,
    reset
);

    output reg[31:0] outPCAdder;    // PC adder +4 to the "and" multiplexer

    input[31:0] outPCNext;                 // PC input from the PC module
    input reset, clock;

    always @(posedge clock)
        begin
            if (reset)
                begin
                    outPCAdder = 32'd0;
                end
            else
                begin
                    outPCAdder = outPCNext+32'd4;
                end
        end

endmodule