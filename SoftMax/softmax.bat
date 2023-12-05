iverilog -o softmax softmax_tb.v softmax_1.v floatReciprocal.v exponent.v floatMult.v floatAdd.v
vvp softmax
gtkwave softmax.vcd