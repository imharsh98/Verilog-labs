module dec_2to4(a,b,d0,d1,d2,d3);
input a,b;
output d0,d1,d2,d3;
assign d0 = ~a & ~b;
assign d1 = ~a & b;
assign d2 = a & ~b;
assign d3 = a & b;
endmodule