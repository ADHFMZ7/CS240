

segment .data

  ; This constant is the precomputed value of pi/180.
  constant dq 0x3F91DF46A0000000

segment .text

global degtorad

degtorad:

  ;need to save contents of xmm14 

  movsd xmm14, [constant]
  mulsd xmm0,  xmm14

  ;need to restore contents of xmm14

  ret
