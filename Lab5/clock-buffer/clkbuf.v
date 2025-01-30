//Write an RTL and testbench for a clock buffer

module clkbuf(mclk,bclk);

input mclk;
output bclk;

buf b1(bclk,mclk);

endmodule