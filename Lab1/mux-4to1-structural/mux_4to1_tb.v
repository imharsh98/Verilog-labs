module mux_4to1_tb();
reg s0,s1,i0,i1,i2,i3;
wire y;
integer i;
mux_4to1 dut(s0,s1,i0,i1,i2,i3,y);
initial
begin
s0 = 1'b0;
s1 = 1'b0;
i0 = 1'b0;
i1 = 1'b0;
i2 = 1'b0;
i3 = 1'b0;
end
initial 
begin
for(i=0;i<64;i=i+1)
begin
{i3,i2,i1,i0,s1,s0} = i;
#10;
end
end
initial
$monitor("inputs s1=%b s0=%b i0=%b i1=%b i2=%b i3=%b output y=%b", s1,s0,i0,i1,i2,i3,y);
initial #800 $finish();
endmodule