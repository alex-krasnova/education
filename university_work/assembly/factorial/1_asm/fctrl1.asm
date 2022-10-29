.8086
.model small		
.stack 100h		
.data	
	buff byte 6,7 Dup(?) ; buffer for entered number
	message1 byte "Enter positive integer n from 1 to 8: ", 0Dh, 0Ah, "$" ; start message
	message2 byte "n! = $" ; message before result
	err byte "incorrect number$" ; error message
.code
Start:
	mov	ax,@data	
	mov	ds,ax			

; output message1
	mov dx,offset message1
	mov ah,09h
	int 21h
	
; input number
    mov ah,0ah
    xor di,di
    mov dx,offset buff ; buffer address
    int 21h ; accept a string
    mov dl,0ah
    mov ah,02h
    int 21h
    
; processing buffer content
    mov si,offset buff+2 ; address of string start
	
; check if the first character is a "-" (entered a negative number)
	cmp byte ptr [si],"-"
	jz errorMsg

; clear register ax, input base = 10, because decimal system
input2ax:
    xor ax,ax
    mov bx,10 
	
; output each character in the loop. For this task, it is slightly redundant, because 1 character only is expected
input2axLoop:
    mov cl,[si] ; get character from buffer
    cmp cl,0dh  ; check if it's the last one
    jz checkIfNumError ; go to check the number in ax if the character is the last one

    ; if the character is not the last, then check it for correctness
    cmp cl,'0'  ; compare cl and 0
    jb errorMsg ; if cl < 0 then error
    cmp cl,'9'  ; compare cl and 9
    ja errorMsg ; if cl > 9 then error
 
    sub cl,'0' ; change type to number
    mul bx     ; multiply by 10
    add ax,cx  ; add to the others
    inc si     ; cursor to next character
    jmp input2axLoop     ; go to the next iteration

; if error, then display error message and exit
errorMsg:
    mov dx,offset err
    mov ah,09
    int 21h
    jmp exit
 
; all characters from the buffer have been processed, the number is in ax
	
; check the range of number: >=1 and <= 8
checkIfNumError:
	cmp ax,1 ; compare ax and 1
	jb errorMsg ; if ax < 1 then error
	cmp ax,8 ; compare ax and 8
	ja errorMsg ; if ax > 8, then error

; factorial calculation
resolveFactBegin:
	xor bx,bx	; clear bx
	mov bx,ax ; initial value bx = input number
	cmp bx,1 ; check if bx = 1
	je outResultBegin ;if bx = 1 then go to exit. Else bx will be multiplied by 0 -> result = 0
	
; in a loop, multiply the result stored in ax register by the parameter stored in bx
; initial value of bx = input number - 1
; end value bx = 1, this is the condition to exit the loop
; the result of the factorial is stored in ax
resolveFactLoop:
	dec bx ; subtract 1 from bx
	mul bx ; multiply ax by bx
	cmp bx,1 ; check if bx = 1
	jne resolveFactLoop ; if bx != 1 then go to the next iteration

; number output
outResultBegin:

; message2 output
	push ax ; save values of ax and dx to stack
	push dx
	mov dx, offset message2 ; output the message n! = ...
	mov ah, 09h
	int 21h
	pop dx ;  restore values of ax and dx from stack
	pop ax
	
; output message - factorial
	mov cx,10 ; cx - base of the number system
	xor di,di ; di - count of numbers
 
; convert each number to character
convResToSymbolLoop:
	xor dx,dx
	div cx ; dl = num mod 10
	add dl,'0' ; convert number to character
	inc di
	push dx ; save to stack
	or ax,ax
	jnz convResToSymbolLoop
		
; output the result from stack to screen
showResultLoop:
	pop dx ; dl = next character
	mov ah,2 ; output symbol to screen
	int 21h
	dec di ; repeat until di<>0
	jnz showResultLoop

; exit	
exit:
	mov	ax,4C00h
	int 21h			
end Start