;Read a character, and if it's an uppercase letter, display it.    
MOV AH, 1
INT 21H

CMP AL, 'A'
JB _EXIT
CMP AL, 'Z'
JG _EXIT
MOV AH, 2
MOV DL, AL
INT 21H

_EXIT:
    MOV AH, 4CH
    INT 21H


