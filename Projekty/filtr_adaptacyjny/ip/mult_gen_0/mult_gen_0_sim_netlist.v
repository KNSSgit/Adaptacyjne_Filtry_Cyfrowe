// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Mon Jan  1 11:41:44 2018
// Host        : Adrian-Komputer running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/filtr_adaptacyjny/ip/mult_gen_0/mult_gen_0_sim_netlist.v
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
JftAxgLFPItj3mVREqpx6WsOTVd8iQeEN0Lnmkn9b3xhVoROZh5ZDSCvdMIMBzmQb5WKb3GeXv60
Yz0apNpRw2i5DXv7K60NycLxHujTJzie1bb+Kf+py2fklb4E9fDSgB7JH/M9I9WiFb7h/PaovEJ/
kv+CelBEg1+VE+CnPkeBBnDZ4B/g00yI8APa3N1n8ksB51xKGhVJvVErqOHQfSNjeJXc8KNkDKea
0FIdYM8DMJKogxuCnO2KTcjSU+oxPNLuPVwHd/DYnKxQAraTJv6YbrIfrNhvTpGSrYl5FSpPcTFz
u8Om52Ce/O4GkXpVfJUSNbRcNGiDT3CJn7XRog==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MYNND1hz99gi7mHW3U/9UyOnCWGOrt/92Pq336GQt4N7e7ZaNA3y18hfBRONYnRkHYLlRsi1BZ87
MKlM5IwSdipCXjuRd6CcmK6q3bT2xWOEkiNUdkjPgSKRfOT0tKHpp3V3Db4Y+6kPWjmuSVkdHcLf
pMiw9m2TZu5mDvB9QWCXDh93kyooIL+NQ2HK3YLxrC/erz6/UJ+wCzYpZsMG55hRBPkHEWPX9YTy
9M26hohxWKvIHyOZCiB0NuVd6XH4XFJnNkdHibWZDY5tOsEz63+94CMW5GubzFPCEzLFvLb2tIRu
WuKtf5SOJwKE9twn+2pmzEvrRV6U7vbGTn2nAQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22016)
`pragma protect data_block
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
vpayHPJSCpwH8gFRgx8=
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
