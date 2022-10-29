#include <stdio.h>
void main()
{
	unsigned int buf=0;
	unsigned char key, clr=15;

	
start: 
	// set the text mode of the image with 16 colors and a dimension of 80 * 25:
	asm 
	{
		mov ah, 00h
		mov al, 03h
		int 10h
	}

	while (key != 1) // key variable stores code of pressed keyboard button. code of esc button = 1
	{
mouse:
		// check mouse buttons:
		asm 
		{
			// get status of mouse buttons: check if right, left, or middle buttons are pressed.
			mov ax, 03h
			int 33h 
			
			// compare with previous status of mouse buttons:
			mov ax, buf
			mov buf, bx
			// bit 0 - left button, bit 1 - right button, bit 2 - middle button. bit = 0 - button is pressed.
			// if no button is pressed, go to exit:
			test bx, 111b 
			jz exititer
			//if status of mouse button is changed, go to exit:
			cmp bx, ax
			jz exititer
		}

color:
		// coloring a line with one of 8 colors:
		asm 
		{
			// shifting the page content down with filling in the vacant space:
			mov ah, 07h
			mov al, 01h // number of lines to be painted = 1
			xor cx, cx // top left corner information
			mov dx, 184Fh // lower right corner information
			mov bh, clr // background color number
			int 10h

			// determining the next color for background painting.
			// possible values of the variable: 0Fh (black), 1Fh (blue), 2Fh (green), 3Fh (blue), 4Fh (red), 5Fh (purple), 6Fh (brown), 7Fh (light grey):
			add clr, 10h
			cmp clr, 8Fh
			jnz condexit
			mov clr, 0Fh
		}

condexit:
		// check if keyboard key esc is pressed:
		asm 
		{
			// if code of key (key variable) is empty, go to exit:
			mov key, 0
			mov ah, 01h
			int 16h
			jz exititer
			// if not, check the code of the pressed key:
			mov ah, 00h
			int 16h
			mov key, ah // code of esc = 1. if key == 1, exit from the while loop
		}

exititer:
	}
}