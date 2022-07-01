// -------------------------------------------------------------------
// @author Matt
// @copyright (C) 2022, <COMPANY>
//
// Created : 01. Jul 2022 11:22
//-------------------------------------------------------------------
module add (out, in1, in2);
    input [15:0] in1, in2;
    output reg [15:0] out;

    always_comb
        out = in1+in2;

endmodule : add