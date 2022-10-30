

segment .data

  constant dd 0x3C8EFA35

segment .text

global degtorad

degtorad:

  movss xmm14, constant
  mulss xmm0,  xmm14

  ret
