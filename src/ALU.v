//-------------------------------------------------------
// ile Name: ALU.v
// Type: module
// Department: Ciência da computação - UFV-Florestal
// Author: João Victor, Vitor Ribeiro, Mateus Henrique
// Author's Email: joao.andrade1@ufv.br, mateus.h.figueredo@ufv.br, vitor.lacerda@ufv.br
//-------------------------------------------------------
// Release history
// Version Date            Description
// 0.1     01/07/2022      Archive creation
// 0.2     02/07/2022      Version with code
//-------------------------------------------------------
// Keywords:   Arithmetic, Logic
//-------------------------------------------------------
// Purpose:    Executes logic and arithmetic operations

module ALU(
    ALUOut,
    ALUControl,
    input1,
    input2
);

    output reg zero;            // Zero signal to the and multiplexer
    output reg[31:0] ALUOut;    // ALU output to the multplexer

    input[31:0] input1;         // Output register1 from the registers memory
    input[31:0] input2;         // Extended immediate from the Immadiate Genarator
    input[3:0] ALUControl;      // Output ALU control from the ALU controller

    // Do the logical operations based in the ALU controller signal
    always @(*)
        begin
            case (ALUControl)
                4'b0000: ALUOut = input1 & input2;  // And
                4'b0001: ALUOut = input1 | input2;  // Or
                4'b0110: ALUOut = input1+input2;    // Sum
                4'b0110: ALUOut = input1-input2;    // Subtraction
                default: ALUOut = input1+input2;    // Sum
            endcase
        end

    //return a zero signal based in the ALU output
    always @(ALUOut)
        begin
            if (!ALUOut)
                begin
                    zero <= 1;
                end
            else
                begin
                    zero <= 0;
                end
        end

endmodule : ALU
