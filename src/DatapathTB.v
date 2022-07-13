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

    wire[31:0] line;

    reg clock, reset;

    Datapath datapath(
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
                datapath.registerMem.registerArray[1], datapath.registerMem.registerArray[1],
                datapath.registerMem.registerArray[2], datapath.registerMem.registerArray[2],
                datapath.registerMem.registerArray[3], datapath.registerMem.registerArray[3],
                datapath.registerMem.registerArray[4], datapath.registerMem.registerArray[4],
                datapath.registerMem.registerArray[5], datapath.registerMem.registerArray[5],
                datapath.registerMem.registerArray[6], datapath.registerMem.registerArray[6],
                datapath.registerMem.registerArray[7], datapath.registerMem.registerArray[7],
                datapath.registerMem.registerArray[8], datapath.registerMem.registerArray[8],
                datapath.registerMem.registerArray[9], datapath.registerMem.registerArray[9],
                datapath.registerMem.registerArray[10], datapath.registerMem.registerArray[10],
                datapath.registerMem.registerArray[11], datapath.registerMem.registerArray[11],
                datapath.registerMem.registerArray[12], datapath.registerMem.registerArray[12],
                datapath.registerMem.registerArray[13], datapath.registerMem.registerArray[13],
                datapath.registerMem.registerArray[14], datapath.registerMem.registerArray[14],
                datapath.registerMem.registerArray[15], datapath.registerMem.registerArray[15],
                datapath.registerMem.registerArray[16], datapath.registerMem.registerArray[16],
                datapath.registerMem.registerArray[17], datapath.registerMem.registerArray[17],
                datapath.registerMem.registerArray[18], datapath.registerMem.registerArray[18],
                datapath.registerMem.registerArray[19], datapath.registerMem.registerArray[19],
                datapath.registerMem.registerArray[20], datapath.registerMem.registerArray[20],
                datapath.registerMem.registerArray[21], datapath.registerMem.registerArray[21],
                datapath.registerMem.registerArray[22], datapath.registerMem.registerArray[22],
                datapath.registerMem.registerArray[23], datapath.registerMem.registerArray[23],
                datapath.registerMem.registerArray[24], datapath.registerMem.registerArray[24],
                datapath.registerMem.registerArray[25], datapath.registerMem.registerArray[25],
                datapath.registerMem.registerArray[26], datapath.registerMem.registerArray[26],
                datapath.registerMem.registerArray[27], datapath.registerMem.registerArray[27],
                datapath.registerMem.registerArray[28], datapath.registerMem.registerArray[28],
                datapath.registerMem.registerArray[29], datapath.registerMem.registerArray[29],
                datapath.registerMem.registerArray[30], datapath.registerMem.registerArray[30],
                datapath.registerMem.registerArray[31], datapath.registerMem.registerArray[31],
                datapath.registerMem.registerArray[32], datapath.registerMem.registerArray[32],
                clock, line);

            $dumpfile("datapath.vcd");
            $dumpvars(0, DatapathTB);
        end

endmodule
