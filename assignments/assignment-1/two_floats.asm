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

segment .text

start:
	; register backup
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
                                                       
	mov 	rax, 0
	mov 	rdi, prompt
	call 	printf

	sub 	rsp, 2048 ; make space for 2 strings
	mov 	rax, 0


	mov 	rdi, two_str
	mov 	rsi, rsp
	mov 	rdx, rsp
	add 	rdx, 1024

	mov 	r15, rsp
	mov 	r14, rdx
	call 	scanf

	mov 	rax, 0
	mov 	rdi, r15
	call 	isfloat
	cmp 	rax, 0
	je 	BadMessage

	mov 	rax, 0
	mov 	rdi, r14
	call 	isfloat
	cmp 	rax, 0
	je 	BadMessage

	mov 	rax, 0
	mov 	rdi, r14
	call 	atof
	movsd 	xmm14, xmm0

	mov 	rax, 0
	mov 	rdi, r15
	call 	atof
	movsd 	xmm15, xmm0


	mov 	rax, 2
	mov 	rdi, two_flt
	movsd 	xmm0, xmm15
	movsd 	xmm1, xmm14
	call 	printf

	ucomisd	xmm14, xmm15
	ja	less		
	jmp	more	

more:
	movsd	xmm9, xmm14
	movsd	xmm8, xmm15
	
	jmp 	success	

BadMessage:
	mov 	rax, 0
	mov 	rdi, bad_msg
	call 	printf

	movsd	xmm0, [bad_flt] 
	jmp	end

less:
	movsd	xmm9, xmm15
	movsd	xmm8, xmm14

	jmp	success	

success:
	
	mov	rax, 1
	mov	rdi, larger
	movsd	xmm0, xmm8
	call 	printf

	movsd	xmm0, xmm9

	jmp	end
end:
	add 	rsp, 2048
	popf                                                 
	pop 	rbx                                               
	pop 	r15                                                
	pop 	r14                                                 
	pop 	r13                                                  
	pop 	r12                                                   
	pop 	r11                                                    
	pop	r10                   
	pop     r9                
	pop     r8               
	pop     rcx             
	pop     rdx            
	pop     rsi           
	pop     rdi          
	pop     rbp         

	ret
