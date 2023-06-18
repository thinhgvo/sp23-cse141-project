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
    input [W-1:0]       DataAddress,
                        DataIn,
    output logic[W-1:0] DataOut
    );
    
    reg [W-1:0] Core[byte_count-1:0];

    always_ff @(posedge clk) begin
        if(reset) begin
            for(integer i = 0; i < byte_count; i++)
                Core[i] <= 0;
        end else if(WriteEn) begin
            Core[DataAddress] <= DataIn;
        end
    end

    assign DataOut = Core[DataAddress];


endmodule