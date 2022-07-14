//-------------------------------------------------------
// File Name: ALUContol.v
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
// Keywords:   alu, control, controller, alu control
//-------------------------------------------------------
// Purpose:    Control of the alu

module ALUControl(
    outALUControl,
    funct7,
    funct3,
    ALUOp,
    clock
);
    output reg[3:0] outALUControl;  // Output to control the ALU

    input[6:0] funct7;          // Function 7 of the Instruction
    input[2:0] funct3;          // Function 3 of the Instruction
    input[1:0] ALUOp;           // ALU operation from the Controller
    input clock;

    always @(*)
    begin
        if (ALUOp == 2'b00 && funct3 == 3'b011)      //outALUControl => ld
        begin
            outALUControl = 4'b0010;
        end
        else if (ALUOp == 2'b00 && funct3 == 3'b111) //outALUControl => sd
        begin
            outALUControl = 4'b0010;
        end
        else if (ALUOp == 2'b01 && funct3 == 3'b000) //outALUControl => beq
        begin
            outALUControl = 4'b0110;
        end
        else if (ALUOp == 2'b10 && funct7 == 7'b0000000 && funct3 == 3'b000 ) // outALUControl => add
        begin
            outALUControl = 4'b0010;
        end
        else if (ALUOp == 2'b10 && funct7 == 7'b0100000 && funct3 == 3'b000) // outALUControl => sub
        begin
            outALUControl = 4'b0110;
        end
        else if (ALUOp == 2'b10 && funct7 == 7'b0000000 && funct3 == 3'b111) // outALUControl => and
        begin
            outALUControl = 4'b0000;
        end
        else if (ALUOp == 2'b10 && funct7 == 7'b0000000 && funct3 == 3'b110) // outALUControl => or
        begin
            outALUControl = 4'b0001;
        end
    end

endmodule