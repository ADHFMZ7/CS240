

segment .data

  constant dd 0x3C8EFA35

segment .text

global degtorad

degtorad:

  push  xmm14
  push  xmm15

  mulsd xmm0,  constant

  pop   xmm15
  pop   xmm14

  ret
