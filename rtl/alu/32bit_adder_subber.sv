`timescale 1ns/1ps

module adder_subber_32bits (
  input logic [31:0] A, B,
  input logic Sub,

  output logic [31:0] S,
  output logic Cout
);
  logic [31:0] b_mod;

  // One's Compliment
  genvar i;
  generate
  for (i = 0; i < 32; i = i + 1) begin : gen_inv
    xor gen_inv (b_mod[i], B[i], Sub);
  end
  endgenerate

  // Add with Two's Compliment if Sub == 1
  adder_32bit main_adder (
    .A(A), .B(b_mod), .Cin(Sub), .S(S), .Cout(Cout)
    );

endmodule
