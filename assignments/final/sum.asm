
segment .data

segment .bss

segment .text 

global sum

sum:

    xorpd xmm0, xmm0
    mov   rcx,  rsi

loop:

    movsd xmm1, [rdi]
    addsd xmm0, xmm1

    add rdi, 8
    dec rcx

    jnz loop

end:
    ret