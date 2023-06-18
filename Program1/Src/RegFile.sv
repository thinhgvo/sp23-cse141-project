/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Register File component
*/

module reg_f #(parameter W = 8, D = 4) (
    input           clk,
                    reset,
                    ALU_Src,
                    RegWrite,
                    LUT_Src,
    input   [D-1:0] raddr,
    input   [W-1:0] writeValue,
                    Target,
    output  [W-1:0] IsnsOperand,
                    ReadA,
                    ReadB
    );
    
    logic [W-1:0] registers[2**D];

    assign IsnsOperand = registers[raddr];
    assign ReadA       = registers[0];
    assign ReadB       = registers[1];

    always_ff @(posedge clk) begin
        if(reset == 1)
            for(int i = 0; i < 2**D; i++)
                registers[i] <= 0;
        else if(RegWrite == 1) registers[raddr] <= ReadA;
        else if(ALU_Src  == 1) registers[0]     <= writeValue;
        else if(LUT_Src  == 1) registers[0]     <= Target;
    end

endmodule