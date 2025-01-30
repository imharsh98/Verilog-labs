module priority_encoder(I0,I1,I2,I3,I4,I5,I6,I7,Y0,Y1,Y2,Idle);
input I0,I1,I2,I3,I4,I5,I6,I7;
output Y0,Y1,Y2,Idle;
wire w1,w2,w3,w4,w5,w6,w7,w8;
priority_circuit p(.I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7), .H0(w1), .H1(w2), .H2(w3), .H3(w4), 
    .H4(w5), .H5(w6), .H6(w7), .H7(w8), .Idle(Idle));
binary_encoder b(.I0(w1), .I1(w2), .I2(w3), .I3(w4), .I4(w5), .I5(w6), .I6(w7), .I7(w8), .Y0(Y0), .Y1(Y1), .Y2(Y2));
endmodule
