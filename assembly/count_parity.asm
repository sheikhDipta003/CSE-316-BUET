;counts the number of 1s in BX
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC  
    MOV BX, 1100B
    
    ;intitialize counter to 16
    MOV CX, 16
    
    ;clear AX
    XOR AX, AX
    
    TOP:
        ROL BX, 1
        JNC NEXT
        INC AX
    NEXT:
        LOOP TOP    
    
MAIN ENDP
END MAIN