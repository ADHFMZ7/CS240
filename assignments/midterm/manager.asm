;==================================
; Ahmad Aldasouqi
; ahmadaldasouqi@csu.fullerton.edu
; October 13, 2022
; Section TuTh 8-10am
;==================================


extern printf
extern scanf
extern fill
extern reverse
extern display

section .data

max     dw      10

prompt db      "Please enter integers separated by ws and press <enter><control+d> to terminate inputs.", 10, 0
str2    db      "You entered: ", 10, 0
str3    db      "The array has %d long integers", 10, 0
str4    db      "The function reverse was called", 10, 0
str5    db      "The second array holds these values:", 10, 0

section .bss

a       resq    10 
b       resq    10 

section .text

global start

start:

    push rbp
    mov  rbp,rsp
    push rdi                                                   
    push rsi                                                   
    push rdx                                                  
    push rcx                                                    
    push r8                                                     
    push r9                                                     
    push r10                                                  
    push r11                                                    
    push r12                                                   
    push r13                                                   
    push r14                                                   
    push r15                                                    
    push rbx                                                 
    pushf                                                    

    push    qword   0


    ; Prints the input prompt message
    push    qword   0
    mov     rax,    0
    mov     rdi,    prompt
    call    printf
    pop     rax

    ; Calls the input array module

    push qword 0
    mov rax, 0
    mov rdi, a 
    mov rsi, max
    call fill
    mov r15, rax
    pop rax

    ; Prints display Header 
    push    qword   0
    mov     rax,    0
    mov     rdi,    str2 
    call    printf
    pop     rax

    ; Calls display module
    push qword 0
    mov rax, 0
    mov rdi, a
    mov rsi, r15
    call display
    pop rax

    ;Prints remainint 3 strings
    push    qword   0
    mov     rax,    0
    mov     rdi,    str3
    mov     rsi,    r15
    call    printf
    pop     rax

    push    qword   0
    mov     rax,    0
    mov     rdi,    str4
    call    printf
    pop     rax

    push    qword   0
    mov     rax,    0
    mov     rdi,    str5
    call    printf
    pop     rax

    ; Calls the reverse module


    pop     rax

    popf                                                    
    pop rbx                                                     
    pop r15                                                     
    pop r14                                                     
    pop r13                                                     
    pop r12                                                     
    pop r11                                                     
    pop r10                                                     
    pop r9                                                      
    pop r8                                                      
    pop rcx                                                     
    pop rdx                                                     
    pop rsi                                                     
    pop rdi                                                     
    pop rbp                                                     

    ret
