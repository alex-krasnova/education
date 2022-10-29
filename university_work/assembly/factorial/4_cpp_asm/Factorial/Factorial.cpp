// Factorial.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>

int _tmain(int argc, _TCHAR* argv[])
{
	int n, fct;
	bool err_flag = 0;
    std::cout << "Enter positive integer n <= 8: ";
    std::cin >> n;
    //std::cout << "n = " << n << std::endl;

	_asm {
		xor eax,eax
		mov eax,n
		cmp eax,1
		jb errorMsg
		cmp eax,8
		ja errorMsg
		xor ebx,ebx
		mov ebx,eax
		cmp ebx,1
		je p_exit
	resolveFactLoop:
		dec ebx
		mul ebx
		cmp ebx,1
		jne resolveFactLoop
		jz p_exit
	errorMsg:
		mov err_flag,1			
	p_exit:
		mov fct,eax
	}

	if (err_flag == 1)
		std::cout << "Incorrect number" << std::endl;
	else
		std::cout << "n! = " << fct << std::endl;
	system ("pause");
	return 0;
}
