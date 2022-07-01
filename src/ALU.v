// -------------------------------------------------------------------
// @author Mateus
// @copyright (C) 2022, <COMPANY>
//
// Created : 01. Jul 2022 13:31
//-------------------------------------------------------------------
module ALU(ALUOut, ALUControl, input1, input2);
    input[31:0] input1, input2;
    input[3:0] ALUControl;

    output reg zero;
    output reg[31:0] ALUOut;

    always @(*)
        begin
            case (ALUControl)
                4'b0000: ALUOut = input1 & input2;
                4'b0001: ALUOut = input1 | input2;
                4'b0110: ALUOut = input1+input2;
                4'b0110: ALUOut = input1-input2;
                default: ALUOut = input1+input2;
            endcase
        end

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
