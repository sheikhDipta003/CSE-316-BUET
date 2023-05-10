MAIN PROC    

MOV CX, 0   ;stores character count
MOV AH, 1
INT 21H

;while(condition){
;if(newline) break;
;count++;
;take input once more
;}

_WHILE:
    CMP AL, 0DH ;is the char just input a newline
    JE _END
    INC CX
    INT 21H
    JMP _WHILE

_END:
    
MAIN ENDP

END MAIN