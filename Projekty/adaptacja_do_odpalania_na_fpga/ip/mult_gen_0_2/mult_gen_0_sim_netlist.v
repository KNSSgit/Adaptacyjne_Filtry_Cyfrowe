// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.3 (win64) Build 2018833 Wed Oct  4 19:58:22 MDT 2017
// Date        : Thu Dec 28 16:16:35 2017
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
Ksea115ibAeTI0SaPE7yG90VlHDkSSI2sBH5ewk1ysALaLbT540R6elOYh1aqcNrt6SbOJU/WQ8d
fjHJttvLw5ZV9MCtGH81o0dr/JFISW89lKQc23U40JjYKM4P/TRI8QTxceeL+s9pmVewL7hitq62
Jdp4u6EF+C3rW7aBH1gkkFBr75k/nqpqgq9yiRwcCFEDode+1Y0JM6FBPG3rxXpIdedOEbBlv7yP
GFhFT0rAFx9xJSORQyR1T14pZxbtSZPGka9uR6gNsTvQ0bSQ6KtJ6u/BfzFgPgiP9HOsWw3GKtT1
8dj+Kf8Fnw6XHigzLjgfI1JhGdHkLd29YU8oRQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FnQs4Ec2i9FrNzpufRIzm1QdCLnesR5m9IElXuP9XHmusE7fbeLiif0MtBuqAJgPRYWoaM6HMdBC
mjPujJ82SrsN01VbBhPeCmRTo/8bpIU7riaovYTa9hvNwW1s8jZ8skOBzcyWEkmOgzvAOj3635ck
BLKZHqoWLKaqu4hkolyCakEWu4T2gzvmfWvYeg3D5AgQPm4Iv7pZhMxWgNEXuK25L7JVR1SneiA2
QMDcNzxj8eRJCtKqPXnRdaDFZgYTneWzR3PheHTMAi/Z4XDbi+VJwz88SLBAwZaeKWUGRkcQHJzw
p0atZWGMcCv6mb9Yrz0yJ75hJVxc2gHb84CYmQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 14192)
`pragma protect data_block
nVr5uWLOD5laoE1sZ6MeWgvwL7eyo8JmvRmo8sU0XPZRlkrnoywhJCdPajBgZOS2GxXJmvUnh7Zz
inrQrKK4SBNch2+iqgVucbVuLon894Ve+2DCwPeU/YfiNursVliZwVjUp8f5iSMmGJeyEPIgIcKN
7IInGh78FP9fV0dbcjPjWIaAZkJdNLgO+X6nlRmprewbphLJCBAPy2j3v2llp07YjhxQqj3Dcgl4
1lZ+f0gPlZfAEAUjyDUK3VNrzsUfs3hqztqzNSMVdMrIFfFUsRlKC4Ye81T6xoY5O6e62Ja9G5bO
dQ6YLruc5LJVJTaEZNaIpJdIz2xVyzIEscR8u5AgkjbQEsUE7bP5I4+kON86iSRJPScxmThNpdhQ
KE8sztnTXtEk5HU4VVhRvw/5iSKctKJHJtmvcy0tPt3HQ4Mmz1ivCGRvxlWBPn70vv6PviUPdO47
Qm8EkrR/tDX9UGRrgElIHlKuzC56C5yb2inwjhvMH1JT8sIjDXTiRfjg8b4kogoGubCu/fifWLzL
qwIol5hup/P3l2B5yw/8cdNIufhj7EDN39J5LDd9XSO2vxAjD5AYfUeU2YD5V3wew23GSULH0STP
TAZ5Qv3BLhdjXr5V4rfXr/efqt1busthza8VW6nN9f7vz2o7simxzR4apTWsyVnWxPm8QEzQCEdK
XjdsXcWIN83Cnxw8jftNzF7N4mFDvMq4bSHLsBVAATS4lKfjlEyex2xn9SakBS7CklhorDgFCahv
hb2BHXsMddxL2goVynicogsMLX6y35qlvLIDUgu8vKLa+VCJY30iwkg8bcNAMh6/qzDeUUadfQpN
XxgHwggIdH2n9d3sireH33iygpTcOn6XaRPPWBNkKzMm90ivCTTyy4WHwlrFIT4F0XOqeoRfrBIc
yncYMyxXxcFrQGmF075r60sO7/GgHNeUaCNX9f0ZDl++WdIlu2KmS5CYdcU//Hs6Ce+hZKhgpeAK
uzYJCJpr272owbI8nsC+lPsKFE1W5DeFufF2ymWlUgadns7DaaifuhETm7rzlMYtNmGkYX+9QUCV
Lt4l4NTEaqPQIFNrMT6/Jgc+qa56fBpZvb8UO/Lm2NEUfUi70449MAqUlg/ACSZpf2k1X06sGAo6
fTF42KYrm4xKt5/6i/FkCLomdrIWIJIfKjtBHdxnoN+HgrwpUoKFEd1S2T00iywv5dOBT8o4eLw5
UKJvRrfw3PMK+l+24IWGhWcmbBjKfi6HFnTXhN4EPSSUIIfc5AsESOf1wbBmNK9xLL45fBcF7OH6
MxhFqNXij/Y4JsKYKJtSemPyVtCRYXmWQk8dEpUuca3NcwO4eLArjS2IErnZswiXVtx6xAp/0c3x
AczZvLJb8X2SvqmgWKt/Um2WAKZk0cl44vMI5TrEXHVGqY5A/2fWRQAfMcxwAUXGKBCgNFxYJepD
kotZJ3zZes/6xgoslig6UxNmoXsnRnh7foLGmBM4ZPeOK81aN3xDbMQHGyZ1ibIQhm82imMazjjN
Np/PsMu9Kot3Ewjik4Bzkq8H/TEKpPOKiLbrNdIA7vNUWmX2CqPD+qgf4fIhheeuxYmTxRCEiC1f
fwHNk/Nes4IyBkBuB8PPDf3Y4bTyy1E8sEudgtK3kKU3TFXovB8NZhNPiy8ycVOL/u/i1SYZbpgl
pxBZ0nmkQjO6BP/zUbNkq7VuJy9PuzG+rFZjuolELPRq50/WzpgZ6NatcSb8vbIQNJ1xe2ls4XPG
OIGvPQC9Oa4qDur2omDyf1xafwCKQ+rRomr9np0eoCIlRLwFKkgRqR5CqhtF63HW2+AfdelUDBNV
gmTJExqiVMGoIjl+wg4v7wLcsUWkXfZ2Jiz6NEsPMeb7TvMv0Y8z6nNO3tEm5TxTPx3XXJ1UnH/0
49XArtE3rGm6i/inrcztBtwWYAH6xaTlAhWx8ZwrDqhl1uunZ+KGf8E8QbK7eaCcUkPvW0SR+NzJ
VuY1gicNRmpdNhbfCsFLF1qFfb1e5bDScSftTp1KTp8PcWH99LlCWA6p9HwDnc0QkZj+k1lWy+3O
GDLbw5jR/UE8577Sw7HpWiI1V1/c77XDfiO7j9OmCHZEYYaablw3CFZLUBWwegy9dHfHv6A+hJGj
qSOIlYUV/C0s2IgTg7gZrGbKmDi8HV0dJbWmy3iqDze+aBPFjGiWp/orHfbHgF/NyC2/FJop+VFP
+VXwNOMvhBQyFav1Asus4UtA0GU3WnlaxyKbb0SU2ESd/q8MdDAFSQpy/jq7plMKqsqdC2g72xPz
bGfrTPskUKVzX0hcVpkqkSzEJcE4PDv7g6vxraNNOkMNuXp4C2nuIXKqas9CzyTXW9/AreI8Z4C2
3i/SnA2sTIhhzPwRaknAz2w3CGhGVF6RP3cgeKyO0c+rC15DE1WKQbTHiCyiU7lkSff4fmF+fMXH
GrtMFD5PZI5CtkE9iqPRLirUooXYw12fCusHU+M9rzN4VkqYvpXyNggkI+baBRmrPs4aNoERP1sc
Hf6md09cHd2Af1Rczsh+a0rioFXgwtg60mx0DGdGLW0vkybZFR/eVSf8XFBIVfpDybAhPFnOHsba
EXWapfQVain34IoHDczIfqvQ7osBdvb6DhmtMkXs205oIoBKRqES03psng7wMqaulT7mj/pFxI1H
J7m9yGhTlg4YmWR+MCmgEuIfIzxrvT6swhw1UX6fJzATV/q7Ej7ej6lm1X8EHMKLUmiNDS5g9GSa
3O42RjROljE8LZ7U5jlLphFMAPgkd9gcDOchpYTRDJndk/QIuql9QI2SQK1VnqGjHXsCpdtn5S8r
79UDpV+k9ch+wtplAfCC38TM0omDmtQMI8oppL2ItnVVfdceyo+pxNaE0GzEJ8iNAeaAoC/4UY3G
OqCJjAI0Q2w69Biip/FhZdnl8JIuPmOR8G7Ox9GjKPpHj7xDqJ1xNKXvOlRohhnl3F80w8I/oosq
oK30P5vzn0z6qEKEoXp0bz2Cd2THPhe0lsvzNi5WebKntwxteo1phCrRhwnbh/BbH685Gk7vAbKL
wjy5bt7X/BncP67JsaG2q3ZfeCgEQAsCtBxnFyBgnFC1dwMhm8WsBIgF3Co+qOf1dFhZ78so8LUv
QRMnIVEvGTO2ZXsHcW942iMbRgtvP25Dt7nk+D42U/zyfvOagt5oThjpH6qEnJMFAzX8G/YTENEy
SX6Z77PE/m3KKbOCJGd1RDuNVoUn9EMnT5LXssCqtgZCgblgX/lVpyFEcH1Ya3CK83/eDrScoNCr
4aLQHHyXBIE/8Lm2YnCYjOJ0AgCDhgQOFaa9cLp2Nl3rlrJ8ld8ApslnoKuUxR5UF+3985u7MUPM
OIYWqqhpXZGPo17X3eqNeMhqiDTmxqIwFdbG6syGxFZjOl1gdrZL0A54YasbXzbOYKZ52oGduI7t
0Z4dQXGRd08oWqPUpTfAzr4+ujOUMWdKgkCf6319vDNr0mxPVMa9oydnEQWR30EfVirYWV6xowek
ZAj5FQyQ57qOgXr8Jk3kUUfL27Mpw8/ShE0X0q2lZ0Y37ZDgQPVm3XfLXOLFvtp6rgRVYbAMwzxa
sXqt/9biPv+zeShcaYgVu3HXIGlb460zRXwrA6i5xSekxJG1uRN6RC8y6dlPGUQAoFNTonG4PRSL
4AlrDCiXMz7f42/3C2UFLCmYnzaf2qSftp2jugzoqYiyhtQRlUS0PuN/2RJdTuZbHD8V6UFmZCSt
aznSriNWUFxW7QuhHD5Siq8YtZdVTSUlYaOiy0TgyFkAOz6T9hRxhxV8+KAUlmpVG5aoCHn2XyU5
GftyWmqOHkqxEcWDHwgv0FP2YAYHmiJF9S5G0RXkj8c6d2XygVaWP8RMVaCPCGR5TN0lzkdRT1LR
v3nUCiLxtidAM1xWumUnAl+du4ROucbRHlngRVw/GJIIZCULstQRM685fV5M3AQCkKRJHhuxtY0T
DyRAaqT9VOSbmfd2Hk+6SxHYD///8qKWJUn0OtzC8DVKM2CzK6+EPCf2JyWAeOQrXIs0lh04iXoy
zsL1VL3ZegIHAh68dI0CaiqHsYO91rt8Q/gs+ITLHzQmmhA9u5SHYID3UNU5529saBL1jQiBj/+6
+vAdlhRZq/2l4jxhmmDb/Oc31Xg9D6JHH0DwJ5DgwmnjPUfLgSABjkMXIIfqR9P7v6HOUpI0UINH
OA8Pv9focPz2Fm0JHuR31ldSNC4vB55ejVLI8chO8+AtCcuOHMXn2gXjDDngwo+WQZJXoXwc5Lvd
jySVevRx4FtD9KvkrieDmCoVZVXSTMhOUTVDDq4oNporDcB0SOIz5PfBqtxT9xEmLG4rflBj9zX1
jJtTQRAxJMAiTWaSdzLNRuxSlyCS84YZA9Y2spjKs+K3Pfc+aiTGo2nZaMul3ShiYy3nFDi9Gpvt
jsDr5qKZ+Q1U0wRsDrBrj2Y2rxyxQecLAMNnnfxqrHCvEFRQAMFtVsBJrQCBH8bIuq4gf3HNbZKM
itnKxiKXtjzlL5OPNk7363T1WVn7D2MmEd3CtFPEnGqdFSm4HoHBGtVdmno/cbVWH5IxJ+6Qlys0
bPBDx1LaRReOVsik4Zv3EtkRGfl5Euu5gC1gt4J32kT/QICp4RsujlmdlV4UdRzrlT6cpvuJjdvK
uoKnaiwf4mFBjFeHdS0uPudobt6ta/hxmfyfSBi+v+Ws36NWeB4BriTxA5Ijc/HJSmfG/lXyf3ws
HVE5ik+dB7cexqdsIkY2M1oNBPBewhhY6/VoSkG+kpAurYU4tLOVEuNM04x9XnlGv1Zq2MIJqHmd
ah/fLtGIIIqTfsNlXl4D+6y0f77XOd6eyhKT+5oxxj2X0tKTV6kXRlHXg2zVga98XnYEduizfyMH
k4rbxiaJXrghi/+8r9JHIHEsl9yJIMaNr3KEBLunhEBCiN8SRoKTxDLh2fLPhmaE0DkT3VS6hq5P
lAxBFlipsRpg2PVI62NQ8lMJfpg9KT3i+JRvsX15wtQN+LAEW6LbNpUQFi/xyKr5pqPbLCWIxLhj
nwDn/yPcriB50Yq1w8itnOYzq/edmmkEdsa4UFNU+OoNEHKE2PtdLg90EDdyR82ny/y9An6uKnih
9rJsuKEQO7hB3InuvuI0qQafgewXi9fJvKdG3RYWm4AqKDDuSK0yzsD5MUNJlHk855im5A+zByoN
KE8AvGZfV2pZqvYwzD3AiTqmVmS3ElSp8vfMbwmtvr+HnnbjRyWxtbc4B6EBBXYzW11IAmC7ChD7
HFZiAfTjIbM/1yYjIj43lIl3cDU5DY2WwSARsbajQUUdK+y/C/jNsq6hCqKjDGTjJ1OEIkbAnARn
Uyzkx09j9oMhoL7sKcC2/ZF2N68CjeRuCIScGV8Rqvskvd8rQmL3OwESX7liLa6d9xpH6mV8pq9v
SSVWLQr/bCUOf/ih3QBdGbFIv9O7Qwlsz7m98MVI5Yg1BHkrwNfBige8reHfxCoHFGsqJjQ7FYc6
zXC9mJUKA//QUALVDvbF9ZgkvBFxiRfsdeba9obgqNzBW4GNkDYfVzMwR2u3jqzHZSmInH+FrXpc
Jk197ektL7L9DvEFcnMAx6Y7zc8nUQFPMx4cKUeIi6vNPZFmHbhz448MQwwkkOLl0mWvgAHMl+7e
X7CIMwP1c94x4tQYOE1TzTcsTjARdgpwl7HtpNxwOfEp+rrPR5YtQi2QFhL1nMlfQir0DbFIjsx8
Q8OA8nQncH3biPLUdzzvZX7XwQsLs+I+xyjBjCes6S96N2A3cqbUyeLR0OrgDbIlHMaNm2EY98Fd
c9SGzKq7xT4N8pUlNFTO4eePjAlM5JHttk1LBwv9o9JwHhJamA9J/VROr1z1yrt9dqI+zshIiEuz
qqYfRSW1fg1Hx03fLStWNTV5WCaC1nD0+GilW+6/4NmxNCwIYWRmROJj7YGF6zMmKgeARUlZp6DZ
76D7D8gdGC1xpcdF/sX0QSH7ubTV+VCK0Aw1KGi42eTsIm5gWCc1VjVic0dLKUTAuXRxj8M4ISfQ
aAyr6LBwXQlTtj968Bb0MEJnO3vHdYMOfRDblvFSX+AZpq++hiHJv0mZLagmH7psfIpMPUUnCEzV
G57rSkk6zMvOXEoSjc0aUziUWZ6SrAkxsT9qhcP7ioM9XHBamdiqflkHlah54/GAcU6PsdumutgA
Fkys5Rz9mfOpumeuupTZaJcoGI7ssSoLEPE3F2G1ADsYYhn3o853H2HAHCJFp31rOMp5Vc6R9zyv
U+XOCX9MoMGZ0ZLKMzUvd/543T5lCAIPxojL4H+D+4IhI1613jXUBHzmv+Bj2fO2hFknLEfiBzxs
2onYbKVninKP6UG5YrvbFEuLMBnhY8YAiR6CI1nKBbfUZSw8YC0ioO4cMXI2CecVDiAMb77j+MRT
keTVcU6evmoZMCDMDi3YHnScYos/khsNM4Ih3fws70DLJGg1KrHMh5rmcf7u1qQTzp+z/KrbmKRC
YFVHLCo7KluXFDz7RTmjr1BgEGvKmsNdCeDt2NQb+F7Cw3tj8f8eT6QstDosuS6vZJN+znP7wNKi
VbeoeNYjj1Ph/jao+5cqXJR0+wstblYNRGQ03R/I8oG1nf/Qf8RItOT8kKmpATFBLL1PYuuoqlhT
sHybGWuD2EgQJck0yDJEq9tVMlLqUMrGR6T1xBAOSCzk2O9k9WY8+gDaM1jhcFCIQj8IncRZoRuW
1Gz2ugt2FzX1ez5HdwS5pLQPYeOzU/UBxwJtOT9L+HHhXQk22MGeb5Rog+0/hshYJ16q3rDWSyIk
BPk21K7/RqijkJwiLkZFKZFWAc4hj2OHVhlfIqU2t2w2MUBHVL0rvnVrdqOj8Du1BPh3eSJAwoM+
LdFFPZP/SeGiNq/6A1jE7CqHjtZ0Zrq6EyrYFk1xattC7jLv8FzB7FoVyMwEHiUKKRhQY8QXNEK3
tRJlSRAfCD0BxAl0wsjJKyhPawrTeivFkgqZSjAymceHRni8lwrwy+JMDngrgvSY12gpUCpY8aO4
fCmkdDJwY4XdtX57Cg+AfVoSm6GWCTd3XvigZDjFlskS1k/BVtnkoO17gERoZL+w7DBF1cwOzk2h
d/jsNOP3lVUkI+PWXG9PW9M2ZudAhr6zd/Qbt353/CCDYcVTNol/hIRUIapi2O3nu6ftej279FWk
21WyLzT8kCzrzYbwP6SUYvTqw6RM+3PJED6Z7wSZYonI5Jk/iDD7QLgOP7VqGMAjjWngXB1o7rON
B59cg5VEGYmB03+rhknZjt6mtaPedu71IDI+KCwUHDaSZZaF/op9DdbmXPcJAz28gtqyJsUmd+SO
2/uI9ZLINOfei9j/giP7AVGp8WLqH8dZhFgrU7FkJZDwMhrrpnCbXzmcE2t10mS+cHvWoGLLbtHA
fZ7wSwindYyuu6vLdGAYYvcprlwUukmPpQsy+wwmTz+xCTq2uTU9a6yq4T6xbbnl3Tul/oT5mbLu
UHV70Z66TkO20f2zpLoEhfHMJd9kEengtQu1jT+N5vza7WYvflsyAJH2QgeOHzityk9lxnUsxd1W
A2IBIjXmKLbUbrESwqPnrfye11bAGlCXV9CzRofBIwSBfQVgQLPmf5Ioj1tONoA4L83vKIpbfUCJ
ERBgUozOA+BUeC3I7l2vcwBMCxSAxC8smd4VvdO7OzteDY/5Zk7pkf72LzHh9DEW683wO8vdkzcY
yUdGtVTGCZoZOpOULQTW8uSe9mjJaDD4lenvztq6aA9qVlB+mw7UXvk6GD95nJOPuhChwayrYAcp
AOEPwyzl34DWbfMjQaAOKYpzkAr1mSnmRDjf2VpsjmyfhTmNk9DRI+IhOFNMDe6HjXXFyzpMkmaA
SJh223htP83SCbc3cY7O+crBZdFbxKLXy4E9YQr+lNCw0J5xMM53QqrEHWUgCedcXN3P/OqvsW1P
IVJG8e5166jKROzeuHk9lD/k1ofsNdyrgwpa+ogQoYnj9Rda17sZxDWbELrZ2LC9MqbthzMAWjTY
Ko7DwtHGv28iJ1HAU5H0dkmTb8ZdtYxKVJjjOg3VReFsG6TlAmK4nQwBmonMUL/P1P+mMgydcfys
hoVgDw4wgTwfc3aWOXREGOMH0YnVFPheuJnyaa7hZpqouHXu/wefeYHyg02CinyIOPCxeGImzMqS
2mkeLsMKkP4Gu9LVQq+5Y/W0U4RqMQnPSIUOIK4qOKa+jDAbeEUlm1xVF/s9GkllDeSW0ArESCn1
jS6DtPw/FDBQCI+KaGpK/ODjkP2zi7/tWlPnHSxHFVNfWbWNosbQonE6AW7iXHY76HnrBXc6iuRO
fJY21mzJFnxaAMlhNRfOaxwdIy2vfBCA9jM2sGy5CfKPXRKiXux1m4DB/mvDkAk8LU9pXxqVb0ww
SJO3BUjcwxRImngEiglx1/+H9OUVZrjLDGdpOD+f1IiPPCMHDlYvyQcVRvkdA/cXiIOO35K6eyIk
k5bZNKsw0fC8z/x7QNnSkljx5pRCtb0SZk9sYNlHhHPKRVbkVWjcz+vFVnZxJ/rGBWkFP6Y7uMwR
9y+yabAIKzk+INrRCxN01oezWtCgV0EN7jdmMiHJ/U/eTZoTl01ZcDJc7L6m2bQgMBhzpbPaqgFx
Ic7ZaIDKXSt2eIG4Xw0KTTlA1zfWGOrjPJIU6jW6qP+FQGNFZnKF4+52eJlpkK4WUYB6BfNfCNcP
LW2wYthJXLTE2uxnS7Lk0brtKzg6JqwrjXW3WMeWo0EoqwDMR4z01GPKw5hhZsKlZNjN6LeCkLAq
id+JJmBD123gcE/6oGwRzTl7wQgY4G7phL2kmai7NJDFolapKjcO4Tlzda8AuTxFZZc1+9/4WzZe
sm8QMaXLtRcq4d+mth2ckW7yADsvtWJ3fCOuKCP+3YStRZpr54N79c3SYQ0qTzKpH0NMS3zUUnio
npbLkNkqLv09jGYZpPsE6XGf8eH70aXaBNR5vRWYwtsrBadsJmJw/90Dd7hqA0VAAKsYDPScB6+H
I3YETWJN/9SZ684sW1T4bDGfWWdhe9/Ey90VN6+kqO9xcQxb1TdQlAF735lsq8bbC65/5sCYTqI0
E6miHHyJM1GGqn1NumOwacSYyTnauLr/6uA5RUbTiYIJ77AqRemenpbqYLuNg+5bVf7QacOcVh2T
2SnMAPMWOp/H7WVLmK1PYAU5LT7CldDCfOz2h55Mjr1zE/CxPt84I9Yj+nTqgPb3d750aW1hM2Jb
n7E7l+MDzBJMMdJiKKRYUbqavGiEI4GFGUW1ulbwtN+gGuysObHiP6EJAgYP0suqA89zKQDUqYpR
iu2nMheMWIQuew95pfZH2HesI6srMxkR+x2TNiaDMhtwi4NGZOdKZ7PY3gwi3xUO1MNn/msqBZc/
WezKwJBam4cIRwnqb12tlk9IvC8yG83xhGjFJ4nLQll9As2VTnNB64tYi88oFKIdqLxS8182u3wK
Mk1ZfPguG5ylo6278mcg0wZLDYB5phlOlrNpeDx0svuFqnDkimtdkEKRQV8FdWolML7vNwx0ZsEL
xZWCpw67TIABEJJ0N6E9Rd4BgP4YxxCqIvsb7wkidSMPbLnpc8hLENfVf8e9ehErMKacfH2BUs4p
7dHOjeQx0ELhVlqPIjtpijLk9Jt/ih1WvPT6V0gcW5snJskmcCeI34U+j1rgZ/IwwGz1d+c7OjoL
4M9HSr5yGgtXXvVBh3e6ljR8qPTgW1Pr53wJKyWj9iGH7pkQfyLPJXDalBrE9NgDZcgPcLuTCueE
NU1s7936EastuSZzbueRnE9DA0HXuiGygDDJDjYSKQrhLuJBNmoF9qOXH8D1nuo8KOT/hx32nooT
mjrxVrVGY731gvkg5vJtdK4smhIxikkB8kUC4cquNGVwyfmGcb1l6B10qMTfEH/PtnhAo1kQwet8
vYO2F4xs6ftB78W9Wp5/zngysjKPzIE523v/cc55QIc/PSEzOFbEeVTlVKCiAbUobGyxqba05/qO
pLWbLQ51TnPbVc7Eg78aarfVqxtQWM0Zup9tDfAVdyg2/9L9vKX6pBSzrFREnmOiuaVCMsvzoJ4i
x0oy0AeE+VY24CT8hKhGLBCe4IGezgw4VQhFPf54xRw/4ea+6h9s54prWXLAH6j4CZyHoB/Diucj
r9c6AUCPrU98OlwNFpGfDHK8KvfiAP8ujgHsd9IwHPCRY4lcM+x1nBfIOBgRUbkIgTo8egRSUins
sI0sX7+xnBg49mOoiDeQWuhGj8bzEsp+4h5ORRgciQhLeN2RLAej7QYb5jXe8vllOExwepdGDPA5
cOYPC4WW1yKrgdKcLnHgIoEsWYCQuwZgeLeVxMEjtIqaKLvi571ec8P6ecHjsL0owD5nqCR/quTx
E9LA4P5uj3+HqsS2fJJRBRvpiTPBLSRwvbd/RQ3AHl4dT8mCa28KPZ/Er3vRInPyuSc6IOc+RYWN
MinN5LWGSV+WCSLKbkvGeeiQv/mJMuZr86/4M4Rgr3i5Hj4pRtWHf51PhMbCEnwiBpGTf2T36sXt
hcn3LNQKcpUB7IVlMUbYT25w0vvFCFU8ETwySzdjY6oXYazCw+4kHlltQXaGHI0EEO6OL7l/TsiW
pIySzCS8ShwLSVe8tr8KZwaDqsDda7Ss0uz+IJX24aHASUomKRNhPfWMzGTFRsTfOXKhdM3T4Ap0
ZM/HyoSe+FMMHXMUiAl/lwGUxAu4ITucrOaf8rJV3toGs1eEOE53MVw6ZlAmKlElJvHd5L8miIIM
CaMLbfKdDFA46bWPUBRRFdKaJHjiRe8WCz6RCpBMzc7AG03g6HozIgLTcQTAokDrj1pLCR6kA+PD
ew+77PRJJ9f+MEW14nGhDumxrpW6D+BR5t9fPooV6NISJcDryx1qNnXa4IHvnjghiMf7hqEXVght
yErw9afNxN/nfmJVvxTUKdmJvfs09WN4peGEOVYdkT7rcsxmcbj46jB1+KzCKyGpSevuZ+zw3PyQ
XQPC9WCgY9owGVWX20/ufWXvqvKdAFJ5NwUhkS9Ue/5ITqEBHbzxl4m3hSn2+9PPJWue1GNlGMlu
yPokPsyuHRhRMYpW9qtGw+TAmN6Otz5Lb+5NdqnSa10hqA/hI28ouEoDJI1cagj8/hjbKbf8rXcU
gMMFmau9eB1+uaB4JZQ8KzbVOHqsIVS5mO5pZvl57tWWCVQZA82krOpY6xhCswIheOBRZ8T7gltK
lfq9jaUNOFMVJb49jiyZrnV/z5LT1PK16Q/K9eHwe3y3i+Ac4i9unjeyduPh5UzcGBIkq+1lD5ve
+fh7OSd75YfCU2sPrSIIZrrRIqYJBE7Ba4wt5p+yqiLwHr+1EIUzo4kfTqdjcRZwR/oOIYFyMRX0
j52XLzHa6n+vT+09TC5cr+JPc6Odv6XtikgND8RhQoNlW6KRT7Sc5Q7OQWd/OVmEwQqZ8v+W5BhE
sJ2WWQzn/6Vyc+rDm5BbmUVFraRAx+XEGa+hCvMvmG3VdXJsoQ+nhTTxY/ZR2ugILP4gtq/cjF6N
K/2PB4VpvNOL/dBYrM0ulOiK/bTZP2nDGp3eWUUujeTTDkZhptsFnwlBLtVniI1NLD+EoCnLK+5P
0AIYbnBi3lI3P+dbSkYHFbWtAU/H/v2Z2nCY0ciCSX954usd0kB6p7uDjMLgNGtQ8F1E0BF5lngC
jZRFi2AADl2mjLXnf3mRAfc40crQGoGhW09Hck+iHz+iAcNGix+8Fp4Cwgbxf21k8RSwV/LunGta
BjTZEtrOPVIt920iCPRZIoduc2OT0XV0mir4KfWIHzVJQHv42cpuf6wTZ3GoOCGHRJAh8pxTg6oV
lc8c70HsUn4azQCBkDDa77Ep31q4mXFxuOMhYNflFQwNKJaohgPcDtgbwojY+JqVRSslbZh/tI5A
t9V1m75PWBt7wdtMx4OCdcv7hYLVwQwX4PYziTaSsS4CxLE4iOr/aexghs0fsubbPqFAgm/Au97R
2x9Ls4DA4EoOVlF1kxI08XqxGbTd0pOx9z/o2NjaNtS0ySOx5u8iPJXQ4HzoYrZvQJZlUzCkpaLa
KGm0Y7+WNus+u08KxoOqtlJDo0pka4MIcR18NiUTv1o5T3kKYacyonUVnIIXK8cORFOn+8osSVPI
7UV9+lNEzvvHhKHLs4tbqQM4vgy/AkquSW8H8ZICc6rI6slViGFYHWIq/xPvg6PYXwqAhxQa473V
JL1tWKFL4AXU1mHK0JP0MhPYy2d2QwOcJeaVGvLBMxiaeaK4OXXdCSRtOHLLVn+hPtaShw1P0aqw
6VYq9fc/IWuiS0OkFj6hPFvZmvIzCSzzzdqNwR0gQ8jJONoMuniWsaRLPWFrVRENjcLuSzXAKL7u
pxFBfr59s582YqKnMNrWsYZsEjmJlnHh+7hkljrrD6Cm743+rSFYwugo5QdsNyKuVa/3ftv6YfoZ
qU+AsgdfiZj4jAmyUQK9bBN524XrHGtmcb8y96u2SjRB+DQKYfEnpz8OElg7lsTnhsDweQPcaHZF
pXiYWk9T4G/9PwjaLJKBIfwbneNSuPEDdwB8OZ0nEq+yrDD3dxIPoiiIeqEbdMBfdLMHc3w2jazf
ZGALrmtxKcbo53Nx4VkzsIESeL7LycfR8O0JrQT09tuzGFt7NbllPLU0Zal/XIUtF60EinfGdcjc
fxJSH4Ho//mq7rfisMqvICgnugLBez3WYoqO6jN4cm+9LBb+kicNyberwaZfL0RAKWf7RCLtZaFx
BlIlAvwUo6U6DxaM7/OWPspZXu/pJ077svAmDS46ygQS0r1GTtUP50HR36B2z9fSp8w+WDOXKvWj
cPJoKwnqV6pyZ8ymVjuRe8HefKv2LtsDLHvX4BPuTfHEb4o7ImQG4tREbTI00fw7+GKUFDSFPFq2
jnzBNPBeCZOCn5fEoDGaNSy5d6Jl5Tlkks9nJaZ962ZXD2BG8X3rEknoYmZC7bW4n7H3TEl0Ppy0
AWowXm2dWav46w/JD6jP5Vt6otqNiOCSkeTfBnBKh5U9sSjVFTSc+HzRpxDVkSf+rsF58dA562cq
eUN5Ppa4iZ8iz6g1J3azCSPg5pqjUHdTHGexXrBnZH1yAaFAO0p888YRQFmlVplQt3I+MHyErLX+
AI/bU/CO3Q6QjvNGxeuPAvsjWgANLFfmAYd3xwZtPajLBjEVZAc3xtQwjUFhKfStq1Pgx6fuDqNk
NPf7XITB9C1jsgZ39+USQ2UQrBKKm5zmWBK27KE6sIVj14YGZ+HhX2UFrWi5K0t1x2mSEBtxRgZn
h/i+gcvCJhBRxKMS0eoZxJzSNVuMqMZinEjxlQhFt5KUMn4DXaHNZGpamkA+N8ySNB0clO0Q32T+
2zPMSu4swBVQwUP7SEJtZeAG+tSNLEzpGas2jEHISDeEycbN8t9r6jbUcBQRo8Rl391hgIE2lFLs
ueShmGHi0G4Jm0Wt/zn7glimGmZuB5U+lnsyX3YxQgyue7GyBfzQUEB/ikZ5TS5KUhs2avZB2G3/
IDn19s32qYJ9xNL6SNwC5+q0jFOW5FpnRdRXLwLnfdKYefU7nK1ijGErhxA0JyyTctfCDdL61AO3
6edaR5V1J9dt3wggDpBVcDu4vNUG609lq6+2QTPutOF0cEQrAygvPs+1iXmQNmCgtwun/9kxiYcK
fd7swaBpSnX5eyEW5JyEL/w7tiy6cGoFhPMmlyLf536/kzDzyrwWd0SJAPnHoi6v7Ahqq9vocAa3
oQowoeAyERun0potFOEr9pObLTLG/6Z7uqboRJ5F0CLZeQ/dAnddgQ0svkbb/jeN1xDI/83tu4Gs
O1zzQuXwBFWzYXhdatEHfdHDePrfztitxCv9bXxxHpfiDTh5GnkLcAt2u3YVjB73KUyQ9mwBUv+j
yzyewkIMx0BdTx2FzwbdK5easNS2xQk6ONvEPvEgMP0r/umlfpK79V8Ai4mrJV2VryyLZx6vvC92
oPiitzIZZz+TcXUXHbdPvmqb3MVULPJ4cAxoQ+h6Y6gAkfWKhnqnHWhujzPZkDMu5nu9Qn+GNmvd
oe2X6dG0C3SIvnT68XINHgteB0E1fDcPz7KgroGKqlnqAWu6/swV+6Iy5n1FdG59iuXqTy2ph56l
nAjijKSp8VDfeNs3nBpf+kW/ngOF49/cE+9/Evh8fMV56oMzQqI+HVXlnCC7fl+JZjKpdeOL6Oq7
vAtFR7rwQhG0gaco4z0LnqiUmTJkR1adU6XbE4vUIfIVVuEF5BxeCRfmasq9K/rhEAYk9v1rp+0b
8bxQMN4JdOCQLYjXpdYPwavW5EESTYrZ1obXflHwXH/xl8tYT0PRS97o3IvhO3ORUaoOokMnRib6
UjgBvdUylyGAbKQiE6060w9CoeElnT/0iuMV6/RKGIBXN63xhDO3yH04BYeAsKKEjyRX5kSs6rBR
kqnj15Ri2/8+M5d7yP7GIW8L4Z0Kzppc+IkCq7IXq1z38DG3DigSYWCWZElBPlF3pN6gSOF8y4lC
f4qipna2PRntttXKth2TdvxyllPvjaXQns/4U4Sw6idyTFSvzIrb5FjXve02Ja4Q69b/zP4DXSNf
KrgV4q3xySbU8nvAGbXwpEuBnhFZpVammtQ+a7b78NvJ3sPjch+FHM2L9wV6tEUVV77B8/DHehJ3
G2DUlNt0FlZm+aHEgJcnnwRIDezYYd3EUKv8D68l6PpZbfRf8GdotjT2k4QyJAIUz768D4qFkPfk
e5SOjk01RD1kUmf5M6ixBN/rHA9uhgblCpwV/mrogSnHqJEGm2/8vbXaDSN1ufWWhSdnPIwXdhSe
gcXohay8az0XUxHEIhrMCyx9rLXjtfMPpuTwakxo7jtFL6Trpc8EGXzIa+3/8zUHB1sFMQ7JnjaZ
ArsYYQc0uH0paNVZhlpqN2fA4lgd4igdEX/wlmKMJrWYe3hR7O42NynT0XdZ//hsro7NDiswnbvE
M+QczTb0felAqOrfaoATgClid23aNskqfuwquKi7oSlvNajTsVFaHivSYk3+cWQeel2PoXNuV1m8
JoFLhmQFc94hqM9OkmseODOyKitbb0cHFR2omNWZXNtxrycY3YkGYpquTEDaZC3RjaQqEhipi091
FqPiBs2536mHwyaaHKQ5wtGuptFa4IfgOkJ7FsgGHKdxWJX2yctw7Gh/njv1PZBDu7mjgnlrdKsX
BcBeOOZVaNPre2jbVyMOsHwgjPdvnkqZKhDOmEXCjhFqR+kQGTL03DW+WVSeo7l893hYY/N9H4qF
VZapvjf8bMZL6SRfGjp7/Mj6ltJ+7uNQAOqHq9utwnT4VdNM+6dERo6jrVf1OerBnHKArE+Xv0ZI
S/Rmfa6e4YE/SDfJCd7vkx+/L/s51x/yCo5JLA0bggu/3D+TzssJnPiqEKK6dhKT0tm8fwlecwS5
03xQ4tJfDdCCGch5lcfjhu25fhdinQJn1T9/6aKEA3TonMGF8e8GqVg3s4Vu9M1HyUrUhTAfH238
mKwjwQkV7Dvj1cNgZVrAyH7kiQjfoWyyTpjLTKXRJrnvHNc/o8DI/pDzZJUGRNM+gIfsvSUmOCar
LcY3TwKEvrj5h4U5lOt1X4F1BdOOJRVqF95s441jk3Af/nul9HxCQ+H897not4pgij4voCDFunTS
cUhwdNhNUmhm4rF7CBgXhzZ6o4FXyIuL4fyxqc/rPQ0mTUlbJMdREBQPxBjWiJln1tt7Ja6MaauC
DPQIBYUCYR2e2Oel7g86iD25qsC0T0sCrPHJ37E6xosQ+c4ZT8sfe1KxoC3L4xPB/Dda+7lRoZYH
EECmcJwr4aWo+0Ra8Pc9hxrhb6G9TlSCFLaQ8q0P0GEc5lwnv9b5ehFpfAM8SeKxKt8CPfLLa3UF
5oORw+EBspy/JHSX/W4ODrhOtHZa0nd7yH3lh0V2QepgRI6ndEEVWmoGmwma1cLpkcRxU4ER3d7M
IGjfqIPJFDDWel2SGJ7ALVZyXrDnHjCHdCyaRXZNui5LI3z1BN4lCaMswctl0F3sRHsFg4naMzce
J1OtNgTYEj3pfPtzi6ddWXGczsTVTdhHgDrIe7jInojIxBR7jmXdTpiCchK7+uEjtJDNY7g9uJ37
F2peFpVb51LUCIMYoT5lwomTPQP0tlOYQZ756t+23oZCa9qM1jSd4tgRhmrVG0QLtnnOPyvkMoLK
GPI3bE2Q5CnjDJcZTbaRuBMUFu9Ho3zgifc62MUoKks2LV5XafOM4ievGbwTUbKFnXDBemdG6Tot
dUDTJXRqJvqS9MqdTl9mqLy9sOwFIN3x+dYr62vVA+zwfnpmUohk9mXJdDGamGVW+PwtiheA+2qR
yrA2VZi6YVNF8OSv+ISZObS3H5qE6oF/LdOvrtQx+MAgS1oD5/6ejrXWCMwXCPuXwsl/ybP0oZlQ
bHO1eNWryEiutioY732u4oLjf0AxQUKrhYM33QhjQmeP5xtOyu7AuOpPvyZZS9vKmdyCyCR7KBjv
BtLrpZSHUMVhhfTl8IFdZUgOy4IE4HICcDXyaCGE+Dqx9hJ0NlES+XN7/G/+ktfh48pRawk4rUoJ
ho/qhwa6q5x7n4SQGKOwG3xywa+g6opq2hmb0v+IvfFmzGYvi718PFsXfzqXW5e3DhDia1jGKF3u
iiUGGHPKzCZGCzY2IczwZNc8sUJXcxrDj9sVS6vVdbF9Q+SRIv9E/BVbhDePeEeQ+h9kLFavyz7j
wZ9ZNHzMrSD43VHezL5mH8ex5UIZs9LiBuVUtSQgsLrQWC4DBe0AK+UvHriBNHfAX+5ubIpvrch8
JkO6CRMW8tqNQt/kEmKzBOO0QCpPP03w0yGvw1GEYAZFW0qt08G2HtE//pkc5ogrG97c4iRbPjXA
U2AQMdx/0jZFOM80r2W9sqUA8UqK5j0l3U1Qxt98iUxUuxk/bnbbVu7bLGGHJnOfICDI/AfnpI6O
ajXlYQI1TRRjwfjYqI0wJuWTuY9MwO1ZbapxR6V5xC0rRe9nUATnF8oy3f60aPQXo4RdCMb4it/p
Da5btuQGvHymCleiegQyy5YIDbvElBHxaD3gPh8PP+GILzx5yIjNGMMb+mlFuiMkPOGodXetz46Q
JOxDKbhWJ0AOTKdTWRY76o+VF6FM6T8z0cObhRGG3cTrwpGH4Y7H6kBP2l5t7h92vfQ3gnKH9ktQ
VAhuJcwjkl7ugv8PGx1XPUZoVaEapmDsLdMe/dMQu8Qnu3wL0dPOQCSMjX3OG9tzuIqT72/+MF3p
0SzAP5lI7Qd1SAWQkUvgvsOCWfadwWmdqvYp/b+xVAPVvLtxlQIIvBqVd3XymWWJZobfTe0uLoH3
NQhAm0eWzLchT56i0npC9dy5jXcmV0fBwAWUH25nvmqmxCQk0sZ/tJy/5KMlIYTiQUTC97JhPKBs
fGZcNcySSB510YxlVXS24dgb7xV0yUvlph2HLOAvNql/+T+0TbBwJkuux79ahIZoIO2vk5Efgi+h
UfWyVVVJNrpBUIRChScCmaN4WQcqo0mnc6pbUdItlq57Lit35HtHiRXB46iWiOKAT+8a+ZjuCHKj
gNWDLzZDLXYD97MMs4Kf6vdBnLi71Q3hv5KoYD9LLW5IDp5zlMoo/JW35KWefg7CLjD9XuuvCDED
nKYJjRsAQ0e3wosWLgIGYl36b924TNRTkk3k0WsFq3O4fxmXynvnfjZq7teHHanrUhh+Ie9QYTed
bQzGwaXxruh1OmiHXB2ujMMm1TTCKpPMWw3iYDzOAZbL/Km4sadScTHoRMyVfB5pMRrlmh1t6PAI
szRX1CXMVWj+p/qWxqjFL+Idmwv9SUWOJCcHWANAbsUPMwd72hOilXOeKh4luwP/OcOGXhJXHJNU
whm5WjfHaFaC+z1vVQUWMC+/OMjaMhpqY/PXGSpq4imJUJXy/d+jfHBBl4PaCvr1ZGmJStAY1gcV
2GjzovMx1Tg0KDOUCpyGA0dv2UYV1dL5cehK3JUcTRxJBLctX6BreSP9ea0NsboU7moXhJ6dCHKX
oqVdxOi8FI3a2gv7fKRvcWaHYd0aXdqwvRaUi7u7h7fB4zzwlXBNK/YBd3WKdRbiNHaVbb6nh/Wx
KCdgBlJ70Sr554nVf9e+D+n91X01YbFOz3I+0VpCQUYdnuIB36wpb0XRPpYaIjGhyYAOs4Pf9AMp
zO0ISFHHLrmlUz1OFU/7SVuN/BHQHveT+oXmIGEflFN81kKDwsFUAZWSS/vvFZuNr/WUelU6V7Ax
sJKIQ43LVMDgrX7q0QCgN2zR+XI6osOyOLSzQMoF7As/qF1lRBGIFIjQeJO9DUjWPaxJfK/RWDPS
5OVhTTg/GBqCkhuf8ZUHIIL/spvG782Io5lRAEBPEwpTGmy3iqmX4Qr7oBJHQU7Gg1te7EtlAOEN
RV67STbf9GlzzC7INzsl9+wWSNPA9txCaROppkHk2rcYniZoCJZCGWUrnKW09lETjm2h0wFNwsQO
pWbnfI1+4aeQEv0w6I78XGcjPX5th2cHC3ZhAVZCTddvGg0DJ/jN8mQKNazaLe5JtDntB5/VpEkg
3nFzFx6IxxyGzkUUk1/8eEb/+BsAMBikhRU+1SP0gYcC8eiF/ebBJ6mSruR/ukvt4fX9I7C0CAZz
wIBvzpG5VAwYFJdIqpO7UCLg7jomjK9rtmOMs411qHliDAy9S+8nNILWh+QtnWUL5T4J0nnpZhGh
j82D4am8zNxE/tYvXY3mmXfw+QL9wOgPlnfm40l0eFz8OKk4gp90EHhwzY5/oPHyds32es4uQHCR
SS8s7XO1APyIioFfG+H1Bkc+YBYkslHpdSlC9XJ/sMChBNkJbVLjA1wfv35j61Giw9/X/uvnf8YT
o+wXqvKu9KP28HLL+BlEL1266nBV1ftf++PRFJdZgItZwuU7KNYNcpf0QM4dO4WBYCk3cwumXEgT
2PyN7+zv4+jUjKMikEsqkqekHACTznZ0a0hPvau+YRCCFhZlOgB3tc/eX/ar6sUq5DGYasejImY=
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
