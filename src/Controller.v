//-------------------------------------------------------
// File Name: Controller.sv
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
    rWrite,
    memoryToRegister,
    ALUSrc,
    memoryRead,
    memoryWrite,
    opcode,
    clock
);

    output reg branch;              // Branch signal to the And multiplexer
    output reg rWrite;            // Register write signal to the register memory
    output reg memoryToRegister;    // Memory to register signal to the multplexer
    output reg ALUSrc;              // ALU Src signal to the mutplexer
    output reg memoryRead;          // read Memory signal to the Datamemory
    output reg memoryWrite;         // write Memory signal to the Datamemory
    output reg[1:0] ALUOp;          // ALU operation to the ALU Controller

    input[6:0] opcode;              // Opcode from the instruction
    input clock;

    // logic of the Controller, used to generate signals to datapath modules
    always @(posedge clock)
        begin
            case (opcode)
                7'b0110011: // R-format
                    begin
                        ALUSrc <= 1'b0;//certo
                        memoryToRegister <= 1'b0;//certo
                        rWrite <= 1'b1;//certo
                        memoryRead <= 1'b0;//certo
                        memoryWrite <= 1'b0;//certo
                        branch <= 1'b0; //certo
                        ALUOp <= 2'b10;//certo
                    end
                7'b0000011: // LD
                    begin
                        ALUSrc <= 1'b1;//certo
                        memoryToRegister <= 1'b1;//certo
                        rWrite <= 1'b1;//certo
                        memoryRead <= 1'b1;//certo
                        memoryWrite <= 1'b0;//certo
                        branch <= 1'b0;//certo
                        ALUOp <= 2'b00;//certo
                    end
                7'b0100011: // SD
                    begin
                        ALUSrc <= 1'b1;//certo
                        memoryToRegister <= 1'b0;
                        rWrite <= 1'b0;
                        memoryRead <= 1'b0;
                        memoryWrite <= 1'b1;//certo
                        branch <= 1'b0;
                        ALUOp <= 2'b00;
                    end
                7'b1100011: // BEQ
                    begin
                        ALUSrc <= 1'b0;
                        memoryToRegister <= 1'b0;
                        rWrite <= 1'b0;
                        memoryRead <= 1'b0;
                        memoryWrite <= 1'b0;
                        branch <= 1'b1;//certo
                        ALUOp <= 2'b01;//certo
                    end
            endcase
        end

endmodule