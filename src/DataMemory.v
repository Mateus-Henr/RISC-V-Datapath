//-------------------------------------------------------
// File Name: DataMemory.sv
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
// Keywords:   data, memory, storage
//-------------------------------------------------------
// Purpose:    Stores the data

module DataMemory(
    readData,
    position,
    writeData,
    memWrite,
    memRead,
    clock,
    reset
);

    output reg[31:0] readData;  // Reads data to the multiplexer

    input[31:0] position;        // Address to pick from the ALU
    input[31:0] writeData;      // Out register from the register memory
    input reset;                // Reset signal to reset the memory
    input clock;                // Clock signal
    input memWrite;             // Memory write signal from the Controller
    input memRead;              // Memory read signal from the Controller

    reg[31:0] dataArray[31:0];  // Data memory

    // reset all the memory to the default
    always @(posedge clock)
        begin
            if (reset)
                begin
                    dataArray[0] <=  32'd0;
                    dataArray[1] <=  32'd1;
                    dataArray[2] <=  32'd2;
                    dataArray[3] <=  32'd3;
                    dataArray[4] <=  32'd4;
                    dataArray[5] <=  32'd5;
                    dataArray[6] <=  32'd6;
                    dataArray[7] <=  32'd7;
                    dataArray[8] <=  32'd8;
                    dataArray[9] <=  32'd9;
                    dataArray[10] <=  32'd10;
                    dataArray[11] <=  32'd11;
                    dataArray[12] <=  32'd12;
                    dataArray[13] <=  32'd13;
                    dataArray[14] <=  32'd14;
                    dataArray[15] <=  32'd15;
                    dataArray[16] <=  32'd16;
                    dataArray[17] <=  32'd17;
                    dataArray[18] <=  32'd18;
                    dataArray[19] <=  32'd19;
                    dataArray[20] <=  32'd20;
                    dataArray[21] <=  32'd21;
                    dataArray[22] <=  32'd22;
                    dataArray[23] <=  32'd23;
                    dataArray[24] <=  32'd24;
                    dataArray[25] <=  32'd25;
                    dataArray[26] <=  32'd26;
                    dataArray[27] <=  32'd27;
                    dataArray[28] <=  32'd28;
                    dataArray[29] <=  32'd29;
                    dataArray[30] <=  32'd30;
                    dataArray[31] <=  32'd31;
                end

            else if (memWrite)
                begin
                    dataArray[position] <=  writeData;
                end

            else if (memRead)
                begin
                    readData <=  dataArray[position];
                end
        end

endmodule