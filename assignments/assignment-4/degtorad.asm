;======================================================;
;This function was used in the program Accurate Cosines;
; Author: Ahmad Aldasouqi                              ;
; Contact:  ahmadaldasouqi@csu.fullerton.edu           ;
;======================================================;

; *******************************************************************************************************************************
;Function name:  degtorad
;This function converts degrees to radians
;
; Copyright (c) 2022 Ahmad Aldasouqi 
;
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
; as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
;
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
; of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License along with this program.
; If not, see <https://www.gnu.org/licenses/>.
; *******************************************************************************************************************************

;================================================================================================================================
;Author information
;  Author name: Ahmad Aldasouqi
;  Author email: ahmadaldasouqi@csu.fullerton.edu
;
;This file
;   File name: degtorad.asm
;   Language: X86_64 with Intel syntax.
;   Assemble: nasm -f elf64 -o degtorad.o degtorad.asm
;
;Signature:  double degtorad(double degrees)
;
;Disclaimer:  This function does not validate input!
;================================================================================================================================


segment .data

  ; This constant is the precomputed value of pi/180.
  constant dq 0x3F91DF46A0000000

segment .text

global degtorad

degtorad:
  
  push     rbp
  mov      rbp,rsp
  push     rdi                                                    ;Backup rdi
  push     rsi                                                    ;Backup rsi
  push     rdx                                                    ;Backup rdx
  push     rcx                                                    ;Backup rcx
  push     r8                                                     ;Backup r8
  push     r9                                                     ;Backup r9
  push     r10                                                    ;Backup r10
  push     r11                                                    ;Backup r11
  push     r12                                                    ;Backup r12
  push     r13                                                    ;Backup r13
  push     r14                                                    ;Backup r14
  push     r15                                                    ;Backup r15
  push     rbx                                                    ;Backup rbx
  pushf                                                           ;Backup rflags


  ; multiplies input variable by pi/180 constant
  movsd   xmm14, [constant]
  mulsd   xmm0,  xmm14

  popf                                                            ;Restore rflags
  pop     rbx                                                     ;Restore rbx
  pop     r15                                                     ;Restore r15
  pop     r14                                                     ;Restore r14
  pop     r13                                                     ;Restore r13
  pop     r12                                                     ;Restore r12
  pop     r11                                                     ;Restore r11
  pop     r10                                                     ;Restore r10
  pop     r9                                                      ;Restore r9
  pop     r8                                                      ;Restore r8
  pop     rcx                                                     ;Restore rcx
  pop     rdx                                                     ;Restore rdx
  pop     rsi                                                     ;Restore rsi
  pop     rdi                                                     ;Restore rdi
  pop     rbp                                                     ;Restore rbp

  ret
