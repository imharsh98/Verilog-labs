// Code for verifying Logical Operators

module logical_op();
reg [2:0] a, b,c;
reg x, y, z;

//logical AND
initial
begin
a = 5; b = 3'b111; c = 3'bx;
x = a && b;
y = a && c;
z = b && 0;
$display ( " AND x = %b, y = %b, z = %b", x, y, z);
end

//logical OR
initial
begin
a = 5; b = 3'b111; c = 3'bx;
x = a || b;
y = a || c;
z = b || 0;
$display ( " OR x = %b, y = %b, z = %b", x, y, z);
end

//logical NOT
initial
begin
a = 5; b = 3'b111; c = 3'bx;
x = !a;
y = !b;
z = !c;
$display ( " NOT x = %b, y = %b, z = %b", x, y, z);
end

endmodule
