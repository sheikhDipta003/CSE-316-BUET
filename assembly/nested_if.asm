.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC  
   
   MOV AX, 1
   MOV BX, 3
   MOV CX, 2 
   
   CMP AX, BX
   JNL _END ;else
   ;then
   CMP BX, CX
   JNL _ELSE    ;else
   ;then
   MOV AX, 0

_ELSE:
    MOV BX, 0   
_END:   
 
MAIN ENDP
END MAIN