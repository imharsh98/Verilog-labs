module upDown_tb();

reg [3:0] din;
reg clk,rst,load,ctrl;
wire [3:0] dout;

upDown DUT(din,clk,rst,load,dout,ctrl);

initial
begin
clk = 1'b0;
forever
#5 clk = ~clk;
end

task initialize;
begin
{din,rst,load,ctrl}=7'b0000100;
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

task load_in(input [3:0] i);
begin
@(negedge clk)
load=1'b1;
din=i;
@(negedge clk)
load=1'b0;
end
endtask

// task upCount;
// begin
// @(negedge clk)
// ctrl = 1'b0;
// end
// endtask

task downCount;
begin
@(negedge clk)
ctrl = 1'b1;
end
endtask

initial
begin
initialize;
reset;
load_in(4'b0001);
#20;
downCount;
#80
$finish;
end

initial
	begin
		$monitor("Inputs clock=%b reset=%b load=%b ctrl=%b din=%b output=%b",clk,rst,load,ctrl,din,dout);
	end
endmodule
