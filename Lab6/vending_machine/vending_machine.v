// Design a synchronous logic control unit for Vending machine and verify using testbench. 
   // Description of vending machine function: It can take only 2 types of coins. The denominations are 1 and 2 and it can take coins in any order. It delivers only
   // one product that is priced Rs 3. On receiving Rs 3, the product is delivered by asserting an output X=1 which otherwise remains 0. If it gets Rs 4 then the product
   // is delivered by asserting X and also a coin return mechanism is activated by output Y=1 to return a Re 1 coin. 
   // There are two sensors to sense the denomination of the coins that give binary output as shown in the following table. The clock speed is much higher than human
   // response time i.e, no two coins can be deposited in same clock cycle.
   // I	J	Coin
   // 0	X	No coin dropped
   // 1	0 	One rupee
   // 1	1	Two rupees 


module vending_machine(clock,reset,coin,prdt,ret);

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

input clock, reset;
input [1:0] coin;
output reg prdt,ret;

reg [1:0] ps, ns;

always@(posedge clock, posedge reset)
 begin
  if(reset)
   begin
    ps <= S0;
	// prdt <= 1'b0;
	// ret <= 1'b0;
   end
  else
   ps <= ns;
 end
 
always@(ps, coin)
 begin 
  
  case(ps)
   S0: begin
		if(coin == 2'b10)
	     begin
		  ns = S1;
		  prdt = 1'b0;
		  ret = 1'b0;
		 end
	    else if(coin == 2'b11)
	     begin
		  ns = S2;
		  prdt = 1'b0;
		  ret = 1'b0;
		 end
	    //we are assuming that if there is an input combination other than 00,01,11,10, the FSM stays in the same state
        else
	 	 begin
		  ns = S0;
		  prdt = 1'b0;
		  ret = 1'b0;
		 end
	   end
   S1: begin if(coin == 2'b10)
	    begin
		 ns = S2;
		 prdt = 1'b0;
		 ret = 1'b0;
		end
	   else if(coin == 2'b11)
	    begin
		 ns = S0;
		 prdt = 1'b1;
		 ret = 1'b0;
		end
       else
		begin
		 ns = S1;
		 prdt = 1'b0;
		 ret = 1'b0;
		end end

   S2: begin if(coin == 2'b10)
	    begin
		 ns = S0;
		 prdt = 1'b1;
		 ret = 1'b0;
		end
	   else if(coin == 2'b11)
	    begin
		 ns = S0;
		 prdt = 1'b1;
		 ret = 1'b1;
		end
       else
		begin
		 ns = S2;
		 prdt = 1'b0;
		 ret = 1'b0;
		end end

   default: begin
			 ns = S0;
			 prdt = 1'b0;
			 ret = 1'b0;
		    end
  endcase
 end
 
 endmodule