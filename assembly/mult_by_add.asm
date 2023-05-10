;multiplicand = AX, multiplier = BX, product = CX
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC 
    MOV AX, 5
    MOV BX, 2
   ;initialize product to zero
   MOV CX, 0 
   
   REPEAT:
        ;statements
        ADD CX, AX
        DEC BX
        
        ;condition
        JNZ REPEAT  ;repeat until BX becomes zero

    MOV AH, 4CH
    INT 21H 
MAIN ENDP
END MAIN