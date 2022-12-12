
segment.bss

array: resq 1000000
count: resq 1
seconds: resq 1

segment.data

prompt: db "Please enter the count of data items to be placed into the arraw (max 1 million): ", 0
int_form: db "%d", 0

prompt2 : db "Please enter the time interval in seconds between displayed values: ", 0

message: db "The array has been filled wiht non-deterministic random 640-bit float numbers", 10, 0

segment .text


supervisor:
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

    ; take input for delay
    mov  rdi,  prompt2
    call printf

    mov  rdi, int_form
    mov  rsi, seconds
    call scanf

    ; populate array of chosen size with non-deterministic random 64-bit float

    mov   rsi,  array
    mov   rdi,  [count]
    call  fill

    mov   rdi,  message
    call  printf

    ; Make a call to display

    mov   rdi,  array
    mov   rsi, [count]
    mov   rdx, [seconds]


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