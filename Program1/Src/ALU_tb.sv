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

module ALU_tb();

// Inputs
  logic [ 3:0] ROperand;
  logic [ 2:0] IOperand;
  logic [ 7:0] ReadA;
  logic [ 7:0] ReadB;
  logic [ 4:0] Immediate;
  logic 			OpType;

// Outputs
  wire [ 7:0] Output;
  logic       Zero;
  wire        Equal;

	// Instantiate the Unit Under Test (UUT)
  ALU #(8) uut (
		.ROperand(ROperand),
		.IOperand(IOperand),
		.ReadA(ReadA), 
		.ReadB(ReadB),
		.OpType(OpType),
		.Immediate(Immediate), 
		.Output(Output), 
		.Zero(Zero), 
		.Equal(Equal)
	);

initial begin
// Wait 100 ns for global reset to finish
  #100ns;
        
// Add stimulus here
  ReadA = 8'b0000_0100;
  ReadB = 8'b0000_0100;
  
  // ADD Test:
  #20ns;
  OpType    = 0;
  #20ns;
  ROperand  = ADD;
  #1ns;
  if (Output == 8'b0000_1000) begin
    $display("PASSED ADD Test: {Expected: 8, Received: %d}", Output);
  end

  // SUB Test:
  #20ns;
  ROperand  = SUB;
  #1ns;
  if (Output == 8'b0000_0000) begin
    $display("PASSED SUB Test: {Expected: 0, Received = %d}", Output);
  end

  // AND Test:
  #20ns;
  ROperand  = AND;
  #1ns;
  if (Output == 8'b0000_0100) begin
	 $display("PASSED AND Test: {Expected: 4, Received: %d}", Output);
  end

  // OR Test:
  #20ns;
  ROperand  = OR;
  #1ns;
  if (Output == 8'b0000_0100) begin
    $display("PASSED OR Test: {Expected: 4, Received: %d}", Output);
  end

  // STR Test:
  #20ns;
  ROperand  = STR;
  #1ns;
  if (Output == 8'b0000_0100) begin
    $display("PASSED STR Test: {Expected: 4, Received: %d}", Output);
  end

  // LOAD Test:
  #20ns;
  ROperand  = LOAD;
  #1ns;
  if (Output == 8'b0000_0100) begin
    $display("PASSED LOAD Test: {Expected: 4, Received: %d}", Output);
  end

  // SLT Test:
  #20ns;
  ReadB     = 8'b0000_0011;
  ROperand  = SLT;
  #1ns;
  if (Output == 8'b0000_0000) begin
    $display("PASSED SLT Test: {Expected: 0, Received: %d}", Output);
  end

  // XORR Test:
  #20ns;
  ROperand  = XORR;
  #1ns;
  if (Output == 8'b0000_0000) begin
    $display("PASSED XORR Test: {Expected: 0, Received: %d}", Output);
  end

  // XOR Test:
  #20ns;
  ROperand  = XOR;
  #1ns;
  if (Output == 8'b0000_0111) begin
    $display("PASSED XOR Test: {Expected: 7, Received: %d}", Output);
  end

  // SEQ Test:
  #20ns;
  ReadA     = 8'b0000_0011;
  ROperand  = SEQ;
  #1ns;
  if (Output == 8'b0000_0001) begin
    $display("PASSED SEQ Test: {Expected: 1, Received: %d}", Output);
  end

  // BTRU Test:
  #20ns;
  ReadA     = 8'b0000_0001;
  ROperand  = BTRU;
  #1ns;
  if (Output == 8'b0000_0001) begin
    $display("PASSED BTRU Test: {Expected: 1, Received: %d}", Output);
  end

  // NOT Test:
  #20ns;
  ROperand  = NOT;
  #1ns;
  if (Output == 8'b1111_1110) begin
    $display("PASSED NOT Test: {Expected: 254, Received: %d}", Output);
  end

  // ADDI Test:
  #20ns;
  OpType    = 1;
  #1ns;
  ReadA     = 8'b0000_0001;
  Immediate = 5;
  IOperand  = ADDI;
  #1ns;
  if (Output == 8'b0000_0110) begin
    $display("PASSED ADDI Test: {Expected: 6, Received: %d}", Output);
  end

  // SUBI Test:
  #20ns;
  ReadA     = 8'b0000_0111;
  Immediate = 1;
  IOperand  = SUBI;
  #1ns;
  if (Output == 8'b0000_0110) begin
    $display("PASSED SUBI Test: {Expected: 6, Received: %d}", Output);
  end

  // LSLI Test:
  #20ns;
  ReadA     = 8'b0000_0100;
  Immediate = 2;
  IOperand  = LSLI;
  #1ns;
  if (Output == 8'b0001_0000) begin
    $display("PASSED LSLI Test: {Expected: 16, Received: %d}", Output);
  end

  // LSRI Test:
  #20ns;
  ReadA     = 8'b0000_0100;
  Immediate = 2;
  IOperand  = LSRI;
  #1ns;
  if (Output == 8'b0000_0001) begin
    $display("PASSED LSRI Test: {Expected: 1, Received: %d}", Output);
  end

  // LUT Test:
  #20ns;
  Immediate = 10;
  IOperand  = LUT;
  #1ns;
  if (Output == 8'b0000_1010) begin
    $display("PASSED LUT Test: {Expected: 10, Received: %d}", Output);
  end

  // B Test:
  #20ns;
  Immediate = 1;
  IOperand  = B;
  #1ns;
  if (Output == 8'b0000_0001) begin
    $display("PASSED B Test: {Expected: 1, Received: %d}", Output);
  end
end

endmodule

