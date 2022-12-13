
segment .data

double_form: db "%f" ,10,0

section .bss

section .text

global display
extern printf

display:

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

    xor rcx, rcx
    mov r8,  rdi ; array
    mov r9, rsi ; count
loop:
    cmp rcx, r9
    jge done

    movsd xmm0, [r8 + 8*rcx]
    movq xmm1, xmm0
    and rsp, -16
    push r9
    mov rdi, double_form
    call printf
    pop r9

    inc rcx
    jmp loop

done:
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
