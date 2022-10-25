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
  name    db  "Ahmad", 10

segment .text

_start:

  mov   rax,  0x01
  mov   rsi,  name 
  mov   rdx,  6

  syscall

  mov   rax,  0x04
  mov   rdi,  0x41

  syscall
