# sky130_ngspice_reram
Utils to support simulation of Skywater130 open source PDK ReRAM model in ngspice using OpenVAF.

Includes:
1. Patch for a well-posed Verilog-A model, moving from numerical updates to differential equations. Ideas adapted from [1].
2. Install script to download openvaf, compile model and install to ngspice folder in PDK.

[[1] T. Wang and J. Roychowdhury, ‘Well-Posed Models of Memristive Devices’. arXiv, 2016.](https://arxiv.org/abs/1605.04897)
