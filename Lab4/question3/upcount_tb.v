module upcount_tb();

reg [3:0] din;
reg clk,rst,load;
wire [3:0] dout;

upcount dut(din,clk,rst,load,dout);

initial
begin
clk = 1'b0;
forever
#5 clk = ~clk;
end

task initialize;
begin
{din,rst,load}=6'b000010;
end
endtask

task reset;
begin
@(negedge clk)
rst = 1'b1;
@(negedge clk)
rst = 1'b0;
end
endtask

task load_in;
begin
@(negedge clk)
load = 1'b1;
din = 4'b0000;
@(negedge clk)
load = 1'b0;
end
endtask

initial
begin
initialize;
reset;
load_in;
#20;
$finish;
end

initial
	begin
		$monitor("Inputs clock=%b reset=%b load=%b din=%b output=%b",clk,rst,load,din,dout);
	end
endmodule