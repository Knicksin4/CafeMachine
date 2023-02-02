module cafeMachine(
	input clk, input rst, input [1:0]in, // 00 = none, 01 = nickel , 10 = dime, 11 = quarter
	output reg out, output reg[4:0]change
);

parameter s0 = 0;
parameter s5 = 1;
parameter s10 = 2;
parameter s15 = 3;
parameter s20 = 4;
parameter s25 = 5;
parameter s30 = 6;
parameter s35 = 7;
parameter s40 = 8;
parameter s45 = 9;
parameter s50 = 10;
parameter s55 = 11;
parameter s60 = 12;
parameter s65 = 13;
parameter s70 = 14;

reg[3:0] c_state, n_state;

always@ (posedge clk)
	begin
		if(rst == 1)
			c_state <= 0;
		else
			c_state = n_state;
	end

always@(*)
	case(c_state)
		s0: //state 0 
		if(in == 2'b01)
			begin
				n_state = s5;
				out = 0;
				//change = 5'b00000;
			end
		else if(in == 2'b10)
			begin
				n_state = s10;
				out = 0;
				//change = 5'b00000;
			end
		else if(in == 2'b11)
			begin
				n_state = s25;
				out = 0;
				//change = 5'b00000;
			end
		else
			n_state = s0;

		s5: //state 0 
		if(in == 2'b01)
			begin
				n_state = s10;
			end
		else if(in == 2'b10)
			begin
				n_state = s15;
			end
		else if(in == 2'b11)
			begin
				n_state = s30;
			end
		else
			n_state = s5;

		s10: //state 0 
		if(in == 2'b01)
			begin
				n_state = s15;
			end
		else if(in == 2'b10)
			begin
				n_state = s20;
			end
		else if(in == 2'b11)
			begin
				n_state = s35;
			end
		else
			n_state = s10;

		s15: //state 0 
		if(in == 2'b01)
			begin
				n_state = s20;
			end
		else if(in == 2'b10)
			begin
				n_state = s25;
			end
		else if(in == 2'b11)
			begin
				n_state = s40;
			end
		else
			n_state = s15;

		s20: //state 0 
		if(in == 2'b01)
			begin
				n_state = s25;
			end
		else if(in == 2'b10)
			begin
				n_state = s35;
			end
		else if(in == 2'b11)
			begin
				n_state = s45;
			end
		else
			n_state = s20;

		s25: //state 0 
		if(in == 2'b01)
			begin
				n_state = s30;
			end
		else if(in == 2'b10)
			begin
				n_state = s35;
			end
		else if(in == 2'b11)
			begin
				n_state = s50;
			end
		else
			n_state = s25;

		s30: //state 0 
		if(in == 2'b01)
			begin
				n_state = s35;
			end
		else if(in == 2'b10)
			begin
				n_state = s45;
			end
		else if(in == 2'b11)
			begin
				n_state = s55;
			end
		else
			n_state = s30;

		s35: //state 0 
		if(in == 2'b01)
			begin
				n_state = s40;
			end
		else if(in == 2'b10)
			begin
				n_state = s45;
			end
		else if(in == 2'b11)
			begin
				n_state = s60;
			end
		else
			n_state = s35;

		s40: //state 0 
		if(in == 2'b01)
			begin
				n_state = s45;
			end
		else if(in == 2'b10)
			begin
				n_state = s50;
			end
		else if(in == 2'b11)
			begin
				n_state = s65;
			end
		else
			n_state = s40;


		s45: //state 0 
		if(in == 2'b01)
			begin
				n_state = s50;
			end
		else if(in == 2'b10)
			begin
				n_state = s55;
			end
		else if(in == 2'b11)
			begin
				n_state = s70;
			end
		else
			n_state = s45;

		s50:
		begin 
			n_state = s0;
			out = 1;
			change = 5'b00000;
		end

		s55:
		begin 
			n_state = s0;
			out = 1;
			change = 5'b00101;
		end

		s60:
		begin 
			n_state = s0;
			out = 1;
			change = 5'b01010;
		end

		s65:
		begin 
			n_state = s0;
			out = 1;
			change = 5'b01111;
		end

		s70:
		begin 
			n_state = s0;
			out = 1;
			change = 5'b10100;
		end
	endcase
endmodule
