.MODEL SMALL
.STACK 100H
.DATA
    ch DB ?
.CODE
MAIN PROC 
  ;initialize data segment
  MOV AX, @DATA
  MOV DS, AX
  
  ;read a character
  MOV AH, 1
  INT 21H
  
  ;if 'A', CR
  CMP AL, 'A'
  JE _CR
  CMP AL, 'B'
  JE _LF
  JMP _DEFAULT
  
_CR:
    MOV AH, 0DH
    INT 21H 
    JMP _BREAK

_LF:
   MOV AH, 0AH
   INT 21H
   JMP _BREAK

_DEFAULT:
    MOV AH, 4CH
    INT 21H

_BREAK:
  
MAIN ENDP
END MAIN