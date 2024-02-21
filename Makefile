all: GCD 
GCD:
	mkdir -p build/
	bsc --show-schedule --aggressive-conditions -bdir build -vdir build -info-dir build -u -sim -g mkGCD GCD.bsv
	bsc --show-schedule --aggressive-conditions -bdir build -vdir build -info-dir build -u -verilog -g mkGCD GCD.bsv
	bsc -simdir build -p build:+ -sim -o GCD -e mkGCD


PHONY = clean
clean:
	rm -rf build/
	rm GCD.so GCD
