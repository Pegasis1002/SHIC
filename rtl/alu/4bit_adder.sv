`timescale 1ns/1ps

module adder_4bit (
  input logic [3:0]A,
  input logic [3:0]B,
  input logic Cin,
  output logic [3:0]S,
  output logic Cout
);
  logic c0, c1, c2;

  full_adder fa0 (
    .A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .C(c0)
    );

  full_adder fa1 (
    .A(A[1]), .B(B[1]), .Cin(c0), .S(S[1]), .C(c1)
    );

  full_adder fa2 (
    .A(A[2]), .B(B[2]), .Cin(c1), .S(S[2]), .C(c2)
    );

  full_adder fa3 (
    .A(A[3]), .B(B[3]), .Cin(c2), .S(S[3]), .C(Cout)
    );
endmodule
