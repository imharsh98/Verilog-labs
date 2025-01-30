module priority_encoder8to3_tb();

	reg [7:0] data_in;
	wire [2:0] y;
	wire idle;
	integer n;
	
	priority_encoder8to3 DUT(data_in,y,idle);
	
	task stimulus(input [7:0]i);
		begin	
			data_in = i;
		end
	endtask
	
	initial
		begin	
			for(n=0;n<256;n=n+1)
			 begin	
			  stimulus(n);
			  #10;
			 end
		end
	
	initial
		begin
			$monitor("Input data=%b outputs y=%b idle=%b",data_in,y,idle);
		end
	
	initial
		begin
			#3000 $finish;
		end
	
endmodule