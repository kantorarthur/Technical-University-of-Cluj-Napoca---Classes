// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (lin64) Build 6511674 Tue Jun 16 11:01:26 MDT 2026
// Date        : Thu Oct 22 07:29:18 2026
// Host        : pel-GF65-Thin-10SDR running 64-bit Linux Mint 22.3
// Command     : write_verilog -force -mode funcsim {/home/pel/laburi
//               Vivado/lab4_IP/lab4_IP/lab4_IP.gen/sources_1/ip/fp_abs/fp_abs_sim_netlist.v}
// Design      : fp_abs
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fp_abs,floating_point_v7_1_22,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "floating_point_v7_1_22,Vivado 2026.1" *) 
(* NotValidForBitStream *)
module fp_abs
   (aclk,
    s_axis_a_tvalid,
    s_axis_a_tready,
    s_axis_a_tdata,
    m_axis_result_tvalid,
    m_axis_result_tready,
    m_axis_result_tdata);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) (* x_interface_mode = "slave aclk_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME aclk_intf, ASSOCIATED_BUSIF S_AXIS_OPERATION:M_AXIS_RESULT:S_AXIS_C:S_AXIS_B:S_AXIS_A, ASSOCIATED_RESET aresetn, ASSOCIATED_CLKEN aclken, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input aclk;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_A TVALID" *) (* x_interface_mode = "slave S_AXIS_A" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS_A, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_a_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_A TREADY" *) output s_axis_a_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_A TDATA" *) input [31:0]s_axis_a_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TVALID" *) (* x_interface_mode = "master M_AXIS_RESULT" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_RESULT, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_result_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TREADY" *) input m_axis_result_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TDATA" *) output [31:0]m_axis_result_tdata;

  wire \<const0> ;
  wire [30:0]\^m_axis_result_tdata ;
  wire m_axis_result_tready;
  wire m_axis_result_tvalid;
  wire [31:0]s_axis_a_tdata;
  wire s_axis_a_tready;
  wire s_axis_a_tvalid;
  wire NLW_U0_m_axis_result_tlast_UNCONNECTED;
  wire NLW_U0_s_axis_b_tready_UNCONNECTED;
  wire NLW_U0_s_axis_c_tready_UNCONNECTED;
  wire NLW_U0_s_axis_operation_tready_UNCONNECTED;
  wire [31:31]NLW_U0_m_axis_result_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_result_tuser_UNCONNECTED;

  assign m_axis_result_tdata[31] = \<const0> ;
  assign m_axis_result_tdata[30:0] = \^m_axis_result_tdata [30:0];
  GND GND
       (.G(\<const0> ));
  (* C_ACCUM_INPUT_MSB = "32" *) 
  (* C_ACCUM_LSB = "-31" *) 
  (* C_ACCUM_MSB = "32" *) 
  (* C_A_FRACTION_WIDTH = "24" *) 
  (* C_A_TDATA_WIDTH = "32" *) 
  (* C_A_TUSER_WIDTH = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BRAM_USAGE = "0" *) 
  (* C_B_FRACTION_WIDTH = "24" *) 
  (* C_B_TDATA_WIDTH = "32" *) 
  (* C_B_TUSER_WIDTH = "1" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_COMPARE_OPERATION = "8" *) 
  (* C_C_FRACTION_WIDTH = "24" *) 
  (* C_C_TDATA_WIDTH = "32" *) 
  (* C_C_TUSER_WIDTH = "1" *) 
  (* C_C_WIDTH = "32" *) 
  (* C_FIXED_DATA_UNSIGNED = "0" *) 
  (* C_HAS_ABSOLUTE = "1" *) 
  (* C_HAS_ACCUMULATOR_A = "0" *) 
  (* C_HAS_ACCUMULATOR_PRIMITIVE_A = "0" *) 
  (* C_HAS_ACCUMULATOR_PRIMITIVE_S = "0" *) 
  (* C_HAS_ACCUMULATOR_S = "0" *) 
  (* C_HAS_ACCUM_INPUT_OVERFLOW = "0" *) 
  (* C_HAS_ACCUM_OVERFLOW = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ADD = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_A_TLAST = "0" *) 
  (* C_HAS_A_TUSER = "0" *) 
  (* C_HAS_B = "0" *) 
  (* C_HAS_B_TLAST = "0" *) 
  (* C_HAS_B_TUSER = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_COMPARE = "0" *) 
  (* C_HAS_C_TLAST = "0" *) 
  (* C_HAS_C_TUSER = "0" *) 
  (* C_HAS_DIVIDE = "0" *) 
  (* C_HAS_DIVIDE_BY_ZERO = "0" *) 
  (* C_HAS_EXPONENTIAL = "0" *) 
  (* C_HAS_FIX_TO_FLT = "0" *) 
  (* C_HAS_FLT_TO_FIX = "0" *) 
  (* C_HAS_FLT_TO_FLT = "0" *) 
  (* C_HAS_FMA = "0" *) 
  (* C_HAS_FMS = "0" *) 
  (* C_HAS_INVALID_OP = "0" *) 
  (* C_HAS_LOGARITHM = "0" *) 
  (* C_HAS_MULTIPLY = "0" *) 
  (* C_HAS_OPERATION = "0" *) 
  (* C_HAS_OPERATION_TLAST = "0" *) 
  (* C_HAS_OPERATION_TUSER = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_RECIP = "0" *) 
  (* C_HAS_RECIP_SQRT = "0" *) 
  (* C_HAS_RESULT_TLAST = "0" *) 
  (* C_HAS_RESULT_TUSER = "0" *) 
  (* C_HAS_SQRT = "0" *) 
  (* C_HAS_SUBTRACT = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_UNFUSED_MULTIPLY_ACCUMULATOR_A = "0" *) 
  (* C_HAS_UNFUSED_MULTIPLY_ACCUMULATOR_S = "0" *) 
  (* C_HAS_UNFUSED_MULTIPLY_ADD = "0" *) 
  (* C_HAS_UNFUSED_MULTIPLY_SUB = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_MULT_USAGE = "0" *) 
  (* C_OPERATION_TDATA_WIDTH = "8" *) 
  (* C_OPERATION_TUSER_WIDTH = "1" *) 
  (* C_OPTIMIZATION = "1" *) 
  (* C_PART = "xc7a35tcpg236-1" *) 
  (* C_RATE = "1" *) 
  (* C_RESULT_FRACTION_WIDTH = "24" *) 
  (* C_RESULT_TDATA_WIDTH = "32" *) 
  (* C_RESULT_TUSER_WIDTH = "1" *) 
  (* C_RESULT_WIDTH = "32" *) 
  (* C_THROTTLE_SCHEME = "1" *) 
  (* C_TLAST_RESOLUTION = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  fp_abs_floating_point_v7_1_22 U0
       (.aclk(1'b0),
        .aclken(1'b1),
        .aresetn(1'b1),
        .m_axis_result_tdata({NLW_U0_m_axis_result_tdata_UNCONNECTED[31],\^m_axis_result_tdata }),
        .m_axis_result_tlast(NLW_U0_m_axis_result_tlast_UNCONNECTED),
        .m_axis_result_tready(m_axis_result_tready),
        .m_axis_result_tuser(NLW_U0_m_axis_result_tuser_UNCONNECTED[0]),
        .m_axis_result_tvalid(m_axis_result_tvalid),
        .s_axis_a_tdata({1'b0,s_axis_a_tdata[30:0]}),
        .s_axis_a_tlast(1'b0),
        .s_axis_a_tready(s_axis_a_tready),
        .s_axis_a_tuser(1'b0),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_b_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_b_tlast(1'b0),
        .s_axis_b_tready(NLW_U0_s_axis_b_tready_UNCONNECTED),
        .s_axis_b_tuser(1'b0),
        .s_axis_b_tvalid(1'b0),
        .s_axis_c_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_c_tlast(1'b0),
        .s_axis_c_tready(NLW_U0_s_axis_c_tready_UNCONNECTED),
        .s_axis_c_tuser(1'b0),
        .s_axis_c_tvalid(1'b0),
        .s_axis_operation_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_operation_tlast(1'b0),
        .s_axis_operation_tready(NLW_U0_s_axis_operation_tready_UNCONNECTED),
        .s_axis_operation_tuser(1'b0),
        .s_axis_operation_tvalid(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2026.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
JRcv0yIuNRD9W6VWrnJNYEk1f/mEjTo8t3MkveNrPiPP4yh8GG/LyLKpEGLqDUzIzQQAtmkk3745
flIuYkQjxahBkBoRz1fAK9ibTEaLCdHoZnohUK0WaP6QfIFyUv7JqqYAlhEZiVm2XhfVY22S+bXw
1SCt5HbD8QsmhCvbeYA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SqiWUkcAA5NCK995a+KavCSB6zwrfO/PH4Z21UHvKV+G2Y+fPY1It4bSwNgqJ+5//ItGs6Y4CL2W
cqKuv60rJntpBBmWmfCDQTNW3WcZWKq6IRYDKkguQGUcG6rivlkF38vdvfzesdEXWI0yqqvI7Nog
DNQU2dga3o1gjfJQp+nLNltehQNUDUHjN1HrDzup+Xywea77nuo9MPLIB6mjlcmznxwDOFQyeT79
LasqWXrAWhvUl3uTmmzgAmyDZ8zXIf0vcl+VRg7v+LuGlNfL9Dcd3hSGcLad0+GM5eN6hlY3s1VJ
wWsFmdSp70gSai1DSehMtlGo884oeXK4WDn3eA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
pVZf0Z2IXGXxIkXJupRFzz9GUc9yfpCpA9HcAo4n33ViwEMth3YVqdQDdglgUJjXpEm7kPtCLGym
h7RuYHmoR2ZNe7/a6+ir8uI/blywtD9sZ/04lyZpid4k7neSz1kVYOhm3Job5FgFK0zbeajUZACD
iSjAKatmT94wdC13p9U=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UKUg9EjrASI+IF7uyOQmpwqMnYEnwcGbotht2zZ0CiVEyvpbrKA9t+y0pjipYTi8fJb35Tt0anT7
lXqcvO6df50fZtYyPrNt+c/tgs8UUbW7IwuwdQn2P1FQAV2vebjrfCPr6ePdt/dvThpJewN2esfi
RD73Fcm4GBXv7jddTtTIW1vgPAjVBQmx0mYo4k6F/ftDxZ7IQDQzql6zMEDvkDVAziz2YZKE2mJF
0Vy9e7DD1MXCn7I+58zFLMMVrNRhtTCiPYZOlgaA17TcikqItpb1wW1L/6X8B/1jbKqF11tBSQ3u
6lp29wXfYUTJd8fO9BA5XLT3pYmV81D+3AsFTw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hRet+970gK+sgFIztApcbJODe7cmPLEt/uDDsEm32WO+HphL8UBOHPdzBbyGP1NeVX9WM5Kg2ghO
JYg2R5qNRZTObdW8YwjndumYs2xltzwpluW56Bb7Sz7Pefa2PPAIPTjcC+OTveQHbUrkD4MzOekD
hOMJ4k1WH3n5puPuBK/ZuVwyyYXshAd4gPDAFt3WUE1MagyaPgVCBm24GycrM89ScXu03/zJYYo3
N0Fvhai2/IU9d8AnLoGa8xZNBM9wOp36ffKUHTZW6DInKysPOyPmyhX0oGaXQWaVqp1R0REai34N
woHLwo4oCmiMYOwUqLkqn2Cs2VyyBgQ7fUlL+w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2026.1-2030.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gLBd9kd4O6cAA8Aa2w4gEGf0QAmyweQBlfSIOCh4bw4/8j3Qf3ktzBdgFtnQgowPFwgrkPEPVBKc
ZjRJ+5OYL4zFfr7iRcLF5xQLFZ11FMQoLKzDLLHrXIOkhrKgF+vfC5wuA7ihPxN6lZILaW3TiAOc
ZnWq/YsFY00BZCGsteGMXizvmW9u2qZDb7mAXn1XC6KurJ+6HcuEHx8q/WpXvETB0t2Dw/f4lTpC
EhwZvNKxDYn8IqxYyMWOPGvKAINY2PSvcUo6zV3U9302Hz5TwVp1JU5Y3lgp57zO6Re02FigAZJ3
Vs+/6PWEItZBLflYE3WYDDNn5FTjMsxywiNXjw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Jaj4ox2k3bgCR9lA7PE5ZfYE7LvVMWpxOt4E9ywWxZAMNXIB5Ye1ukPRTF4QRGviaDMOYVG0yBM3
mgSItyDAqNeruukYTgbdTsBm1GqPSuFwwew/UTqlvfTMPvFovbY3V/GcLoVVryCDDP4JhW/YTHY+
ZYKwXsjMHcN5idG7h/r+qI8fkTYXbY7ITwb3O0fB6gP5BQ4I/0neMxpmtCgJ4GzNM0QIPL0mgGSz
ln6x+qFNpl4wdBt2JTwvQFl3pRFHfPFhrs2DctRYGoMEZtomg7SThkc/w+BwbzF5C+5vvVN2uhxm
Jo+p0P1mi6aPxVzJw+gC/ap0SdRgSjHLSbdK8Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
NCzkSn4c/F4/3zCroXzSYRmgwoziliZO4onQ8MuGTdgd25rDyIA70Cl9UhuKKIQ2HBiN7UKKQr+P
/zt7gzsSYFlB4Wv3kjDfPypgrcCqxWnAfo+gdbaFLEZsuv1KydHWSg51F479Xu3Pj/TGcPIH2Aei
7jFf5BqP6XSsd8zBgxqyZiudf7CxpQFGxn3rx948B7af9iVK8XDWpsDW3heAqTsPqfAQQ4N3/2BD
/zBr7zkDXaCBpiReQklhj0Cj5wHf0xaFyvAyqdmziwtMVVqpUCB5bEmjL//e8ne0njMMTm235mDm
d9VE6mt9qUUmUhaXWsTNlrmQejKsiPtaQhW/lFRab4Nl4ETjeJutIne2W6f47YnSZyIPFT9jCGjj
pxR1YjtWhZ2UgMn2walm8ZQmaXZXZ9l4BnVTPlILtZBxwrK7iJ2jnBr5kjPfkAZS78ScKYVAtSBJ
blSZNbQB6g66kRWQ7NpKqJvXjgbEx8+emYXXeYcp6520GK5oF+ZxsVKa

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fJPw9qAlhwP0Mb4kDaU/OoCQNejOpGPlQRhItOSR+MBkd9JXjLyblgdS7rTx2l1T/K/DMXzo9+Ch
McvAN/2Frji8XwQJMfnWvGRHWG9g2u9E1WUrOpczpmzcWfj5lX/iB0/SacriK5ERJtHvPEV8KvSr
wXk/HEBX79xJltx1SVy3AsP23icwU6dS6zP17flFqsBU6K76Fyweoq2F1UrvdBWn8qdV0OrXV7Oc
lW0Pu0ICms6xitpfWP5H+qBxNDP1cEwjMcSeOUsgYKZTPpwD9vt5udnB2MSZ4oreMEDbd/A2Q/yQ
dVagzjW4eLeoP/oOrYM5Ay0rwkCfMP4pgXW8Nw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Z/UAFnLSVXBf4d3wGj4W8D6fnz0c+2n39mb6eu3YMaHlDH3Mw0EhFKiQWXuCMfCmDuLxTT7+BKYW
XVMEHPt6VYIg4LHnQjM4DWKqIb5FpykgKNeux9MDfRDssRVJROEAJTVggXBp9wsOrXE8MQYAFNL1
93Pi6VjGemoJtGct3S27C7a2N/kJDveVdutL7xWf+fSfj3avz3twpfQgBl1h3tTTwnNM4mVUEAFP
LCcJQpOmY+wgM6O8cqHe5/xh+WUO3Pqq+umv+rjqUXFc5GEEkgBrbiiqOZgSk/0uVrCEuB7Drc2O
5u9c/aedOFCZD0XCwo8A5GweiJzfJvEq8qeQyQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lZy5CVbGveDwqv/m6TImgQUrVpBOulVWGuLTNEXJY4iYzUn4y5SmN50xTEV4dXh2oj9Xqd5PPqky
sF3KDCj3Va4WkoxVbcSK9/2ArMKtGzJeZJOqZvweUlb4qGcw95ti/zZkQdQBEDyQqyFT4XQh38/7
+9WhscUPHwRvWSIKb02UmhZXn/2mA7cQ8aSIhdVPyUEG1kkwXd2n65/a+ku4uIkSFjozsAaS520p
+yyUnvyYoAcraZ7NwebO7M+jQGoyJznh1skX4R/vpz69uCWm4g+9z/MKASZFxAOMqt95DTnmNczX
J2lekS97Dpufs8QZWKx6sxlkgCcoHKto5S9dnw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9136)
`pragma protect data_block
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
HBu27oogPZZuapEcu0nGvA==
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2026.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
JRcv0yIuNRD9W6VWrnJNYEk1f/mEjTo8t3MkveNrPiPP4yh8GG/LyLKpEGLqDUzIzQQAtmkk3745
flIuYkQjxahBkBoRz1fAK9ibTEaLCdHoZnohUK0WaP6QfIFyUv7JqqYAlhEZiVm2XhfVY22S+bXw
1SCt5HbD8QsmhCvbeYA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SqiWUkcAA5NCK995a+KavCSB6zwrfO/PH4Z21UHvKV+G2Y+fPY1It4bSwNgqJ+5//ItGs6Y4CL2W
cqKuv60rJntpBBmWmfCDQTNW3WcZWKq6IRYDKkguQGUcG6rivlkF38vdvfzesdEXWI0yqqvI7Nog
DNQU2dga3o1gjfJQp+nLNltehQNUDUHjN1HrDzup+Xywea77nuo9MPLIB6mjlcmznxwDOFQyeT79
LasqWXrAWhvUl3uTmmzgAmyDZ8zXIf0vcl+VRg7v+LuGlNfL9Dcd3hSGcLad0+GM5eN6hlY3s1VJ
wWsFmdSp70gSai1DSehMtlGo884oeXK4WDn3eA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
pVZf0Z2IXGXxIkXJupRFzz9GUc9yfpCpA9HcAo4n33ViwEMth3YVqdQDdglgUJjXpEm7kPtCLGym
h7RuYHmoR2ZNe7/a6+ir8uI/blywtD9sZ/04lyZpid4k7neSz1kVYOhm3Job5FgFK0zbeajUZACD
iSjAKatmT94wdC13p9U=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UKUg9EjrASI+IF7uyOQmpwqMnYEnwcGbotht2zZ0CiVEyvpbrKA9t+y0pjipYTi8fJb35Tt0anT7
lXqcvO6df50fZtYyPrNt+c/tgs8UUbW7IwuwdQn2P1FQAV2vebjrfCPr6ePdt/dvThpJewN2esfi
RD73Fcm4GBXv7jddTtTIW1vgPAjVBQmx0mYo4k6F/ftDxZ7IQDQzql6zMEDvkDVAziz2YZKE2mJF
0Vy9e7DD1MXCn7I+58zFLMMVrNRhtTCiPYZOlgaA17TcikqItpb1wW1L/6X8B/1jbKqF11tBSQ3u
6lp29wXfYUTJd8fO9BA5XLT3pYmV81D+3AsFTw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hRet+970gK+sgFIztApcbJODe7cmPLEt/uDDsEm32WO+HphL8UBOHPdzBbyGP1NeVX9WM5Kg2ghO
JYg2R5qNRZTObdW8YwjndumYs2xltzwpluW56Bb7Sz7Pefa2PPAIPTjcC+OTveQHbUrkD4MzOekD
hOMJ4k1WH3n5puPuBK/ZuVwyyYXshAd4gPDAFt3WUE1MagyaPgVCBm24GycrM89ScXu03/zJYYo3
N0Fvhai2/IU9d8AnLoGa8xZNBM9wOp36ffKUHTZW6DInKysPOyPmyhX0oGaXQWaVqp1R0REai34N
woHLwo4oCmiMYOwUqLkqn2Cs2VyyBgQ7fUlL+w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2026.1-2030.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gLBd9kd4O6cAA8Aa2w4gEGf0QAmyweQBlfSIOCh4bw4/8j3Qf3ktzBdgFtnQgowPFwgrkPEPVBKc
ZjRJ+5OYL4zFfr7iRcLF5xQLFZ11FMQoLKzDLLHrXIOkhrKgF+vfC5wuA7ihPxN6lZILaW3TiAOc
ZnWq/YsFY00BZCGsteGMXizvmW9u2qZDb7mAXn1XC6KurJ+6HcuEHx8q/WpXvETB0t2Dw/f4lTpC
EhwZvNKxDYn8IqxYyMWOPGvKAINY2PSvcUo6zV3U9302Hz5TwVp1JU5Y3lgp57zO6Re02FigAZJ3
Vs+/6PWEItZBLflYE3WYDDNn5FTjMsxywiNXjw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Jaj4ox2k3bgCR9lA7PE5ZfYE7LvVMWpxOt4E9ywWxZAMNXIB5Ye1ukPRTF4QRGviaDMOYVG0yBM3
mgSItyDAqNeruukYTgbdTsBm1GqPSuFwwew/UTqlvfTMPvFovbY3V/GcLoVVryCDDP4JhW/YTHY+
ZYKwXsjMHcN5idG7h/r+qI8fkTYXbY7ITwb3O0fB6gP5BQ4I/0neMxpmtCgJ4GzNM0QIPL0mgGSz
ln6x+qFNpl4wdBt2JTwvQFl3pRFHfPFhrs2DctRYGoMEZtomg7SThkc/w+BwbzF5C+5vvVN2uhxm
Jo+p0P1mi6aPxVzJw+gC/ap0SdRgSjHLSbdK8Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
NCzkSn4c/F4/3zCroXzSYRmgwoziliZO4onQ8MuGTdgd25rDyIA70Cl9UhuKKIQ2HBiN7UKKQr+P
/zt7gzsSYFlB4Wv3kjDfPypgrcCqxWnAfo+gdbaFLEZsuv1KydHWSg51F479Xu3Pj/TGcPIH2Aei
7jFf5BqP6XSsd8zBgxqyZiudf7CxpQFGxn3rx948B7af9iVK8XDWpsDW3heAqTsPqfAQQ4N3/2BD
/zBr7zkDXaCBpiReQklhj0Cj5wHf0xaFyvAyqdmziwtMVVqpUCB5bEmjL//e8ne0njMMTm235mDm
d9VE6mt9qUUmUhaXWsTNlrmQejKsiPtaQhW/lFRab4Nl4ETjeJutIne2W6f47YnSZyIPFT9jCGjj
pxR1YjtWhZ2UgMn2walm8ZQmaXZXZ9l4BnVTPlILtZBxwrK7iJ2jnBr5kjPfkAZS78ScKYVAtSBJ
blSZNbQB6g66kRWQ7NpKqJvXjgbEx8+emYXXeYcp6520GK5oF+ZxsVKa

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fJPw9qAlhwP0Mb4kDaU/OoCQNejOpGPlQRhItOSR+MBkd9JXjLyblgdS7rTx2l1T/K/DMXzo9+Ch
McvAN/2Frji8XwQJMfnWvGRHWG9g2u9E1WUrOpczpmzcWfj5lX/iB0/SacriK5ERJtHvPEV8KvSr
wXk/HEBX79xJltx1SVy3AsP23icwU6dS6zP17flFqsBU6K76Fyweoq2F1UrvdBWn8qdV0OrXV7Oc
lW0Pu0ICms6xitpfWP5H+qBxNDP1cEwjMcSeOUsgYKZTPpwD9vt5udnB2MSZ4oreMEDbd/A2Q/yQ
dVagzjW4eLeoP/oOrYM5Ay0rwkCfMP4pgXW8Nw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Z/UAFnLSVXBf4d3wGj4W8D6fnz0c+2n39mb6eu3YMaHlDH3Mw0EhFKiQWXuCMfCmDuLxTT7+BKYW
XVMEHPt6VYIg4LHnQjM4DWKqIb5FpykgKNeux9MDfRDssRVJROEAJTVggXBp9wsOrXE8MQYAFNL1
93Pi6VjGemoJtGct3S27C7a2N/kJDveVdutL7xWf+fSfj3avz3twpfQgBl1h3tTTwnNM4mVUEAFP
LCcJQpOmY+wgM6O8cqHe5/xh+WUO3Pqq+umv+rjqUXFc5GEEkgBrbiiqOZgSk/0uVrCEuB7Drc2O
5u9c/aedOFCZD0XCwo8A5GweiJzfJvEq8qeQyQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lZy5CVbGveDwqv/m6TImgQUrVpBOulVWGuLTNEXJY4iYzUn4y5SmN50xTEV4dXh2oj9Xqd5PPqky
sF3KDCj3Va4WkoxVbcSK9/2ArMKtGzJeZJOqZvweUlb4qGcw95ti/zZkQdQBEDyQqyFT4XQh38/7
+9WhscUPHwRvWSIKb02UmhZXn/2mA7cQ8aSIhdVPyUEG1kkwXd2n65/a+ku4uIkSFjozsAaS520p
+yyUnvyYoAcraZ7NwebO7M+jQGoyJznh1skX4R/vpz69uCWm4g+9z/MKASZFxAOMqt95DTnmNczX
J2lekS97Dpufs8QZWKx6sxlkgCcoHKto5S9dnw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 4560)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
