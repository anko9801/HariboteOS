[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[BITS 32]
[FILE "alloca.nas"]

		GLOBAL	__alloca

[SECTION .text]

__alloca:			; void api_beep(int tone);
		ADD		EAX,-4
		SUB		ESP,EAX
		JMP		DWORD [ESP+EAX]
