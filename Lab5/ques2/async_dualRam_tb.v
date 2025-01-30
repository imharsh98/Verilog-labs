module async_dualRam_tb();

reg [15:0] data_in;
reg [2:0] rd_addr, wr_addr;
reg wr_clk, rd_clk, clr, we, re;
wire [15:0] data_out;

async_dualRam DUT(wr_clk,rd_clk,clr,data_in,re,we,data_out,rd_addr,wr_addr);

initial
 begin
  wr_clk = 1'b0;
  forever 
  #5 wr_clk=~wr_clk;
 end
 
initial
 begin
  rd_clk = 1'b1;
  forever 
  #10 rd_clk=~rd_clk;
 end
  
task initialize;
 begin
  data_in = 16'd0;
  {rd_addr,wr_addr} = 8'd0;
  {clr,we,re} = 3'b000;
 end
endtask

task dut_clr;
 begin
  clr = 1'b1;
  #10;
  clr = 1'b0;
 end
endtask

task write(input [15:0]i, input [2:0]j, input k);
 begin
 @(negedge wr_clk)
  data_in = i;
  wr_addr = j;
  we = k;
  //turn off write enable 
 @(negedge wr_clk)
  we = 1'b0;
 end
endtask

task read(input [2:0] m, input n);
 begin
 @(negedge rd_clk)
  rd_addr = m;
  re = n;
 @(negedge rd_clk)
  re = 1'b0;
 end
endtask

initial
 begin
 initialize;
 dut_clr;
 #10;
 write(16'b1111,3'b1,1'b1);
 #10;
 read(3'b1,1'b1);
 #10;
 $finish;
end

initial
	begin
		$monitor("Inputs wr_clock=%b rd_clock=%b clr=%b re=%b we=%b rd_addr=%b wr_addr=%b data_in=%b output data_out=%b",wr_clk,rd_clk,clr,re,we,rd_addr,wr_addr,data_in,data_out);
	end
endmodule


 