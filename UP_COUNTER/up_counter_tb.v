`timescale 1ns/1ns

module up_counter_async_tb;
  reg clk, rst;
  wire [3:0] q;

  // Instantiate the DUT (Design Under Test)
  up_counter_async_st uut (
    .q(q),
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    $dumpfile("up_counter_async_bh.vcd");
    $dumpvars(0, up_counter_async_tb);
    $monitor("time=%0t | rst=%b | clk=%b | q=%d", $time, rst, clk, q);

    clk = 0;
    rst = 1;
    #10 rst = 0;
    #150 $finish;
  end
endmodule
jk_ff jk_ff0 (.q(q[0]),.clk(clk),.rst(rst)),.j(d[0]),,.k(d[0]);
jk_ff jk_ff1 (.q(q[1]),.clk(d[0]),.rst(rst)),.j(d[1]),,.k(d[1]);
jk_ff jk_ff2 (.q(q[2]),.clk(d[1]),.rst(rst)),.j(d[2]),,.k(d[2]);
jk_ff jk_ff3 (.q(q[3]),.clk(d[2]),.rst(rst)),.j(d[3]),,.k(d[3]);