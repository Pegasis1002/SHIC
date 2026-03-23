`timescale 1ns/1ps

module adder_4bit_tb;
  logic [3:0] a, b, s;
  logic cin, cout;

  adder_4bit uut (
    .A(a), .B(b), .Cin(cin), .S(s), .Cout(cout)
    );

  initial begin
        $dumpfile("adder_4bit.vcd");
        $dumpvars(0, adder_4bit_tb);

        // Test 1: 5 + 3 = 8
        a = 4'd5; b = 4'd3; cin = 0; #10;
        $display("A:%d B:%d Cin:%b | S:%d Cout:%b", a, b, cin, s, cout);

        // Test 2: 15 + 1 = 16 (Overflow)
        a = 4'hF; b = 4'h1; cin = 0; #10;
        $display("A:%h B:%h Cin:%b | S:%h Cout:%b", a, b, cin, s, cout);

        $finish;
    end

endmodule
