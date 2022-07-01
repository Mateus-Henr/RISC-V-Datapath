module PCAdder(PC, PCAdd);
    input[31:0] PC;
    output reg[31:0] PCAdd;

    always @(PC)
        begin
            PCAdd <= PC+4;
        end

endmodule