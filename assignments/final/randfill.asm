; input: number of doubles -> rdi
; input: pointer to array of that size -> rsi
; output: pointer to that amount of random floats

segment .data

segment .bss

segment .text 

global fill

fill:

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
generate:
    ; loop setup
    cmp rcx,  rdi
    jge done  

    rdrand rax
    cvtsi2sd xmm0, rax
    ucomisd xmm0, xmm0
    jne     generate

    movsd [rsi + 8*rcx], xmm0
    inc rcx
    jmp generate

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