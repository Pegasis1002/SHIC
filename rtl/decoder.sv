`timescale 1ns/1ps

module decoder (
  input logic [31:0] inst,
  output logic [6:0] opcode,
  output logic [4:0] rd, rs1, rs2,
  output logic [2:0] funct3,
  output logic [6:0] funct7,
  output logic [31:0] I_imm,
  output logic [31:0] S_imm,
  output logic [31:0] U_imm,
  output logic [31:0] B_imm,
  output logic [31:0] J_imm
);
  assign opcode = inst[6:0];
  assign rd = inst[11:7];
  assign rs1 = inst[19:15];
  assign rs2 = inst[24:20];

  assign funct3 = inst[14:12];
  assign funct7 = inst[31:25];

  // Immidiates
  assign I_imm = {{20{inst[31]}}, inst[31:20]};
  assign S_imm = {{20{inst[31]}}, inst[31:25], inst[11:7]};
  assign B_imm = {{19{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
  assign J_imm = {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0};
  assign U_imm = {inst[31:12], 12'b0};

endmodule
