`timescale 1ns/1ns

module down_counter_sync_tb;
  reg clk, rst;
  wire [3:0] q;

  // Instantiate the DUT (Design Under Test)
  down_counter_sync_bh uut (
    .q(q),
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    $dumpfile("down_counter_sync_bh.vcd");
    $dumpvars(0, down_counter_sync_tb);
    $monitor("time=%0t | rst=%b | clk=%b | q=%d", $time, rst, clk, q);

    clk = 0;
    rst = 1;
    #5 rst = 0;
    #160 $finish;
  end
endmodule
