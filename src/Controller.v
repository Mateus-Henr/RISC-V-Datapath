//-------------------------------------------------------
// File Name: Controller.v
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
// Keywords:   controller, control
//-------------------------------------------------------
// Purpose:    control of the datapath

module Controller(
    ALUOp,
    branch,
    regWrite,
    memoryToRegister,
    ALUSrc,
    memoryRead,
    memoryWrite,
    opcode
);

    output branch;              // Branch signal to the And multiplexer
    output regWrite;            // Register write signal to the register memory
    output memoryToRegister;    // Memory to register signal to the multplexer
    output ALUSrc;              // ALU Src signal to the mutplexer
    output memoryRead;          // Memory read signal to the Datamemory
    output memoryWrite;         // Memory write signal to the Datamemory
    output reg[1:0] ALUOp;      // ALU operation to the ALU Controller

    input opcode;               // Opcode from the instruction

    // Control logic to generate signals for datapath modules
    always @(opcode)
        begin
            case (opcode)
                7'b0110011: // R-format
                    begin
                        ALUSrc <= 0;
                        memoryToRegister <= 0;
                        regWrite <= 1;
                        memoryRead <= 0;
                        memoryWrite <= 0;
                        branch <= 0;
                        ALUOp <= 2'b10;
                    end
                7'b0000011: // LD
                    begin
                        ALUSrc <= 1;
                        memoryToRegister <= 1;
                        regWrite <= 1;
                        memoryRead <= 1;
                        memoryWrite <= 0;
                        branch <= 0;
                        ALUOp <= 2'b00;
                    end
                7'b0100011: // SD
                    begin
                        ALUSrc <= 1;
                        memoryToRegister <= 0;
                        regWrite <= 0;
                        memoryRead <= 0;
                        memoryWrite <= 1;
                        branch <= 0;
                        ALUOp <= 2'b00;
                    end
                7'b1100011: // BEQ
                    begin
                        ALUSrc <= 0;
                        memoryToRegister <= 0;
                        regWrite <= 0;
                        memoryRead <= 0;
                        memoryWrite <= 0;
                        branch <= 1;
                        ALUOp <= 2'b01;
                    end
            endcase
        end

endmodule : Controller