module ImmGen(numIn, numOut);
    input[15:0] numIn;
    output[31:0] numOut;

    always @(*)
        begin
            numOut <= numIn+32'b0;
        end

endmodule : ImmGen