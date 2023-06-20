/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Data Memory component
*/

module DataMem #(parameter W=8, byte_count=256) (
    input               clk,
                        reset,
                        WriteEn,
                        Mem_to_Reg,
    input   [W-1:0]     DataAddress,
                        DataIn,
                        ALUResult,
    output logic[W-1:0] DataOut
    );
    
    logic [W-1:0] Core[byte_count-1:0];
	 
    always_comb begin
        if(Mem_to_Reg)
            DataOut = Core[DataAddress];
        else
            DataOut = ALUResult;
    end

    always @(posedge clk) begin
		  if(WriteEn)
            Core[DataAddress] <= DataIn;
    end
endmodule