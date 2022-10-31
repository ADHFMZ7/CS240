
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

  sub     rsp, 16
  movdqu  dqword [esp], xmm0

  ; multiplies input variable by pi/180 constant
  movsd   xmm14, [constant]
  mulsd   xmm0,  xmm14


  movdqu  xmm14, dqword [rsp]
  add     rsp, 16

  ret
