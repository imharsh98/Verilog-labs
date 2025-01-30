//Write an RTL to design 4-bit MOD12 loadable binary up counter and verify using test bench
module upMod12(din,clk,rst,load,dout);

input [3:0] din;
input clk,rst,load;
output reg [3:0] dout;

always@(posedge clk)
begin
if(rst)
	dout <= 4'b0000;
else if(load)
	dout <= din;
	// if(din > 4'b1011)
		// dout <= 4'b0000 + (din - 4'b1100);
	// else
		// dout <= din;
else if(dout == 4'b1011)
	dout <= 4'b0000;
else
	dout <= dout + 4'b0001;
end
endmodule