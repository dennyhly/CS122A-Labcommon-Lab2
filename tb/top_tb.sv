`include "src/top.sv"
`default_nettype none

module top_tb;
logic clk;
logic [3:0] bcd;
logic [6:0] seg7;

top top_uut
(
    /** add additional signals */
    .bcd(bcd),
    .seg7(seg7)
);

localparam CLK_PERIOD = 5;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("build/top.vcd");
    $dumpvars(0, top_tb);
end

initial begin
    clk<=1'b1;
    #(CLK_PERIOD*3);
    // testbench logic goes below
    bcd <= 4'd0;
    #(CLK_PERIOD*3);
    bcd <= 4'd1;
    #(CLK_PERIOD*3);
    bcd <= 4'd2;
    #(CLK_PERIOD*3);
    bcd <= 4'd3;
    #(CLK_PERIOD*3);
    bcd <= 4'd4;
    #(CLK_PERIOD*3);
    bcd <= 4'd5;
    #(CLK_PERIOD*3);
    bcd <= 4'd6;
    #(CLK_PERIOD*3);
    bcd <= 4'd7;
    #(CLK_PERIOD*3);
    bcd <= 4'd8;
    #(CLK_PERIOD*3);
    bcd <= 4'd9;
    #(CLK_PERIOD*3);
    bcd <= 4'd10;
    #(CLK_PERIOD*3);
    bcd <= 4'd11;
    #(CLK_PERIOD*3);
    bcd <= 4'd12;
    #(CLK_PERIOD*3);
    bcd <= 4'd13;
    #(CLK_PERIOD*3);
    bcd <= 4'd14;
    #(CLK_PERIOD*3);
    bcd <= 4'd15;
    #(CLK_PERIOD*3);


    $finish;
end

endmodule
`default_nettype wire