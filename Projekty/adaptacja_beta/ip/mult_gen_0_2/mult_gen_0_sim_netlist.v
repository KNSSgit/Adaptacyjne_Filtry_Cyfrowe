// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Sun Dec 31 18:17:13 2017
// Host        : DESKTOP-A13IS9B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/adaptacja_beta/ip/mult_gen_0_2/mult_gen_0_sim_netlist.v
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
imqDORvRMzSGwzASsYuNbjLI4pS5dqgHHajozJdif1BGJqhmlRYXH8XDNt85FeUJAgGUH7fs0uZy
jVyk2cuqqxQbypapDfZn523cDoCvDGIAgEnTUcBV8x/zSpSiDqSwMKYBpbVwdVcEn6g4yMHZVcNo
j5s5EdrlrkSp+1scE3xirCU7sna4C3Jhucu06DcCKiFxP+QN36mcDYmdtqABAXVnGqtyC+WBLSJS
UzQFfg8Duwy8IUt01OX8iy74JxARR4iFV6nfXxDv/ZWjyj3zMwIRMQXBCDu85zJUIprFfVaQyB7+
owWS1mlIXrFBJSanr7syCfEQVsLBjgSbXlKa/w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
czso+hvYIffSt2W1zTrg/lAC7mT92VeeihZkvuN+rUqfRY5udkzRcMU87n2XR7C6BttJ62l2muno
bSeKw9sE3vhFZrWPIUzArUXQRKoPLH6xstfX4YFponoxFKgN4+x3u42vQV59tlwfEhtrGJiSrxIB
rvrMeBat0e0BfhyFju8AIp06JABWHFWoqkZLa7/Vx8OVJiPIS37Urihn3icbrUdxOGcgoyv2Z5Mi
MycAD6BkfBNtp3I0Wh+Q4H4ZtwImftUKQL/lQURLl5m5Kd5kOSNDv1OOmGcZyvHLbO3j6JRNiouL
CjThTs1hmHXX6iMJ3adkWLR/ZgGBw54N3I+XTQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22016)
`pragma protect data_block
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
S9Kzu9iIAA5Ooyj2q/w=
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
