//-------------------------------------------------------
// File Name: DataMemory.v
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

module DataMemory(address, writeData, clock, memWrite, memRead, readData, reset);

    input[31:0] address, writeData;
    input reset, clock, memWrite, memRead;

    output reg[31:0] readData;

    reg[31:0] dataArray[34:0];

    always @(reset)
        begin
            if (reset)
                begin
                    dataArray[0] <= 32'b0;
                    dataArray[1] <= 32'b0;
                    dataArray[2] <= 32'b0;
                    dataArray[3] <= 32'b0;
                    dataArray[4] <= 32'b0;
                    dataArray[5] <= 32'b0;
                    dataArray[6] <= 32'b0;
                    dataArray[7] <= 32'b0;
                    dataArray[8] <= 32'b0;
                    dataArray[9] <= 32'b0;
                    dataArray[10] <= 32'b0;
                    dataArray[11] <= 32'b0;
                    dataArray[12] <= 32'b0;
                    dataArray[13] <= 32'b0;
                    dataArray[14] <= 32'b0;
                    dataArray[15] <= 32'b0;
                    dataArray[16] <= 32'b0;
                    dataArray[17] <= 32'b0;
                    dataArray[18] <= 32'b0;
                    dataArray[19] <= 32'b0;
                    dataArray[20] <= 32'b0;
                    dataArray[21] <= 32'b0;
                    dataArray[22] <= 32'b0;
                    dataArray[23] <= 32'b0;
                    dataArray[24] <= 32'b0;
                    dataArray[25] <= 32'b0;
                    dataArray[26] <= 32'b0;
                    dataArray[27] <= 32'b0;
                    dataArray[28] <= 32'b0;
                    dataArray[29] <= 32'b0;
                    dataArray[30] <= 32'b0;
                    dataArray[31] <= 32'b0;
                end
        end
    always @(posedge clock)
        begin
            if (memWrite)
                begin
                    dataArray[address] <= writeData;
                end
        end

    always @(address or memRead)
        begin
            if (memRead)
                begin
                    memRead <= dataArray[address];
                end
            else
                begin
                    memRead <= 32'b0;
                end
        end

endmodule