//-------------------------------------------------------
// File Name: RegisterMemory.sv
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
// Kxzeywords:   data, register, storage
//-------------------------------------------------------
// Purpose:    Stores the registers

module RegisterMemory(
    outRS1,
    outRS2,
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
    rs1,
    rs2,
    rsWrite,
    dataWrite,
    rWrite,
    clk,
    reset
);

    output reg[31:0] outRS1;                // Output to the ALU
    output reg[31:0] outRS2;                // Output to the Data write / multiplexer

    output reg[31:0] registerArray1;        // Output to the Datapath
    output reg[31:0] registerArray2;        // Output to the Datapath
    output reg[31:0] registerArray3;        // Output to the Datapath
    output reg[31:0] registerArray4;        // Output to the Datapath
    output reg[31:0] registerArray5;        // Output to the Datapath
    output reg[31:0] registerArray6;        // Output to the Datapath
    output reg[31:0] registerArray7;        // Output to the Datapath
    output reg[31:0] registerArray8;        // Output to the Datapath
    output reg[31:0] registerArray9;        // Output to the Datapath
    output reg[31:0] registerArray10;       // Output to the Datapath
    output reg[31:0] registerArray11;       // Output to the Datapath
    output reg[31:0] registerArray12;       // Output to the Datapath
    output reg[31:0] registerArray13;       // Output to the Datapath
    output reg[31:0] registerArray14;       // Output to the Datapath
    output reg[31:0] registerArray15;       // Output to the Datapath
    output reg[31:0] registerArray16;       // Output to the Datapath
    output reg[31:0] registerArray17;       // Output to the Datapath
    output reg[31:0] registerArray18;       // Output to the Datapath
    output reg[31:0] registerArray19;       // Output to the Datapath
    output reg[31:0] registerArray20;       // Output to the Datapath
    output reg[31:0] registerArray21;       // Output to the Datapath
    output reg[31:0] registerArray22;       // Output to the Datapath
    output reg[31:0] registerArray23;       // Output to the Datapath
    output reg[31:0] registerArray24;       // Output to the Datapath
    output reg[31:0] registerArray25;       // Output to the Datapath
    output reg[31:0] registerArray26;       // Output to the Datapath
    output reg[31:0] registerArray27;       // Output to the Datapath
    output reg[31:0] registerArray28;       // Output to the Datapath
    output reg[31:0] registerArray29;       // Output to the Datapath
    output reg[31:0] registerArray30;       // Output to the Datapath
    output reg[31:0] registerArray31;       // Output to the Datapath
    output reg[31:0] registerArray32;       // Output to the Datapath

    input[4:0] rs1;                         // Read register1 from the instruction
    input[4:0] rs2;                         // Read register2 from the instruction
    input[4:0] rsWrite;                    // Write register form the instruction
    input[31:0] dataWrite;                  // Data write from the multplexer
    input rWrite;                           // Register write signal from the controller
    input reset;                            // Reset signal
    input clk;                              // Clock

    // Set the defalt values of the registers in memory
    initial
        begin
            registerArray[0] <= 32'b0;
            registerArray[1] <= 32'b1;
            registerArray[2] <= 32'b0;
            registerArray[3] <= 32'b0;
            registerArray[4] <= 32'b0;
            registerArray[5] <= 32'b0;
            registerArray[6] <= 32'b0;
            registerArray[7] <= 32'b0;
            registerArray[8] <= 32'b0;
            registerArray[9] <= 32'b0;
            registerArray[10] <= 32'b0;
            registerArray[11] <= 32'b0;
            registerArray[12] <= 32'b0;
            registerArray[13] <= 32'b0;
            registerArray[14] <= 32'b0;
            registerArray[15] <= 32'b0;
            registerArray[16] <= 32'b0;
            registerArray[17] <= 32'b0;
            registerArray[18] <= 32'b0;
            registerArray[19] <= 32'b0;
            registerArray[20] <= 32'b0;
            registerArray[21] <= 32'b0;
            registerArray[22] <= 32'b0;
            registerArray[23] <= 32'b0;
            registerArray[24] <= 32'b0;
            registerArray[25] <= 32'b0;
            registerArray[26] <= 32'b0;
            registerArray[27] <= 32'b0;
            registerArray[28] <= 32'b0;
            registerArray[29] <= 32'b11111100; // 252 in binary
            registerArray[30] <= 32'b0;
            registerArray[31] <= 32'b0;
        end

    // Checks if values are different from 0.
    always @(posedge clk)
        begin
            if (reset)
                begin
                    registerArray[0] <= 32'b0;
                    registerArray[1] <= 32'b1;
                    registerArray[2] <= 32'b0;
                    registerArray[3] <= 32'b0;
                    registerArray[4] <= 32'b0;
                    registerArray[5] <= 32'b0;
                    registerArray[6] <= 32'b0;
                    registerArray[7] <= 32'b0;
                    registerArray[8] <= 32'b0;
                    registerArray[9] <= 32'b0;
                    registerArray[10] <= 32'b0;
                    registerArray[11] <= 32'b0;
                    registerArray[12] <= 32'b0;
                    registerArray[13] <= 32'b0;
                    registerArray[14] <= 32'b0;
                    registerArray[15] <= 32'b0;
                    registerArray[16] <= 32'b0;
                    registerArray[17] <= 32'b0;
                    registerArray[18] <= 32'b0;
                    registerArray[19] <= 32'b0;
                    registerArray[20] <= 32'b0;
                    registerArray[21] <= 32'b0;
                    registerArray[22] <= 32'b0;
                    registerArray[23] <= 32'b0;
                    registerArray[24] <= 32'b0;
                    registerArray[25] <= 32'b0;
                    registerArray[26] <= 32'b0;
                    registerArray[27] <= 32'b0;
                    registerArray[28] <= 32'b0;
                    registerArray[29] <= 32'b11111100; // 252 in binary
                    registerArray[30] <= 32'b0;
                    registerArray[31] <= 32'b0;
                end
            else if (rWrite)
                begin
                    if (rsWrite)
                        begin
                            registerArray[rsWrite] <= dataWrite;
                        end
                end

            outRS1 <= registerArray[rs1];
            outRS2 <= registerArray[rs2];
        end

endmodule