/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    ALU component
*/
import Operations::*;

module ALU #(parameter W=8) (
    input [W-1:0] ReadA,
                  ReadB,
    input [4:0]   Immediate,
    input [3:0]   ROperand,
	input [2:0]	  IOperand,
	input 		  OpType,
    output logic [W-1:0] Output,
    output logic  Zero,
    output wire   Equal
    );

    assign Equal = (ReadA == ReadB) ? 1 : 0;

    always_comb begin 
		  case (OpType)
           0 : case (ROperand)
                AND  : Output = ReadA & ReadB;
                OR   : Output = ReadA | ReadB;
                ADD  : Output = ReadA + ReadB;
                NOT  : Output = ~ReadA;
                SUB  : Output = ReadA - ReadB;
                STR  : Output = ReadA;
				LOAD : Output = ReadA;
				SLT  : Output = ReadA < ReadB;
				SEQ  : Output = ReadA == ReadB;
                MVTO : Output = ReadA;
                BTRU : Output = (ReadA == 1) ? 1 : 0;
                // MVFR : Output = InputA + InputB;
                XOR  : Output = ReadA ^ ReadB;
                XORR : Output = ^ReadB;
                default: Output = 0;
           endcase
			  1 : case (IOperand)
                ADDI : Output = ReadA + Immediate;
                SUBI : Output = ReadA - Immediate;
                LSRI : Output = ReadA >> Immediate;
                LSLI : Output = ReadA << Immediate;
                B    : Output = (Immediate == 1) ? 1 : 0;
                LUT  : Output = Immediate;
                default: Output = 0;
           endcase
        endcase
        case (Output)
            8'b0 : Zero = 1; 
            default: Zero = 0;
        endcase
        
    end
endmodule