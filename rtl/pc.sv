`timescale 1ns/1ps

module shic_pc (
  input logic clk,
  input logic rst_n,
  input logic [31:0] next_pc,
  output logic [31:0] pc
);
  always_ff @(clk) begin 
    if (!rst_n) begin
      pc <= 32'h0;
    end else begin
      pc <= next_pc;
    end
  end
endmodule
