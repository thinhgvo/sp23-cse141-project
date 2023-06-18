/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Control Unit component
*/

import Operations::*;

module Control (
    input        [8:0] Insn,
    output logic       ALU_Src,
                       RegWrite,
                       Mem_to_Reg,
                       Branch,
                       LUT_Src,
                       Mem_Write,
                       Halt
    );
    
logic			   OpType;
wire         [3:0] ROperand;
wire		 [2:0] IOperand;

assign OpType   = Insn[8];
assign ROperand = Insn[7:4];
assign IOperand = Insn[7:5];

always_comb begin
    RegWrite   = 0;
    LUT_Src    = 0;
    Branch     = 0;
    Mem_to_Reg = 0;
    Mem_Write  = 0;
    ALU_Src    = 0;
    Halt       = 0;
        case (OpType)
            0 : case (ROperand)
                ADD  : ALU_Src    = 1;
                SUB  : ALU_Src    = 1;
                XOR  : ALU_Src    = 1;
                AND  : ALU_Src    = 1;
                OR   : ALU_Src    = 1;
                MVTO : ALU_Src    = 1;
//               MVFR : ALU_Src    = 1;
                SLT  : ALU_Src    = 1;
                SEQ  : ALU_Src    = 1;
                LOAD : ALU_Src    = 1;
                XORR : ALU_Src    = 1;
                NOT  : ALU_Src    = 1;
                STR  : Mem_Write  = 1;
                BTRU : Branch     = 1;
            endcase
            1 : case (IOperand)
                ADDI : ALU_Src    = 1;
                SUBI : ALU_Src    = 1;
                LSRI : ALU_Src    = 1;
                LSLI : ALU_Src    = 1;
                LUT  : LUT_Src    = 1;
                B    : Branch     = 1;
                HALT : Halt       = 1;
            endcase
        endcase
end
endmodule