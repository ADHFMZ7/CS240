
segment .data

double_form: db "%1.12ld" ,10,0

section .bss

section .text

global dislay

display:

    xor rcx, rcx
    mov r8,  rdi ; array
    mov r9, rsi ; count
loop:
    cmp rcx, r9 
    jge done

    movsd xmm0, [r8 + 8*r9]
    mov rdi, double_form
    call printf

    inc rcx
    jmp loop

done:
    
    ret