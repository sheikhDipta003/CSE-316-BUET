; prints the contents of AX as 
; a signed decimal integer. If AX >= 0, OUTDEC will print the contents in 
; decimal; if AX < 0, OUTDEC will print a minus sign, replace AX by -AX, and print the contents in decimal. 
outdec proc
    ;save registers
    push ax
    push bx
    push cx
    push dx
    
    cmp ax, 0
    jge print_pos ;if ax contains a pos num, go to print_pos
    
    push ax       ;save the number since we need to use ah in order to print '-'
    mov dl, '-'
    mov ah, 2
    int 21h   
    
    ;since we will print -ax, ax itself must be positive
    pop ax
    neg ax
    
    
print_pos:
    xor cx, cx  ;counts num of digits
    mov bx, 10  ;store the base
    
    repeat2:
        xor dx, dx  ;since the number to print is 16 bits, clear the high word in dividend dx:ax
        div bx      ;quotient = ax, remainder = dx
        push dx     ;store remainder
        inc cx      ;one digit has been saved 
        
        cmp ax, 0   ;if quotient is zero, no more digits to extract
        jne repeat2
        
    mov ah, 2       ;prepare to print
    
    print_loop:
        pop dx      ;take back one digit from the lsb
        add dx, 30h     ;convert to ascii
        int 21h     ;print
        
        LOOP print_loop
        
    pop dx
    pop cx
    pop bx
    pop ax
    
    ret
    
outdec endp