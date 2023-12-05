`timescale 10 ns / 10 ps

module convUnit(clk,reset,image,filter,result);

parameter DATA_WIDTH = 16;
parameter D = 1; 
parameter F = 5; 

input clk, reset;
input [0:D*F*F*DATA_WIDTH-1] image, filter;
output [0:DATA_WIDTH-1] result;

reg [DATA_WIDTH-1:0] selectedInput1, selectedInput2;

integer i;


processingElement16 PE
	(
		.clk(clk),
		.reset(reset),
		.floatA(selectedInput1),
		.floatB(selectedInput2),
		.result(result)
	);


always @ (posedge clk, posedge reset) begin
	if (reset == 1'b1) begin 
		i = 0;
		selectedInput1 = 0;
		selectedInput2 = 0;
	end else if (i > D*F*F-1) begin 
		selectedInput1 = 0;
		selectedInput2 = 0;
	end else begin 
		selectedInput1 = image[DATA_WIDTH*i+:DATA_WIDTH];
		selectedInput2 = filter[DATA_WIDTH*i+:DATA_WIDTH];
		i = i + 1;
	end
end

endmodule