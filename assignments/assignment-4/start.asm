;======================================; 
;                                      ;
;          Accurate Cosines            ;
;     written by Ahmad Aldasouqi       ;
;   ahmadaldasouqi@csu.fullerton.edu   ;
;              10-30-2022              ;
;                                      ;
;======================================;



global _start

segment .data
  welcome    db  "Welcome to Accurate Cosines by Ahmad Aldasouqi", 10

segment .text

_start:

  mov   rax,  0x01
  mov   rsi,  welcome 
  mov   rdx,  47 

  syscall

  mov   rax,  0x3c
  mov   rdi,  0x00

  syscall
