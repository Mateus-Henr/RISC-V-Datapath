module mux_2to1_32bit(out, inA, inB, sel);

    input[31:0] inA;
    input[31:0] inB;
    input sel;

    output[31:0] out;

    reg[31:0] out;

    always @(inA, inB, sel)
        begin
            if (sel == 0)
                begin
                    out <= inA;
                end
            else
                begin
                    out <= inB;
                end
        end

endmodule