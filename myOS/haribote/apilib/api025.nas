[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[BITS 32]
[FILE "api025.nas"]

		GLOBAL	_api_fread

[SECTION .text]

_api_fread:			; void api_fread(char *buf, int maxsize, int fhandle);
		PUSH	EBX
		MOV		EDX,25
		MOV		EBX,[ESP+8]
		MOV		ECX,[ESP+12]
		MOV		EAX,[ESP+16]
		INT		0x40
		POP		EBX
		RET
