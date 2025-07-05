//`timescale 1ns / 1ps


module LPF_top(clk, rst, y_n);

input clk, rst;
wire [7:0] x_n;
output [16:0] y_n;

wire [7:0] sine_out ;

sine_wave sine_wave_inst
(
	.Clk(clk),
	.data_out(sine_out)
);

LPF LPF_inst
(
	.clk(clk),
	.rst(rst),
	.x_n(sine_out),
	.y_n(y_n)
);

endmodule

