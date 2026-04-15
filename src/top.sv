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

always @(*) begin
    case (res)
        // without carry bit
        5'h0: seg7 = 8'b01111110;
        5'h1: seg7 = 8'b00110000;
        5'h2: seg7 = 8'b01101101;
        5'h3: seg7 = 8'b01111001;
        5'h4: seg7 = 8'b00110011;
        5'h5: seg7 = 8'b01011011;
        5'h6: seg7 = 8'b01011111;
        5'h7: seg7 = 8'b01110000;
        5'h8: seg7 = 8'b01111111;
        5'h9: seg7 = 8'b01111011;
        5'hA: seg7 = 8'b01110111;
        5'hB: seg7 = 8'b00011111;
        5'hC: seg7 = 8'b01001110;
        5'hD: seg7 = 8'b00111101;
        5'hE: seg7 = 8'b01001111;
        5'hF: seg7 = 8'b01000111;
        // with carry bit
        5'h10: seg7 = 8'b11111110;
        5'h11: seg7 = 8'b10110000;
        5'h12: seg7 = 8'b11101101;
        5'h13: seg7 = 8'b11111001;
        5'h14: seg7 = 8'b10110011;
        5'h15: seg7 = 8'b11011011;
        5'h16: seg7 = 8'b11011111;
        5'h17: seg7 = 8'b11110000;
        5'h18: seg7 = 8'b11111111;
        5'h19: seg7 = 8'b11111011;
        5'h1A: seg7 = 8'b11110111;
        5'h1B: seg7 = 8'b10011111;
        5'h1C: seg7 = 8'b11001110;
        5'h1D: seg7 = 8'b10111101;
        5'h1E: seg7 = 8'b11001111;
        5'h1F: seg7 = 8'b11000111;
        default: seg7 = 8'b01111110; 
    endcase
end

endmodule