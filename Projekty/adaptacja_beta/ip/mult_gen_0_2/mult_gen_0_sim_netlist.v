// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Thu Dec 28 16:16:34 2017
// Host        : DESKTOP-A13IS9B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top mult_gen_0 -prefix
//               mult_gen_0_ mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_13,Vivado 2017.3" *) 
(* NotValidForBitStream *)
module mult_gen_0
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [23:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [34:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [58:0]P;

  wire [23:0]A;
  wire [34:0]B;
  wire CLK;
  wire [58:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "24" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "35" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "58" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_13 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "24" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "35" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "58" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0_13
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [23:0]A;
  input [34:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [58:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [23:0]A;
  wire [34:0]B;
  wire CLK;
  wire [58:0]P;
  wire [47:0]PCASC;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "24" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "35" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "58" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_0_mult_gen_v12_0_13_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
dWWkLS4MAxTabZJf/z6PdYqCAGBEFl60TKb71Rh2J+7fWDO/9CrkzmRY6MvLyDNa6XcNwmyjo+vH
IT27waHJUw==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
PStuquU0P15n6Yubm4HMz3YAXAHDJepiOAryzYKQSHrg15urbj1rVu7aY4DMfqLAeOhhBf2TxCH+
9b87ufCRohY5ifOwzlMpKd1I3Si+/3GUzw9K8cI1mIMThIsp8ehAXs7z6PmPe8fpb58yK53dOUFC
FlXVFlQ6H75gMzv2rk4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kwri0+QxipG5A83IfKXbnNqYBPHFYGaIsFL2KUvt2+LL7U18MJTQM+vo3V0pETK3opNpZ2mjFhXX
ZzMyYH6qWunSiWYrhs76sXNQ6knBLUhyk1u3tR5DMBXeoO/LVNQv6j3UGT0axEDoKmA+owk75POw
nrWnrkyYKkBEjVQZp/KPABPhhmASMkggWTXY3g6g0xQjGCQ+VxdTkVKoA6XMhNWaRzxDsRy9OUbU
oxP2nChnJTZkuYS+wwzHiaJ1lvMrtfYzNGg/Kwwtey0hN3IfMuVmf2ekPAKJQbUdvdbdMnS6FRz2
0u1JY8tUdctyWIwH3hvfVDk66bxGiWjLknoPjQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ESY/ZH+AOdR3bJqVthBiqNmS1Jk9vG9eNoc6T4mvQxABeWInTaMFH5NkdbdUlHov8eF7SmZE70WB
4IRayOKfvPxA8JUbj4JtuPw5Z4chCBY7T1gFg85KCLWBceRIQFqhSQS7Yp5ruOHM1R3lABf0DrmT
pMIKsz09QJbnVuBRr6EcSYXweqOMVf23gE+j/5QrN3W3+YU4uOqVekWMf+NXuLpJit85XZmiXOP8
MLPN6QA6ojsaqurh6u0qqqdHu0ueB2zuQJUF9OY7BElgqWCuKnmNopoG6VpfRlow3aoOnx0BItXF
4WZA0b0UvdATxN0d9vul2AZzEkxuVibl5QhmEw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QU2aH6P/xI2F+KTH+343BxpGAPnWdbPeRjqVBInBEYpd+kSziCSub3j2t6XzCbhEMu7Bz1gAUEpo
Rz9cEAi8Mhig12ELCTQBLt97IIIBB3EMMaYdXYFuALnAdGET5Ls2k6BA+/reYpsZPGJ6N0G+rIP2
xOT6QhtjQ7J0/d4KKdSBMFWxpl9bBh77/oLyB7lgZZXOH5qEh/fQj1XmVhY+VKLQAAgJU6AdPvaS
aTUfNcvM2zkAICgPbm1M6JoBZcHBu9ktB06412Ip0F1kmmDtlQsv6MxYdIireAvAN5pJySI0QCVM
9z9D3cJYBl/AoBjSk6RhPa6oMfZXShIgwATRFQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
QVcKNT3uT/N+TRIZq6fZRukT5w/zN0mLW+8srEKbzCGBtUWWAfY/ZXcAsiFOAUT8P74Eem/5yLlJ
NCqhFDs56cEcv3DUmVRq19feSFq5jL+Msg5JbEWK1Q4def4qnJmLvbdTedENrnhiab7fS5umsdXK
mhSuM8LyfzEDuEodUPk=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nndcpEnL0nNbk8F4xWqpm+K5naMnFaJozpsJN51Ns0zsRSSUESxbqyxF13pa+9yK3A37adCOywfl
yNwUoQmpZcxHTWaDgNBWp0wt0aOJr+62A/yO4qrxnVqJGbzacN1x09Ssxtj21Mjkl7vJ7j+P/GzX
4iEjHQzZU24x5XwW/no4kbj+s28zKN71Rf1EZCiEdnAoPS9dCC6orFOYwwSg68oXF/eLVXo4zFJF
NV6pcjlZlONhbZsycUyqLAAH8qqHB6dlnSHMbkHqjlIByg78JrwEUEOe5dYxw8YELwI6Y5pZwv63
0s6oFSRksaznFGTyhsiGLv4RmK42MPI2MyrLoA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Xc1CgcCAEtiZmlVG3EsDK6Sko8iGs5RZTVL0aPwOailF6v3h5c0ljuE6c394aa/d+RilWSmp44mu
Pni6Ul659u8W/imqLT2TWm94uzNrJGu+uuf/UvdpaKYeLqX/V7hfu3OJeLt+sPQNEFqRu1tPo+qG
2H4xYRNlHdWJWWibT33l9yRQBi3NwgJQSoZhFVK2cygyUkg1vnTusQexLB+Ca++fk+Aw7LCa8aql
mg1Sg7ugWIxJKRp0hiNz77H/8we+AXzQpo51LQLed5K+zqtu6tEk4UKfiakPc0dheEqSM4JMCPgP
kvINk3yVjd7B+aOb9QRa/dgMCXLFsG6BPSGg4A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
b7ThVqFSFxgbzf2QfH1JlBbdsUA1Qd6sTD21jf1QQrwo10rj5OL4B5ODKjtrku2nBFhAXeN8RXGt
BfxkhgJb+Kfc9PJdM789w9dzrBGoPnMoW+f+sy79h3Nl9Jf7kAzsW1XUwXRSR6e6yiKwuT/F/ywX
mh6SkxtckjhMBlTe7e2NWPo0m2IzFdppJO6K9VCxJOQjCqqe1Wplj8y1XgaPBd+EZp1UBJR+1e3M
WgHgHTkX+GYG6wXawMEZ+Z96hFnF9EEZQrm/5own35reYZNcmfwBKdXO+UYaa5zTYGCw4RwSCQyy
tWIJ5jd949OLCN+meIftwRC2s76F1kj5DooUhQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 14272)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

endmodule
`endif
