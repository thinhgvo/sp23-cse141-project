/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Package that defines the operations that can be performed in the ALU
*/

package Operations;

    // R-Type:
    const logic [3:0] AND  = 4'b0000;
    const logic [3:0] OR   = 4'b0001;
    const logic [3:0] NOT  = 4'b0010;
    const logic [3:0] ADD  = 4'b0011;
    const logic [3:0] SUB  = 4'b0100;
    const logic [3:0] LOAD = 4'b0101;
    const logic [3:0] STR  = 4'b0110;
    const logic [3:0] SLT  = 4'b0111;
    const logic [3:0] SEQ  = 4'b1000;
    const logic [3:0] BTRU = 4'b1001;
    const logic [3:0] MVTO = 4'b1010;
    // const logic [4:0] MVFR = 5'b0_1011;
    const logic [3:0] XOR  = 4'b1100;
    const logic [3:0] XORR = 4'b1101;

    // I-Type:
    const logic [2:0] ADDI = 3'b000;
    const logic [2:0] SUBI = 3'b001;
    const logic [2:0] B    = 3'b010;
    const logic [2:0] LSRI = 3'b011;
    const logic [2:0] LSLI = 3'b100;
    const logic [2:0] LUT  = 3'b101;
    const logic [8:0] HALT = 9'b1_1111_1111;

endpackage // operations