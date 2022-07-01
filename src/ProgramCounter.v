module ProgramCounter(PCNext, PC, reset, clock);
    input[31:0] PCNext;
    input reset, clock;
    output reg[31:0] PC;

    always @(posedge clock)
        begin
            if (reset)
                begin
                    PC <= 32'b0;
                end
            else
                begin
                    PC <= PCNext;
                end
        end

endmodule