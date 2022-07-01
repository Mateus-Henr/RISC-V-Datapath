// -------------------------------------------------------------------
// @author Mateus
// @copyright (C) 2022, <COMPANY>
//
// Created : 01. Jul 2022 13:20
//-------------------------------------------------------------------
module instruction_memory(pc, instr1, instr2, instr3, instr4, instr5);
    input[31:0] pc;
    output reg[6:0] instr1;
    output reg[3:0] instr2, instr3, instr4;
    output reg[31:0] instr5;

    wire instr1 = pc[0:6];
    wire instr2 = pc[19:15];
    wire instr3 = pc[24:20];
    wire instr4 = pc[11:7];
    wire instr5 = pc;

endmodule : instruction_memory