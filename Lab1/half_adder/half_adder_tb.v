module half_adder_tb();
reg a,b;
wire s,c;
integer i;
half_adder dut(a,b,s,c);
initial
begin
a = 1'b0;
b = 1'b0;
end
initial
begin
for(i=0;i<4;i=i+1)
begin
{a,b}=i;
#10;
end
end
initial
$monitor("input A=%b B=%b Outputs sum=%b carry=%b", a,b,s,c);
initial #200 $finish();
endmodule
