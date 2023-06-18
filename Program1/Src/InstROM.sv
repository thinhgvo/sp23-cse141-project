/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Instruction Memory component
*/

module instr_ROM # (parameter D = 8, C = 9) (
    input        [D-1:0] InstAddress, // The machine code that will be read and translate into the instructions for the processor
    output logic [C-1:0] InstOutput  // The instructions that the processor can understand
);

    logic        [C-1:0] Core[2**D];
    initial begin
        $readmemb("mach_code.txt",Core);
    end

    always_comb InstOutput = Core[InstAddress];
    
endmodule