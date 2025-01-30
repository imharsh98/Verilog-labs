module shift_op();
	reg [3:0] a,b,x,y,z,w;
	
	initial
		begin
			a = 4'b0110; b = 4'b1100;
			
			x = a << 1; // logical left shift
			y = b >> 2; // logical right shift
			
			z = a >>> 1; //arithmetic right shift
			w = b <<< 2; //arithmetic left shift
			
			$display("inputs a =%b, b=%b, outputs x =%b, y =%b, z =%b, w=%b", a,b,x,y,z,w);
		end
endmodule
			