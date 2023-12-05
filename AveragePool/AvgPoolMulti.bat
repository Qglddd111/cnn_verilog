iverilog -o AvgPoolSingle AvgPoolSingle_tb.v  AvgPoolSingle.v AvgUnit.v floatMult16.v floatAdd16.v
vvp AvgPoolSingle
gtkwave avgpoolsingle.vcd