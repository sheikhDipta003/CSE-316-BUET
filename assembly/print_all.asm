.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AH, 2
    MOV DL, 0
    MOV CX, 256
    
    
    PRINT_LOOP:
        INT 21H
        INC DL
        DEC CX
        JNZ PRINT_LOOP
        
        MOV AH, 4CH
        INT 21h
MAIN ENDP
END MAIN