module lock(
	input clk,
	input btn_reset,
	input btn_0,
	input btn_1,
	output reg unlock
);

//password:11001

parameter s_reset=3'b000;
parameter s_1=3'b001;
parameter s_11=3'b010;
parameter s_110=3'b011;
parameter s_1100=3'b100;
parameter s_11001=3'b101;


reg [2:0] state=s_reset;
reg [2:0] next_state=s_reset;

always@(posedge clk or posedge btn_reset)begin
	if(btn_reset)
		next_state<=s_reset;
	else
		state<=next_state;
end


always@(*)begin
	next_state=state;
	case(state)
		s_reset:begin
			if(btn_0&!btn_1)
				next_state=s_reset;
			else if(btn_1&!btn_0)
				next_state=s_1;
			end
		s_1:begin
			if(btn_0&!btn_1)
				next_state=s_reset;
			else if(btn_1&!btn_0)
				next_state=s_11;
			end
		s_11:begin
			if(btn_0&!btn_1)
				next_state=s_110;
			else if(btn_1&!btn_0)
				next_state=s_11;
			end
		s_110:begin
			if(btn_0&!btn_1)
				next_state=s_1100;
			else if(btn_1&!btn_0)
				next_state=s_1;
			end
		s_1100:begin
			if(btn_0&!btn_1)
				next_state=s_reset;
			else if(btn_1&!btn_0)
				next_state=s_11001;
			end
		s_11001:begin
			if(btn_0&!btn_1)
				next_state=s_reset;
			else if(btn_1&!btn_0)
				next_state=s_11;
			end
	endcase
end
always@(state)begin
	case(state)
		s_11001: unlock = 1;
		default: unlock = 0;
	endcase
end

endmodule