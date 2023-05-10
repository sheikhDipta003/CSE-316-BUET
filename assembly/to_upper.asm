.MODEL SMALL
.STACK 100H
.DATA
    prompt DB 'ENTER A LOWERCASE LETTER:$'
    feedbc DB 0DH,0AH,'IN UPPERCASE IT IS: '
    CHAR DB ?,'$'
.CODE
MAIN PROC
    ;initialize data segment
    MOV AX, @DATA
    MOV DS, AX
    
    ;display prompt
    LEA DX, prompt
    MOV AH, 9
    INT 21H
    
    ;take a letter as input
    MOV AH, 1
    INT 21H
    
    ;convert it into uppercase
    ;ch = ch - 32
    SUB AL, 20H
    MOV CHAR, AL 
    
    ;print the letter in uppercase in a new line
    LEA DX, feedbc
    MOV AH, 9
    INT 21H
    
    ;return
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP

END MAIN