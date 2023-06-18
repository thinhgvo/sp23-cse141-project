/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Control Unit component
*/

import Operations::*;

module Control (
    input        [4:0] Operand,
    output logic [1:0] ALU_Src,
    output logic       Mem_to_Reg,
    output logic       Branch,
    output logic       Mem_Write,
    output logic       Halt
    );
    
    always_comb begin
        Branch     = 0;
        Mem_to_Reg = 0;
        Mem_Write  = 0;
        ALU_Src    = 0;
        Halt       = 0;
        case (Operand)
            ADD  : ALU_Src    = 1;
            ADDI : ALU_Src    = 1;
            SUB  : ALU_Src    = 1;
            SUBI : ALU_Src    = 1;
            LSRI : ALU_Src    = 1;
            LSLI : ALU_Src    = 1;
            XOR  : ALU_Src    = 1;
            AND  : ALU_Src    = 1;
            OR   : ALU_Src    = 1;
//            MVTO : ALU_Src    = 1;
//            MVFR : ALU_Src    = 1;
            SLT  : ALU_Src    = 1;
            SEQ  : ALU_Src    = 1;
            LOAD : Mem_to_Reg = 1;
            STR  : Mem_Write  = 1;
            B    : Branch     = 1;
            BTRU : Branch     = 1;
            HALT : Halt       = 1;
        endcase
    end

endmodule