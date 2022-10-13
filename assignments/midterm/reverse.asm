;
; Ahmad Aldasouqi
; ahmadaldasouqi@csu.fullerton.edu
; October 13, 2022
; Section TuTh 8-10am
;

segment .data

segment .bss

segment .text

global reverse

reverse:

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

    ; Store input parameters
    mov     r15,    rdi ; Array b
    mov     r14,    rsi ; Array a
    mov     r13,    rdx ; Length

    mov     r12,    0

loop:
    cmp     r12,    r13
    jge     terminate 
    mov     rcx,    [r14 + 8 * r12]
    push    rcx
    inc     r12
    jmp     loop

terminate:
    mov     r12,    0
loop_two:
    cmp     r12,    r13
    jge     end
    pop     rcx
    mov     [r15 + 8*r12],  rcx
    inc     r12

end:
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