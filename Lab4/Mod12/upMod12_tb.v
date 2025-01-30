module upMod12_tb();

reg [3:0] din;
reg clk,rst,load;
wire [3:0] dout;

upMod12 DUT(din,clk,rst,load,dout);

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

task load_in(input [3:0] i);
begin
@(negedge clk)
load=1'b1;
din=i;
@(negedge clk)
load=1'b0;
end
endtask

initial
begin
initialize;
reset;
load_in(4'b1001);
#100;
$finish;
end

initial
	begin
		$monitor("Inputs clock=%b reset=%b load=%b din=%b output=%b",clk,rst,load,din,dout);
	end
endmodule
