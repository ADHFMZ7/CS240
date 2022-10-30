

segment .data

  constant dd 0x3C8EFA35

segment .text

global degtorad

degtorad:

  mulsd xmm0,  constant

  ret
