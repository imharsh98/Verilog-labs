module tffd(t,clk,rst,q,qout);

input t,clk,rst;
output q,qout;
wire w1;

assign w1=t^q;

DelayFF d1(clk,rst,w1,q,qout);

endmodule
