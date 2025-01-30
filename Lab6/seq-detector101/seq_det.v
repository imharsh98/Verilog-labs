//Write an RTL description for a 101 sequence detector and verify using testbench
//we are considering overlapping case and Moore FSM

module seq_det(clock,reset,inp,result);

input clock,reset,inp;
output result;

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

reg [1:0] ps, ns;

always@(posedge clock, posedge reset)
 begin
  if(reset)
   ps <= S0;
  else
   ps <= ns;
 end
 
always@(ps,inp)
 begin
  case(ps)
   S0 : if(inp == 1'b1)
		 ns = S1;
		else
		 ns = S0;
   S1 : if(inp == 1'b0)
		 ns = S2;
		else 
		 ns = S1;
   S2 : if(inp == 1'b1)
		 ns = S3;
		else
		 ns = S0;
   S3 : if(inp == 1'b0)
		 ns = S2;
		else 
		 ns = S1;
   default : ns = S0;
  endcase
 end
 
  assign result = (ns == S3);
  
endmodule