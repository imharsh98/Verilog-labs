module dec3to8_tb();

	reg [2:0] data_in;
	reg en;
	wire [7:0] y;
	integer n;
	
	dec3to8 DUT(data_in,en,y);
	
	task initialize;
		begin
			en = 1'b1;
		end
	endtask
	
	task stimulus(input [2:0]i);
		begin	
			//#10;
			data_in = i;
		end
	endtask
	
	task reinitialize;
		begin
			en = 1'b0;
		end
	endtask
	
	initial
		begin	
			initialize;
			for(n=0;n<8;n=n+1)
			 begin	
			  stimulus(n);
			  #10;
			 end
			reinitialize;
		end
	
	initial
		begin
			$monitor("Inputs data=%b, en=%b output y=%b",data_in,en,y);
		end
	
	initial
		begin
			#100 $finish;
		end
	
endmodule
		
	
	