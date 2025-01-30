//Write an RTL and testbench for a 16x8 synchronous dual port RAM memory
module sync_dualRam(clk,reset,data_in,re,we,data_out,rd_addr,wr_addr);

parameter data_width = 8, data_depth = 16;

input clk,reset,we,re;
input [3:0] wr_addr,rd_addr;
input [data_width-1:0] data_in;
output reg [data_width-1:0] data_out;
reg [data_width-1:0] mem [data_depth-1:0];
integer i;

always@(posedge clk)
 begin
	if(reset)
	 begin
		for(i=0;i<data_depth;i=i+1)
			mem[i] <= 0;
		data_out <= 0;
	 end
	else
	 begin
		if(we == 1)
			mem[wr_addr] <= data_in;
		if(re == 1)
			data_out <= mem[rd_addr];
	 end
 end
 
endmodule
