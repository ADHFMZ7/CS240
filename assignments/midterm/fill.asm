;
; Ahmad Aldasouqi
; ahmadaldasouqi@csu.fullerton.edu
; October 13, 2022
; Section TuTh 8-10am
;

extern printf
extern scanf

global fill

segment .data

long_format db "%ld", 0

segment .bss  

segment .text 

fill:


    push rbp
    mov  rbp,rsp
    push rdi                                                    ;Backup rdi
    push rsi                                                    ;Backup rsi
    push rdx                                                    ;Backup rdx
    push rcx                                                    ;Backup rcx
    push r8                                                     ;Backup r8
    push r9                                                     ;Backup r9
    push r10                                                    ;Backup r10
    push r11                                                    ;Backup r11
    push r12                                                    ;Backup r12
    push r13                                                    ;Backup r13
    push r14                                                    ;Backup r14
    push r15                                                    ;Backup r15
    push rbx                                                    ;Backup rbx
    pushf                                                       ;Backup rflags

    push qword 0 ;staying on the boundary

    ; Taking information from parameters
    mov r15, rdi  ; This holds the first parameter (the array)
    mov r14, rsi  ; This holds the second parameter (the size of array)


    ; let user enter numbers until cntrl + d is entered
    mov r13, 0 ; for loop counter
fill_loop:
  cmp r14, r13 ; Ends loop if more numbers are found 
  jle end 
  mov rax, 0
  mov rdi, long_format
  push qword 0
  mov rsi, rsp
  call scanf
  cdqe
  cmp rax, -1  ; Ends loop if EOF character is found 
  pop r12
  je end 
  mov [r15 + 8*r13], r12  
  inc r13  ;increment loop counter
  jmp fill_loop

end:

    pop rax 
    mov rax, r13  ; store the number of things in the aray from the counter of for loop

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
