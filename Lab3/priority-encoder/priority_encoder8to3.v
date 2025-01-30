module priority_encoder8to3(data_in, y, idle);

	input [7:0] data_in;
	output reg [2:0] y;
	output reg idle;
	
	always@(data_in)
		begin
			if(data_in[7] == 1'b1)
				begin	
					y = 3'b111;
					idle = 1'b0;
				end
			else if(data_in[6] == 1'b1)
				begin
					y = 3'b110;
					idle = 1'b0;
				end
			else if(data_in[5] == 1'b1)
				begin	
					y = 3'b101;
					idle = 1'b0;
				end
			else if(data_in[4] == 1'b1)
				begin
					y = 3'b100;
					idle = 1'b0;
				end
			else if(data_in[3] == 1'b1)
				begin
					y = 3'b011;
					idle = 1'b0;
				end
			else if(data_in[2] == 1'b1)
				begin
					y = 3'b010;
					idle = 1'b0;
				end
			else if(data_in[1] == 1'b1)
				begin
					y = 3'b001;
					idle = 1'b0;
				end
			else if(data_in[0] == 1'b1)
				begin
					y = 3'b000;
					idle = 1'b0;
				end
			else
				begin
					y = 3'bzzz;
					idle = 1'b1;
				end
		end
endmodule
		
					