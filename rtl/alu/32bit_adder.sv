`timescale 1ns/1ps

module adder_32bit (
  input logic [31:0] A, B,
  input logic Cin,

  output logic [31:0] S,
  output logic Cout
);
  logic c0, c1, c2;

  adder_8bit _8a1 (
    .A(A[7:0]), .B(B[7:0]), .Cin(Cin), .S(S[7:0]), .Cout(c0)
    );

  adder_8bit _8a2 (
    .A(A[15:8]), .B(B[15:8]), .Cin(c0), .S(S[15:8]), .Cout(c1)
    );

  adder_8bit _8a3(
    .A(A[23:16]), .B(B[23:16]), .Cin(c1), .S(S[23:16]), .Cout(c2)
    );

  adder_8bit _8a4 (
    .A(A[31:24]), .B(B[31:24]), .Cin(c2), .S(S[31:24]), .Cout(Cout)
    );
endmodule
