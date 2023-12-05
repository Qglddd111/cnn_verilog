iverilog -o convLayerMulti convLayerMulti_tb.v convLayerMulti.v convLayerSingle.v convUnit.v RFselector.v processingElement16.v floatMult16.v floatAdd16.v
vvp convLayerMulti
gtkwave convLayerMulti.vcd