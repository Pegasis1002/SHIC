`timescale 1ns/1ps

module shic_tb;
  bit clk;

  always #5 clk = ~clk;

  shic_top dut (
    .clk
    )

endmodule
