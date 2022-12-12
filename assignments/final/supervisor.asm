
segment .bss

array: resq 1000000
count: resq 1
seconds: resq 1

segment .data

prompt: db "Please enter the count of data items to be placed into the arraw (max 1 million): ", 0
int_form: db "%d", 0
double_form: db "%f", 10, 0

prompt2 : db "Please enter the time interval in seconds between displayed values: ", 0

message: db "The array has been filled with non-deterministic random 64-bit float numbers", 10, 0
message2: db "The arithmetic sum is ", 0
message3: db "The arithmetic mean is ", 0
message4: db "The supervisor will return the mean to the caller", 10, 0
nl: db 10, 0

segment .text

extern printf
extern scanf
extern fill
extern sum
extern display

global supervisor

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


    ; print the sum

    mov  rdi, message2
    call printf

    mov  rdi, array
    mov  rsi, [count]
    call sum

    movsd xmm14, xmm0

    ; print sum 

    mov rdi, double_form
    mov rsi, xmm14


    ;
    mov  rdi, message3
    call printf

    ; compute mean

    cvtsi2sd xmm12, [count]
    divsd xmm0, xmm12


    ; print mean

    mov rdi, double_form
    mov rsi, xmm0


    ; print exit message

    mov  rdi, message4
    call printf

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
