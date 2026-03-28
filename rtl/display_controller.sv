module display_controller (
  input  logic        clk_100m, // Fast system clock
  input  logic [31:0] data,     // Your 32-bit PC
  output logic [6:0]  seg,      // Shared segment lines
  output logic [7:0]  an        // Individual power lines (Anodes)
);
  logic [16:0] refresh_counter;

  always_ff @(posedge clk_100m) begin
    refresh_counter <= refresh_counter + 1;
  end

  logic [2:0] digi_selc;
  assign digi_selc = refresh_counter[16:14];

  logic [3:0] hex_nibble;
  always_comb begin
    case (digi_selc)
      3'd0: hex_nibble = data[3:0];   // Rightmost
      3'd1: hex_nibble = data[7:4];
      3'd2: hex_nibble = data[11:8];
      3'd3: hex_nibble = data[15:12];
      3'd4: hex_nibble = data[19:16];
      3'd5: hex_nibble = data[23:20];
      3'd6: hex_nibble = data[27:24];
      3'd7: hex_nibble = data[31:28]; // Leftmost
      default: hex_nibble = 4'h0;
    endcase
  end

  hex_to_7seg decoder (.hex(hex_nibble), .seg(seg));
  always_comb begin
    an = 8'b11111111;
    an[digi_selc] = 1'b0;
  end
endmodule
