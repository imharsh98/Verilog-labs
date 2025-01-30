module siso_tb();

 reg clock,rst,si;
 wire so;
 
 parameter CYCLE = 10;
 
 siso DUT(clock,rst,si,so);
 
 always
	begin	
		#(CYCLE/2);
		clock = 1'b0;
		#(CYCLE/2);
		clock = ~clock;
	end
	
 task initialize;
	begin
		{rst,si} = 2'b00;
	end
 endtask
 
 task rst_dut;
	begin
		@(negedge clock)
			rst = 1'b1;
		@(negedge clock)
			rst = 1'b0;
	end
 endtask
 
 task stimulus(input i);
	begin
		@(negedge clock)
		si = i;
	end
 endtask
		
		
 initial
	begin
		initialize;
		rst_dut;
		stimulus(1);
		stimulus(0);
		stimulus(1);
		stimulus(0);
		stimulus(1);
		stimulus(0);
		stimulus(1);
		stimulus(0);
		#10;
		$finish;
	end

 initial
	begin	
		$monitor("inputs clock=%b reset=%b si=%b output so=%b",clock,rst,si,so);
	end

endmodule
		