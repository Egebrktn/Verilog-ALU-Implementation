# Verilog ALU Project

This project is an Arithmetic Logic Unit (ALU) implementation designed using Verilog HDL.

## Contents
- `alu.v`: Main ALU module design.
- `alu_tb.v`: Testbench file.
- `README.md`: Project documentation.

## Usage
To simulate the project using Icarus Verilog:
```bash
iverilog -o alu_sim alu.v alu_tb.v
vvp alu_sim
```
You can open the `alu_test.vcd` file with GTKWave to inspect the waveforms.
The generated `alu_sim` and `.vcd` files are ignored by `.gitignore` to keep the repository clean.
