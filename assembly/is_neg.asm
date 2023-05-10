;convert high-level branching to assembly
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
   MOV AX, 10
   CMP AX, 0
   JNL END_IF
   MOV BX, -1
   
END_IF:
    MOV AH, 4CH
    INT 21H  
    
MAIN ENDP
END MAIN