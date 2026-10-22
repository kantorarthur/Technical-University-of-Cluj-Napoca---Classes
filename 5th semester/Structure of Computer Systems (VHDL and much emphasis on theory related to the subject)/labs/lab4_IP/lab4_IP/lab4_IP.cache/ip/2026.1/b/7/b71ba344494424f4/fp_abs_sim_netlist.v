// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (lin64) Build 6511674 Tue Jun 16 11:01:26 MDT 2026
// Date        : Thu Oct 22 07:29:17 2026
// Host        : pel-GF65-Thin-10SDR running 64-bit Linux Mint 22.3
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fp_abs_sim_netlist.v
// Design      : fp_abs
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fp_abs,floating_point_v7_1_22,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "floating_point_v7_1_22,Vivado 2026.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_floating_point_v7_1_22 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9168)
`pragma protect data_block
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
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 4544)
`pragma protect data_block
SxGi/Pvy4OfwtGhugQh9jLffbkjb8Qsqh9Cz2nfwVUSd/zeL42qjNrzEvycUlf/b9OpnX6T5k4yL
ozyef6YOmRcOZggTpUDoCyrUYNKojj8VxEXnxVI5e0hfydNLDcWT1ky73lhEGv31RjDMMKlVZHuD
ZG5cIzc3/MX/J0UKWTmDnIm7hbQIfOCIYHDtfKTqrcxJGntRz12bmOZSYk+56xLdLzF2cKtTDaC5
atPu+5ylNr5c7DQrUGCnEOZHNhSx+ZoxMKgM/4zj8FJ3x6cu8oLY9bixDg0IaudpaOZgcIlX28KW
b0thU19ss6f6S3CzX2SZMsJyV7OmdqQF7sWZgPKOKjJtajfqeXsybQqLpvgjxqSykAmE01EzFjWZ
QDrg1UlPuB8xETww3BCXG+qosFgibMvuCLV7nCWAztoTwsHEN8hsxwn71AhBJFbTCGWQhw3IwItj
G6Z7La7sTPuBNHGIJUBKIDbFMYudqZkKroDvSEafUPWwMUVELSkz9Pj/PZOgEpknRCKhXR4kAykk
4cCWkw0wpCCqY62Due5Wr+TSXA4qYo6kr8F8rQcgYEfN+4Y9Q+m2FYpg1CuEBe4VC+FR7ZcxWTtp
tQ5aE5txL9RiSUiN7cNMd9wU0vxKy+g98shnHHEO69F9Lyqbp/IpYQlliSSdoWkozIrdJGQP//DZ
9GXzZ6eGUhoBKvWbkIdSl0Z/MUKaz8p6Uh7OWSoxKTJ0bNU+4b0Z5u8ZWhG7yO5Nr28fwFoQ0LlG
LJRgDqTv9boiD3+Xhoj9lLuZrWXtid2WA1uf4gMxbLI7OZKoCz6fxb9LzWQU02EVr0l+hU0OnwSR
hkyT8mXeXSeHZHWoZbkmGBkqa9fIKlZfiYb/zpsZiy+6cFUiTj/T5ASJswOYk5njPqH3y+yNBb2U
ACiE40OR4xwovW28P/eKmrFozcswqESJNgZcXlQ3PE726FQXlHSdBdn9Q2ea680ZQ6bumx/fWYvt
EC14YlJ6KuApU6vYkPDaiZcHqIEzPpntCPqAJp44LTbImtddPIRMNwFOVCa+GarDuhi9zWN4EpM4
5/Y6ub/25bvr3JHsnItDRNv4pi5GL2Vk/I4kJ0pES07clYh0JcoPOW9Pe+RimOhhiCNVhVUMEW9/
TOrcz2FYArvTIK3HZWYa7oVPMObEEbbzy7NxogqHjm9Asu0YSW89KuhOQbKE8QKRkKW5VEXFkYkU
VkeHBPcvwLFm+ucI4wx4uI/hImKnJ1aGFWcM9JdPQkxoJj50Fv0VLeWdGf6SYFVfzmMLFkx7GNv2
/RmpRMCDaqvJwdclkrMK4JdAJHu+JzqrXawlXPfVwlhXiAXvJz7kq6I5XSTTlPkCaaDSuo6f4ryp
/NKPd682mZPFMAl2FONkkal6wjKJJ5p0vsaAl3E1BO4y4HRzwkOncb5OPlTiT6dMYO+BO9k61G32
65FTAY+L2GV3l1OURck5wlqltRddn/2+kncxeSGg/BM+4DjDYQUvq1SD7aCXq169MLOLEyMdDpBH
ewfDk171TIvLF+CiGMf/wjdGaaU/9RkaRW9yBP7y6QDvBy1Qbah9pOuK4tNmoLKsxkvQLkonMOpr
/3m0akWAzvYeyFOMzQhJ9tlaHMRGZxyU5qu0tEvZT2cH6DetrQh1ElALoVeVoIi8WlMHdyulZOIv
8Z2eLXAY46u/2XLm4mn0o/Zq67oltcjuwaAaDtrd7lozOBByS8Y0N+ExJVzRtej4q2lFhfTFw8vp
gQ4vbpDvGmAG5wX21aLSUGOoxugqq/2D/EQTIg8IAJl8QiiAl8NYMvgu97whGo1MJIDqWVaJDxKa
wb3EmG8zpBJ+612oWujGuZBv74dsyPYRAruwrWQ8A34YDGzgeRCRr8uRsQi8F9h39BuyBrLfd/wW
zb5hnJ8huEIXqLpaRIz+5yYz0dDIkgQlqm174Z4/vdGGO6SPbHUsuT13AzLSpg96WLPWGFIdbEZH
ffctnPb7Uiz+RtObQS9I9+ytM4Y88282jdtM3fRFPMbGd9CmuAwJFkbZykXqd9wlml9rurWsyaVv
HEK1KcCeQsqTI5MlP3a83Dto61qyBrjlixgB4e1N4cDYrAazqtVRJEtjPVS9pr4QvJX1eGD+7flJ
rdXspn7m+gNOr2tBd8ROR15VYV4EMg39MFugoBxDa/uz8jav/AHQWjQ45sOKjHrqKZ0vGt1i0xFe
+o2Zb3UvJvMLuY7jg2qOwLicQXbwTN5ZV5al6VR2LM87QVSmfowd4X4N7l1gM3he7HHHa8/VKwhO
E315orrAh+3+I/8YGwHoIUZNkKm/b1FuALZk0xBYGamaStGtOxG7lEzjj8kwqLywEbSr0YUqCDKm
Z0PrXJvYulishudHlsXK8mSEbmRAYfulnklxfacTRwMXVMFJhX/FcnC+06r0QvAWSMLPHB6XwJyc
CVMVCE9urXM/muAsTrP72xdNFYAVSmCYXTMBU5c6pmKUFK2SECh2yd+fsxNWlAy4BMJN7oyCEZS8
wTs56v0fFuKvVScdzYUKffJJXl5/MjrAfb22mv6JKWr0p49qBFh8QehvZCv5k8rJF23dnjX4eOWH
crw3GxqV+Jiy59LBAsNzEpQrf5w5heD60hL9gShAWC3fBj+h0t3+KvtLKlP7DbKnU0Zh+8Gwq+Uv
1ucuFWSriPYZtjlKM4UAHYOWgzhA3F9tJpJaM2bHtOcRTuFJ5vq/U3qxWi6R9GGVFa0xv24IDHt/
BH2IVl4kuFif2Anc+NraORbjAIiOMsbzjKmJhM14KOI4DBanytLHoq+PjrgU7pkdUTSm+5eEHTk1
aS+StrMu6YVQ8WZN1KsZjuNXsTs8KOHGTLa2ThgT/57AySiSl+gRfnIIb+VtfAO1DM3LEkteyKO1
ac4fnkGpgk56R3ir8gaWHRwHfXv+j/FbdrIWpPPdhByfJvGTnZUBYFH4BzPNS4l7AWID0BvzgZkj
HMaPFLYRtbi9yiBtirjmfwdV3+xjkZlFf5Eh++c4XNDYUMzIxVa/A9QTiIhnTav4g82M2XEnVjWb
XFFkewiIydLzK6MVogYaet8nXjt70QNZTqB/JcCwactYsjOI1ZRDTW9q02gH56IeOMO94erZ8jf/
tLf0vDS0Xg2D666MR2c9YUMNKHar7sio2+fwa0F6hIT9zpc0lzVX842oo2PghmfrSSzUuAzCyVp7
3zSCgCsP4aZNNPXq5u7kPkNBHGgFZsEH4+zNJ5Avl2VeCyVHKyYCI0z3lOdg08IN3sD9amx1Xv+d
kqGmQNfCWDLZQYKg8WYGVWV4UXZao4tVvuvvFyvfMjumwZyLZBavCpwMg52ojQQ4UUNkoW/q1nq0
HZM9MGSCM6J5BkP9RaUMZsbBYgw5ET8/CKERxIABvJhP9bN0WPvmy6EdV374tpbDMEr93KYF/ErB
BVPfuwHWUzCweyz0H8FCmtvwuiKr5ga5fEhhFnrK0oLRJCZ2pKGBpYk/6xDmc6Wdy6S3u1iK5+FA
0pt+xKb+vT39E+jUW0GmaGht68YBka7TQo0EAkul6T+dQKXxoyXgdd33mKs1rP5b7uAYjVzjLmzM
Se1yCMaPhYhv61NByKfutQkZrFH6gZp01Q0eK8a5PFOkX7ZLWVvzq3+36IVMpPBZriDxq2yAfz6b
3hyUKAWRmzJoLzTXDEHSS9zCpkaNlttW2LDrAVeS5ljnL1G/tlIUB1sXEnFNuZ99K8vMPAJSHwmJ
W38LyayWEvyG1j8x3bmU7l4ziVZZy7DC/gDS6SNzPDGvfJTwsbg1B8SR4yRUaIKEvshpVIGuVhn+
RpsNu0Ui8Y00n1Tj7YxDUU3n+42j/gBII+dIIWrNTvCYhRiPa18pIbKfA40PN/vY4R5OBiL5sgOx
QrHzlRn+19dsjMpAEK/kuCAUbIUWKviuT0gly1V6GvDh+WXJZXtGKcOgN5WZd8He3fSQ4Ne8M9mr
iCxBIBn52Gre7OLR7zkOeEmlZZSEjenxa8cJ9faephK25mOJgokegTeiaAVNQKAP05+nBmd6yqmX
VuNQVsO4PKj48p5PzjT5qq0gMs0b14tUxuY5+aGfRInsbgmz6qyHyIMwmLVFL0VbmG0bUJgExd9s
jZ8PAPvPYjv/JHLFnedMxHVjY71T/Y45mhx+Ol4hqinPIFVKj9x7uywi1NZ2VW/Z816qCHf+kMDs
9jBgasVZ52/0RcNtS9pQQ5w/zGby0TLYUwVbclj19/EfpWdSHMfQ8rszxIU0/N4tj8U5K8ndkCKB
KBjCh4TqcuhHL1nHszP7/88xY2Rl3FSvnim3ZwNUA31MP51rMONYpObAn1ABXJvVjg/aJyL0jpt0
JrEXylZM8PSS+kt9547nANYJEYieOibu0BmVWFhVgWtWa2nHIqhWh8snQAfn4zhemXtkwjYiaWd4
jKrSJOgxFsufi5RassPFECWh/LYAc6P3x8YK1TynEgt2T37+xarHTPujcJinHb6Uwo/OYSADUZy4
4rAY/snUFeHB6MCHskInVaNEsk08UbPgypoBT86eltavk/buKfHjeDXn3X2dEXO3D9qJTjSWeLc5
a3/2U+a7ospCI4lGCipAj1QkG+M1oHwh8MNhp4eUn5cwgVQ4Q8GPVpKaoi5i1Kuv1mc9hPQoVH52
aZ6FrhX/lM0lZDz2CeyfC8xTWtdEOfj8iGMdHrriptbJ8/FCN3a31ev4/535gYWGW7ZpS7iMzFFX
x40/1F8KyTVJBciXHOdANBeoBtdaqKCXUIiblBiy4BL/Xf6jrM9JQNYsm49n8/yrI57rqFL1EVzN
aOuvQyv7AsAjXE1dnC6/alx6dpSMrqsy2LNqsJDrP01tc1yquFwxW0riu1iFKXe5ktM+LLixyFpY
dfbARIiMmY4wk7LTH2lxcpUx87xvJiDSwBvhx6zw6hwXqe+BX+o5PwkPjk6lnMOJy2yZ+hGTeGR0
adFA/fUmcBxIBjRUnXe5eWGJU6ErxPuK1SnTvE9/Wj06oPSJ49oVE1jcazFisk6MsWhKmDTDdFi2
HNbSVpWd2eyj9dE9hwuqw7m0GaBzJxc7D/BWZN/kjlPQhqbR/gXuriK1Djjnhj8aflxLd50GMdXv
NLbGPMTU+EYLTfhlsftMksD+nhyCPZHRkKgNTdBPN06BNWotkuwm5cDXw+u3l3ch1KaIhV1O0WRP
pej55gywNoBWYTELZKt7+KlB3tYBZzxF6PfgfvdLfZC1YIVwnLab4WJGMJhzpj7x+hpavN+qLmaz
RLO4WNEoD9tcZvO90fJCzxclxNks65AbboJteNuKMFbHFtpfgitkxWDsMJY9pM0fRnHh5bVLWb4J
ORUdBgLNvShZ/tKjbFXuWLIJLmb5RvXU/tGav7XdNfW8vkIJhyS6SEWsgT/l+tl6ISQ/j+OB5j5Y
iP/nImNB3BnWQhW2343Y75pvzIZO1nuuOm+Ivh71QnUYtbl2o9/4GhYotO2SV970xu6kjoL5nepP
o1u9Q87PPy4D/U3FNMNAvmSqh+H+Szr4xjvl2UGdm07VHpoLs8V1I6Gj8rg7ng4Y1nIBNgg0a5QA
0j0QtVW8dHcUsaUrTW7jpODd0EIhGmZzOIgwQkoIh31X0KSgoZweW0WFdqkcqBNiG69irP8mQjR9
hs0hdxTmf750DeXVh0RCIZuvKpMSmVola5r5cyMVpgaQgrD59LLQ0DcG1SGwg7XgFB8I8B/3i1/2
tqyu5RqioSvRFhSQ03YPqi8Gl2aupgSc55V73krs1HDnkbPXGEzuDnB/+azwqpR3D+CFNAbAwUTD
x9vFWNmqlXT0f6WMdPCj0IPKgoMHEMSZ+XwO6VC6SzQgp3jYeySo8Mw90w7PDhs249cC3pa/14ht
ifWdwh4zahpZvwitLapOxiZJh3LJYi1VYbR2OIqa4q+eBAGLsiujL2MhoIcqnFj7V+oIuXr2ws8q
DDO7tGlB544ymjGm/P9AL3lUgxeqZTuGI1ojDJls7YcBlqE4G7Ud06oZCQGUfabpGDGqawxQGW0V
tShM2yIOAFoDDldXrOiZwPD8DbC4xrIdWnOnjFpwYoWhwIcgBbZXeTs=
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
