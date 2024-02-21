import pyverilator
import os

sim = pyverilator.PyVerilator.build('build/mkGCD2.v', verilog_path=[os.path.expandvars('$BLUESPECDIR/Verilog')])


# start gtkwave to view the waveforms as they are made
sim.start_gtkwave()

# add all the io and internal signals to gtkwave
sim.send_to_gtkwave(sim.io)
sim.send_to_gtkwave(sim.internals)

# tick the automatically detected clock
sim.clock.tick()

# set rst back to 0
sim.io.RST_N = 1
sim.clock.tick()
sim.io.RST_N = 0
sim.clock.tick()
sim.io.RST_N = 1
sim.clock.tick()
sim.clock.tick()
sim.clock.tick()

# FIRST INTERESTING CLOCK CYCLE
sim.io.start_a = 24
sim.io.start_b = 15
print(sim.io.RDY_start) # Should make sure that RDY_start is high
sim.io.EN_start = 1 
# SECOND INTERESTING CLOCK CYCLE
sim.clock.tick()
sim.io.EN_start = 0 # We don't want to restart again! And we are not ready anyway