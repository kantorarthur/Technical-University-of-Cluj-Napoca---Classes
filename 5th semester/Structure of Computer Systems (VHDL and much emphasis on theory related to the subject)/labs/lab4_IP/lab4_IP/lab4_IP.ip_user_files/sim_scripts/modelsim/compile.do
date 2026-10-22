vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xbip_utils_v3_0_16
vlib modelsim_lib/msim/axi_utils_v2_0_12
vlib modelsim_lib/msim/xbip_pipe_v3_0_12
vlib modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_7
vlib modelsim_lib/msim/mult_gen_v12_0_25
vlib modelsim_lib/msim/floating_point_v7_1_22

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xbip_utils_v3_0_16 modelsim_lib/msim/xbip_utils_v3_0_16
vmap axi_utils_v2_0_12 modelsim_lib/msim/axi_utils_v2_0_12
vmap xbip_pipe_v3_0_12 modelsim_lib/msim/xbip_pipe_v3_0_12
vmap xbip_dsp48_wrapper_v3_0_7 modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_7
vmap mult_gen_v12_0_25 modelsim_lib/msim/mult_gen_v12_0_25
vmap floating_point_v7_1_22 modelsim_lib/msim/floating_point_v7_1_22

vlog -work xpm -64 -incr -mfcu  -sv "+incdir+../../../../../../vivado_bun/2026.1/data/rsb/busdef" "+incdir+../../ipstatic/hdl" \
"/home/pel/vivado_bun/2026.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/pel/vivado_bun/2026.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/pel/vivado_bun/2026.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/home/pel/vivado_bun/2026.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../lab4_IP.gen/sources_1/ip/fifo32x64/fifo32x64_sim_netlist.vhdl" \

vcom -work xbip_utils_v3_0_16 -64 -93  \
"../../ipstatic/hdl/xbip_utils_v3_0_rfs.vhd" \

vcom -work axi_utils_v2_0_12 -64 -93  \
"../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_12 -64 -93  \
"../../ipstatic/hdl/xbip_pipe_v3_0_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_7 -64 -93  \
"../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_25 -64 -93  \
"../../ipstatic/hdl/mult_gen_v12_0_rfs.vhd" \

vcom -work floating_point_v7_1_22 -64 -93  \
"../../ipstatic/hdl/floating_point_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../lab4_IP.gen/sources_1/ip/fp_subtractor/sim/fp_subtractor.vhd" \
"../../../../../../Desktop/lab4ssc/temperature_subtractor.vhd" \
"../../../../../../Desktop/lab4ssc/testbench_stimulus_file.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

