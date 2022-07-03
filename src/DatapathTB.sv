//-------------------------------------------------------
// File Name: DatapathTB.sv
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

    reg[31:0] registerArray1;
    reg[31:0] registerArray2;
    reg[31:0] registerArray3;
    reg[31:0] registerArray4;
    reg[31:0] registerArray5;
    reg[31:0] registerArray6;
    reg[31:0] registerArray7;
    reg[31:0] registerArray8;
    reg[31:0] registerArray9;
    reg[31:0] registerArray10;
    reg[31:0] registerArray11;
    reg[31:0] registerArray12;
    reg[31:0] registerArray13;
    reg[31:0] registerArray14;
    reg[31:0] registerArray15;
    reg[31:0] registerArray16;
    reg[31:0] registerArray17;
    reg[31:0] registerArray18;
    reg[31:0] registerArray19;
    reg[31:0] registerArray20;
    reg[31:0] registerArray21;
    reg[31:0] registerArray22;
    reg[31:0] registerArray23;
    reg[31:0] registerArray24;
    reg[31:0] registerArray25;
    reg[31:0] registerArray26;
    reg[31:0] registerArray27;
    reg[31:0] registerArray28;
    reg[31:0] registerArray29;
    reg[31:0] registerArray30;
    reg[31:0] registerArray31;
    reg[31:0] registerArray32;

    reg clock, reset;

    Datapath datapath(
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

    initial
        begin
            clock = 1'b0;
            reset = 1'b0;
            #1000 $finish;
        end

    always @(*)
        begin
            #10 clock = ~clock;
        end

    initial
        begin
            $monitor("  Register       Decimal                Binary\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n \
                        %02d               %02d                   %b\n",
                registerArray1, registerArray1, registerArray1,
                registerArray2, registerArray2, registerArray2,
                registerArray3, registerArray3, registerArray3,
                registerArray4, registerArray4, registerArray4,
                registerArray5, registerArray5, registerArray5,
                registerArray6, registerArray6, registerArray6,
                registerArray7, registerArray7, registerArray7,
                registerArray8, registerArray8, registerArray8,
                registerArray9, registerArray9, registerArray9,
                registerArray10, registerArray10, registerArray10,
                registerArray11, registerArray11, registerArray11,
                registerArray12, registerArray12, registerArray12,
                registerArray13, registerArray13, registerArray13,
                registerArray14, registerArray14, registerArray14,
                registerArray15, registerArray15, registerArray15,
                registerArray16, registerArray16, registerArray16,
                registerArray17, registerArray17, registerArray17,
                registerArray18, registerArray18, registerArray18,
                registerArray19, registerArray19, registerArray19,
                registerArray20, registerArray20, registerArray20,
                registerArray21, registerArray21, registerArray21,
                registerArray22, registerArray22, registerArray22,
                registerArray23, registerArray23, registerArray23,
                registerArray24, registerArray24, registerArray24,
                registerArray25, registerArray25, registerArray25,
                registerArray26, registerArray26, registerArray26,
                registerArray27, registerArray27, registerArray27,
                registerArray28, registerArray28, registerArray28,
                registerArray29, registerArray29, registerArray29,
                registerArray30, registerArray30, registerArray30,
                registerArray31, registerArray31, registerArray31,
                registerArray32, registerArray32, registerArray32);



            $dumpfile("datafile.vcd");
            $dumpvars(0, DatapathTB);
        end

endmodule
