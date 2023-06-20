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
  input logic  [3:0] index,
  output logic [7:0] branch_target
);

  always_comb begin
	  case(index)
		  4'b0000 : branch_target = 0;
		  default : branch_target = 0;
	  endcase
  end

endmodule
