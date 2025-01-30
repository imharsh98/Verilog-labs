module full_adder_tb();
reg a,b,cin;
wire s,c;
integer i;
full_adder dut(a,b,cin,s,c);
initial
begin
a = 1'b0;
b = 1'b0;
cin = 1'b0;
end
initial
begin
for(i=0;i<8;i=i+1)
begin
{a,b,cin} = i;
#10;
end
end
initial
$monitor("inputs A=%b B=%b C=%b outputs sum=%b carry=%b", a,b,cin,s,c);
initial #200 $finish();
endmodule