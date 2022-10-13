
extern printf
extern scanf
extern fill

section .data

int_form db "%ld", 0

section .bss

  array resq  64

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
  push  qword 0
  mov   rax,  0
  mov   rdi,  array
  mov   rsi,  64
  call  fill
  mov   r15,  rax 
  pop   rax 

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
