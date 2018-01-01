// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Mon Jan  1 11:21:05 2018
// Host        : DESKTOP-A13IS9B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/KNSS/Adaptacyjne_Filtry_Cyfrowe/Projekty/filtr_adaptacyjny/filtr_adaptacyjny.srcs/sources_1/ip/mult_gen_0/mult_gen_0_sim_netlist.v
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [39:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [63:0]P;

  wire [23:0]A;
  wire [39:0]B;
  wire CLK;
  wire [63:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "24" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "40" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "63" *) 
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
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "40" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "63" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_13" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
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
  input [39:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [63:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [23:0]A;
  wire [39:0]B;
  wire CLK;
  wire [63:0]P;
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
  (* C_B_WIDTH = "40" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "63" *) 
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
n6MHzoZ+5Efktl5ggSOK/y81acl+DZDEo3S9QcXqyQM9Gb2hUSSzJj4nwAKSnFGyPWIi/1q2inLr
nzAcBsknMgDZcJOZa3tJ5qLFeu8OjvjewjIxcWiFATTs0o9jnR0y6hvPyo7wx4EHRdsd+qE334e/
LNiVIwe6l4RKGk3C+63U1q0+3wgiIv2SZNOy1YqgSfITEz6DZan2+SDsfjQHg918cGsGcbdoVV6A
q1yXVYDfptbpB64NCVBeXdggBMkH+mGkBKJ/LAZBDCPP0UZs2x8ohPOA+UucWPoUtTpi7RdVBDGJ
jmLFV6SHumv3z2qCsjA9Ta1uAyEypx+eBZIvHA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UaT5FZSXR7OJabXg7GixEtTs1Y0UycaIW7jPJs9JZhyYrDCFmxh3rhUxSyn+D0dekORUVBVdQomd
pHfFWh8btcVikgOn2LwWdyhMfBGZc6lMeDePZUTPXl/imj3IXF8lL908g+4juGyXVtbj9Do5Q7do
XbFR7oo9Vft951yB+4ojbMe5viDxgsk+kerU0RvIOt83uSQMapjd3J6VCZnhd1d+gK90Za8HhAz6
e0g5IKJc5Ux4VMaR257OhwoWa+Xp2O7Z51fdPOPq51/vu/9cJhtipeaz9vtaFhXhRJbFVLIK+wW5
aaTYgEODg++9YjzVeDDsHJv8V4t8WsNlsyefOw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22016)
`pragma protect data_block
+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
gSE6tCJu5QNgmrhiMgQ=
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
