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
  goodbye    db  "Have a nice day. Bye!", 10 


segment .text

_start:


  ; prints welcome message using 'write' syscall
  mov   rax,  0x01
  mov   rsi,  welcome 
  mov   rdx,  47 
  syscall

  ; Show time in tics

  ; input a float number in degrees

  ; output the same number for confirmation

  ; convert the number degrees -> radians (mul by pi/180)

  ; Compute cosine of radian number

  ; Outputs computed value

  ; shows number of tics

  ; goodbye message
  mov   rax,  0x01
  mov   rsi,  goodbye
  mov   mrd,  22
  syscall

  ; exits program using 'exit' syscall
  mov   rax,  0x3c
  mov   rdi,  0x00
  syscall
