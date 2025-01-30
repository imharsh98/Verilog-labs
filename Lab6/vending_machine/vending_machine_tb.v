module vending_machine_tb();

reg clock,reset;
reg [1:0] coin;
wire prdt,ret;

vending_machine DUT(.clock(clock),.reset(reset)
				,.coin(coin),.prdt(prdt),.ret(ret));
				
parameter CYCLE = 10;

always
 begin
  #(CYCLE/2);
   clock = 1'b0;
  #(CYCLE/2);
   clock = ~clock;
 end
 
task initialize();
 begin
	coin = 0;
	reset = 1'b0;
 end
endtask

task delay(input integer i);
 begin
	#i;
 end
endtask

task rst();
 begin
	delay(5);
	reset = 1'b1;
	delay(10);
	reset = 1'b0;
 end
endtask

task stimulus(input [1:0] j);
 begin
	@(negedge clock);
	 coin = j;
 end
endtask

initial
 begin
  initialize;
  rst;
  stimulus(10);
  stimulus(10);
  stimulus(01);
  stimulus(11);
  stimulus(11);
  stimulus(11);
  stimulus(11);
  stimulus(11);
  rst;
  delay(10);
  $finish;
 end
 
initial
 begin
	$monitor("Inputs clock=%b reset=%b coin=%b outputs product delivered=%b return_change=%b",clock,reset,coin,prdt,ret);
 end
 
endmodule

