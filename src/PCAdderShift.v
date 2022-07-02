module PCAdder(PC, immGen, PCAddshift);

    input[31:0] PC, immGen;

    output reg[31:0] PCAddshift;

    always @(PC)
        begin
            PCAddshift <= PC+immGen;
        end

endmodule