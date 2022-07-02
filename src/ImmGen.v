module ImmGen(out, in);
    input[15:0] in;
    output[31:0] out;

    always @(*)
        begin
            out <= in+32'b0;
        end

endmodule : ImmGen