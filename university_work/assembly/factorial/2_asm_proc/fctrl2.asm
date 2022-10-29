.8086
.model small
.stack 100h		
.data	
	message1 byte "Enter positive integer n from 1 to 8: ", 0Dh, 0Ah, "$" 
	message2 byte "n! = $"
	buff byte 6,7 Dup(?)
	err byte "incorrect number$"
.code
Main PROC
	mov	ax,@data	
	mov	ds,ax			

; message output: Enter positive integer n from 1 to 8
	mov dx,offset message1
	mov ah,09h
	int 21h

; call the procedure for entering the number n
	call InputInt
	cmp di,1 ; there was an error if the value in di is 1
	jz exit ; do not calculate factorial, exit
	
; call the procedure for calculating factorial
	call CalcFactorial
	
; message output: n! =
	push ax
	push dx
	mov dx,offset message2
	mov ah,09h
	int 21h
	pop dx
	pop ax
	
; call the procedure for outputting the calculated factorial
	call OutputResult
	
exit:
	mov	ax,4C00h
	int 21h	

Main ENDP

; procedure for entering the number n. Result will be saved in ax register
InputInt proc
	mov ah,0ah
    xor di,di
    mov dx,offset buff
    int 21h
    mov dl,0ah
    mov ah,02h
    int 21h
    
; processing buffer content
    mov si,offset buff+2
	
; check if the first character is a "-" (entered a negative number)
	cmp byte ptr [si],"-"
	jz errorMsg

; clear register ax, input base = 10, because decimal system
input2ax:
    xor ax,ax
    mov bx,10
	
; output each character in the loop. For this task, it is slightly redundant, because 1 character only is expected
input2axLoop:
    mov cl,[si]
    cmp cl,0dh
    jz checkIfNumError

    ; if the character is not the last, then check it for correctness
    cmp cl,'0'
    jb errorMsg
    cmp cl,'9'
    ja errorMsg
 
    sub cl,'0'
    mul bx
    add ax,cx 
    inc si
    jmp input2axLoop

; if error, then display error message and exit
errorMsg:
	mov di,1
    mov dx,offset err
    mov ah,09h
    int 21h
    jmp i_exit

; all characters from the buffer have been processed, the number is in ax
	
; check the range of number: >=1 and <= 8
checkIfNumError:
	cmp ax,1
	jb errorMsg
	cmp ax,8
	ja errorMsg
	
i_exit:
	ret

InputInt endp

; procedure for calculating factorial. Input number should be stored in ax. Output result will be stored in ax.
CalcFactorial proc 
	xor bx,bx
	mov bx,ax
	cmp bx,1
	je f_exit
	
; in a loop, multiply the result stored in ax register by the parameter stored in bx
resolveFactLoop:
	dec bx
	mul bx
	cmp bx,1
	jne resolveFactLoop
	
f_exit:
	ret

CalcFactorial endp

; procedure for outputting the calculated factorial. Output the number stored in register ax to the screen
OutputResult proc 
	mov cx,10
	xor di,di
 
; convert each number to character
convResToSymbolLoop:
	xor dx,dx
	div cx
	add dl,'0'
	inc di
	push dx
	or ax,ax
	jnz convResToSymbolLoop
		
; output the result from stack to screen
showResultLoop:
	pop dx
	mov ah,02h
	int 21h
	dec di
	jnz showResultLoop
	
	ret

OutputResult endp

end Main