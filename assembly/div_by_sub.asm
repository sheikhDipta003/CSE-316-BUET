;divisor = BX, dividend = AX, quotient = CX
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC 
    MOV AX, 10
    MOV BX, 2
   ;initialize quotient to zero
   MOV CX, 0 
   
   _WHILE:
        CMP AX, BX
        JNGE _BREAK  ;if dividend becomes less than divisor, stop
        
        INC CX 
        SUB AX, BX
        
        JMP _WHILE
   
_BREAK:
    MOV AH, 4CH
    INT 21H 
MAIN ENDP
END MAIN