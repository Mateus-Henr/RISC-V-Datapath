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
    clock,
    reset
);

    input reset, clock;

    // Wires
    wire[31:0] ALUrResp,
               ALUoperator,
               PC,
               instruction,
               PCpsadd,
               writeData,
               data1,
               data2,
               soma,
               PCNext,
               ALUout,
               immediate,
               auxiliarData,
               PCshift,
               readData;

    wire branch,
         memRead,
         memtoReg,
         memWrite,
         ALUSrc,
         zero,
         rWrite; // Control

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
        .outPCAdder(PCpsadd),
        .outPCNext(PCNext),
        .clock(clock),
        .reset(reset)
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
        .rWrite(rWrite),
        .memoryToRegister(memtoReg),
        .ALUSrc(ALUSrc),
        .memoryRead(memRead),
        .memoryWrite(memWrite),
        .opcode(instruction[6:0]),
        .clock(clock)
    );

    ImmediateGenerator immGen(
        .outImmediate(immediate),
        .immediate(instruction),
        .clock(clock)
    );

    RegisterMemory registerMem(
        .outRS1(data1),
        .outRS2(data2),
        .rs1(instruction[19:15]),
        .rs2(instruction[24:20]),
        .rsWrite(instruction[11:7]),
        .dataWrite(writeData),
        .rWrite(rWrite),
        .clock(clock),
        .reset(reset)
    );

    ALUControl aluCrt(
        .outALUControl(ALUCrt),
        .funct7(instruction[31:25]),
        .funct3(instruction[14:12]),
        .ALUOp(ALUOp),
        .clock(clock)
    );

    MUX_32_2_1_2 mux1(
        .out(auxiliarData),
        .input1(data2),
        .input2(immediate),
        .selector(ALUSrc),
        .clock(clock)
    );

    ALU alu(
        .ALUOut(ALUout),
        .zero(zero),
        .ALUControl(ALUCrt),
        .input1(data1),
        .input2(auxiliarData),
        .clock(clock)
    );

    DataMemory dataMem(
        .readData(readData),
        .position(ALUout),
        .writeData(data2),
        .memWrite(memRead),
        .memRead(memWrite),
        .clock(clock),
        .reset(reset)
    );

    MUX_32_2_1 mux2(
        .out(writeData),
        .input1(readData),
        .input2(ALUout),
        .selector(memtoReg),
        .clock(clock)
    );

    MUX32_2_1_and mux32And(
        .PCNext(PC),
        .addPC(PCpsadd),
        .addPCShift(PCshift),
        .zero(zero),
        .branch(branch),
        .clock(clock)
    );

    PCAdderShift pcAdderShift(
        .PCAddShift(PCshift),
        .outPCNext(PCNext),
        .immediate(immediate),
        .clock(clock),
        .reset(reset)
    );

endmodule