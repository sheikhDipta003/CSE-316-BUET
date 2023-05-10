.model small
.stack 100h
.data
.code
main proc
    mov ah, 2
    mov dl, '?'
    int 21h
    
    xor cx, cx
    
    mov ah, 1
    int 21h
    
    _while:
        cmp al, 0DH
        je _endWhile   
        
        push ax
        inc cx
        
        int 21h
        jmp _while
    
    _endWhile: 
    
    ;print a newline
    mov ah, 2
    mov dl, 0dh
    int 21h
    
    mov dl, 0ah
    int 21h  
    jcxz exit
    
    ;print the reverse string 
    top:
        pop dx 
        int 21h
        
        LOOP top
    
    exit:
        mov ah, 4ch
        int 21h  
    
main endp
end main