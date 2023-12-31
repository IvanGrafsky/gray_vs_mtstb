module bin2gray#(
  parameter WIDTH = 4
)(
  input logic [WIDTH - 1 : 0] bin_i,
  output logic [WIDTH - 1 : 0] gray_o
);

assign gray_o = bin_i ^ (bin_i >> 1);

endmodule

