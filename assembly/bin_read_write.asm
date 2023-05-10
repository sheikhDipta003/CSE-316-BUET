.MODEL SMALL
.STACK 100H
.DATA
    newline DB 0DH,0AH,'$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ;read a binary string and store it in BX as a bin number  
    XOR BX, BX
    MOV AH, 1
    INT 21H
    
    _WHILE:
        CMP AL, 0DH
        JE _EXIT
        
        SUB AL, 30h
        SHL BX, 1
        OR BL, AL   ;since we are putting this bit always at the lsb, which is part of BL
        
        INT 21H
        JMP _WHILE
    
    _EXIT:
        LEA DX, newline
        MOV AH, 9
        INT 21H
        
    
    ;output the bin number in console
    MOV CX, 16
    TOP: 
        ROL BX, 1
        JC print_one
        MOV DL, 0
        JMP display
    
    print_one:
        MOV DL, 1   
    
    display:
        MOV AH, 2
        INT 21H
        LOOP TOP

MAIN ENDP
END MAIN