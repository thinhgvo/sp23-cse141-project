// Test bench
// Program Counter (Instruction Fetch)

module ProgCtr_tb;

//timeunit 1ns/1ps;

// Define signals to interface with UUT
// bit Reset;
// bit Start;
// bit Clk;
// bit BranchAbsEn;
// bit BranchRelEn;
// bit ALU_flag;
// bit [9:0] TargetOrOffset;
// logic [9:0] NextInstructionIndex;
bit         Init;
bit         Halt;
bit         Clk;
bit         Branch;
bit [8:0]   Target;
logic [8:0] PC;

// Instatiate and connect the Unit Under Test
IF uut (
  .Init(Init),
  .Halt(Halt),
  .clk(Clk),
  .Branch(Branch),
  .Target(Target),
  .PC(PC)
);

integer ClockCounter = 0;
always @(posedge Clk)
  ClockCounter <= ClockCounter + 1;

// The actual testbench logic
//
// In this testbench, let's look at 'manual clocking'
initial begin
  // Time 0 values
  $display("Initialize Testbench.");
  Init = '1;
  Halt = '0;
  Clk = '0;
  Branch = '0;
  Target = 'd0;

  // Advance to simulation time 1, latch values
  #1 Clk = '1;

  // Advance to simulation time 2, check results, prepare next values
  #1 Clk = '0;
  $display("Checking Reset behavior");
  assert (PC == 'd0);
  Init = '0;

  // Advance to simulation time 3, latch values
  #1 Clk = '1;

  // Advance to simulation time 4, check results, prepare next values
  #1 Clk = '0;
  $display("Checking that nothing happens before Start");
  assert (PC == 'd0);

  // Advance to simulation time 5, latch values
  #1 Clk = '1;

  // Advance to simulation time 6, check results, prepare next values
  #1 Clk = '0;
  $display("Checking that nothing happened during Start");
  assert (PC == 'd0);
  Branch = 1;
  Target = 'd10;

  // Advance to simulation time 7, latch values
  #1 Clk = '1;

  // Advance to simulation time 8, check outputs, prepare next values
  #1 Clk = '0;
  $display("Checking that first Start went to first program");
  assert (PC == 'd000);
  // No change in inputs

  // Advance to simulation time 9, latch values
  #1 Clk = '1;

  // Advance to simulation time 10, check outputs, prepare next values
  #1 Clk = '0;
  $display("Checking that no branch advanced by 1");
  assert (PC == 'd001);
  Branch = '1;
  Target = 'd10;

  // Latch, check, setup next test
  #1 Clk = '1;
  #1 Clk = '0;
  $display("Checking that absolute branch went to target");
  assert (PC == 'd10);
  Branch = '0;
  // Branch = '1;
  // Target= 'd5;
  // note, ALU_flag still 0

  // Latch, check, setup next test
  #1 Clk = '1;
  #1 Clk = '0;
  $display("Checking that relative branch with no ALU flag did not jump");
  assert (PC == 'd11);
  // Branch = '0;
  // Branch = '1;
  // Target = 'd5;
  // ALU_flag = '1;

  // Latch, check, setup next test
  #1 Clk = '1;
  #1 Clk = '0;
  $display("Checking that relative branch with ALU flag did jump");
  assert (PC == 'd16);

  $display("All checks passed.");
end

initial begin
  $dumpfile("ProgCtr.vcd");
  $dumpvars();
  $dumplimit(104857600); // 2**20*100 = 100 MB, plenty.
end

endmodule
