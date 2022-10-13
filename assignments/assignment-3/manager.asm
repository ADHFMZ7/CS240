
extern printf
extern scanf


section .data

int_form db "%ld", 0

section .bss



section .text

  global  start

start:

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
  jmp   init 

init:

  mov   r14,  0   ; initialize r14 with zero to count the current size of the array


loop:

  mov   rax,  0
  mov   rdi,  int_form
  push  qword 0
  mov   rsi,  rsp
  call  scanf
  cdqe
  cmp   rax,  -1
  je    out
  mov   r8,   [rsp]
  mov   [r13+8*r14], r8 ; Find a way to declare memory and then add this to the offset
  inc   r14
  pop   rax
  jmp   loop


out:

  jmp   end

end:

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
