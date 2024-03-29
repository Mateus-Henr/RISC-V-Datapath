//-------------------------------------------------------
// ile Name: ALU.sv
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
    zero,
    ALUControl,
    input1,
    input2,
    clock
);

    output reg[31:0] ALUOut;    // ALU output to the multplexer
    output reg zero;            // Zero signal to the and multiplexer

    input[31:0] input1;         // Output register1 from registers memory
    input[31:0] input2;         // Extended immediate from Immadiate Genarator
    input[3:0] ALUControl;      // Output ALU control from ALU controller
    input clock;

    // Do the logical operations based in the ALU controller signal
    always @(posedge clock)
        begin
            case (ALUControl)
                4'b0000: ALUOut = input1 & input2;   // And
                4'b0001: ALUOut = input1 | input2; // Or
                4'b0010: ALUOut = input1+input2;   // Sum
                4'b0110: ALUOut = input1-input2;       // Sub
                4'b0111: ALUOut = (input1 & input2);
                4'b1100: ALUOut = ~(input1 | input2);
                default: ALUOut = 32'b0;                               // Default
            endcase

            if (ALUOut == 32'b0)
                begin
                    zero = 1'b1;
                end
            else
                begin
                    zero = 1'b0;
                end
        end

endmodule