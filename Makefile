all: GCD GCDGuarded GCDDual
GCD:
	mkdir -p build/
	bsc --show-schedule --aggressive-conditions -bdir build -vdir build -info-dir build -u -sim -g mkGCD GCD.bsv
	bsc --show-schedule --aggressive-conditions -bdir build -vdir build -info-dir build -u -verilog -g mkGCD GCD.bsv
	bsc -simdir build -p build:+ -sim -o GCD -e mkGCD
GCDGuarded:
	mkdir -p build/
	bsc --show-schedule --aggressive-conditions -bdir build -vdir build -info-dir build -u -verilog -g mkGCDGuarded GCDGuarded.bsv
GCDDual:
	mkdir -p build/
	bsc --show-schedule --aggressive-conditions -bdir build -vdir build -info-dir build -u -verilog -g mkGCD2 DualGCD.bsv

PHONY = clean
clean:
	rm -rf build/
	rm -rf obj_dir/
	rm GCD.so GCD
	rm gtkwave.vcd
