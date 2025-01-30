module async_singleRam_tb();

reg we,en;
reg[2:0] addr;
wire [15:0] data;
reg [15:0] temp;
integer l;

async_singleRam DUT(addr,data,we,en);

assign data = (we && ~en) ? temp : 16'bz;

task initialize();
 begin
  {we,en,addr,temp} <= 0;
 end
endtask

task stimulus(input [2:0]i, input [15:0]j);
 begin
  addr <= i;
  temp <= j;
 end
endtask

task write();
 begin
  we = 1'b1;
  en = 1'b0;
 end
endtask

task read();
 begin
  we = 1'b0;
  en = 1'b1;
 end
endtask

task delay;
 begin
  #10;
 end
endtask

initial 
 begin
  initialize;
  delay;
  write;
  for(l=0;l<8;l=l+1)
   begin
    stimulus(l,l);
	delay;
   end
  initialize;
  delay;
  read;
  for(l=0;l<8;l=l+1)
   begin
    stimulus(l,l);
	delay;
   end
  delay;
  $finish;
 end
 
initial 
 begin 
  $monitor("Values of addr = %d, data = %d", addr,data);
 end

endmodule