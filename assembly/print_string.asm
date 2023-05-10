; displaying a string
.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'Hello!$'
.CODE
MAIN PROC
  ;initialize DS
  MOV AX, @DATA
  MOV DS, AX
  
  ;display msg
  LEA DX, MSG
  MOV AH, 9
  INT 21H
  
  ;return to DOS
  MOV AH, 4CH
  INT 21H  
MAIN ENDP
END MAIN