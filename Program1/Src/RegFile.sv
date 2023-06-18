/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Register File component
*/

module reg_f #(parameter W = 8, D = 3) (
    input          clk,
                   RegWrite,
    input  [D-1:0] SrcA,
                   SrcB,
                   writeReg,
    input  [W-1:0] writeValue,
    output [W-1:0] ReadA,
                   ReadB
    );
    
    logic [W-1:0] registers[2**D];

    assign ReadA = registers[SrcA];
    assign ReadB = registers[SrcB];

    always_ff @(posedge clk) begin
       if(RegWrite && (writeReg != 0)) registers[writeReg] <= writeValue; 
    end

endmodule