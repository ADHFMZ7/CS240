
segment .data

segment .bss

segment .text 

global sum

sum:

    xorpd xmm0, xmm0

    mov rcx, rsi

loop:

    inc rcx
    cmp rcx, 0
    je end

    movapd xmm1, [rdi]

    addpd xmm0, xmm1

    add rdi, 16
    jmp loop

end:

    ret