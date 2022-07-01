// -------------------------------------------------------------------
// @author Mateus
// @copyright (C) 2022, <COMPANY>
//
// Created : 01. Jul 2022 13:20
//-------------------------------------------------------------------
module RegisterMemory(outRS1, outRS2, rs1, rs2, rsWrite, dataWrite, clk);
    input[4:0] rs1, rs2;
    input[31:0] rsWrite, dataWrite;
    output[31:0] outRS1, outRS2;

    reg[32:0] registerArray[32:0];

    initial begin
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

    always @(posedge clk)
        begin
            if (RegWrite && ReWrite != 32'b0)
                begin
                    registerArray[rsWrite] <= dataWrite;
                end
        end

    assign outRS1 = registerArray[rs1];
    assign outRS2 = registerArray[rs2];

endmodule: RegisterMemory