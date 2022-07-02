module Datapath(ALUSrc, memtoReg, regWrite, memRead, memWrite, branch, ALUOp, opcode, clock);

    output ALUSrc, memtoReg, regWrite, memRead, memWrite, branch;
    output[1:0] ALUOp;

    input[6:0] opcode;
    input clock;

    always @(*)
        begin

        end

endmodule : Controller