
segment .bss

array: resq 10000000
count: resq 1 

segment .data


  prompt:   db  "enter size of array: ", 0
  int_form:  db  "%d",0
  message: db   "NUMBERS SORTED", 10, 10, 0

segment .text 

  global manager

  extern scanf
  extern printf
  extern display
  extern quicksort
  extern fill

  manager:

; backup registers

    push  rbp
    mov   rsp, rbp
    push  rdi
    push  rsi
    push  rdx
    push  rcx
    push  r8
    push  r9
    push  r10
    push  r11
    push  r12
    push  r13
    push  r14
    push  r15
    push  rbx
    pushf


; take input for amount of items

  mov   rdi,  prompt
  call  printf

  mov   rdi, int_form ; format of int
  mov   rsi, count    ; number of ints 

  call  scanf

; populate array of chosen size with non-deterministic random 64-bit float

  mov   rsi,  array
  mov   rdi,  [count]
  call  fill

; run display.c function

  mov   rdi,  array
  mov   rsi,  0
  mov   rdx,  count 
  call  display

; display time in tics


; run sort function

mov   rdi,  array
mov   rsi,  count
;call quicksort

; display time in tics again


; display how many tics have elapsed and what that is in seconds


; display.c again to show sorted items

 mov   rdi,  array
 mov   rsi,  0
 mov   rdx,  count

; return benchmark time to driver


; restore registers

    popf
    pop   rbx
    pop   r15
    pop   r14
    pop   r13
    pop   r12
    pop   r11
    pop   r10
    pop   r9
    pop   r8
    pop   rcx
    pop   rdx
    pop   rsi
    pop   rdi
    pop   rbp

    ret
