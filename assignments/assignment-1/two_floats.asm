;=============================================== 
;
; Double Doubles
; written by Ahmad Aldasouqi
; ahmadaldasouqi@csu.fullerton.edu
; 09-05-2022
;
;===============================================
extern printf
extern scanf
extern isfloat
extern atof

global start 

segment .data

prompt	db 	"Please enter two float numbers separated by white space. Press enter after the second input.", 10, 0
two_str db 	"%s %s", 0
bad_msg db 	"bad float", 10, 0
bad_flt dq 	-1.0
two_flt db 	"Your numbers are %.6lf and %.6lf", 10, 0
larger  db 	"The larger float is %.6lf", 10, 0

segment .bss

  //

segment .text

start:
	; Backs up registers to restore after program exits 
	push 	rbp
	mov  	rbp,rsp
	push 	rdi                                                    
	push 	rsi                                                   
	push 	rdx                                                  
	push 	rcx                                                 
	push 	r8                                                 
	push 	r9                                                
	push 	r10                                              
	push 	r11                                             
	push 	r12                                            
	push 	r13                                           
	push 	r14                                          
	push 	r15                                         
	push 	rbx                                        
	pushf

  ; prints the prompt to input floats
	mov 	rax, 0
	mov 	rdi, prompt
	call 	printf

  ; make space for 2 strings
	sub 	rsp, 2048 
	mov 	rax, 0

  ; populates perameter registers for scanf
	mov 	rdi, two_str
	mov 	rsi, rsp
	mov 	rdx, rsp
	add 	rdx, 1024
	mov 	r15, rsp
	mov 	r14, rdx
	call 	scanf

  ; checks if first string is a valid float
	mov 	rax, 0
	mov 	rdi, r15
	call 	isfloat
	cmp 	rax, 0
	je 	BadMessage

  ; checks if second string is a valid float
	mov 	rax, 0
	mov 	rdi, r14
	call 	isfloat
	cmp 	rax, 0
	je 	BadMessage

  ; calls atof to convert string to float and move it to xmm14
	mov 	rax, 0
	mov 	rdi, r14
	call 	atof
	movsd 	xmm14, xmm0

  ; calls atof to convert string to float and move it to xmm14
	mov 	rax, 0
	mov 	rdi, r15
	call 	atof
	movsd 	xmm15, xmm0

  ;prints the two floats
	mov 	rax, 2
	mov 	rdi, two_flt
	movsd 	xmm0, xmm15
	movsd 	xmm1, xmm14
	call 	printf

  ; compares the two floats and jumps to the appropriate label
	ucomisd	xmm14, xmm15
	ja	less		
	jmp	more	

more:
  ; moves larger float to xmm9 register
  ; moves smaller float to xmm8 register
	movsd	xmm9, xmm14
	movsd	xmm8, xmm15
	
	jmp 	success	

BadMessage:
  ; prints message indicating string is not a valid float
	mov 	rax, 0
	mov 	rdi, bad_msg
	call 	printf
  
  ; moves -1. to the return register
	movsd	xmm0, [bad_flt] 
	jmp	end

less:
  ; moves larger float to xmm9 register
  ; moves smaller float to xmm8 register
	movsd	xmm9, xmm15
	movsd	xmm8, xmm14

	jmp	success	

success:

  ; prints the message for larger float
	mov	rax, 1
	mov	rdi, larger
	movsd	xmm0, xmm8
	call 	printf

  ; moves smaller float to return register
	movsd	xmm0, xmm9

	jmp	end
end:

  ; restores all backed up registers
	add 	rsp, 2048
	popf                                                 
	pop 	rbx                                               
	pop 	r15                                                
	pop 	r14                                                 
	pop   r13                                                  
	pop 	r12                                                   
	pop 	r11                                                    
	pop	  r10                   
	pop   r9                
	pop   r8               
	pop   rcx             
	pop   rdx            
	pop   rsi           
	pop   rdi          
	pop   rbp         

	ret
