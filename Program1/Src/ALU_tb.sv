////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:12:37 10/27/2011
// Design Name:   ALU
// Module Name:   /department/home/leporter/Xilinx/lab_basics/ALU_tb.v
// Project Name:  lab_basics
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
import Operations::*;
module ALU_tb;

// Inputs
  logic [ 4:0] Operand;
  logic [ 7:0] ReadA;
  logic [ 7:0] ReadB;

// Outputs
  wire [ 7:0] Output;
  wire        Zero;
  wire        Equal;

	// Instantiate the Unit Under Test (UUT)
  ALU #(8) uut (
		.Operand, 
		.ReadA, 
		.ReadB, 
		.Output, 
		.Zero, 
		.Equal
	);

initial begin
// Wait 100 ns for global reset to finish
  #100ns;
        
// Add stimulus here
  ReadA = 8'h0004;
  ReadB = 8'h0004;
  #20ns  Operand = SUB;
  #20ns	 Operand = AND;
  #20ns	 ReadB = 8'h0003;
  Operand = XOR;
end

endmodule

