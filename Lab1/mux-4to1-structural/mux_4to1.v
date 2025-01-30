module mux_4to1(s0,s1,i0,i1,i2,i3,y);
input s0,s1,i0,i1,i2,i3;
output y;
wire w1,w2;
mux_2to1 m1(.i0(i0), .i1(i1), .s(s0), .y(w1)); 
mux_2to1 m2(.i0(i2), .i1(i3), .s(s0), .y(w2));
mux_2to1 m3(.i0(w1), .i1(w2), .s(s1), .y(y));
endmodule