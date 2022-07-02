module mux_2to1_32bit(out, input1, input2, selector);

    input[31:0] input1;
    input[31:0] input2;
    input selector;

    output[31:0] out;

    reg[31:0] out;

    always @(input1, input2, selector)
        begin
            if (selector)
                begin
                    out <= input2;
                end
            else
                begin
                    out <= input1;
                end
        end

endmodule