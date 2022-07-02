//-------------------------------------------------------
// File Name: DatapathTB.v
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
// Purpose:    Used to perform tests

`timescale 1ns/1ps
`include "Datapath.v"

module DatapathTB();

    reg[31:0] instruction;
    reg[31:0] registerArray[31:0];
    reg ALUSrc, memtoReg, regWrite, memRead, memWrite, branch;
    reg[1:0] ALUOp;

    reg clock, start;

    wire done;

    Datapath Datapath(gt,
        lt,
        eq,
        dA,
        ldB,
        sell,
        se12,
        sel_in,
        data_in,
        instruction[24:31],
        clock,
        registerArray);

    Controller controller(ALUOp,
        branch,
        regWrite,
        memoryToRegister,
        ALUSrc,
        memRead,
        memWrite,
        instruction[24:31]);

    initial
        begin
            clock = 1'b0;
            #1000 $finish;
        end

    always @(*)
        begin
            clock = ~clock;
        end

    initial
        begin
            #10 instruction = 00000000000000001000000100110011;
            #10 instruction = 00000000001000001000000010110011;
            #10 instruction = 00000000001000001000000010110011;
            #10 instruction = 01000000001000001000000010110011;
            #10 instruction = 01000000001000001000000010110011;
            #10 instruction = 00000000000100001000000010110011;
            #10 instruction = 00000000000000001010000000100011;
        end

    initial
        begin
            $monitor($time, "Register       Decimal       Binary\n
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b
                            %02d               %02d                   %b",
                registerArray[0],
                registerArray[1],
                registerArray[2],
                registerArray[3],
                registerArray[4],
                registerArray[5],
                registerArray[6],
                registerArray[7],
                registerArray[8],
                registerArray[9],
                registerArray[10],
                registerArray[11],
                registerArray[12],
                registerArray[13],
                registerArray[14],
                registerArray[15],
                registerArray[16],
                registerArray[17],
                registerArray[18],
                registerArray[19],
                registerArray[20],
                registerArray[21],
                registerArray[22],
                registerArray[23],
                registerArray[24],
                registerArray[25],
                registerArray[26],
                registerArray[27],
                registerArray[28],
                registerArray[29],
                registerArray[30],
                registerArray[31]);

            $dumpfile("datafile.vcd");
            $dumpvark(0, DatapathTB);
        end

endmodule: DatapathTB
