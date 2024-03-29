//-------------------------------------------------------
// File Name: ImmediateGenerator.sv
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
// Keywords:   immediate, generate, generator
//-------------------------------------------------------
// Purpose:    Used to amplify Immediate

module ImmediateGenerator(
    outImmediate,
    immediate,
    clock
);

    output reg[31:0] outImmediate;  // Immediate with 32 bits

    input[31:0] immediate;          // Immediate with 16 bits
    input clock;

//    reg [6:0] opcode = immediate[6:0];              // Instruction's opcode 5 bits

    // Amplify Immediate extendint with zeros for positive numbers and one for the negative numbers
    always @(posedge clock)
        begin
            case (immediate[6:0])
                7'b0100011:
                    begin
                        outImmediate <= {{21{immediate[31]}}, immediate[31:25], immediate[11:7]};                // SD Stype
                    end
                7'b0000011:
                    begin
                        outImmediate <= {{21{immediate[31]}}, immediate[31:20]};                                 // LD Itype
                    end
                7'b1100011:
                    begin
                        outImmediate <= {{20{immediate[31]}}, immediate[7], immediate[30:25], immediate[11:8]}; //branch
                    end
            endcase
        end

endmodule