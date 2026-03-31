`timescale 1ns/1ps

module shic_pc (
  input logic clk,
  input logic rst_n,
  input logic [31:0] next_pc,
  output logic [31:0] pc
);
  logic [26:0] clk_counter;
  logic slow_clk;
  always_ff @(posedge clk) begin
    clk_counter <= clk_counter + 1;
     slow_clk <= clk_counter[26];
  end
  
  always_ff @(posedge slow_clk or negedge rst_n) begin 
    if (!rst_n) begin
      pc <= 32'h0;
    end else begin
      pc <= next_pc;
    end
  end
endmodule
