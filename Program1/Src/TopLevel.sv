/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Top Level
*/
module TopLevel #(parameter W=8, byte_count=2**W, D = 3) (
    input         clk,
                  reset,
                  Init,     // "start" testbench to sends inputs
    output logic  done      // "finish" output back to the testbench
    );
    logic[W:0] Target;
	 logic		Halt;
	 logic		Branch;
    wire [W:0] PC;

    IF IF(.*);

    logic RegWrite;
    logic [D-1:0] SrcA;
    logic [D-1:0] SrcB;
    logic [D-1:0] writeReg;
    logic [W-1:0] writeValue;
    logic [W-1:0] ReadA;
    logic [W-1:0] ReadB;

    reg_f #(W,D) reg_f(.*);
	 
	 logic [4:0]  Operand;
	 logic [1:0]  ALU_Src;
	 logic		  Mem_to_Reg;
	 logic		  Mem_Write;
	 
	 Control control(.*);
	 
	 logic [W-1:0] Immediate, Output;
	 logic Zero, Equal;
	 
	 ALU #(W) alu(.*);
	 
	 logic WriteEn;

    logic [$clog2(byte_count)-1:0] raddr, waddr;

    logic [W-1:0] DataIn,
                  DataAddress;
    wire  [W-1:0] DataOut;

    DataMem #(W,byte_count) DataMem(.*);


    logic [ 6:0] count;
    logic [ 8:0] p;                              // parity bits
    logic [15:0] temp1, temp2;                   // putput bits (data bits + parity bits)
    logic        temp1_enh, temp1_enl, temp2_en; 

    assign p[8] = ^temp1[10:4];
    assign p[4] = (^temp1[10:7])^(^temp1[3:1]);
    assign p[2] = temp1[10]^temp1[9]^temp1[6]^temp1[5]^temp1[3]^temp1[2]^temp1[0];
    assign p[1] = temp1[10]^temp1[8]^temp1[6]^temp1[4]^temp1[3]^temp1[1]^temp1[0];
    assign p[0] = ^{temp1[10:4],p[8],temp1[3:1],p[4],temp1[0],p[2:1]};

    always @(posedge clk)
        if(Init) begin
            count <= 0;
            temp1 <= 0;
            temp2 <= 0;
        end else begin
            count                     <= count + 1;
            if(temp1_enh) temp1[15:8] <= DataOut;
            if(temp1_enl) temp1[ 7:0] <= DataOut;
            if(temp2_en)  temp2       <= {temp1[10:4],p[8],temp1[3:1],p[4],temp1[0],p[2:0]};
        end

    always_comb begin
        temp1_enl = 0;
        temp1_enh = 0;
        temp2_en  = 0;
        raddr     = 0;
        waddr     = 0;
        WriteEn  = 0;
        DataIn   = temp2[7:0];
        case (count[2:0])
            1 : begin
                raddr     = 2*count[6:3];
                temp1_enl = 1;
            end
            2 : begin
                raddr     = 2*count[6:3]+1;
                temp1_enh = 1;
            end
            3 : temp2_en  = 1;
            4 : begin
                WriteEn   = 1;
                waddr     = 2*count[6:3]+30;
                DataIn    = temp2[7:0];
            end
            5 : begin
                WriteEn   = 1;
                waddr     = 2*count[6:3]+31;
                DataIn    = temp2[15:8];
            end
        endcase
    end

    assign done = &count;
    
endmodule