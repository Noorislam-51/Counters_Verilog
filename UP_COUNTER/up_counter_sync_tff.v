module t_ff(q, clk, rst, t);
  input clk, rst, t;
  output reg q;

  always @(posedge clk or posedge rst) begin
    if (rst)
      q <= 1'b0;
    else if (t)
      q <= ~q;      // Toggle when T = 1
  end
endmodule


module up_counter_sync_tff(q, clk, rst);
  input clk, rst;
  output [2:0] q;
  wire [2:0] t;

  // Toggle logic
  assign t[0] = 1'b1;      // LSB toggles every clock
  assign t[1] = q[0];      // MSB toggles when LSB = 1
  assign t[2] = q[0] & q[1]; 
  // Instantiate T flip-flops
  t_ff t0 (.q(q[0]), .clk(clk), .rst(rst), .t(t[0]));
  t_ff t1 (.q(q[1]), .clk(clk), .rst(rst), .t(t[1]));
  t_ff t3 (.q(q[2]), .clk(clk), .rst(rst), .t(t[2]));
endmodule
