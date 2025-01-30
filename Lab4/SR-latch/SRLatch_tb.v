module SRLatch_tb();

wire q,qbar;
reg s,r;
reg tempq,tempqb;

SRLatch DUT(s,r,q,qbar);
assign q = tempq;
assign qbar = tempqb;
initial
begin
r = 1'b0;
s = 1'b1;
tempq = 1'b1;
tempqb = 1'b0;
end

initial
begin
{r,s,tempq,tempqb} = 4'b0110;
#10;
{r,s,tempq,tempqb} = 4'b0010;
#10;
{r,s,tempq,tempqb} = 4'b1001;
#10;
{r,s,tempq,tempqb} = 4'b0001;
#10;
end

initial
$monitor("inputs r=%b s=%b q=%b qbar=%b outputs q=%b qbar=%b",r,s,q,qbar,q,qbar);
initial #100 $finish();

endmodule

/* module sr_latch_tb();

reg s,r;
wire q,qbar;

sr_latch dut(.s(s),.r(r),.q(q),.qbar(qbar));

task initialize();
begin
 s=0;
 r=0;
end
endtask

task inputs();
{s,r} = {$random}%2;
endtask

initial 
 begin
  initialize;
  repeat(4);
  inputs;
 end
 
initial
 begin
  #100 $finish();
 end
 
endmodule */