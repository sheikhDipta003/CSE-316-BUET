;?27 
;the sum OF 2 and 7 is 9 
.MODEL SMALL
.STACK 100H
.DATA
    ques DB '?$'
    feedbc DB 'the sum of '
    x DB ?,' and '
    y DB ?,' is '
    z DB ?,'$'
.CODE
MAIN PROC
    ;initialize data segment
    MOV AX, @DATA
    MOV DS, AX
    
    ;prompt for two numbers
    LEA DX, ques
    MOV AH, 9
    INT 21H
    
    ;input the numbers
    MOV AH, 1
    INT 21H
    MOV x, AL
    
    INT 21H
    MOV y, AL
    
    ;add and store result in z
    MOV AL, x
    MOV CL, y
    ADD CL, AL
    MOV z, CL
    
    ;show result
    LEA DX, feedbc
    MOV AH, 9
    INT 21H
MAIN ENDP
END MAIN