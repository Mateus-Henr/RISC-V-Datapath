//-------------------------------------------------------
// File Name: Datapath.v
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
// Keywords:   datapath, tests
//-------------------------------------------------------
// Purpose:    Datapath

// Includes
`include "ALU.v"
`include "ALUControl.v"
`include "Controller.v"
`include "ImmediateGenerator.v"
`include "InstructionMemory.v"
`include "MUX32_2_1.v"
`include "MUX32_2_1_and.v"
`include "PCAdder.v"
`include "PCAdderShift.v"
`include "ProgramCounter.v"
`include "RegisterMemory.v"

module Datapath(
    wireisterArray,
    clock,
    reset
);

    output wire[31:0] wireisterArray[31:0];

    input wirereset, clock;

    // Wires
    wire[31:0] PC, writeData, data1, data2, soma, PCNext, instruction, ALUout, immediate, auxiliarData, PCshift, readData;
    wire branch, memRead, memtoReg, memWrite, ALUSrc, zero, ANDBranch; // Control
    wire[1:0] ALUOp; // Control

    // Modules
    ProgramCounter PC(
        .outPCNext(PCNext),
        .PCNext(PC),
        .reset(wirereset),
        .clock(clock)
    );

    PCAdder pcAdd(
        .outPCAdder(PC),
        .PC(PCNext)
    );

    InstructionMemory instructionMem(
        .out(instruction),
        .PC(PC),
        .reset(wirereset)
    );

    Controller control(
        .ALUOp(),
        .branch(),
        .regWrite(),
        .memoryToRegister(),
        .ALUSrc(),
        .memoryRead(),
        .memoryWrite(),
        .opcode()
    );

    ALU alu(
        .ALUOut(),
        .zero(),
        .ALUControl(),
        .input1(),
        .input2()
    );


    ALUControl aluCrt(
        .outALUControl(),
        .funct7(),
        .funct3(),
        .ALUOp()
    );



    DataMemory dataMem(
        .readData(),
        .address(),
        .writeData(),
        .clock(),
        .memWrite(),
        .memRead(),
        .reset()
    );

    ImmediateGenerator immGen(
        .outImmediate(),
        .immediate()
    );



    mux_2to1_32bit mux32(
        .out(),
        .input1(),
        .input2(),
        .selector()
    );

    mux_2to1_32bit mux32And(
        .PCNext(),
        .addPC(),
        .addPCShift(),
        .zero(),
        .branch()
    );

    PCAddeShift pcAdderShift(
        .PCAddShift(),
        .PC(),
        .immediate()
    );

    RegisterMemory registerMem(
        .outRS1(),
        .outRS2(),
        .registerArray(),
        .rs1(),
        .rs2(),
        .rsWrite(),
        .dataWrite(),
        .rWrite(),
        .clk()
    );

endmodule : Controller