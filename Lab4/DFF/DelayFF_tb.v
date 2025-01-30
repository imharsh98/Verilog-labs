module DelayFF_tb();

	//Testbench global variables
	reg clk,reset,d;
	wire q,qb;
	
	//defining a parameter with value 10
	parameter CYCLE = 10;
	
	DelayFF DUT(clk, reset, d, q, qb);
	
	//clock generation logic
	always
		begin
			#(CYCLE/2);
			clk = 1'b0;
			#(CYCLE/2);
			clk = ~clk;
		end
	
	//reset task
	task rst_dut();
		begin
			@(negedge clk);
				reset = 1'b1;
			@(negedge clk);
				reset = 1'b0;
		end
	endtask
	
	//data task
	task din(input i);
		begin
			@(negedge clk);
				d = i;
		end
	endtask

	//call by value method of stimulus generation
	initial
		begin
			rst_dut;
			din(0);
			din(1);
			din(0);
			din(1);
			din(1);
			rst_dut;
			din(0);
			din(1);
			#10;
			$finish;
		end
	
	initial
		begin	
			$monitor("Values of clk=%b , reset=%b, data=%b, q=%b, qb=%b",clk,reset,d,q,qb);
		end
	
endmodule
		
		