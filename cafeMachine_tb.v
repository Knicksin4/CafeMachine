`timescale 1ns/100ps
module cafeMachine_tb;
//inputs
reg clk;
reg[1:0] in;
reg rst;
//output
wire out;
wire[4:0] change;
cafeMachine uut(
.clk(clk),
.rst(rst),
.in(in),
.out(out),
.change(change)
);
initial begin
//initialise inputs
$dumpfile("cafeMachine.vcd");
$dumpvars(0,cafeMachine_tb);
clk=0;
rst=0;
#5 rst = 1;
#5 rst = 0;
end
always #5 clk = ~clk; 
initial
begin
in = 2'b00;
#20 in = 2'b10;
#10 in = 2'b10;
#10 in = 2'b01;
#10 in = 2'b11;
#100 $finish;
end
endmodule
