module priority_encoder_tb();
reg I0,I1,I2,I3,I4,I5,I6,I7;
wire Y0,Y1,Y2,Idle;
priority_encoder dut(I0,I1,I2,I3,I4,I5,I6,I7,Y0,Y1,Y2,Idle);
initial
begin
I0 = 1'b1;
I1 = 1'b0;
I2 = 1'b0;
I3 = 1'b1;
I4 = 1'b0;
I5 = 1'b0;
I6 = 1'b1;
I7 = 1'b1;
end
initial
$monitor("inputs I0=%b I1=%b I2=%b I3=%b I4=%b I5=%b I6=%b I7=%b", I0,I1,I2,I3,I4,I5,I6,I7);
initial
$monitor("outputs Y2=%b Y1=%b Y0=%b Idle=%b ", Y2,Y1,Y0,Idle);
initial #100 $finish();
endmodule