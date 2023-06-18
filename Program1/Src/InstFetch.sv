/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Counter component
*/

module IF(
    input Branch,
    input [8:0] Target,
    input Init,
    input Halt,
    input clk,
    output logic [8:0] PC
    );

    always @(posedge clk)
        if(Init)
            PC <= 0;
        else if(Halt)
            PC <= PC;
        else if(Branch)
            PC <= Target;
        else
            PC <= PC + 1;

endmodule