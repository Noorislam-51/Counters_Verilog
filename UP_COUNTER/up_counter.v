
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

// ASYNC UP-COUNTER_STRUCTURE--------------------------
module up_counter_async_st(q,clk,rst);
wire [3:0]d;
input clk,rst;
output [3:0]q;

assign d=~q;


  dff dff0 (.q(q[0]),.d(d[0]),.clk(clk),.rst(rst));
  dff dff1 (.q(q[1]),.d(d[1]),.clk(d[0]),.rst(rst));
  dff dff2 (.q(q[2]),.d(d[2]),.clk(d[1]),.rst(rst));
  dff dff3 (.q(q[3]),.d(d[3]),.clk(d[2]),.rst(rst));

endmodule


// SYNC UP-COUNTER_STRUCTURE--------------------------
module up_counter_sync_st(q,clk,rst);
wire [3:0]d;
input clk,rst;
output [3:0]q;
// from TT 
assign d0 = ~q[0];
assign d1 = q[1] ^ q[0];
assign d2 = q[2] ^ (q[1] & q[0]);
assign d3 = q[3] ^ (q[2] & q[1] & q[0]);

dff dff0 (.q(q[0]),.d(d0),.clk(clk),.rst(rst));
dff dff1 (.q(q[1]),.d(d1),.clk(clk),.rst(rst));
dff dff2 (.q(q[2]),.d(d2),.clk(clk),.rst(rst));
dff dff3 (.q(q[3]),.d(d3),.clk(clk),.rst(rst));

endmodule

// ASYNC UP-COUNTER_BEHAVIORAL--------------------
module async_counter (
    input  wire clk,
    input  wire rst,
    output reg  [3:0] q
);

    // LSB toggles with main clock
    always @(posedge clk or posedge rst) begin
        if (rst)
            q[0] <= 1'b0;
        else
            q[0] <= ~q[0];
    end

    // Next bit toggles with previous bit
    always @(posedge q[0] or posedge rst) begin
        if (rst)
            q[1] <= 1'b0;
        else
            q[1] <= ~q[1];
    end

    always @(posedge q[1] or posedge rst) begin
        if (rst)
            q[2] <= 1'b0;
        else
            q[2] <= ~q[2];
    end

    always @(posedge q[2] or posedge rst) begin
        if (rst)
            q[3] <= 1'b0;
        else
            q[3] <= ~q[3];
    end

endmodule

// SYNC UP-COUNTER_BEHAVIORAL--------------------------
module up_counter_sync_bh(q,clk,rst);
input clk,rst;
output reg [3:0]q;

always@(negedge clk or posedge rst)begin
  if(rst)
    q<=1'b0;
  else
    q<=q+1;
end
endmodule

