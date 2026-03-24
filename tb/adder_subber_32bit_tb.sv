`timescale 1ns/1ps

module adder_subber_32bit_tb;
  logic [31:0] a, b, s;
  logic cout, sub;

  adder_subber_32bits _32a1 (
    .A(a), .B(b), .S(s), .Cout(cout), .Sub(sub)
    );

  initial begin
    $dumpfile("adder_subber_32bit.vcd");
    $dumpvars(0, adder_subber_32bits_tb);

    a = 32'hFFFFFFFF; b = 32'h00000001;  sub = 1'b0; #10;
    $display("A:%h B:%h sub:%b || Cout:%b S:%h", a, b, sub, cout, s);

    a = 32'h800; b = 32'h8000;  sub = 1'b0; #10;
    $display("A:%h B:%h sub:%b || Cout:%b S:%h", a, b, sub, cout, s);

    a = 32'hFFFFFFFF; b = 32'h00000001;  sub = 1'b1; #10;
    $display("A:%h B:%h sub:%b || Cout:%b S:%h", a, b, sub, cout, s);

    a = 32'hFFFFFFFF; b = 32'hFFFFFFFF;  sub = 1'b1; #10;
    $display("A:%h B:%h sub:%b || Cout:%b S:%h", a, b, sub, cout, s);

    a = 32'hFFFFFFFF; b = 32'hFF000;  sub = 1'b1; #10;
    $display("A:%h B:%h sub:%b || Cout:%b S:%h", a, b, sub, cout, s);
  end

endmodule
