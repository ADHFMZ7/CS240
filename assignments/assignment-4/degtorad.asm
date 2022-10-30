

segment .data

  ; This constant is the precomputed value of pi/180.
  constant dd 0x3C8EFA35

segment .text

global degtorad

degtorad:

  push  xmm14 

  movss xmm14, [constant]
  mulss xmm0,  xmm14

  pop   xmm14

  ret
