module LPF(clk,rst, x_n, y_n);

input clk,rst;
input [7:0]x_n;
output reg signed [15:0] y_n;

parameter N = 32;

reg signed [7:0] h [0:31];

    initial begin
  	$readmemb("D:/Downloads/coefficients_j4.hex", h);
    end


reg signed[7:0] input_delay [1: N-1];
integer j;
always@(*) begin
	//y_n = 0; 
y_n = h[0] * x_n;
	for(j = 1; j < N; j = j+1)
y_n = y_n + (h[j] * input_delay[j]);
end

                    
integer i;
always@(posedge clk) begin
  if(rst) begin
	for(i = 1; i <= N; i=i+1) 
			input_delay[i] <= 0;
end

else  begin
	input_delay[1] <= x_n;
	for(i = 2; i <= N; i = i+1)
		input_delay[i] <= input_delay[i - 1];
	end
end




endmodule
