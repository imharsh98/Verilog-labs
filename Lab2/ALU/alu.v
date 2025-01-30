module alu(input [7:0]a_in, b_in,
	   input [3:0] command_in,
	   input oe,
	   output [15:0] d_out);
	   
	parameter ADD = 4'b0000, //add 2 8-bit numbers
			  INC = 4'b0001, //increment a by 1 
			  SUB = 4'b0010, //subtract b from a
			  DEC = 4'b0011, //decrement a by 1
			  MUL = 4'b0100, //multiply a and b
			  DIV = 4'b0101, //divide a by b
			  SHL = 4'b0110, //shift a to left side by 1 bit
			  SHR = 4'b0111, //shift a to right by 1 bit
			  AND = 4'b1000, //logical AND
			  OR = 4'b1001, // logical OR
			  INV = 4'b1010, // logical negation
			  NAND = 4'b1011, // bitwise NAND
			  NOR = 4'b1100, // bitwise NOR
			  XOR = 4'b1101, // bitwise XOR
			  XNOR = 4'b1110, // bitwise XNOR
			  BUF = 4'b1111; // BUF
			  
	//Internal variable used during ALU operation
	reg [15:0] out;
	
	always@(command_in,a_in,b_in)
		begin
		case(command_in)
			ADD	  : out = a_in + b_in;
			INC   : out = a_in + 1'b1;
			SUB   : out = a_in - b_in;
			DEC   : out = a_in - 1'b1;
			MUL   : out = a_in * b_in;
			DIV   : out = a_in / b_in;
			SHL   : out = a_in << 1;
			SHR   : out = a_in >> 1;
			INV   : out = !(a_in);
			AND   : out = a_in && b_in;
			OR    : out = a_in || b_in;
			NAND  : out = ~(a_in & b_in);
			NOR	  : out = ~(a_in | b_in);
			XOR	  : out = a_in ^ b_in;
			XNOR  : out = a_in ~^ b_in;
			BUF	  : out = a_in;
				default: out = 0;
			endcase
		end
		
	assign d_out = (oe) ? out : 16'bzzzz;
	
endmodule
	
			 