//-------------------------------------------------------
// File Name: ImmediateGenerator.v
// Type: module
// Department: Ciencias da computação - UFV-Florestal
// Author: João Victor, Vitor Ribeiro, Mateus Henrique
// Author's Email: joao.andrade1@ufv.br, mateus.h.figueredo@ufv.br, vitor.lacerda@ufv.br
//-------------------------------------------------------
// Release history
// Version Date            Description
// 0.1     01/07/2022      Archive creation
// 0.2     02/07/2022      Version with code
//-------------------------------------------------------
// Keywords:   immediate, generate, generator
//-------------------------------------------------------
// Purpose:    Used to amplify Immediate

module ImmediateGenerator(outImmediate, immediate);

    input[15:0] immediate;
    
    always @(*)
        begin
            if (!immediate[15])
                begin
                    outImmediate <= immediate | 32'b0;
                end
            else
                begin
                    outImmediate <= immediate & 32'b1;
                end
        end

endmodule : ImmediateGenerator