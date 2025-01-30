//Write an RTL and testbench for an 8x16 asynchronous dual port RAM memory
module async_dualRam(wr_clk,rd_clk,clr,data_in,re,we,data_out,rd_addr,wr_addr);

parameter data_width = 16, data_depth = 8;

input wr_clk,rd_clk,clr,we,re;
input [2:0] wr_addr,rd_addr;
input [data_width-1:0] data_in;
output reg [data_width-1:0] data_out;
reg [data_width-1:0] mem [data_depth-1:0];
integer i;

always@(posedge wr_clk, posedge clr)
 begin
	if(clr)
	 begin
		for(i=0;i<data_depth;i=i+1)
			mem[i] <= 0;
	 end
	else if(we)
	 mem[wr_addr] <= data_in;
 end

always@(posedge rd_clk, posedge clr)
 begin
  if(clr)
   begin
	data_out <= 0;
   end
  else if(re)
   data_out <= mem[rd_addr];
 end
 
endmodule
