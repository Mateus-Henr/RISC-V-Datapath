module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData, reset);

    input[31:0] Address;
    input[31:0] WriteData;
    input reset;
    input Clk;
    input MemWrite;
    input MemRead;

    output reg[31:0] ReadData;

    reg[31:0] DataArray[34:0];

    always @(reset) begin
        if (reset == 1) begin
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
    always @(posedge Clk)
        begin
            if (MemWrite)
                begin
                    dataArray[Address>>2] <= WriteData;
                end
            else
                begin

                end
        end

    always @(Address or MemRead)
        begin
            if (MemRead == 1)
                begin

                end
            else begin

            end
        end


endmodule