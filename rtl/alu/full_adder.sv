`timescale 1ns/1ps

module full_adder (
  input logic A, B, Cin,
  output logic S, C
);
  logic w1, w2, w3;

  xor G1 (w1, A, B);
  xor G2 (S, w1, Cin);

  and G3 (w2, Cin, w1);
  and G4 (w3, A, B);

  or  G5 (C, w2, w3);
endmodule
