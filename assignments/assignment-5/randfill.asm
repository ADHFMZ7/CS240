; input: number of doubles -> rdi
; input: pointer to array of that size -> rsi
; output: pointer to that amount of random floats

segment .data

segment .bss

segment .text 

global fill

fill:

    push rcx
    push rax
    xor rcx, rcx
generate:
    ; loop setup
    cmp rcx,  rsi
    jge done  

    rdrand rax
    cvtsi2sd xmm0, rax
    ucomisd xmm0, xmm0
    jne     generate

    movsd [array + 8*rcx], xmm0
    inc rcx
    jmp generate

done:
    pop rax
    pop rcx
    ret