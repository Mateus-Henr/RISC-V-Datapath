module ProgramCounter(PCNext, PC, Reset, Clk);
    input[31:0] PCNext;
    input Reset, Clk;
    output reg[31:0] PC;

    initial begin
        PC <= 32'b0;
    end

    always @(posedge Clk)
        begin
            if (Reset == 1)
                begin
                    PC <= 32'b0;
                end
            else
                begin
                    PC <= PCNext;
                end
        end

endmodule