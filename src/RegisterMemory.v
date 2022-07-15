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
    rs1,
    rs2,
    rsWrite,
    dataWrite,
    rWrite,
    clock,
    reset
);

    output reg[31:0] outRS1;                // Output to the ALU
    output reg[31:0] outRS2;                // Output to the Data write / multiplexer

    reg[31:0] registerArray[31:0];

    input[4:0] rs1;                         // Read register1 from the instruction
    input[4:0] rs2;                         // Read register2 from the instruction
    input[4:0] rsWrite;                    // Write register form the instruction
    input[31:0] dataWrite;                  // Data write from the multplexer
    input rWrite;                           // Register write signal from the controller
    input reset;                            // Reset signal
    input clock;                              // Clock

    initial
        begin
            registerArray[0] = 32'b0;
            registerArray[1] = 32'b0;
            registerArray[2] = 32'b111;
            registerArray[3] = 32'b0;
            registerArray[4] = 32'b0;
            registerArray[5] = 32'b0;
            registerArray[6] = 32'b0;
            registerArray[7] = 32'b0;
            registerArray[8] = 32'b0;
            registerArray[9] = 32'b0;
            registerArray[10] = 32'b0;
            registerArray[11] = 32'b0;
            registerArray[12] = 32'b0;
            registerArray[13] = 32'b0;
            registerArray[14] = 32'b0;
            registerArray[15] = 32'b0;
            registerArray[16] = 32'b0;
            registerArray[17] = 32'b0;
            registerArray[18] = 32'b0;
            registerArray[19] = 32'b0;
            registerArray[20] = 32'b0;
            registerArray[21] = 32'b0;
            registerArray[22] = 32'b0;
            registerArray[23] = 32'b0;
            registerArray[24] = 32'b0;
            registerArray[25] = 32'b0;
            registerArray[26] = 32'b0;
            registerArray[27] = 32'b0;
            registerArray[28] = 32'b0;
            registerArray[29] = 32'b11111100; // 252 in binary
            registerArray[30] = 32'b0;
            registerArray[31] = 32'b0;
        end

    // Checks if values are different from 0.
    always @(posedge clock)
        begin
            if (reset)
                begin
                    registerArray[0] = 32'd1;
                    registerArray[1] = 32'd2;
                    registerArray[2] = 32'd3;
                    registerArray[3] = 32'd4;
                    registerArray[4] = 32'd5;
                    registerArray[5] = 32'd6;
                    registerArray[6] = 32'd7;
                    registerArray[7] = 32'd8;
                    registerArray[8] = 32'd9;
                    registerArray[9] = 32'd10;
                    registerArray[10] = 32'd10;
                    registerArray[11] = 32'd11;
                    registerArray[12] = 32'd12;
                    registerArray[13] = 32'd13;
                    registerArray[14] = 32'd14;
                    registerArray[15] = 32'd15;
                    registerArray[16] = 32'd16;
                    registerArray[17] = 32'd17;
                    registerArray[18] = 32'd18;
                    registerArray[19] = 32'd19;
                    registerArray[20] = 32'd20;
                    registerArray[21] = 32'd21;
                    registerArray[22] = 32'd22;
                    registerArray[23] = 32'd23;
                    registerArray[24] = 32'd24;
                    registerArray[25] = 32'd25;
                    registerArray[26] = 32'd26;
                    registerArray[27] = 32'd27;
                    registerArray[28] = 32'd28;
                    registerArray[29] = 32'd11111100; // 252 in binary
                    registerArray[30] = 32'd30;
                    registerArray[31] = 32'd31;
                end
               else
                   begin
                        outRS1 = registerArray[rs1];
                        outRS2 = registerArray[rs2];

                        if (rWrite == 1'b1 && rsWrite != 1'b0)
                        begin
                            registerArray[rsWrite] = dataWrite;
                        end
                end
        end
endmodule