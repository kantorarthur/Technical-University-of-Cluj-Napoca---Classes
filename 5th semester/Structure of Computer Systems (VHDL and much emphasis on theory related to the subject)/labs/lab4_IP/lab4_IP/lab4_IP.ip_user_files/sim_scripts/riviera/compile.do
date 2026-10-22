transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib
vlib riviera/xbip_utils_v3_0_16
vlib riviera/axi_utils_v2_0_12
vlib riviera/xbip_pipe_v3_0_12
vlib riviera/xbip_dsp48_wrapper_v3_0_7
vlib riviera/mult_gen_v12_0_25
vlib riviera/floating_point_v7_1_22

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib
vmap xbip_utils_v3_0_16 riviera/xbip_utils_v3_0_16
vmap axi_utils_v2_0_12 riviera/axi_utils_v2_0_12
vmap xbip_pipe_v3_0_12 riviera/xbip_pipe_v3_0_12
vmap xbip_dsp48_wrapper_v3_0_7 riviera/xbip_dsp48_wrapper_v3_0_7
vmap mult_gen_v12_0_25 riviera/mult_gen_v12_0_25
vmap floating_point_v7_1_22 riviera/floating_point_v7_1_22

vlog -work xpm  -incr "+incdir+../../../../../../vivado_bun/2026.1/data/rsb/busdef" "+incdir+../../ipstatic/hdl" -l xpm -l xil_defaultlib -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 \
"/home/pel/vivado_bun/2026.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/pel/vivado_bun/2026.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/pel/vivado_bun/2026.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/home/pel/vivado_bun/2026.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../lab4_IP.gen/sources_1/ip/fifo32x64/fifo32x64_sim_netlist.vhdl" \

vcom -work xbip_utils_v3_0_16 -93  -incr \
"../../ipstatic/hdl/xbip_utils_v3_0_rfs.vhd" \

vcom -work axi_utils_v2_0_12 -93  -incr \
"../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_12 -93  -incr \
"../../ipstatic/hdl/xbip_pipe_v3_0_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_7 -93  -incr \
"../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_25 -93  -incr \
"../../ipstatic/hdl/mult_gen_v12_0_rfs.vhd" \

vcom -work floating_point_v7_1_22 -93  -incr \
"../../ipstatic/hdl/floating_point_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../lab4_IP.gen/sources_1/ip/fp_subtractor/sim/fp_subtractor.vhd" \
"../../../../../../Desktop/lab4ssc/temperature_subtractor.vhd" \
"../../../../../../Desktop/lab4ssc/testbench_stimulus_file.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

