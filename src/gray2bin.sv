module gray2bin#(
  parameter WIDTH = 4
)(
  input logic [WIDTH - 1 : 0] gray_i,
  output logic [WIDTH - 1 : 0] bin_o
);

generate
  for(genvar i = 0; i < WIDTH; i++) begin
    assign bin_o[i] = ^(gray_i >> i);
  end
endgenerate

endmodule