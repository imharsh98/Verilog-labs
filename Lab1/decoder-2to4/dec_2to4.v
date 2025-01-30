module dec_2to4(a,b,en,d0,d1,d2,d3);
input a,b,en;
output d0,d1,d2,d3;
assign d0 = ~a & ~b & en;
assign d1 = ~a & b & en;
assign d2 = a & ~b & en;
assign d3 = a & b & en;
endmodule