module full_adder(a,b,cin,sum,carry);
input a,b,cin;
output sum,carry;
wire w1,w2,w3;
half_adder b1(.a(a),.b(b),.s(w1),.c(w2));
half_adder b2(.a(cin),.b(w1),.s(sum),.c(w3));
or or1(carry,w2,w3);
endmodule