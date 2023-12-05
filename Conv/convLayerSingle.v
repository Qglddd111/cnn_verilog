`timescale 10 ns / 10 ps

module convLayerSingle(clk,reset,image,filter,outputConv);

parameter DATA_WIDTH = 16;
parameter D = 1; 
parameter H = 32; 
parameter W = 32; 
parameter F = 5; 

input clk, reset;
input [0:D*H*W*DATA_WIDTH-1] image;
input [0:D*F*F*DATA_WIDTH-1] filter;
output reg [0:(H-F+1)*(W-F+1)*DATA_WIDTH-1] outputConv; 

wire [0:((W-F+1)/2)*DATA_WIDTH-1] outputConvUnits; 

reg internalReset;
wire [0:(((W-F+1)/2)*D*F*F*DATA_WIDTH)-1] receptiveField; 


integer counter, outputCounter;


reg [5:0] rowNumber, column; 


RFselector
#(
	.DATA_WIDTH(DATA_WIDTH),
	.D(D),
	.H(H),
	.W(W),
	.F(F)
) RF
(
	.image(image),
	.rowNumber(rowNumber),
	.column(column),
	.receptiveField(receptiveField)
);

genvar n;

generate 
	for (n = 0; n < (H-F+1)/2; n = n + 1) begin 
		convUnit
		#(
			.D(D),
			.F(F)
		) CU
		(
			.clk(clk),
			.reset(internalReset),
			.image(receptiveField[n*D*F*F*DATA_WIDTH+:D*F*F*DATA_WIDTH]),
			.filter(filter),
			.result(outputConvUnits[n*DATA_WIDTH+:DATA_WIDTH])
		);
	end
endgenerate

always @ (posedge clk or posedge reset) begin
	if (reset == 1'b1) begin
		internalReset = 1'b1;
		rowNumber = 0;
		column = 0;
		counter = 0;
		outputCounter = 0;
	end else if (rowNumber < H-F+1) begin
		if (counter == D*F*F+2) begin
			outputCounter = outputCounter + 1;
			counter = 0;
			internalReset = 1'b1;
			if (column == 0) begin
				column = (H-F+1)/2;
			end else begin
				rowNumber = rowNumber + 1;
				column = 0;
			end
		end else begin
			internalReset = 0;
			counter = counter + 1;
		end
	end
end

always @ (*) begin
	outputConv[outputCounter*((W-F+1)/2)*DATA_WIDTH+:((W-F+1)/2)*DATA_WIDTH] = outputConvUnits;
end
endmodule


