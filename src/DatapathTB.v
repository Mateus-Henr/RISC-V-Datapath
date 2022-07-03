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

    reg[31:0] registerArray[31:0];
    reg clock, reset;

    Datapath datapath(
        registerArray,
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
            $monitor($time, "Register       Decimal       Binary\n \
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
            $dumpvark(0, datapath);
        end

endmodule
