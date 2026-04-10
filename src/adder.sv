module adder (
    /** Input Ports */
    input wire [3:0] val1,
    input wire [3:0] val2,
    /** Output Ports */
    output logic [4:0] res
);

assign res = val1 + val2;

endmodule