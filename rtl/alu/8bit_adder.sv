`timescale 1ns/1ps

module adder_8bit (
  input logic [7:0] A, B,
  input logic Cin,

  output logic [7:0] S,
  output logic Cout
);
  logic c;

  adder_4bit _4a1 (
    .A(A[3:0]), .B(B[3:0]), .Cin(Cin), .S(S[3:0]), .Cout(c)
    );

  adder_4bit _4a2 (
    .A(A[7:4]), .B(B[7:4]), .Cin(c), .S(S[7:4]), .Cout(Cout)
    );
endmodule
