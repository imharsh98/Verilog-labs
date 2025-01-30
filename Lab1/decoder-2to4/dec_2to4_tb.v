module dec_2to4_tb();
reg x,y,en;
wire p0,p1,p2,p3;
integer i;
dec_2to4 dut(.a(x),.b(y),.en(en),.d0(p0),.d1(p1),.d2(p2),.d3(p3));
initial
begin
x = 1'b0;
y = 1'b0;
en = 1'b1;
end
initial
begin
for(i=0;i<4;i=i+1)
begin
{x,y} = i;
#10;
end
end
initial
$monitor("inputs A=%b B=%b outputs %b %b %b %b", x,y,p0,p1,p2,p3);
initial #100 $finish(); 
endmodule