# Feb21_sp2024

Bluespec compiler goes from bsv -> verilog 
```
bsc --show-schedule --aggressive-conditions -bdir build -vdir build -info-dir build -u -verilog -g mkGCD GCD.bsv
```
produces the verilog file in `build/mkGCD.v`



# Installing pyverilator and gtkwave

For pyverilator:

```
git clone https://github.com/bat52/pyverilator.git
cd pyverilator
pip install .
```

Gtkwave is available in most distributions


Simulates verilog, and export the simulation object as a python object.
Run the simple test harness in the interpreter (for example in the nice ipython3):
```ipython3 -i test_initialGCD.py```

