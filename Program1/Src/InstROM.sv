/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Instruction Memory component
*/

module instr_ROM # (parameter D = 11, C = 10) (
    input        [D-1:0] InstAddress, // The machine code that will be read and translate into the instructions for the processor
    output logic [C-1:0] InstOutput  // The instructions that the processor can understand
);

    logic        [C-1:0] core[2**D];
    initial begin
        $readmemb("D:\CSE 141L\Program1\mach_code.txt",core);
    end

    always_comb InstOutput = core[InstAddress];
    
endmodule