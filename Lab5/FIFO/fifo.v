//Write an RTL and test bench for 16 x 8 FIFO memory and verify using testbench.
module fifo(clk,reset,data_in,re,we,data_out,empty,full);

parameter data_width = 8, data_depth = 16, address_bus_width = 5;
 
input clk,reset,we,re;
reg [address_bus_width-1:0] wr_addr,rd_addr;
input [data_width-1:0] data_in;
output reg [data_width-1:0] data_out;
output empty,full;
reg [data_width-1:0]mem[data_depth-1:0];
integer i;

always@(posedge clk)
 begin
	if(reset)
	 begin
		for(i=0;i<data_depth;i=i+1)
			mem[i] <= 0;
		wr_addr <= 0;
	 end
	else if(we == 1 && full == 0)
	 begin
		mem[wr_addr[3:0]] <= data_in;
		wr_addr = wr_addr + 1;
	 end
 end
 
always@(posedge clk)
 begin
	if(reset)
	 begin
		data_out <= 0;
		rd_addr <= 0;
	 end
	else if(re == 1 && empty == 0)
	 begin
		data_out <= mem[rd_addr[3:0]];
		rd_addr <= rd_addr + 1;
	 end
 end
 
assign empty = (wr_addr==rd_addr)?1'b1:1'b0;
assign full = (wr_addr=={~rd_addr[4],rd_addr[3:0]})?1'b1:1'b0;

endmodule

