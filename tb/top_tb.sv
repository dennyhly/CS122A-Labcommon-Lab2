`include "src/top.sv"
`default_nettype none

module top_tb;
logic clk;
logic [3:0] val1;
logic [3:0] val2;
logic [7:0] seg7;
logic pass;

top top_uut
(
    /** add additional signals */
    .val1(val1),
    .val2(val2),
    .seg7(seg7)
);

localparam CLK_PERIOD = 5;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    // Set up output to VCDD file
    $dumpfile("tb.vcd");
    $dumpvars(0, top_tb);

    // Initialize testbench variables
    pass = 1'b1;

    // Simulate the clock signal
    clk = 1'b0;
    forever begin
        #10 clk = ~clk;
    end
end

    // testbench logic goes below

    task test_Addition_No_Carry();
    begin
        val1 = 4'h5;
        val2 = 4'h4;
        #15;
        // 5 + 4 = 9. Expected: 8'b11110110
        pass &= (seg7 == 8'b11110110);
        if (seg7 !== 8'b11110110) $display("Fail: 5+4 expected 9, got %b", seg7);
    end
    endtask

    task test_Addition_Carry();
    begin
        val1 = 4'hF;
        val2 = 4'h1;
        #15;
        // F + 1 = 10 (hex). Expected: 8'b11111101 
        pass &= (seg7 == 8'b11111101);
        if (seg7 !== 8'b11111101) $display("Fail: F+1 expected 10, got %b", seg7);
    end
    endtask
 
initial begin
        // Initialize variables
        pass = 1'b1;
        val1 = 0;
        val2 = 0;

        // Wait for first clock edge to start
        @(negedge clk); 
        test_Addition_No_Carry(); 
        
        @(negedge clk); 
        test_Addition_Carry(); 

        // Final Result Display
        if (pass) begin
            $display("Tests Passed!");
        end else begin
            $display("Failed tests");
        end
        $finish();
end

endmodule
`default_nettype wire