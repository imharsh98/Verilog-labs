module relational_op();
	reg [3:0] a,b;
	reg x,y,z,w;
	
	initial
		begin
			a = 4'b0110; b = 4'b1100;
			
			x = a < b;  
			y = a > b; 
			z = a >= b; 
			w = a <= b; 
			
			$display("inputs a =%b, b=%b, outputs x =%b, y =%b, z =%b, w=%b", a,b,x,y,z,w);
		end
endmodule
			