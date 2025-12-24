

// DFF---------------------------------
module dff(q,d,clk,rst);
  input clk,rst,d;
  output reg q;
  
  always@ (posedge clk or posedge rst)
    if(rst)
      q=1'b0;
  	else
      q<=d;
  
endmodule

// ASYNC UP-COUNTER_BEHAVIORAL--------------------------

module down_counter_async_bh(q,clk,rst);
input clk,rst;
output reg [3:0]q;

always@(posedge clk or posedge rst)begin
  if(rst)
    q<=1'b0;
  else
    q<=q-1;
end
endmodule

// SYNC UP-COUNTER_BEHAVIORAL--------------------------

module down_counter_sync_bh(q,clk,rst);

input clk,rst;
output reg [3:0]q;

always@(posedge clk or posedge rst)begin
  if(rst)
    q<=1'b0;
  else
    q<=q-1;
end
endmodule

// ASYNC DOWN-COUNTER_STRUCTURE--------------------------
module down_counter_async_st(q,clk,rst);
wire [3:0]d;
input clk,rst;
output [3:0]q;

assign d=~q;

dff dff0 (.q(q[0]),.d(d[0]),.clk(clk),.rst(rst));
dff dff1 (.q(q[1]),.d(d[1]),.clk(q[0]),.rst(rst));
dff dff2 (.q(q[2]),.d(d[2]),.clk(q[1]),.rst(rst));
dff dff3 (.q(q[3]),.d(d[3]),.clk(q[2]),.rst(rst));

endmodule

// SYNC UP-COUNTER_STRUCTURE--------------------------
module down_counter_sync_st(q,clk,rst);
wire [3:0]d;
input clk,rst;
output [3:0]q;
// from TT 
assign d0 = ~q[0];
assign d1 = q[1] ^ ~q[0];
assign d2 = q[2] ^ (~q[1] & ~q[0]);
assign d3 = q[3] ^ (~q[2] & ~q[1] & ~q[0]);

dff dff0 (.q(q[0]),.d(d0),.clk(clk),.rst(rst));
dff dff1 (.q(q[1]),.d(d1),.clk(clk),.rst(rst));
dff dff2 (.q(q[2]),.d(d2),.clk(clk),.rst(rst));
dff dff3 (.q(q[3]),.d(d3),.clk(clk),.rst(rst));

endmodule

