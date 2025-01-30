module tffd_tb();

reg clk,rst,t;
wire q,qout;
parameter CYCLE = 10;

tffd DUT(t,clk,rst,q,qout);

always
	begin
		#(CYCLE/2);
		clk = 1'b0;
		#(CYCLE/2);
		clk = ~clk;
	end
	
task rst_dut();
	begin	
		@(negedge clk)
			rst = 1'b1;
		@(negedge clk)
			rst = 1'b0;
	end
endtask

task t_in(input i);
	begin
		@(negedge clk);
			t = i;
	end
endtask

initial
	begin
		rst_dut;
		t_in(0);
		t_in(1);
		t_in(0);
		t_in(1);
		rst_dut;
		t_in(0);
		t_in(1);
		#10;
		$finish;
	end

initial
	begin
		$monitor("inputs clk=%b reset=%b t-input=%b outputs q=%b qbar=%b",clk,rst,t,q,qout);
	end
	
endmodule
		