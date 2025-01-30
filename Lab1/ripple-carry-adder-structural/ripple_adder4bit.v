module ripple_adder4bit(a0,a1,a2,a3,b0,b1,b2,b3,cin,s0,s1,s2,s3,carry);
input a0,a1,a2,a3,b0,b1,b2,b3,cin;
output s0,s1,s2,s3,carry;
wire w1,w2,w3;
full_adder f1(.a(a0), .b(b0), .cin(cin), .s(s0), .c(w1));
full_adder f2(.a(a1), .b(b1), .cin(w1), .s(s1), .c(w2));
full_adder f3(.a(a2), .b(b2), .cin(w2), .s(s2), .c(w3));
full_adder f4(.a(a3), .b(b3), .cin(w3), .s(s3), .c(carry));
endmodule
