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
`include "DataMemory.v"
`include "ImmediateGenerator.v"
`include "InstructionMemory.v"
`include "MUX32_2_1.v"
`include "MUX32_2_1_and.v"
`include "PCAdder.v"
`include "PCAdderShift.v"
`include "ProgramCounter.v"
`include "RegisterMemory.v"

module Datapath(
    registerArray1,
    registerArray2,
    registerArray3,
    registerArray4,
    registerArray5,
    registerArray6,
    registerArray7,
    registerArray8,
    registerArray9,
    registerArray10,
    registerArray11,
    registerArray12,
    registerArray13,
    registerArray14,
    registerArray15,
    registerArray16,
    registerArray17,
    registerArray18,
    registerArray19,
    registerArray20,
    registerArray21,
    registerArray22,
    registerArray23,
    registerArray24,
    registerArray25,
    registerArray26,
    registerArray27,
    registerArray28,
    registerArray29,
    registerArray30,
    registerArray31,
    registerArray32,
    clock,
    reset
);

    output wire [31:0] registerArray1;
    output wire[31:0] registerArray2;
    output wire[31:0] registerArray3;
    output wire[31:0] registerArray4;
    output wire[31:0] registerArray5;
    output wire[31:0] registerArray6;
    output wire[31:0] registerArray7;
    output wire[31:0] registerArray8;
    output wire[31:0] registerArray9;
    output wire[31:0] registerArray10;
    output wire[31:0] registerArray11;
    output wire[31:0] registerArray12;
    output wire[31:0] registerArray13;
    output wire[31:0] registerArray14;
    output wire[31:0] registerArray15;
    output wire[31:0] registerArray16;
    output wire[31:0] registerArray17;
    output wire[31:0] registerArray18;
    output wire[31:0] registerArray19;
    output wire[31:0] registerArray20;
    output wire[31:0] registerArray21;
    output wire[31:0] registerArray22;
    output wire[31:0] registerArray23;
    output wire[31:0] registerArray24;
    output wire[31:0] registerArray25;
    output wire[31:0] registerArray26;
    output wire[31:0] registerArray27;
    output wire[31:0] registerArray28;
    output wire[31:0] registerArray29;
    output wire[31:0] registerArray30;
    output wire[31:0] registerArray31;
    output wire[31:0] registerArray32;

    input reset, clock;

    // Wires
    wire[31:0] PC, writeData, data1, data2, soma, PCNext, instruction, ALUout, immediate, auxiliarData, PCshift, readData;
    wire branch, memRead, memtoReg, memWrite, ALUSrc, zero, regWrite; // Control
    wire[1:0] ALUOp; // Control
    wire[3:0] ALUCrt;

    // Modules
    ProgramCounter programCounter(
        .outPCNext(PCNext),
        .PCNext(PC),
        .reset(reset),
        .clock(clock)
    );

    PCAdder pcAdd(
        .outPCAdder(PC),
        .PC(PCNext)
    );

    InstructionMemory instructionMem(
        .out(instruction),
        .PC(PCNext),
        .reset(reset)
    );

    Controller control(
        .ALUOp(ALUOp),
        .branch(branch),
        .regWrite(regWrite),
        .memoryToRegister(memtoReg),
        .ALUSrc(ALUSrc),
        .memoryRead(memRead),
        .memoryWrite(memWrite),
        .opcode(instruction[6:0])
    );

    ImmediateGenerator immGen(
        .outImmediate(immediate),
        .immediate(instruction)
    );

    ALUControl aluCrt(
        .outALUControl(ALUCrt),
        .funct7(instruction[31:25]),
        .funct3(instruction[15:12]),
        .ALUOp(ALUOp)
    );

    RegisterMemory registerMem(
        .outRS1(data1),
        .outRS2(data2),
         .registerArray1(registerArray1),
        .registerArray2(registerArray2),
        .registerArray3(registerArray3),
        .registerArray4(registerArray4),
        .registerArray5(registerArray5),
        .registerArray6(registerArray6),
        .registerArray7(registerArray7),
        .registerArray8(registerArray8),
        .registerArray9(registerArray9),
        .registerArray10(registerArray10),
        .registerArray11(registerArray11),
        .registerArray12(registerArray12),
        .registerArray13(registerArray13),
        .registerArray14(registerArray14),
        .registerArray15(registerArray15),
        .registerArray16(registerArray16),
        .registerArray17(registerArray17),
        .registerArray18(registerArray18),
        .registerArray19(registerArray19),
        .registerArray20(registerArray20),
        .registerArray21(registerArray21),
        .registerArray22(registerArray22),
        .registerArray23(registerArray23),
        .registerArray24(registerArray24),
        .registerArray25(registerArray25),
        .registerArray26(registerArray26),
        .registerArray27(registerArray27),
        .registerArray28(registerArray28),
        .registerArray29(registerArray29),
        .registerArray30(registerArray30),
        .registerArray31(registerArray31),
        .registerArray32(registerArray32),
        .rs1(instruction[19:15]),
        .rs2(instruction[24:20]),
        .rsWrite(instruction[11:7]),
        .dataWrite(writeData),
        .rWrite(regWrite),
        .clk(clock),
        .reset(reset)
    );

    MUX_32_2_1 mux1(
        .out(auxiliarData),
        .input1(data2),
        .input2(immediate),
        .selector(ALUSrc)
    );

    ALU alu(
        .ALUOut(ALUout),
        .zero(zero),
        .ALUControl(ALUCrt),
        .input1(data1),
        .input2(auxiliarData)
    );

    PCAddeShift pcAdderShift(
        .PCAddShift(PCshift),
        .PC(PCNext),
        .immediate(immediate)
    );

    MUX32_2_1_and mux32And(
        .PCNext(PCNext),
        .addPC(PC),
        .addPCShift(PCshift),
        .zero(zero),
        .branch(branch)
    );

    DataMemory dataMem(
        .readData(readData),
        .address(ALUout),
        .writeData(writeData),
        .clock(clock),
        .memWrite(memRead),
        .memRead(memWrite),
        .reset(reset)
    );

    MUX_32_2_1 mux2(
        .out(writeData),
        .input1(readData),
        .input2(ALUout),
        .selector(memtoReg)
    );



endmodule