section .data

double_form: db "%f" ,10,0

section .text

global display
extern printf

display:
    ; save the registers that will be clobbered by the function
    push rbp
    mov rbp, rsp
    push rdi
    push rsi
    push rdx

    ; align the stack to a multiple of 16 bytes
    and rsp, -16

    ; set up the arguments for printf
    mov rdi, double_form
    mov rsi, [rbp + 16] ; array
    mov rdx, [rbp + 24] ; count

    xor rax, rax ; counter

loop:
    cmp rax, rdx
    jge done

    movsd xmm0, [rsi + 8*rax]
    movq xmm1, xmm0
    call printf

    inc rax
    jmp loop

done:
    ; restore the saved registers
    pop rdx
    pop rsi
    pop rdi
    pop rbp

    ret