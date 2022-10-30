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
extern degtorad
extern ftoa
extern stringtof
extern cos

segment .data
  welcome    db  "Welcome to Accurate Cosines by Ahmad Aldasouqi", 10
  prompt     db  "Please enter an angle in degrees and press enter: " 
  confirm    db  "You entered "
  

  time       db  "The current time in tics is "
  newline    db  10
  goodbye    db  "Have a nice day. Bye!", 10 

  example    dq  0x5A

segment .bss

  

segment .text

_start:

  ; prints welcome message using 'write' syscall
  mov   rax,  0x01
  mov   rdi,  0x01
  mov   rsi,  welcome 
  mov   rdx,  47 
  syscall

  ;print string before displaying time
  mov   rax,  0x01
  mov   rdi,  0x01
  mov   rsi,  time
  mov   rdx,  47 

  ;load current time into rax register 
  cpuid
  rdtsc

  ;convert time to a float

  ; input a float number in degrees

  ;; prints prompt to input angle
  mov   rax,  0x01
  mov   rdi,  0x01
  mov   rsi,  prompt
  mov   rdx,  50

  ;; make space for string
;  sub   rsp,  1024
  ;; 
;  mov   rax,  0x00
;  xor   rdi,  rdi
;  mov   rsi,  [rsp]
;  mov   rdx,  10

  ;temp for testing purposes
  movsd xmm0, [example]

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


