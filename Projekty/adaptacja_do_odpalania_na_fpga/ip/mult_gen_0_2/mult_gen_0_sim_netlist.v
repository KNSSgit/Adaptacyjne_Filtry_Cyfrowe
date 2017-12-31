// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Sun Dec 31 18:25:25 2017
// Host        : DESKTOP-A13IS9B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/adaptacja_do_odpalania_na_fpga/ip/mult_gen_0_2/mult_gen_0_sim_netlist.v
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
lB136MapEHYzk+AgrMogtHjL2SaqY7iqCkmNPTGjGmzwpChQToje1yiHwisORw/UaizFqaWeXiL3
qGYj2jMo6vNNFSKM6FF0LLcjZDMyROuiBgbttVYNhJyRSF2EpzIw73IchWt+6W7Jse5MmG8xM332
IkRwGD5J3y8PrBKfoE5jHF6PM4KrvNRm/RCuqEI+wj1xgrwhhMSXORLS5bgzlWeAlwFTOi0LWQAJ
Imdn+FvUpNpmj3E49xBLiJvMW/Tuk3K+aq0YI9vCdqodq5fcVncTjil9B2mFLQ9oEiQZkEMPCJSM
CzRp1a/H+uVtlulGMJctCD0U8DpGua03bckJoQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
3FE2PHKzyEAJ50P+kuqG+1OKtaG/zDre3BTrqhCt/utLdE+QCiZqo1E6zQLew/ipI1QT2xd9/4xP
m8D6J6a66fPYJLGq0kQnBOjHO91Qui9+ACYwmKZnp/OhIeYMkHzxjIlTBygpK8UefvmYO01Y0U6X
txGMaPxpNxzTpLtZW7xSr9i5oLHABBT1xZq5UA2kpRxmdUhkM+XXEKssKxVhgT1yVNS9DgSaASg8
T6c+Y+U9OpebHgZl2c+D8jpXvAVNAhR+ZXM7KNxJxDcVI8jWrnyUAy3aPdeWUSnSyMii8PNdUQqE
SRTAy5Y/tg6UkGkF05iiBQzt1sYDBdM7cWIRTg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22016)
`pragma protect data_block
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
WBUwWFXxfq/9XGGx7p4=
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
