//Write an RTL and testbench for 4-bit SISO
module siso(clock,rst,si,so);

reg [3:0] temp;
input clock,rst,si;
output reg so;

always@(posedge clock)
begin
	if(rst)
		temp <= 0;
	else
	 begin
		temp <= {si,temp[3:1]};
		so <= temp[0];
	 end
end
endmodule
		
	