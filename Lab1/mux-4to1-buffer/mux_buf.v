module mux_buf(in,s,y);
input [3:0]in;
input [1:0]s;
output wor y;
wire [3:0]w;
wire [3:0]x;
dec_2to4 d1(.a(s[1]),.b(s[0]),.d0(w[0]),.d1(w[1]),.d2(w[2]),.d3(w[3]));
bufif1 b1(x[0],in[0],w[0]);
bufif1 b2(x[1],in[1],w[1]);
bufif1 b3(x[2],in[2],w[2]);
bufif1 b4(x[3],in[3],w[3]);
assign y=x[0];
assign y=x[1];
assign y=x[2];
assign y=x[3];
endmodule

