
segment .data

segment .bss

segment .text 

global sum

sum:

    xorpd xmm0, xmm0
    xor   rcx,  rcx

loop:

    inc rcx
    cmp rcx, rsi
    je end

    movapd xmm1, [rdi]

    addpd xmm0, xmm1

    add rdi, 16
    jmp loop

end:

    ret