;Write a program to display a "?", read two capital letters, and display them on the next line In alphabetical order
.MODEL SMALL
.STACK 100H
.DATA
    char1 DB ?,'$'
    char2 DB ?,'$'
    ques DB '?$'
    newline DB 0DH,0AH,'$'
.CODE
MAIN PROC 
    ;initialize data segment
    MOV AX, @DATA
    MOV DS, AX
    
    ;prompt user
    LEA DX, ques
    MOV AH, 9
    INT 21H
    
    ;read two capital letters
    MOV AH, 1
    INT 21H
    MOV char1, AL
    
    INT 21H
    MOV char2, AL
    
    ;display newline
    LEA DX, newline
    MOV AH, 9
    INT 21H
    
    ;display capitalized chars
    SUB char1, 32
    SUB char2, 32
    
    LEA DX, char1
    MOV AH, 9
    INT 21H
    
    LEA DX, char2
    INT 21H
     
MAIN ENDP
END MAIN