//Write an RTL description for 4-bit synchronous loadable up counter and verify using test bench.
module upcount(din,clk,rst,load,dout);
input [3:0] din;
input clk,rst,load;
output reg [3:0] dout;
always@(posedge clk)
begin
if(rst)
dout <= 4'b0000;
else if(load)
dout <= din;
else
dout <= dout + 4'b0001;
end
endmodule