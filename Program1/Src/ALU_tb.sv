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
  logic [ 3:0] Operand;
  logic [ 7:0] ReadA;
  logic [ 7:0] ReadB;
  logic [ 4:0] Immediate;

// Outputs
  wire [ 7:0] Output;
  wire        Zero;
  wire        Equal;

	// Instantiate the Unit Under Test (UUT)
  ALU #(8) uut (
		.Operand,
		.ReadA, 
		.ReadB,
    .Immediate, 
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
  $display("sub Output = 0? %d", Output);
  #20ns	 Operand = AND;
  $display("and Output = 4? %d", Output);
  #20ns	 ReadB = 8'h0003;
  Operand = XOR;
  $display("xor Output = 7? %d", Output);
end

endmodule

