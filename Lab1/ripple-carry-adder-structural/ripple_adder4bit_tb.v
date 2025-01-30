module ripple_adder4bit_tb();
reg a0,a1,a2,a3,b0,b1,b2,b3,cin;
wire s0,s1,s2,s3,carry;
ripple_adder4bit dut(a0,a1,a2,a3,b0,b1,b2,b3,cin,s0,s1,s2,s3,carry);
initial
begin
a0 = 1'b1;
a1 = 1'b0;
a2 = 1'b0;
a3 = 1'b1;
b0 = 1'b0;
b1 = 1'b0;
b2 = 1'b1;
b3 = 1'b1;
cin = 1'b0;
end
initial
$monitor("inputs a3=%b a2=%b a1=%b a0=%b", a3,a2,a1,a0);
initial
$monitor("inputs b3=%b b2=%b b1=%b b0=%b cin=%b", b3,b2,b1,b0,cin);
initial
$monitor("outputs s3=%b s2=%b s1=%b s0=%b carry=%b", s3,s2,s1,s0,carry);
initial #100 $finish();
endmodule