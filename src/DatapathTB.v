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

module DatapathTB();

    wire[31:0] registerArray1;
    wire[31:0] registerArray2;
    wire[31:0] registerArray3;
    wire[31:0] registerArray4;
    wire[31:0] registerArray5;
    wire[31:0] registerArray6;
    wire[31:0] registerArray7;
    wire[31:0] registerArray8;
    wire[31:0] registerArray9;
    wire[31:0] registerArray10;
    wire[31:0] registerArray11;
    wire[31:0] registerArray12;
    wire[31:0] registerArray13;
    wire[31:0] registerArray14;
    wire[31:0] registerArray15;
    wire[31:0] registerArray16;
    wire[31:0] registerArray17;
    wire[31:0] registerArray18;
    wire[31:0] registerArray19;
    wire[31:0] registerArray20;
    wire[31:0] registerArray21;
    wire[31:0] registerArray22;
    wire[31:0] registerArray23;
    wire[31:0] registerArray24;
    wire[31:0] registerArray25;
    wire[31:0] registerArray26;
    wire[31:0] registerArray27;
    wire[31:0] registerArray28;
    wire[31:0] registerArray29;
    wire[31:0] registerArray30;
    wire[31:0] registerArray31;
    wire[31:0] registerArray32;
    wire[31:0] line;

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
        line,
        clock,
        reset
    );

    initial
        begin
            clock = 1'b0;
            reset = 1'b0;
            #1000 $finish;
        end

    initial
        begin
            forever #20 clock = ~clock;
        end

    initial
        begin
            $monitor({"Register         Decimal               Binary\n",
                        "0                %03d                   %b\n",
                        "1                %03d                   %b\n",
                        "2                %03d                   %b\n",
                        "3                %03d                   %b\n",
                        "4                %03d                   %b\n",
                        "5                %03d                   %b\n",
                        "6                %03d                   %b\n",
                        "7                %03d                   %b\n",
                        "8                %03d                   %b\n",
                        "9                %03d                   %b\n",
                        "10               %03d                   %b\n",
                        "11               %03d                   %b\n",
                        "12               %03d                   %b\n",
                        "13               %03d                   %b\n",
                        "14               %03d                   %b\n",
                        "15               %03d                   %b\n",
                        "16               %03d                   %b\n",
                        "17               %03d                   %b\n",
                        "18               %03d                   %b\n",
                        "19               %03d                   %b\n",
                        "20               %03d                   %b\n",
                        "21               %03d                   %b\n",
                        "22               %03d                   %b\n",
                        "23               %03d                   %b\n",
                        "24               %03d                   %b\n",
                        "25               %03d                   %b\n",
                        "26               %03d                   %b\n",
                        "27               %03d                   %b\n",
                        "28               %03d                   %b\n",
                        "29               %03d                   %b\n",
                        "30               %03d                   %b\n",
                        "31               %03d                   %b\n",
                        "clock = %d\nLINE = %d\n"},
                registerArray1, registerArray1,
                registerArray2, registerArray2,
                registerArray3, registerArray3,
                registerArray4, registerArray4,
                registerArray5, registerArray5,
                registerArray6, registerArray6,
                registerArray7, registerArray7,
                registerArray8, registerArray8,
                registerArray9, registerArray9,
                registerArray10, registerArray10,
                registerArray11, registerArray11,
                registerArray12, registerArray12,
                registerArray13, registerArray13,
                registerArray14, registerArray14,
                registerArray15, registerArray15,
                registerArray16, registerArray16,
                registerArray17, registerArray17,
                registerArray18, registerArray18,
                registerArray19, registerArray19,
                registerArray20, registerArray20,
                registerArray21, registerArray21,
                registerArray22, registerArray22,
                registerArray23, registerArray23,
                registerArray24, registerArray24,
                registerArray25, registerArray25,
                registerArray26, registerArray26,
                registerArray27, registerArray27,
                registerArray28, registerArray28,
                registerArray29, registerArray29,
                registerArray30, registerArray30,
                registerArray31, registerArray31,
                registerArray32, registerArray32,
                clock, line);

            $dumpfile("datapath.vcd");
            $dumpvars(0, DatapathTB);
        end

endmodule
