module JKFFlop_tb();

reg clock, rst, j, k;
wire q,qbar;
parameter CYCLE = 10;

JKFFlop DUT(clock,rst,j,k,q,qbar);

always
	begin
		#(CYCLE/2);
		clock = 1'b0;
		#(CYCLE/2);
		clock = ~clock;
	end
	
task rst_dut();
	begin	
		@(negedge clock)
			rst = 1'b1;
		@(negedge clock)
			rst = 1'b0;
	end
endtask

task inputs(input [1:0]i);
	begin
		@(negedge clock)
			{j,k}=i;
	end 
endtask

initial
	begin
		rst_dut;
		inputs(2'b11);
		inputs(2'b00);
		inputs(2'b01);
		inputs(2'b10);
		#10;
		$finish;
	end

initial
	begin
		$monitor("inputs clk=%b reset=%b j=%b k=%b outputs q=%b qbar=%b",clock,rst,j,k,q,qbar);
	end
	
endmodule