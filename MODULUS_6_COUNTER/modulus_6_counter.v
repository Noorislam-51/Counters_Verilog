module dff(q,clk,rst,d);
input clk,rst,d;
output reg q; 

always@(posedge clk ,posedge rst)
  if(rst)
    q<=1'b0;
  else
    q<=d;
endmodule


// module modulus_6_counter_st(q,clk,rst);
// wire [2:0]d;
// input clk,rst;
// output [2:0]q;

// assign d0 = ~q[0];
// assign d1 = q[1] ^ ~q[0];
// assign d2 = q[2] ^ (~q[1] & ~q[0]);
// dff dff0 (.q(q[0]),.d(d[0]),.clk(clk),.rst(rst));
// dff dff1 (.q(q[1]),.d(d[1]),.clk(clk),.rst(rst));
// dff dff2 (.q(q[2]),.d(d[2]),.clk(clk),.rst(rst));

// endmodule


module modulus_6_counter_bh(q,clk,rst);
wire [2:0]d;
input clk,rst;
output reg [2:0]q;

assign d=q+1;
always@(negedge clk or posedge rst)begin
  if(q==3'd6 ||rst)
    q<=1'b0;
  else 
    q<=q+1;
end
endmodule