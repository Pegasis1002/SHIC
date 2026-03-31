`timescale 1ns/1ps

module shic_top (
  input  logic        clk_100m,
  input logic clk,
  input logic rst_n,
  output logic [6:0]  seg,
  output logic [7:0]  an
);
  logic [31:0] current_pc, next_pc, inst;

  shic_pc pc_reg (
    .clk(clk_100m),
    .rst_n(rst_n),
    .next_pc(next_pc),
    .pc(current_pc)
    );
  
    imem rom (
      .addr(current_pc), .inst(inst)
    );
    
    adder_32bit pc_increament (
      .A(current_pc),
      .B(32'd4),
      .Cin(1'b0),
      .S(next_pc),
      .Cout()
      );

  
  display_controller display (
    .clk_100m(clk_100m), .data(inst), .seg(seg), .an(an)
    );
endmodule
