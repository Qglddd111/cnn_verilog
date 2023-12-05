`timescale 1 ns / 10 ps

module AvgUnit_tb ();

reg [15:0] numA;
reg [15:0] numB;
reg [15:0] numC;
reg [15:0] numD;
wire [15:0] AvgOut;

initial begin
	
	
	#0
  numA = 16'h4000;
  numB = 16'h4200;
  numC = 16'h4400;
  numD = 16'h4500;

	
	#10
	numA = 16'h3C00;
  numB = 16'h4000;
  numC = 16'h4200;
  numD = 16'h4400;
	
	
	#10
	numA = 16'hBC00;
  numB = 16'hC000;
  numC = 16'hC200;
  numD = 16'hC400;
  
 
  #10
	numA = 16'hC000;
  numB = 16'hC200;
  numC = 16'hC400;
  numD = 16'hC500;
  #10
	$stop;
end

AvgUnit UUT
(
    .numA(numA),
    .numB(numB),
    .numC(numC),
    .numD(numD),
    .AvgOut(AvgOut)
);

endmodule