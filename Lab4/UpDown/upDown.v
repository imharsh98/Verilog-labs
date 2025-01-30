//Write a RTL to design 4 bit loadable binary synchronous up down counter
module upDown(din,clk,rst,load,dout,ctrl);

input [3:0] din;
input clk,rst,load,ctrl;
output reg [3:0] dout;

always@(posedge clk)
begin
if(rst)
	dout <= 4'b0000;
else if(load)
	dout <= din;
else if(ctrl == 1'b0)
	dout <= dout + 4'b0001;
else
	dout <= dout - 4'b0001;
end
endmodule