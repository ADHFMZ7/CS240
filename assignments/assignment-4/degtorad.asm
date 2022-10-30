

segment .data

  constant dq 0x3f91df46a0000000 

segment .text

global degtorad

degtorad:

  push  xmm14
  push  xmm15

  mulsd xmm0,  constant

  pop   xmm14
  pop   xmm15

  ret
