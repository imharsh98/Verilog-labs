//Write an RTL description for JK flip flop using parameter declaration for the respective scenarios 
//HOLD, SET, RESET, TOGGLE.
module JKFFlop(clock,rst,j,k,q,qbar);

input clock,rst,j,k;
output reg q;
output qbar;

parameter HOLD = 2'b00, RESET = 2'b01, SET = 2'b10, TOGGLE = 2'b11;

always@(posedge clock)
	begin
		if(rst)
			q <= 1'b0;
		else
			begin
			 case({j,k})
				HOLD   : q <= q;
				RESET  : q <= 1'b0;
				SET	   : q <= 1'b1;
				TOGGLE : q <= ~q;
				default: q <= 1'bx;
			 endcase
			end
	end
	
assign qbar = ~q;
endmodule
			
