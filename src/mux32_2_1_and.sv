module mux_2to1_32bit(out, inA, inB, zero, branch, sel);

    output[31:0] out;
    input[31:0] inA;
    input[31:0] inB;
    input zero, branch;

    reg[31:0] out;
    reg sel;
    always @(inA, inB, inC, sel)
        begin
            sel <= zero | branch;
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