# Feb21_sp2024

Bluespec compiler goes from bsv -> verilog 
```
bsc --show-schedule --aggressive-conditions -bdir build -vdir build -info-dir build -u -verilog -g mkGCD GCD.bsv
```
produces the verilog file in `build/mkGCD.v`



# Installing pyverilator to interact in python with verilog object

```
git clone https://github.com/bat52/pyverilator.git
cd pyverilator
pip install .
```
