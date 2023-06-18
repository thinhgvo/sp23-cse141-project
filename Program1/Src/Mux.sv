/*
    Author: Thinh Vo, Duy Nguyen
    Course: CSE141L
    Professor: John Eldon
    Note: This code is based on the source code provided by professor Eldon.
    Multiplexer component
*/
module multiplexer #(parameter INPUTS = 8, DATA_WIDTH = 8) (
  input logic [DATA_WIDTH-1:0] data_in [INPUTS-1:0],
  input logic [$clog2(INPUTS)-1:0] select,
  output logic [DATA_WIDTH-1:0] data_out
);

  always_comb begin
    data_out = data_in[0];
    for (int i = 0; i < INPUTS; i++) begin
      if (select == i) begin
        data_out = data_in[i];
      end
    end
  end

endmodule