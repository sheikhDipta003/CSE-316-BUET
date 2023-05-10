;reverse a binary string
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC  
    MOV AL, 1
    MOV CX, 8
    
    REVERSE:
        SHL AL, 1
        RCR BL, 1
        LOOP REVERSE
        
    MOV AL, BL
    
MAIN ENDP
END MAIN