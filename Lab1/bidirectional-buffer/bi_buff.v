module bi_buff(a,b,ctrl);
inout a,b;
input ctrl;
bufif1 b1(b,a,ctrl);
bufif0 b2(a,b,ctrl);
endmodule