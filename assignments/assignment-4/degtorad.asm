

segment .data

  constant dd 0x3C8EFA35

segment .text

global degtorad

degtorad:

  movsd xmm14, constant
  mulsd xmm0,  xmm14

  ret
