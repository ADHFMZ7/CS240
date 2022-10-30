

segment .data

  constant dq 0x3f91df46a0000000 

segment .text

global degtorad

degtorad:

  movsd xmm15,  xmm0
  movsd xmm14,  [constant]

  mulsd xmm15,  xmm14

  movsd xmm0,   xmm15

  ret
