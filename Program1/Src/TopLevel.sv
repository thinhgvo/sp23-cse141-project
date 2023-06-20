/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Top Level
*/
module TopLevel #(parameter W=8, byte_count=2**W, D = 4) (
    input         clk,
                  reset,
                  Init,     // "start" testbench to sends inputs
    output logic  done      // "finish" output back to the testbench
    );

    /* Declare all signals */
    
    /* Instr_Rom signals */
    logic [W:0]  	 InstAddress;
    logic [W:0]    InstOutput; 

    /* IF signals */
    logic[W-1:0] Target;
    logic		  Halt, Branch;
    wire [W-1:0] PC;
    
    /* reg_f signals */
    logic 		  ALU_Src, RegWrite, LUT_Src;
    logic[W-1:0] InsnOperand, ReadA, ReadB;
    
    /* Control signals */
    logic 		  Mem_Write, Mem_to_Reg;

    /* ALU signals */
    wire [W-1:0] Output;
    wire 		  Equal;
    logic		  Zero;
    
    /* Data_mem signals */
    logic 		  WriteEn;
    logic[W-1:0] DataOut;
	 
    instr_ROM instr_ROM(.*);
	 
    IF IF(.*);
	 
    reg_f reg_f(
        .raddr(InstOutput[3:0]),
        .writeValue(DataOut),
        .*
    );
	 
    Control control(
        .Insn(InstOutput),
        .*
    );
	 
    ALU alu(
        .Immediate(InstOutput[4:0]),
        .OpType(InstOutput[8]),
        .ROperand(InstOutput[7:4]),
        .IOperand(InstOutput[7:5]),
        .*
    );
	 
    DataMem data_mem(
        .DataAddress(Output),
        .ALUResult(Output),
        .DataIn(ReadA),
        .*
    );
	 
    BLUT blut(
        .index(InstOutput[3:0]),
        .branch_target(Target),
        .*
    );

    logic [ 6:0] count;
//    logic [ 8:0] p;                              // parity bits
//    logic [15:0] temp1, temp2;                   // putput bits (data bits + parity bits)
//    logic        temp1_enh, temp1_enl, temp2_en; 
//
//    assign p[8] = ^temp1[10:4];
//    assign p[4] = (^temp1[10:7])^(^temp1[3:1]);
//    assign p[2] = temp1[10]^temp1[9]^temp1[6]^temp1[5]^temp1[3]^temp1[2]^temp1[0];
//    assign p[1] = temp1[10]^temp1[8]^temp1[6]^temp1[4]^temp1[3]^temp1[1]^temp1[0];
//    assign p[0] = ^{temp1[10:4],p[8],temp1[3:1],p[4],temp1[0],p[2:1]};

    always @(posedge clk)
        if(Init) begin
            count <= 0;
//            temp1 <= 0;
//            temp2 <= 0;
        end else if(!done) begin
            count                     <= count + 1;
//            if(temp1_enh) temp1[15:8] <= DataOut;
//            if(temp1_enl) temp1[ 7:0] <= DataOut;
//            if(temp2_en)  temp2       <= {temp1[10:4],p[8],temp1[3:1],p[4],temp1[0],p[2:0]};
        end
//
//    always_comb begin
//        temp1_enl = 0;
//        temp1_enh = 0;
//        temp2_en  = 0;
//        InstOutput[3:0]     = 0;
//        Output     = 0;
//        WriteEn  = 0;
//        ReadA   = temp2[7:0];
//        case (count[2:0])
//            1 : begin
//                Output     = 2*count[6:3];
//                temp1_enl = 1;
//            end
//            2 : begin
//                InstOutput[3:0]     = 2*count[6:3]+1;
//                temp1_enh = 1;
//            end
//            3 : temp2_en  = 1;
//            4 : begin
//                WriteEn   = 1;
//                Output     = 2*count[6:3]+30;
//                ReadA    = temp2[7:0];
//            end
//            5 : begin
//                WriteEn   = 1;
//                Output     = 2*count[6:3]+31;
//                ReadA    = temp2[15:8];
//            end
//        endcase
//    end

    assign done = &count;
    
endmodule