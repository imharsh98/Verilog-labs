//Write an RTL and testbench for an 8x16 asynchronous single port RAM memory

module async_singleRam(addr,data,we,en);
 
parameter depth = 8, width = 16, addr_bus = 3;

input [addr_bus-1:0] addr;
input we,en;
inout [width-1:0] data;
reg [width-1:0] temp;
reg [width-1:0] mem [depth-1:0];

always@(*)
 begin
  if(we == 1 && en == 0) 
   mem[addr] <= data;
 end
 
always@(*)
 begin
  if(we == 0 && en == 1)
   temp <= mem[addr];
 end
 
assign data = (~we&en)?temp:16'bz;

endmodule