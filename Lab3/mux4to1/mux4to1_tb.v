module mux4to1_tb();

	reg [3:0] d;
	reg [1:0] sel;
	wire y;
	
	mux4to1 DUT(d,sel,y);
	
	task initialize;
		begin
			{d,sel} = 0;
		end
	endtask
	
	task stimulus(input [3:0]i, input [1:0]j);
		begin	
			#10;
			d = i;
			sel = j;
		end
	endtask
	
	initial
		begin
			initialize;
			stimulus(4'd5, 2'd2);
			stimulus(4'd15,2'd3);
			stimulus(4'd6,2'd1);
		end
	
	initial
		begin
		 $monitor("Values of data=%b,sel=%b,Output=%b",d,sel,y);
		end
		
	initial
		begin
			#100 $finish;
		end
		
endmodule