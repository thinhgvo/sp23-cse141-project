/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Counter component
*/

module IF(
    input        [7:0] Target,
    input              Branch,
                       Init,
                       Halt,
                       clk,
    output logic [7:0] PC
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