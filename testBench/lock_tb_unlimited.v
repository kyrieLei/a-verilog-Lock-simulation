`timescale 1ns/1ns

module lock_tb_unlimited();
reg clk=0;
reg btn_reset=0;
reg btn_0 = 0;
reg btn_1 = 0;
wire unlock;

always clk = #5 ~clk;

lock_top i_uut(
	.clk(clk),
	.btn_reset(btn_reset),
	.btn_0(btn_0),
	.btn_1(btn_1),
	.unlock(unlock)
);

initial begin
	
	btn_reset = 1;
	#10;btn_reset = 0;
	#10;btn_1 = 1;
	#10;btn_1 = 0;
	
	#10;btn_0 = 1;
	#10;btn_0 = 0;
	
	#10;btn_1 = 1;
	#10;btn_1 = 0;
	
	#10;btn_1 = 1;
	#10;btn_1 = 0;
	
	#10;btn_0 = 1;
	#10;btn_0 = 0;
	
	#10;btn_1 = 1;
	#10;btn_1 = 0;
	
	#10;btn_1 = 1;
	#10;btn_1 = 0;
	
	#10;btn_0 = 1;
	#10;btn_0 = 0;
	
	#10;btn_0 = 1;
	#10;btn_0 = 0;
	
	#10;btn_0 = 1;
	#10;btn_0 = 0;
	
	#10;btn_1 = 1;
	#10;btn_1 = 0;
	
	#10;btn_1 = 1;
	#10;btn_1 = 0;

	
end

endmodule