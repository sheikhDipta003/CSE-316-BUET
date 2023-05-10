;takes a character string and stores equivalent decimal representation in ax
indec proc
   ;save registers
   push bx
   push cx
   push dx  
   
   mov ah, 2
   mov dl, '?'
   int 21h
   
   xor bx, bx   ;holds the final dec num
   xor cx, cx   ;holds the sign, 1 if neg, 0 if pos
   
   mov ah, 1
   int 21h
   cmp al, '-'
   je minus
   cmp al, '+'
   je plus
   jmp repeat
   
   
   minus:   mov cx, 1
   plus:    int 21h     ;read a character
   
   repeat:
        ;check if the input char is between 0 and 9
        cmp al, '0'
        jnge _exit
        cmp al, '9'
        jnle _exit
        
        ;convert ascii to dec
        sub al, 30h
        xor ah, ah  ;clear the high byte   
        push ax     ;save the digit
        
        
        mov ax, 10    ;ax = 10
        mul bx        ;ax = ax * bx(old) 
        mov bx, ax 
        pop ax        ;retrieve ax(saved) 
        add bx, ax    ;bx(new) = bx(old) + ax(saved)
        
        ;continue reading
        mov ah, 1
        int 21h
        cmp al, 0dh ;cr?
        jne repeat
        
   mov ax, bx 
   cmp cx, 1
   jne _exit    ;if not negative, exit
   neg ax       ;otherwise negate ax

   _exit:  pop dx
           pop cx
           pop bx 
           
           ret
    
indec endp
