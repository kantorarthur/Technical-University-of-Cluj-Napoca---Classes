onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib testbench_stimulus_file_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {testbench_stimulus_file.udo}

run 1000ns

quit -force
