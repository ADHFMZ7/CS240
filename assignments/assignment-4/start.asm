;======================================; 
;                                      ;
;          Accurate Cosines            ;
;     written by Ahmad Aldasouqi       ;
;   ahmadaldasouqi@csu.fullerton.edu   ;
;              10-30-2022              ;
;                                      ;
;======================================;


; Raw Assembly Notes
;
; We use system calls to the OS to accomplish
; tasks such as i/o
;
; a full list of linux system calls can be found at 
; https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md
;
; rax register holds the number of the systemcall
; the
;

global _start

segment .data
  welcome    db  "Welcome to Accurate Cosines by Ahmad Aldasouqi", 10
  prompt     db  "Please enter an angle in degrees and press enter: " 
  confirm    db  "You entered "
  

  time       db  "The current time in tics is "
  newline    db  10
  goodbye    db  "Have a nice day. Bye!", 10 

segment .bss

  

segment .text

_start:

  ; prints welcome message using 'write' syscall
  mov   rax,  0x01
  mov   rsi,  welcome 
  mov   rdx,  47 
  syscall

  ; Show time in tics

  ; input a float number in degrees

  ;;
  mov   rax,  0x00
  xor   rsi,  rsi
  mov   rdx,  memory

  ; output the same number for confirmation

  ; convert the number degrees -> radians (mul by pi/180)
  
  ; Compute cosine of radian number

  ; Outputs computed value

  ; shows number of tics

  ; goodbye message
  mov   rax,  0x01
  mov   rsi,  goodbye
  mov   rdx,  22
  syscall

  ; exits program using 'exit' syscall
  mov   rax,  0x3c
  mov   rdi,  0x00
  syscall


