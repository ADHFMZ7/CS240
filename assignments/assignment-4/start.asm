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
extern degtorad ;double degtorad(double degrees)
extern ftoa     ;void ftoa(double value, char * string)
extern cos      ;double cos(double value)
extern ltoa
extern strlen 
extern scan     ;long int scan(char* buf, long int buflen)
extern atof     ;double atof(char * ascii_float)

segment .data
  welcome   db  "Welcome to Accurate Cosines by Ahmad Aldasouqi", 10
  prompt    db  "Please enter an angle in degrees and press enter: " 
  confirm   db  "You entered "
  

  time      db  "The current time in tics is "
  newline   db  10
  goodbye   db  "Have a nice day. Bye!", 10 

  example   dq  0x5A

segment .bss

  tics      resb  50
  inputstd  resb  50
  buffer    resb  50
  buffer2   resb  50

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
  mov   rdx,  28 
  syscall

  ;load current time into r14 register 
  cpuid
  rdtsc
  shl   rdx,  32
  or    rdx,  rax
  mov   r14,  rdx   

  ;convert time in tics to string
  mov   rax,  0
  mov   rdi,  r14
  mov   rsi,  tics
  call  ltoa
  mov   r14,  rax
  ;get length of string for printing

  mov   rax,  0
  mov   rdi,  r14
  call  strlen
  mov   r15,  rax 

  ;print string using write syscall

  mov   rax,  0x01
  mov   rdi,  0x01
  mov   rsi,  tics
  mov   rdx,  r15
  syscall

  ;print newline character

  mov   rax,  0x01
  mov   rdi,  0x01
  mov   rsi,  newline
  mov   rdx,  1
  syscall

  ;prints current time


  mov   rdi,  r14
  mov   rsi,  tics




input:

  ;; prints prompt to input angle
  mov   rax,  0x01
  mov   rdi,  0x01
  mov   rsi,  prompt
  mov   rdx,  50
  syscall

  mov   rax,  0
  mov   rdi,  buffer
  mov   rsi,  50
  call  scan
  mov   r15,  rax 

  ; print the string
  mov   rax,  0x01
  mov   rdi,  0x01
  mov   rsi,  buffer 
  mov   rdx,  r15
  syscall


  ; print a newline

  mov   rax,  0x01
  mov   rdi,  0x01
  mov   rsi,  newline
  mov   rdx,  1
  syscall    

  ; convert string to float number
  mov   rax,  0
  mov   rdi,  buffer
  call  atof
  movsd xmm8,  xmm0
 
computation:

  ; convert the number degrees -> radians (mul by pi/180)
  mov   rax,  0
  movsd xmm0, xmm8 
  call degtorad
  movsd xmm8, xmm0

  call cos 
  movsd xmm8, xmm0

  ; Outputs computed value

  movsd xmm0, xmm8
  mov   rdi,  buffer2
  call ftoa

  ; get length of buffer 
  mov   rax,  0
  mov   rdi,  buffer2
  call  strlen
  mov   r15,  rax 

  ;print buffer 
  mov   rax,  0x01
  mov   rdi,  0x01
  mov   rsi,  buffer2
  mov   rdx,  r15
  syscall

  ; print a newline

  mov   rax,  0x01
  mov   rdi,  0x01
  mov   rsi,  newline
  mov   rdx,  1
  syscall   

exit:

  ; shows number of tics

 ;print string before displaying time
  mov   rax,  0x01
  mov   rdi,  0x01
  mov   rsi,  time
  mov   rdx,  28 
  syscall

  ;load current time into r14 register 
  cpuid
  rdtsc
  shl   rdx,  32
  or    rdx,  rax
  mov   r14,  rdx   

  ;convert time in tics to string
  mov   rax,  0
  mov   rdi,  r14
  mov   rsi,  tics
  call  ltoa
  mov   r14,  rax
  ;get length of string for printing

  mov   rax,  0
  mov   rdi,  r14
  call  strlen
  mov   r15,  rax 

  ;print string using write syscall

  mov   rax,  0x01
  mov   rdi,  0x01
  mov   rsi,  tics
  mov   rdx,  r15
  syscall

  ;print newline character

  mov   rax,  0x01
  mov   rdi,  0x01
  mov   rsi,  newline
  mov   rdx,  1
  syscall

  ;prints current time

  mov   rdi,  r14
  mov   rsi,  tics


  ; goodbye message
  mov   rax,  0x01
  mov   rdi,  0x01
  mov   rsi,  goodbye
  mov   rdx,  22
  syscall

  ; exits program using 'exit' syscall
  mov   rax,  0x3c
  mov   rdi,  0x00
  syscall


