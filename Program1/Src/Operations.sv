/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Package that defines the operations that can be performed in the ALU
*/

package Operations;

    // R-Type:
    const logic [3:0] AND  = 5'b0_0000;
    const logic [3:0] OR   = 5'b0_0001;
    const logic [3:0] NOT  = 5'b0_0010;
    const logic [3:0] ADD  = 5'b0_0011;
    const logic [3:0] SUB  = 5'b0_0100;
    const logic [3:0] LOAD = 5'b0_0101;
    const logic [3:0] STR  = 5'b0_0110;
    const logic [3:0] SLT  = 5'b0_0111;
    const logic [3:0] SEQ  = 5'b0_1000;
    const logic [3:0] BTRU = 5'b0_1001;
    const logic [4:0] MVTO = 5'b0_1010;
    // const logic [4:0] MVFR = 5'b0_1011;
    const logic [3:0] XOR  = 5'b0_1100;
    const logic [4:0] XORR = 5'b0_1101;

    // I-Type:
    const logic [2:0] ADDI  = 4'b1_000;
    const logic [2:0] SUBI  = 4'b1_001;
    const logic [2:0] B     = 4'b1_010;
    const logic [2:0] LSRI  = 4'b1_011;
    const logic [2:0] LSLI  = 4'b1_100;
    const logic [2:0] LUT   = 4'b1_101;
    const logic [8:0] HALT  = 9'b1_1111_1111;

endpackage // operations