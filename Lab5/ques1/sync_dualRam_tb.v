module sync_dualRam_tb();

reg [7:0] data_in;
reg [3:0] rd_addr, wr_addr;
reg clk, reset, we, re;
wire [7:0] data_out;

sync_dualRam DUT(clk,reset,data_in,re,we,data_out,rd_addr,wr_addr);

initial
 begin
  clk = 1'b0;
  forever 
  #5 clk=~clk;
 end
  
task initialize;
 begin
  data_in = 8'd0;
  {rd_addr,wr_addr} = 8'd0;
  {reset,we,re} = 3'b000;
 end
endtask

task dut_reset;
 begin
  @(negedge clk)
   reset = 1'b1;
  @(negedge clk)
   reset = 1'b0;
 end
endtask

task write(input [7:0]i, input [3:0]j, input k);
 begin
 @(negedge clk)
  data_in = i;
  wr_addr = j;
  we = k;
  //turn off write enable 
 @(negedge clk)
  we = 1'b0;
 end
endtask

task read(input [3:0] m, input n);
 begin
 @(negedge clk)
  rd_addr = m;
  re = n;
 @(negedge clk)
  re = 1'b0;
 end
endtask

initial
 begin
 initialize;
 dut_reset;
 #10;
 write(8'b1111,4'b1,1'b1);
 #10;
 read(4'b1,1'b1);
 #10;
 $finish;
end

initial
	begin
		$monitor("Inputs clock=%b reset=%b re=%b we=%b rd_addr=%b wr_addr=%b data_in=%b output data_out=%b",clk,reset,re,we,rd_addr,wr_addr,data_in,data_out);
	end
endmodule


 