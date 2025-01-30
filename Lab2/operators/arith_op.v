module arith_op();
	reg [3:0] a,b,c;
	integer d,e;
	reg [3:0] x,y,z;
	integer l,m,n;
	initial
		begin
			a = 4'b0010; b = 4'b0011; c = 4'b101x;
			d = 3; e = 8;
			x = a * b;
			y = a + b;
			z = b - a;
			l = e / d;
			m = e % d;
			n = c * a;
			$display("inputs a =%b, b=%b, c=%b, d=%d, e=%d, outputs x =%b, y =%b, z =%b, l=%d, m=%d, n=%d", 
			a,b,c,d,e,x,y,z,l,m,n);
		end
endmodule
			