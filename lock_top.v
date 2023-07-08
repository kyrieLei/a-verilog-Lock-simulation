module lock_top(
	input clk,
	input btn_reset,
	input btn_0,
	input btn_1,
	output unlock
);

wire btn_0_wire;
wire btn_1_wire;

level2pulse btn_0_l2p(
	.reset(btn_reset),
	.lvl(btn_0),
	.clk(clk),
	.pulse(btn_0_wire)
);

level2pulse btn_1_l2p(
	.reset(btn_reset),
	.lvl(btn_1),
	.clk(clk),
	.pulse(btn_1_wire)
);


lock my_lock(
	.btn_reset(btn_reset),
	.btn_0(btn_0_wire),
	.btn_1(btn_1_wire),
	.clk(clk),
	.unlock(unlock)
);


endmodule

