`timescale 1ns/1ps

module adder_32bit_tb;
  logic [31:0]a, b, s;
  logic cin, cout;

  adder_32bit uut (
    .A(a), .B(b), .S(s), .Cin(cin), .Cout(cout)
    );

  initial begin
    $dumpfile("adder_32bit.vcd");
    $dumpvars(0, adder_32bit_tb);

    a = 32'h00FF; b = 32'h0F00; cin = 0; #10;
    $display("A:%h B:%h Cin:%b || Cout:%b S:%h", a, b, cin, cout, s);

    a = 32'h00FF; b = 32'h0F00; cin = 1; #10;
    $display("A:%h B:%h Cin:%b || Cout:%b S:%h", a, b, cin, cout, s);

    a = 32'h00FF; b = 32'hFF00; cin = 1; #10;
    $display("A:%h B:%h Cin:%b || Cout:%b S:%h", a, b, cin, cout, s);

    a = 32'hFFFF0000; b = 32'h0000FFFF; cin = 1; #10;
    $display("A:%h B:%h Cin:%b || Cout:%b S:%h", a, b, cin, cout, s);

    a = 32'hFFFF0000; b = 32'h0000FFFF; cin = 0; #10;
    $display("A:%h B:%h Cin:%b || Cout:%b S:%h", a, b, cin, cout, s);

    $finish;
  end
endmodule
