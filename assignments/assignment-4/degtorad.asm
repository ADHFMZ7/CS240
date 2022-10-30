

segment .data

  ; This constant is the precomputed value of pi/180.
  constant dq 0x3F91DF46A0000000

segment .text

global degtorad

degtorad:

  movsd xmm14, [constant]
  mulsd xmm0,  xmm14

  ret
