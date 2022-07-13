//-------------------------------------------------------
// File Name: Shifter.v
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
// Keywords:   Shifter, shift, left
//-------------------------------------------------------
// Purpose:    Used to shift the Immediate

module Shifter(
    shiftImmediate,
    immediate,
    clock
);
    output reg [31:0]shiftImmediate;   // Shifted imeddiate to the adder 32 bits

    input[31:0]immediate;            // Imeddiate from the Immeediate Generator 32 bits
    input clock;

    // Shift the immediate
    always @ (*)
        begin
            shiftImmediate <= (immediate << 2);
        end
endmodule