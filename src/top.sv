`include "src/decoder.sv"
`include "src/adder.sv"

module top (
    /** Input Ports */
    input wire [3:0] val1,
    input wire [3:0] val2,
    /** Output Ports */
    output logic [7:0] seg7
);

wire [4:0] res;

adder add_inst (
    .val1(val1),
    .val2(val2), 
    .res(res)
);

/** Logic */
always @(*) begin
    case (res)
        // without carry bit
        5'h0: seg7 = 8'b11111100;
        5'h1: seg7 = 8'b01100000;
        5'h2: seg7 = 8'b11011010;
        5'h3: seg7 = 8'b11110010;
        5'h4: seg7 = 8'b01100110;
        5'h5: seg7 = 8'b10110110;
        5'h6: seg7 = 8'b10111110;
        5'h7: seg7 = 8'b11100000;
        5'h8: seg7 = 8'b11111110;
        5'h9: seg7 = 8'b11110110;
        5'hA: seg7 = 8'b11101110;
        5'hB: seg7 = 8'b00111110;
        5'hC: seg7 = 8'b10011100;
        5'hD: seg7 = 8'b01111010;
        5'hE: seg7 = 8'b10011110;
        5'hF: seg7 = 8'b10001110;
        // with carry bit
        5'h10: seg7 = 8'b11111101;
        5'h11: seg7 = 8'b01100001;
        5'h12: seg7 = 8'b11011011;
        5'h13: seg7 = 8'b11110011;
        5'h14: seg7 = 8'b01100111;
        5'h15: seg7 = 8'b10110111;
        5'h16: seg7 = 8'b10111111;
        5'h17: seg7 = 8'b11100001;
        5'h18: seg7 = 8'b11111111;
        5'h19: seg7 = 8'b11110111;
        5'h1A: seg7 = 8'b11101111;
        5'h1B: seg7 = 8'b00111111;
        5'h1C: seg7 = 8'b10011101;
        5'h1D: seg7 = 8'b01111011;
        5'h1E: seg7 = 8'b10011111;
        5'h1F: seg7 = 8'b10001111;
        default: seg7 = 8'b11111100; 
    endcase
end

endmodule