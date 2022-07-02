module mux_2to1_32bit(out, input1, input2, zero, branch, selector);

    input[31:0] input1, input2;
    input zero, branch;

    output[31:0] out;

    reg[31:0] out;
    reg selector;

    always @(input1, input2, inC, selector)
        begin
            selector <= zero | branch;
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