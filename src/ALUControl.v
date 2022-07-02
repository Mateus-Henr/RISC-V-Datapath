module ALUControl(outALUControl, funct7, funct3, ALUOp);

    input[6:0] funct7;
    input[3:0] funct3;
    input[1:0] ALUOp;

    output[4:0] outALUControl;

    always @(*)
        case (ALUOp)
            2'b00: // Add (00) for loads and stores.
                begin
                    outALUControl = 4'b0000;
                end
            2'b01: // Subtract and test if zero (01) for beq.
                begin
                    outALUControl = 4'b0110;
                end
            2'b10, 2'b11: // Operation encoded in the funct7 and funct3 fields (10).
                begin
                    if (!ALUOp[0] && !ALUOp[1])
                        begin
                            outALUControl <= 4'b0010;
                        end
                    else if (ALUOp[0])
                        begin
                            outALUControl <= 4'b0110;
                        end
                    else if (ALUOp[1])
                        begin
                            if (!funct7[0] &&
                                !funct7[1] &&
                                    !funct7[2] &&
                                        !funct7[3] &&
                                            !funct7[4] &&
                                                !funct7[5] &&
                                                    !funct7[6] &&
                                                        !funct3[0] &&
                                                            !funct3[1] &&
                                                                !funct3[2])
                                begin
                                    outALUControl <= 4'b0010;
                                end
                            else if (!funct7[0] &&
                                !funct7[1] &&
                                    !funct7[2] &&
                                        !funct7[3] &&
                                            !funct7[4] &&
                                                funct7[5] &&
                                                !funct7[6] &&
                                                    !funct3[0] &&
                                                        !funct3[1] &&
                                                            !funct3[2])
                                begin
                                    outALUControl <= 4'b0110;
                                end
                            else if (!funct7[0] &&
                                !funct7[1] &&
                                    !funct7[2] &&
                                        !funct7[3] &&
                                            !funct7[4] &&
                                                !funct7[5] &&
                                                    !funct7[6] &&
                                                        funct3[0] &&
                                                        funct3[1] &&
                                                        funct3[2])
                                begin
                                    outALUControl <= 4'b0000;
                                end
                            else if (!funct7[0] &&
                                !funct7[1] &&
                                    !funct7[2] &&
                                        !funct7[3] &&
                                            !funct7[4] &&
                                                !funct7[5] &&
                                                    !funct7[6] &&
                                                        !funct3[0] &&
                                                            funct3[1] &&
                                                            funct3[2])
                                begin
                                    outALUControl <= 4'b0001;
                                end
                            else // Invalid.
                                begin
                                    outALUControl <= 4'b0000;
                                end
                        end
                end

        endcase

endmodule : ALUControl