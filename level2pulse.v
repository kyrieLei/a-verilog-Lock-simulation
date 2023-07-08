module level2pulse(
	input clk,
	input lvl,
	input reset,
	output reg pulse
);
parameter s00=2'b00;
parameter s01=2'b01;
parameter s11=2'b10;

reg [1:0] state;
reg [1:0] next_state;

always@(posedge clk or posedge reset)begin
	if(reset)begin
		state<=s00;
	end else begin
		state<=next_state;
	end
end

always@(*)begin
	next_state = state;
	case(state)
		s00:
			if(lvl)
				next_state=s01;
		s01:
			if(lvl)
				next_state=s11;
			else
				next_state=s00;
		s11:
			if(!lvl)
				next_state=s00;
	endcase
end

always@(state)begin
	case(state)
		s01:pulse=1'b1;
		default:pulse=1'b0;
	endcase
end

endmodule


