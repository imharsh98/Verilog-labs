module fifo_tb();

reg [7:0] data_in;
reg clk, reset, we, re;
wire [7:0] data_out;
wire empty,full;
integer j;

fifo DUT(clk,reset,data_in,re,we,data_out,empty,full);

initial
 begin
  clk = 1'b0;
  forever 
  #5 clk=~clk;
 end
  
task initialize;
 begin
  data_in = 8'd0;
  {reset,we,re} = 3'b000;
 end
endtask

task dut_reset;
 begin
  reset = 1'b1;
  #10;
  reset = 1'b0;
 end
endtask

task write(input [7:0]i, input k);
 begin
 @(negedge clk)
  data_in = i;
  we = k;
 end
endtask

task read(input n);
 begin
 @(negedge clk)
  re = n;
 end
endtask

initial
 begin
 initialize;
 dut_reset;
 #10;
 for(j=0;j<16;j=j+1)
  begin
	write(j,1'b1);
	#5;
  end
 //There is a scope for optimisation here because in the transcript there are few clocks where write enable is high but ideally should not be 
 if(j==16)
	write(j,1'b0);
 #10;
 for(j=0;j<16;j=j+1)
  begin
	read(1'b1);
	#5;
  end
 if(j==16)
	read(1'b0);
 #10;
 $finish;
end

initial
	begin
		$monitor("Inputs clock=%b reset=%b re=%b we=%b empty=%b full=%b data_in=%b output data_out=%b",clk,reset,re,we,empty,full,data_in,data_out);
	end
	
endmodule


 