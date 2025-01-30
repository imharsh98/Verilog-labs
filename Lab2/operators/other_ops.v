module other_ops();

	reg a, le,li, ce, ci;
	reg [2:0] b,c;
	reg [7:0] x,z;
	reg [10:0] y;
	reg [3:0] g,h,o,p,q,r,s;
	
	initial
		begin
			a = 1'b1; b = 3'b100; c = 3'b110;
			x = {a,b,c}; 		//concatenation operator
			z = {x[1:0], b[2:1], c}; //concat op in a different way
			y = {{2{a}},b,{2{c}}}; //replication operator within concat operator
			$display("inputs a =%b, b=%b, c=%b, outputs x =%b, z =%b, y =%b", a,b,c,x,z,y);
		end
	
	initial	
		begin
			g = 4'b1x0z; h = 4'b1x0z;
			le = g == h; //logical equality
			li = g != h; //logical inequality
			ce = g === h; //case equality
			ci = g !== h; //case inequality
			$display("inputs g =%b, h=%b, outputs le =%b, li =%b, ce =%b, ci =%b", g,h,le,li,ce,ci);
		end
		
	initial
		begin	
			o = 4'b1010; p = 4'b0010; q = 4'b1110;
			r = (&q) ? o : p; //conditional operator
			s = q ? o : p; 	  //conditional operator
			$display("inputs o =%b, p=%b, q=%b, outputs r =%b, s =%b", o,p,q,r,s);
		end
	
endmodule
		