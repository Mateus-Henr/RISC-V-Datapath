// -------------------------------------------------------------------
// @author Mateus
// @copyright (C) 2022, <COMPANY>
//
// Created : 01. Jul 2022 13:31
//-------------------------------------------------------------------
module alu(out, carry_out, inp1, inp2, sel);
    input[11:0] inp1, inp2;
    input[3:0] sel;
    output reg[11:0] out;
    output reg carry_out;

    always_comb
        begin
            case (sel)
                4'b0000: out = inp1 & inp2;
                4'b0001: out = inp1 | inp2;
                4'b00110: out = inp1+inp2;
                4'b0110: out = inp1-inp2;
                default: out = inp1+inp2;
            endcase
        end

endmodule : alu
