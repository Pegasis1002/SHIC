`timescale 1ns/1ps

module imem (
  input logic [31:0] addr,
  output logic [31:0] inst
);
  logic [31:0] mem [0:63];

  initial begin
    mem[0] = 32'hCAFEBABE;
    mem[1] = 32'h00000013;
    mem[2] = 32'h42932829;
    mem[3] = 32'h12345678;
    mem[4] = 32'hFFFAAAAA;

    for (int i = 5; i < 64; i++) begin
      mem[i] = 32'h0;
    end
  end

  assign inst = mem[addr[7:2]];
  //assign inst = addr;
endmodule
