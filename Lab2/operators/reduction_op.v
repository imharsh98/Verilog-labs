// Code for verifying Reduction Operators

module reduction_op();
reg [3:0] a, b; 
reg u, v, w, x, y, z;

initial
begin
a = 4'b0110; b = 4'b1000;
u = &b;  //reduction AND
v = |b;	 //reduction OR
w = ^b;	 //reduction XOR
x = ~&a; //reduction NAND
y = ~^a; //reduction XNOR
z = ~|a; //reduction NOR
$display ( " a = %b, b = %b, u=%b, v=%b, w=%b, x=%b, y=%b, z = %b", a,b,u,v,w,x, y, z);
end

endmodule
