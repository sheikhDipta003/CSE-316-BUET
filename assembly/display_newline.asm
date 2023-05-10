;Write a program to (a) prompt the user, (b) read first, middle, and 
;last initials of a person's name, and (c) display them duwn the 
;left margin.

.MODEL SMALL
.STACK 100H
.DATA
    prompt DB 'enter three initials: $'
    newline DB 0DH,0AH,'$'
    init1 DB ?,0DH,0AH
    init2 DB ?,0DH,0AH
    init3 DB ?,'$'
.CODE
MAIN PROC
    ;initialize data segement
    MOV AX, @DATA
    MOV DS, AX
    
    ;take input
    LEA DX, prompt
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV init1, AL
    
    INT 21H
    MOV init2, AL
    
    INT 21H
    MOV init3, AL
    
    ;display a new line
    LEA DX, newline
    MOV AH, 9
    INT 21H
     
    ;display the initials
    LEA DX, init1
    MOV AH, 9
    INT 21H
    
MAIN ENDP
END MAIN

 