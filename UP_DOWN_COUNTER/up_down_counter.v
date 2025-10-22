module up_down_ripple_counter(q,clk rst dir);
input clk,rst,dir;
output [3:0]q;

always @(posedge clk ,posedge rst)
  if(rst)
    q<=4'b0000;
  else if (dir)
    q<=q+1;
  else 
    q<=q-1;
end
endmodule