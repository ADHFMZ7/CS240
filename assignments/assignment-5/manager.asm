
segment .bss

array: resq 10000000

segment .data


  prompt:   db  "enter size of array: ", 0
  int_form:  db  "%d",0

segment .text 

  global manager

  extern scanf
  extern printf
  extern display
  extern sort

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
  mov   rsi, array    ; pointer to array

  call scanf


; populate array of chosen size with non-deterministic random 64-bit float

populate:
  mov rcx,  0
  cmp rcx,  rax
  jg 



; run display.c function


; display time in tics


; run sort function


; display time in tics again


; display how many tics have elapsed and what that is in seconds


; display.c again to show sorted items


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
