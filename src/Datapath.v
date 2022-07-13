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

module Datapath(
    instruction,
    clock,
    reset
);

    output wire[31:0] instruction;
    output wire[31:0] ALUrResp;
    output wire[31:0] ALUoperator;
    input reset, clock;

    // Wires
    wire[31:0] PCpsadd, writeData, data1, data2, soma, PCNext, ALUout, immediate, auxiliarData, PCshift, readData, immediateSH;
    wire branch, memRead, memtoReg, memWrite, ALUSrc, zero, regWrite; // Control
    wire[1:0] ALUOp; // Control
    wire[3:0] ALUCrt;
    wire[31:0] PC;

    // Modules
    ProgramCounter programCounter(
        .outPCNext(PCNext),
        .PCNext(PC),
        .reset(reset),
        .clock(clock)
    );

    PCAdder pcAdd(
        .outPCAdder(PCpsadd),
        .PC(PCNext)
    );

    InstructionMemory instructionMem(
        .out(instruction),
        .PC(PCNext),
        .reset(reset),
        .clock(clock)
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
        .funct3(instruction[14:12]),
        .ALUOp(ALUOp)
    );

    RegisterMemory registerMem(
        .outRS1(data1),
        .outRS2(data2),
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

    Shifter sht(
        .shiftImmediate(immediateSH),
        .immediate(immediate)
    );

    PCAddeShift pcAdderShift(
        .PCAddShift(PCshift),
        .PC(PCNext),
        .immediate(immediateSH)
    );

    MUX32_2_1_and mux32And(
        .PCNext(PC),
        .addPC(PCNext),
        .addPCShift(PCshift),
        .zero(zero),
        .branch(branch)
    );
//----------------------------------
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