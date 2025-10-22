`timescale 1ns/1ns

module up_down_ripple_counter_tb;
reg clk,rst,dir;
wire [3:0]q;
  
up_down_ripple_counter uut (q, clk, rst, dir);


always #5 clk=~clk;
initial begin
    $dumpfile("up_down_ripple_counter.vcd");
    $dumpvars(0, up_down_ripple_counter_tb);
  $monitor("time=%0t | rst=%b |dir=%b | clk=%b | q=%d", $time, rst, dir,clk, q);

  // Initialize signals
    clk = 0;
    rst = 1;
    dir = 1;      // start counting up
    #10 rst = 0;  // release reset

    // Count up for a while
    #100 dir = 0; // switch to count down

    // Let it run for some cycles
    #100 $finish;
  end
endmodule