// Code for verifying Bitwise Operators

module bitwise_op();
reg [2:0] a, b, c, x, y, z;

//bitwise AND
initial
begin
a = 5; b = 3'b111; c = 3'bx;
x = a & b;
y = a & c;
z = b & 3'b1;
$display ( " AND x = %b, y = %b, z = %b", x, y, z);
end

//bitwise OR
initial
begin
a = 5; b = 3'b111; c = 3'bx;
x = a | b;
y = a | c;
z = b | 3'b1;
$display ( " OR x = %b, y = %b, z = %b", x, y, z);
end

//bitwise XOR
initial
begin
a = 5; b = 3'b111; c = 3'bx;
x = a ^ b;
y = a ^ c;
z = b ^ 3'b1;
// x = !a;
// y = !b;
// z = !c;
$display ( " XOR x = %b, y = %b, z = %b", x, y, z);
end

//bitwise Negation
initial
begin
a = 5; b = 3'b111; c = 3'bx;
x = ~a;
y = ~b;
z = ~c;
$display ( " Negation x = %b, y = %b, z = %b", x, y, z);
end

//bitwise XNOR
initial
begin
a = 5; b = 3'b111; c = 3'bx;
x = a ~^ b;
y = a ~^ c;
z = b ~^ 3'b1;
$display ( " XNOR x = %b, y = %b, z = %b", x, y, z);
end

endmodule
