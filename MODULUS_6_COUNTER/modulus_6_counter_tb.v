`timescale 1ns/1ns

module modulus_6_counter_tb;
  reg clk, rst;
  wire [3:0] q;

  // Instantiate the T FF counter (structural/sync)
modulus_6_counter_st uut (
    .q(q),
    .clk(clk),
    .rst(rst)
  );

  // Clock generation: 10ns period
  always #5 clk = ~clk;

  initial begin
    $dumpfile("modulus_6_counter.vcd");
    $dumpvars(0, modulus_6_counter_tb);
    $monitor("time=%0t | rst=%b | clk=%b | q=%d", $time, rst, clk, q);

    // Initialize signals
    clk = 0;
    rst = 1;
    #10 rst = 0;

    // Let it run for some cycles
    #200 $finish;
  end
endmodule
