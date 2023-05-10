.model small
.stack 100h
.data 
A DB ?

.code
main proc
  ;init data segment
  mov ax, @data
  mov ds, ax 
  
  lea si, A
  
  call input_arr
  call select
  call print_arr  
  
  ;exit from dos
  mov ah, 4ch
  int 21h  
main endp   
          
          
input_arr proc

    push si
    
    mov ah, 2
    mov dl, ':'
    int 21h 
    xor cx, cx
     
    mov ah, 1
    int 21h
     
    _while:
        cmp al, 0dh
        je exit 
        
        sub al, 30h
        mov [si], al
        add si, 1 
        inc cx
        
        int 21h
        jmp _while
    
    exit: 
    mov bx, cx 
    pop si

ret
input_arr endp

;assumes the array to be a byte array 
select proc 

    push bx      ;bx = num of elem, si = offset addr of array, cx = how many comparisons are needed in the next pass, dx = save array offset
    push cx
    push dx   
    push si 
    dec bx
    jz end_sort     ;if array contains only 1 elem, nothing to sort 
    mov dx, si      
    
    sort_loop:
    mov si, dx
    mov cx, bx
    mov di, si      ;di = pointer to the largest elem in a pass
    mov al, [si]    ;al = value of the largest elem in the pass
    
    for:
    inc si          ;go to the next elem
    cmp [si], al    ;check if [si] < al
    jng next        ;no, continue
    
    mov di, si
    mov al, [si]
    
    next:
    loop for
    
    ;now al contains the largest elem and di points to it
    call swap
    dec bx      ;1 elem has been sorted 
    jnz sort_loop
    
    end_sort: 
    ;retore the original values
    pop si
    pop dx
    pop cx
    pop bx 
    
    ;mov ah, 2 
    ;add bx, 30h ;convert to ascii of the decimal num stored in bx
    ;mov dl, bl
    ;int 21h

ret
select endp
 
 
;swaps two elem, [si] and al; si currently points to the last elem, al is the largest elem and di is the pointer to it
swap proc
    push ax
     
    mov al, [si]    ;al = last
    xchg al, [di]   ;al = largest, di -> last  
    mov [si], al    ;largest elem moves to the last
    
    pop ax 

ret
swap endp   

print_arr proc
    ;i = 0
    ;while(i < n){
    ;print(arr[i])
    ;i++
    ;}   
    mov cx, bx  
    
    for_:  
    
    mov ah, 2 
    mov dl, [si] 
    add dl, 30h
    int 21h   
    
    mov dl, ','
    int 21h
    
    add si, 1  
    
    loop for_

ret
print_arr endp

end main