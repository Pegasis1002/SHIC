`timescale 1ns/1ps

module adder_8bit_tb;
  logic [7:0] a, b, s;
  logic cout, cin;

  adder_8bit uut (
    .A(a), .B(b), .S(s), .Cin(cin), .Cout(cout)
    );

  initial begin
      $dumpfile("adder_8bit.vcd");
      $dumpvars(0, adder_8bit_tb);

      a = 8'hF; b = 8'hF; cin = 0; #10
      $display("A:%h B:%h Cin:%b || S:%h Cout:%b", a, b, cin, s, cout);

      a = 8'hFF; b = 8'h1; cin = 0; #10
      $display("A:%h B:%h Cin:%b || S:%h Cout:%b", a, b, cin, s, cout);

      a = 8'hFF; b = 8'h1; cin = 1; #10
      $display("A:%h B:%h Cin:%b || S:%h Cout:%b", a, b, cin, s, cout);
      $finish;
  end

endmodule
