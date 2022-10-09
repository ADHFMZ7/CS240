;==============;
;              ;
;              ;
;==============;
;              ;
;              ;
;==============;
extern printf
extern scanf
extern atof

section .data
  
  prompt  db  "Please enter your last name: ", 0
  prompt1 db  "Please enter your title: ", 0
  prompt2 db  "Please enter the sides of your triangle separated by ws: ", 0

  f_form  db  "%f %f", 0
  s_form  db  "%s", 0

  output  db  "The length of the hypotenuse is %.6F"

  exit    db  "PLease enjoy your triangles %s %s.", 10, 0

section .bss

section .text

  global  start

;========
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
  jmp   input

input:

  ; Prints output prompt 
  mov   rdi,  prompt  
  call printf

  mov   rdi,  s_form
  call  scanf

  ;mov   r10,  rax
  mov   rsi,  rax

  mov   rdi,  s_form
  call  printf


;========
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





