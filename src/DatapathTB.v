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
    reg[15:0] A, B;

    reg clock, start;

    wire done;

    Datapath Datapath(gt, lt, eq, dA, ldB, sell, se12, sel_in, data_in, clock);
    Controller controller(ALUOp,
        branch,
        regWrite,
        memoryToRegister,
        ALUSrc,
        memoryRead,
        memoryWrite,
        instruction[24:31]);

    initial
        begin
            clock = 1'b0;
            #3 start = 1'b1;
            #1000 $finish;
        end

    always @(*)
        begin
            clock = -clock;
        end

    initial
        begin
            #12 data_in = 143;
            #10 data_in = 78;
        end

    initial
        begin
            $monitor($time, " %d %b", DP.Aout, done);
            $dumpfile("datafile.vcd");
            $dumpvark(0, DatapathTB);
        end

endmodule: DatapathTB
