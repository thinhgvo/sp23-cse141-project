/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Branch Look Up Table Level component
*/
module BLUT (
  input logic clk,
  input logic reset,
  input logic [4:0] index,
  input logic [9:0] target_address,
  input logic WriteEn,
  output logic[9:0] branch_target
);

  logic [9:0] blut [31:0];

  logic [9:0] branch_target_reg;

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      branch_target_reg <= 10'b0;
    end else begin
      if (WriteEn) begin
        blut[index] <= target_address;
      end else begin
        branch_target_reg <= blut[index];
      end
    end
  end

  assign branch_target = branch_target_reg;

endmodule
