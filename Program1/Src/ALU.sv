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
                  Immediate,
    input [4:0] Operand,
    output logic [W-1:0] Output,
    output logic Zero,
    output wire Equal
    );

    assign Equal = (ReadA == ReadB) ? 1 : 0;

    always_comb begin 

        case (Operand)
            AND  : Output = ReadA & ReadB;
            OR   : Output = ReadA | ReadB;
            NOT  : Output = ~ReadA | ReadB;
            SUB  : Output = ReadA - ReadB;
            SLT  : Output = (ReadB < ReadA) ? ReadB : (ReadA < ReadB) ? ReadA : 0;
            SEQ  : Output = (ReadA == ReadB) ? ReadA : 0;
            // MVTO : Output = InputA + InputB;
            // MVFR : Output = InputA + InputB;
            XOR  : Output = ReadA ^ ReadB;
            // XORR : Output = InputA + InputB;
            ADDI : Output = ReadA + Immediate;
            SUBI : Output = ReadA - Immediate;
            LSRI : Output = ReadA >> Immediate;
            LSLI : Output = ReadA << Immediate;
            LUT  : Output = Immediate;
            default: Output = 0;
        endcase

        case (Output)
            8'b0 : Zero = 1; 
            default: Zero = 0;
        endcase
        
    end
endmodule