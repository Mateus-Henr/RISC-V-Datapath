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

module mux_2to1_32bit(
    PCNext,
    addPC,
    addPCShift,
    zero, branch
);

    output reg[31:0] PCNext;    // Next progam to the PC module

    input[31:0] addPC;          // Program counter +4 from the adder
    input[31:0] addPCShift;     // Program counter shifted from the shift adder
    input zero;                 // Zero signal from the ALU
    input branch;               // Branch signal from the controler

    reg selector;               // Selector to select the adder

    // Make a and with zero and branch to chouse the adder
    always @(addPC, addPCShift, inC)
        begin
            selector <= zero & branch;

            if (selector)
                begin
                    PCNext <= addPCShift;
                end
            else
                begin
                    PCNext <= addPC;
                end
        end

endmodule