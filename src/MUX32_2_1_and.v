//-------------------------------------------------------
// File Name: MUX32_2_1_and.v
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
// Keywords:   multiplexers, and
//-------------------------------------------------------
// Purpose:    Multiplexer with "and" gateway

module mux_2to1_32bit(out, addPC, addPCShift, zero, branch);

    input[31:0] addPC, addPCShift;
    input zero, branch;

    output reg[31:0] PCNext;

    reg[31:0] out;
    reg selector;

    always @(addPC, addPCShift, inC)
        begin
            selector <= zero & branch;

            if (selector)
                begin
                    out <= addPCShift;
                end
            else
                begin
                    out <= addPC;
                end
        end

endmodule