`timescale 1ns/1ps

module hex_to_7seg (
    input  logic [3:0] hex,   // 4-bit input (0-15)
    output logic [6:0] seg    // 7-bit output (a, b, c, d, e, f, g)
);

    // We use always_comb because this is pure logic with no memory.
    // The output changes immediately when the input changes.
    always_comb begin
        case (hex)
            // Bit order in 'seg' is [g f e d c b a]
            // Remember: 0 = ON, 1 = OFF
            4'h0: seg = 7'b1000000; // a,b,c,d,e,f ON; g OFF
            4'h1: seg = 7'b1111001; // b,c ON; others OFF
            4'h2: seg = 7'b0100100; // a,b,d,e,g ON; others OFF
            4'h3: seg = 7'b0110000; // a,b,c,d,g ON; others OFF
            4'h4: seg = 7'b0011001; // b,c,f,g ON; others OFF
            4'h5: seg = 7'b0010010; // a,c,d,f,g ON; others OFF
            4'h6: seg = 7'b0000010; // a,c,d,e,f,g ON; others OFF
            4'h7: seg = 7'b1111000; // a,b,c ON; others OFF
            4'h8: seg = 7'b0000000; // ALL segments ON
            4'h9: seg = 7'b0011000; // a,b,c,f,g ON; others OFF
            4'hA: seg = 7'b0001000; // a,b,c,e,f,g ON
            4'hB: seg = 7'b0000011; // c,d,e,f,g ON (looks like 'b')
            4'hC: seg = 7'b1000110; // a,d,e,f ON
            4'hD: seg = 7'b0100001; // b,c,d,e,g ON (looks like 'd')
            4'hE: seg = 7'b0000110; // a,d,e,f,g ON
            4'hF: seg = 7'b0001110; // a,e,f,g ON
            default: seg = 7'b1111111; // All OFF
        endcase
    end

endmodule
