module seq_det_tb();

reg clock,reset,inp;
wire result;

seq_det DUT(clock,reset,inp,result);

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
  inp = 1'b0;
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

task stimulus(input data);
 begin 
  @(negedge clock);
   inp = data;
 end
endtask

initial
 begin
  initialize;
  rst;
  stimulus(0);
  stimulus(1);
  stimulus(0);
  stimulus(1);
  stimulus(0);
  stimulus(1);
  stimulus(1);
  rst;
  stimulus(1);
  stimulus(0);
  stimulus(1);
  stimulus(1);
  delay(10);    
  $finish;
 end
 
initial
 begin
	$monitor("Inputs clock=%b reset=%b input=%b output=%b",clock,reset,inp,result);
 end
 
endmodule
  