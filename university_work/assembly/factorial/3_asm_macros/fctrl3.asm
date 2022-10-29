.8086
.model small,stdcall 
.stack 100h		
INCLUDE MacrosL3.inc ; connecting macros
.data	
	message1 byte "Enter positive integer n from 1 to 8: ", 0Dh, 0Ah, "$" 
	message2 byte "n! = $"
	buff byte 6,7 Dup(?)
	err byte "incorrect number$"
	param word ?
.code
Main PROC
	mov	ax,@data	
	mov	ds,ax			

; message output: Enter positive integer n from 1 to 8
	mov dx,offset message1
	mov ah,09h
	int 21h

; macro for entering the number
	InputInt buff, err
	cmp di,1
	jz exit
	mov param,ax ; save result to param var
	
; macro for calculating factorial
	CalcFactorial param
	mov param,ax ; save result to param var
	
; message output: n! =
	push dx
	mov dx,offset message2
	mov ah,09h
	int 21h
	pop dx
	
; macro for outputting the calculated factorial
	OutputResult param
	
exit:
	mov	ax,4C00h
	int 21h	

Main ENDP

end Main