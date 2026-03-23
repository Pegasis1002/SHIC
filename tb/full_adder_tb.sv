`timescale 1ns/1ps

module full_adder_tb;
  logic a, b, cin;
  logic s, c;

  full_adder uut (
    .A(a),
    .B(b),
    .Cin(cin),
    .S(s),
    .C(c)
    );

  initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0, full_adder_tb);

    $display("Time\t A B Cin | S C");
    $monitor("%g\t %b %b  %b  | %b %b", $time, a, b, cin, s, c);

    {a, b, cin} = 3'b000; #10;
    {a, b, cin} = 3'b001; #10;
    {a, b, cin} = 3'b010; #10;
    {a, b, cin} = 3'b011; #10;
    {a, b, cin} = 3'b100; #10;
    {a, b, cin} = 3'b101; #10;
    {a, b, cin} = 3'b110; #10;
    {a, b, cin} = 3'b111; #10;

    $display("Verification Complete.");
    $finish;
  end
endmodule
