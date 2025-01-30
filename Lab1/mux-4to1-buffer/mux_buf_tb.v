module mux_buf_tb();
reg [3:0] in;
reg [1:0] s;
wor y;
integer i;
mux_buf dut(in,s,y);
initial
begin
s[0] = 1'b0;
s[1] = 1'b0;
in[0] = 1'b0;
in[1] = 1'b0;
in[2] = 1'b0;
in[3] = 1'b0;
end
initial 
begin
for(i=0;i<64;i=i+1)
begin
{in[3],in[2],in[1],in[0],s[1],s[0]} = i;
#10;
end
end
initial
$monitor("inputs s1=%b s0=%b i0=%b i1=%b i2=%b i3=%b output y=%b", s[1],s[0],in[0],in[1],in[2],in[3],y);
initial #800 $finish();
endmodule