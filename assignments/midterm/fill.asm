;
; Ahmad Aldasouqi
; ahmadaldasouqi@csu.fullerton.edu
; October 13, 2022
; Section TuTh 8-10am
;

extern printf
extern scanf
extern islong

global fill

segment .data

long_format db "%ld", 0

segment .bss  

segment .text 

fill:

    ; Backs up registers to guarantee callers data
    push    rbp
    mov     rbp,rsp
    push    rdi                                                    
    push    rsi                                                    
    push    rdx                                                    
    push    rcx                                                    
    push    r8                                                     
    push    r9                                                     
    push    r10                                                    
    push    r11                                                    
    push    r12                                                    
    push    r13                                                    
    push    r14                                                    
    push    r15                                                    
    push    rbx                                                    
    pushf                                                       

    push qword 0 

    
    mov r15, rdi  ; holds the uninitialized array
    mov r14, rsi  ; moves length of array into r14

    
    mov r13, 0 ; loop counter
fill_loop:
    cmp r14, r13 ; Ends loop if more than 10 numbers are found 
    jle end 
    mov rax, 0
    mov rdi, long_format
    push qword 0
    mov rsi, rsp
    call scanf
    cdqe
    cmp rax, -1  ; Ends loop if EOF character is found 
    je end

    mov rdi, rax
    call islong
    cmp rax, -1


    pop r12
    je end 
    mov [r15 + 8*r13], r12  
    inc r13  ;increment loop counter
    jmp fill_loop

end:

    pop rax 
    mov rax, r13  ; Store length of array in return register

    ; Restores backed up registers to original state
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
