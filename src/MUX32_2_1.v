//-------------------------------------------------------
// File Name: MUX32_2_1.sv
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
// Keywords:   multiplexers
//-------------------------------------------------------
// Purpose:    Multiplexer

module MUX_32_2_1(
    out,
    input1,
    input2,
    selector,
    clock
);

    output reg[31:0] out;   // Output to the register memory / ALU

    input[31:0] input1;     // Input from the ALU / output register 2
    input[31:0] input2;     // Input from the Readed data in data memory / Immediate genaretor
    input selector;         // Input from the controler memory toregister / ALU Src
    input clock;

    //choose the value for the ALU / value to write in the register
    always @(posedge clock)
        begin
            if (selector)
                begin
                    out = input2;
                end
            else
                begin
                    out = input1;
                end
        end

endmodule