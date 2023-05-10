;If AL contains I or 3, display "o"; if AL contains 2 or 4, display "e".

MAIN PROC
MOV AX, 1H

CMP AL, 1
JE ODD
CMP AL, 3
JE ODD
CMP AL, 2
JE EVEN
CMP AL, 4
JE EVEN

ODD:
    MOV DL, 'o' 
    JMP DISPLAY
EVEN:
    MOV DL, 'e'
    
DISPLAY:
    MOV AH, 2
    INT 21H


MAIN ENDP

END MAIN
