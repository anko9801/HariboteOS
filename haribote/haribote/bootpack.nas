[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_init_gdtidt
	EXTERN	_init_pic
	EXTERN	_io_sti
	EXTERN	_fifo32_init
	EXTERN	_init_pit
	EXTERN	_init_keyboard
	EXTERN	_enable_mouse
	EXTERN	_io_out8
	EXTERN	_memtest
	EXTERN	_memman_init
	EXTERN	_memman_free
	EXTERN	_init_palette
	EXTERN	_shtctl_init
	EXTERN	_task_init
	EXTERN	_task_run
	EXTERN	_sheet_alloc
	EXTERN	_memman_alloc_4k
	EXTERN	_sheet_setbuf
	EXTERN	_init_screen8
	EXTERN	_init_mouse_cursor8
	EXTERN	_sheet_slide
	EXTERN	_sheet_updown
	EXTERN	_fifo32_put
	EXTERN	_file_readfat
	EXTERN	_file_search
	EXTERN	_file_loadfile2
	EXTERN	_memman_free_4k
	EXTERN	_fifo32_status
	EXTERN	_io_cli
	EXTERN	_fifo32_get
	EXTERN	_sheet_free
	EXTERN	_taskctl
	EXTERN	_mouse_decode
	EXTERN	_cons_putstr0
	EXTERN	_asm_end_app
	EXTERN	_keytable0.0
	EXTERN	_wait_KBC_sendready
	EXTERN	_keytable1.1
	EXTERN	_task_sleep
	EXTERN	_hankaku
	EXTERN	_change_wtitle8
	EXTERN	_task_alloc
	EXTERN	_console_task
	EXTERN	_make_window8
	EXTERN	_make_textbox8
[FILE "bootpack.c"]
[SECTION .data]
_keytable0.0:
	DB	0
	DB	0
	DB	49
	DB	50
	DB	51
	DB	52
	DB	53
	DB	54
	DB	55
	DB	56
	DB	57
	DB	48
	DB	45
	DB	94
	DB	8
	DB	0
	DB	113
	DB	119
	DB	101
	DB	114
	DB	116
	DB	121
	DB	117
	DB	105
	DB	111
	DB	112
	DB	64
	DB	91
	DB	10
	DB	0
	DB	97
	DB	115
	DB	100
	DB	102
	DB	103
	DB	104
	DB	106
	DB	107
	DB	108
	DB	59
	DB	58
	DB	0
	DB	0
	DB	93
	DB	122
	DB	120
	DB	99
	DB	118
	DB	98
	DB	110
	DB	109
	DB	44
	DB	46
	DB	47
	DB	0
	DB	42
	DB	92
	DB	32
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	55
	DB	56
	DB	57
	DB	45
	DB	52
	DB	53
	DB	54
	DB	43
	DB	49
	DB	50
	DB	51
	DB	48
	DB	46
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	92
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	92
	DB	0
	DB	0
_keytable1.1:
	DB	0
	DB	0
	DB	33
	DB	34
	DB	35
	DB	36
	DB	37
	DB	38
	DB	39
	DB	40
	DB	41
	DB	126
	DB	61
	DB	126
	DB	8
	DB	0
	DB	81
	DB	87
	DB	69
	DB	82
	DB	84
	DB	89
	DB	85
	DB	73
	DB	79
	DB	80
	DB	96
	DB	123
	DB	10
	DB	0
	DB	65
	DB	83
	DB	68
	DB	70
	DB	71
	DB	72
	DB	74
	DB	75
	DB	76
	DB	43
	DB	42
	DB	0
	DB	0
	DB	125
	DB	90
	DB	88
	DB	67
	DB	86
	DB	66
	DB	78
	DB	77
	DB	60
	DB	62
	DB	63
	DB	0
	DB	42
	DB	0
	DB	32
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	55
	DB	56
	DB	57
	DB	45
	DB	52
	DB	53
	DB	54
	DB	43
	DB	49
	DB	50
	DB	51
	DB	48
	DB	46
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	95
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	124
	DB	0
	DB	0
LC0:
	DB	"nihongo.fnt",0x00
LC2:
	DB	0x0A,"Break(mouse) :",0x0A,0x00
LC1:
	DB	0x0A,"Break(key) :",0x0A,0x00
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	LEA	EBX,DWORD [-44+EBP]
	SUB	ESP,1876
	MOV	DWORD [-1812+EBP],-1
	MOV	DWORD [-1816+EBP],-1
	MOV	DWORD [-1820+EBP],0
	MOV	DWORD [-1832+EBP],-1
	MOV	DWORD [-1836+EBP],-1
	MOV	DWORD [-1840+EBP],2147483647
	MOV	DWORD [-1844+EBP],0
	MOV	DWORD [-1856+EBP],0
	MOV	DWORD [-1860+EBP],0
	MOV	AL,BYTE [4081]
	SAR	AL,4
	MOV	EDX,EAX
	AND	EDX,7
	MOV	DWORD [-1864+EBP],EDX
	MOV	DWORD [-1868+EBP],-1
	CALL	_init_gdtidt
	CALL	_init_pic
	CALL	_io_sti
	LEA	EAX,DWORD [-636+EBP]
	PUSH	0
	PUSH	EAX
	PUSH	128
	PUSH	EBX
	CALL	_fifo32_init
	MOV	DWORD [4076],EBX
	CALL	_init_pit
	PUSH	256
	PUSH	EBX
	CALL	_init_keyboard
	LEA	EAX,DWORD [-780+EBP]
	PUSH	EAX
	PUSH	512
	PUSH	EBX
	CALL	_enable_mouse
	ADD	ESP,36
	PUSH	248
	PUSH	33
	CALL	_io_out8
	PUSH	239
	PUSH	161
	CALL	_io_out8
	LEA	EAX,DWORD [-764+EBP]
	PUSH	0
	PUSH	EAX
	LEA	EAX,DWORD [-76+EBP]
	PUSH	32
	PUSH	EAX
	CALL	_fifo32_init
	ADD	ESP,32
	PUSH	-1073741825
	PUSH	4194304
	CALL	_memtest
	PUSH	3932160
	MOV	DWORD [-1848+EBP],EAX
	CALL	_memman_init
	PUSH	647168
	PUSH	4096
	PUSH	3932160
	CALL	_memman_free
	MOV	EAX,DWORD [-1848+EBP]
	SUB	EAX,4194304
	PUSH	EAX
	PUSH	4194304
	PUSH	3932160
	CALL	_memman_free
	ADD	ESP,36
	CALL	_init_palette
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [4088]
	PUSH	3932160
	CALL	_shtctl_init
	PUSH	3932160
	MOV	DWORD [-1852+EBP],EAX
	CALL	_task_init
	PUSH	2
	PUSH	1
	MOV	DWORD [-1876+EBP],EAX
	PUSH	EAX
	MOV	DWORD [-20+EBP],EAX
	CALL	_task_run
	ADD	ESP,32
	MOV	EAX,DWORD [-1876+EBP]
	MOV	EDX,DWORD [-1852+EBP]
	MOV	DWORD [4068],EDX
	MOV	BYTE [188+EAX],0
	PUSH	EDX
	CALL	_sheet_alloc
	MOV	ESI,EAX
	MOVSX	EDX,WORD [4086]
	MOVSX	EAX,WORD [4084]
	IMUL	EAX,EDX
	PUSH	EAX
	PUSH	3932160
	CALL	_memman_alloc_4k
	PUSH	-1
	MOV	EBX,EAX
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	EBX
	PUSH	ESI
	CALL	_sheet_setbuf
	ADD	ESP,32
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	EBX
	LEA	EBX,DWORD [-1804+EBP]
	CALL	_init_screen8
	PUSH	DWORD [-1848+EBP]
	PUSH	DWORD [-1852+EBP]
	CALL	_open_console
	PUSH	DWORD [-1852+EBP]
	MOV	EDI,EAX
	CALL	_sheet_alloc
	PUSH	99
	PUSH	16
	MOV	DWORD [-1872+EBP],EAX
	PUSH	10
	PUSH	EBX
	PUSH	EAX
	CALL	_sheet_setbuf
	ADD	ESP,44
	PUSH	99
	PUSH	EBX
	MOV	EBX,2
	CALL	_init_mouse_cursor8
	MOVSX	EAX,WORD [4084]
	LEA	ECX,DWORD [-16+EAX]
	MOV	EAX,ECX
	CDQ
	IDIV	EBX
	MOV	DWORD [-1824+EBP],EAX
	MOVSX	EAX,WORD [4086]
	PUSH	0
	LEA	ECX,DWORD [-44+EAX]
	PUSH	0
	MOV	EAX,ECX
	PUSH	ESI
	CDQ
	IDIV	EBX
	MOV	DWORD [-1828+EBP],EAX
	CALL	_sheet_slide
	PUSH	4
	PUSH	32
	PUSH	EDI
	CALL	_sheet_slide
	ADD	ESP,32
	PUSH	DWORD [-1828+EBP]
	PUSH	DWORD [-1824+EBP]
	PUSH	DWORD [-1872+EBP]
	CALL	_sheet_slide
	PUSH	0
	PUSH	ESI
	CALL	_sheet_updown
	PUSH	1
	PUSH	EDI
	CALL	_sheet_updown
	PUSH	2
	PUSH	DWORD [-1872+EBP]
	CALL	_sheet_updown
	ADD	ESP,36
	PUSH	EDI
	CALL	_keywin_on
	LEA	EDX,DWORD [-76+EBP]
	PUSH	237
	PUSH	EDX
	CALL	_fifo32_put
	LEA	EAX,DWORD [-76+EBP]
	PUSH	DWORD [-1864+EBP]
	PUSH	EAX
	CALL	_fifo32_put
	PUSH	11520
	PUSH	3932160
	CALL	_memman_alloc_4k
	PUSH	1049088
	MOV	EBX,EAX
	PUSH	EAX
	CALL	_file_readfat
	ADD	ESP,36
	PUSH	224
	PUSH	1058304
	PUSH	LC0
	CALL	_file_search
	ADD	ESP,12
	MOV	EDX,EAX
	TEST	EAX,EAX
	JE	L2
	MOV	EAX,DWORD [28+EAX]
	PUSH	EBX
	MOV	DWORD [-1808+EBP],EAX
	LEA	EAX,DWORD [-1808+EBP]
	PUSH	EAX
	MOVZX	EAX,WORD [26+EDX]
	PUSH	EAX
	CALL	_file_loadfile2
	ADD	ESP,12
	MOV	ECX,EAX
L3:
	MOV	DWORD [4072],ECX
	PUSH	11520
	PUSH	EBX
	PUSH	3932160
	CALL	_memman_free_4k
L84:
	ADD	ESP,12
L14:
	LEA	EBX,DWORD [-76+EBP]
	PUSH	EBX
	CALL	_fifo32_status
	POP	EDX
	TEST	EAX,EAX
	JLE	L17
	CMP	DWORD [-1868+EBP],0
	JS	L88
L17:
	LEA	EBX,DWORD [-44+EBP]
	CALL	_io_cli
	PUSH	EBX
	CALL	_fifo32_status
	POP	ESI
	TEST	EAX,EAX
	JE	L89
	PUSH	EBX
	CALL	_fifo32_get
	MOV	DWORD [-1808+EBP],EAX
	CALL	_io_sti
	POP	EBX
	TEST	EDI,EDI
	JE	L24
	CMP	DWORD [28+EDI],0
	JNE	L24
	XOR	EDI,EDI
L25:
	MOV	EDX,DWORD [-1808+EBP]
	LEA	EAX,DWORD [-256+EDX]
	CMP	EAX,255
	JBE	L90
	LEA	EAX,DWORD [-512+EDX]
	CMP	EAX,255
	JBE	L91
	LEA	EAX,DWORD [-768+EDX]
	CMP	EAX,255
	JBE	L92
	LEA	EAX,DWORD [-1024+EDX]
	CMP	EAX,999
	JBE	L93
	LEA	EAX,DWORD [-2024+EDX]
	CMP	EAX,255
	JA	L14
	IMUL	EAX,EDX,40
	ADD	EAX,DWORD [-1852+EBP]
	PUSH	42240
	PUSH	DWORD [-79916+EAX]
	PUSH	3932160
	LEA	EBX,DWORD [-79916+EAX]
	CALL	_memman_free_4k
	PUSH	EBX
	CALL	_sheet_free
	ADD	ESP,16
	JMP	L14
L93:
	IMUL	EDX,EDX,192
	ADD	EDX,DWORD [_taskctl]
	LEA	EAX,DWORD [-192520+EDX]
	PUSH	EAX
	CALL	_close_constask
L83:
	POP	EAX
	JMP	L14
L92:
	IMUL	EAX,EDX,40
	MOV	EDX,DWORD [-1852+EBP]
	LEA	EAX,DWORD [-29676+EAX+EDX*1]
	PUSH	EAX
	CALL	_close_console
	JMP	L83
L91:
	MOVZX	EAX,BYTE [-1808+EBP]
	PUSH	EAX
	LEA	EAX,DWORD [-780+EBP]
	PUSH	EAX
	CALL	_mouse_decode
	POP	ECX
	POP	EBX
	TEST	EAX,EAX
	JE	L14
	MOV	EAX,DWORD [-772+EBP]
	MOV	EDX,DWORD [-776+EBP]
	ADD	DWORD [-1828+EBP],EAX
	ADD	DWORD [-1824+EBP],EDX
	JS	L94
L51:
	CMP	DWORD [-1828+EBP],0
	JS	L95
L52:
	MOVSX	EAX,WORD [4084]
	DEC	EAX
	CMP	DWORD [-1824+EBP],EAX
	JLE	L53
	MOV	DWORD [-1824+EBP],EAX
L53:
	MOVSX	EAX,WORD [4086]
	DEC	EAX
	CMP	DWORD [-1828+EBP],EAX
	JLE	L54
	MOV	DWORD [-1828+EBP],EAX
L54:
	PUSH	DWORD [-1828+EBP]
	PUSH	DWORD [-1824+EBP]
	PUSH	DWORD [-1872+EBP]
	CALL	_sheet_slide
	ADD	ESP,12
	MOV	EAX,DWORD [-1824+EBP]
	MOV	EDX,DWORD [-1828+EBP]
	MOV	DWORD [-1832+EBP],EAX
	MOV	DWORD [-1836+EBP],EDX
	TEST	DWORD [-768+EBP],1
	JNE	L96
	MOV	DWORD [-1812+EBP],-1
	CMP	DWORD [-1840+EBP],2147483647
	JE	L14
L85:
	PUSH	DWORD [-1844+EBP]
	PUSH	DWORD [-1840+EBP]
	PUSH	DWORD [-1856+EBP]
	CALL	_sheet_slide
	MOV	DWORD [-1840+EBP],2147483647
	JMP	L84
L96:
	CMP	DWORD [-1812+EBP],0
	JS	L97
	MOV	EBX,DWORD [-1824+EBP]
	MOV	EAX,DWORD [-1820+EBP]
	SUB	EBX,DWORD [-1812+EBP]
	MOV	ESI,DWORD [-1828+EBP]
	SUB	ESI,DWORD [-1816+EBP]
	MOV	EDX,DWORD [-1828+EBP]
	LEA	EBX,DWORD [2+EBX+EAX*1]
	MOV	DWORD [-1816+EBP],EDX
	MOV	DWORD [-1840+EBP],EBX
	ADD	DWORD [-1844+EBP],ESI
	AND	DWORD [-1840+EBP],-4
	JMP	L14
L97:
	MOV	EAX,DWORD [-1852+EBP]
	MOV	EAX,DWORD [16+EAX]
	MOV	DWORD [-1884+EBP],EAX
	MOV	ECX,EAX
L87:
	DEC	ECX
	TEST	ECX,ECX
	JLE	L14
	MOV	EDX,DWORD [-1852+EBP]
	MOV	ESI,DWORD [-1828+EBP]
	MOV	EBX,DWORD [-1824+EBP]
	MOV	EDX,DWORD [20+EDX+ECX*4]
	MOV	DWORD [-1856+EBP],EDX
	SUB	ESI,DWORD [16+EDX]
	SUB	EBX,DWORD [12+EDX]
	JS	L87
	MOV	EAX,DWORD [4+EDX]
	CMP	EBX,EAX
	JGE	L87
	TEST	ESI,ESI
	JS	L87
	CMP	ESI,DWORD [8+EDX]
	JGE	L87
	IMUL	EAX,ESI
	MOV	DWORD [-1888+EBP],EAX
	MOV	EDX,DWORD [EDX]
	MOV	EAX,DWORD [-1888+EBP]
	ADD	EAX,EBX
	MOVZX	EAX,BYTE [EAX+EDX*1]
	MOV	EDX,DWORD [-1856+EBP]
	CMP	EAX,DWORD [20+EDX]
	JE	L87
	MOV	EAX,DWORD [-1884+EBP]
	DEC	EAX
	PUSH	EAX
	PUSH	EDX
	CALL	_sheet_updown
	CMP	DWORD [-1856+EBP],EDI
	POP	EAX
	POP	EDX
	JE	L63
	PUSH	EDI
	CALL	_keywin_off
	MOV	EDI,DWORD [-1856+EBP]
	PUSH	EDI
	CALL	_keywin_on
	POP	EDX
	POP	ECX
L63:
	CMP	EBX,2
	JLE	L64
	MOV	EDX,DWORD [-1856+EBP]
	MOV	EAX,DWORD [4+EDX]
	SUB	EAX,3
	CMP	EBX,EAX
	JGE	L64
	CMP	ESI,2
	JLE	L64
	CMP	ESI,20
	JG	L64
	MOV	EAX,DWORD [-1824+EBP]
	MOV	EDX,DWORD [-1828+EBP]
	MOV	DWORD [-1812+EBP],EAX
	MOV	DWORD [-1816+EBP],EDX
	MOV	EAX,DWORD [-1856+EBP]
	MOV	EDX,DWORD [-1856+EBP]
	MOV	EAX,DWORD [12+EAX]
	MOV	EDX,DWORD [16+EDX]
	MOV	DWORD [-1820+EBP],EAX
	MOV	DWORD [-1844+EBP],EDX
L64:
	MOV	EAX,DWORD [-1856+EBP]
	MOV	EDX,DWORD [4+EAX]
	LEA	EAX,DWORD [-21+EDX]
	CMP	EAX,EBX
	JG	L14
	LEA	EAX,DWORD [-5+EDX]
	CMP	EBX,EAX
	JGE	L14
	CMP	ESI,4
	JLE	L14
	CMP	ESI,18
	JG	L14
	MOV	EDX,DWORD [-1856+EBP]
	TEST	BYTE [28+EDX],16
	JE	L98
	MOV	EDX,DWORD [-1856+EBP]
	MOV	EBX,DWORD [36+EDX]
	PUSH	LC2
	PUSH	DWORD [164+EBX]
	CALL	_cons_putstr0
	CALL	_io_cli
	LEA	EAX,DWORD [48+EBX]
	MOV	DWORD [84+EBX],EAX
	MOV	DWORD [76+EBX],_asm_end_app
	CALL	_io_sti
	PUSH	0
	PUSH	-1
	PUSH	EBX
	CALL	_task_run
	ADD	ESP,20
	JMP	L14
L98:
	MOV	EBX,DWORD [36+EDX]
	PUSH	-1
	PUSH	EDX
	CALL	_sheet_updown
	PUSH	EDI
	CALL	_keywin_off
	MOV	EDX,DWORD [-1852+EBP]
	MOV	EAX,DWORD [16+EDX]
	MOV	EDI,DWORD [16+EDX+EAX*4]
	PUSH	EDI
	CALL	_keywin_on
	CALL	_io_cli
	LEA	EAX,DWORD [16+EBX]
	PUSH	4
	PUSH	EAX
	CALL	_fifo32_put
	CALL	_io_sti
	ADD	ESP,24
	JMP	L14
L95:
	MOV	DWORD [-1828+EBP],0
	JMP	L52
L94:
	MOV	DWORD [-1824+EBP],0
	JMP	L51
L90:
	CMP	EDX,383
	JG	L27
	CMP	DWORD [-1860+EBP],0
	JNE	L28
	MOV	AL,BYTE [_keytable0.0-256+EDX]
L86:
	MOV	BYTE [-124+EBP],AL
L30:
	MOV	AL,BYTE [-124+EBP]
	TEST	AL,AL
	JE	L31
	TEST	EDI,EDI
	JE	L31
	MOVSX	EAX,AL
	ADD	EAX,256
	PUSH	EAX
	MOV	EAX,DWORD [36+EDI]
	ADD	EAX,16
	PUSH	EAX
	CALL	_fifo32_put
	POP	EAX
	POP	EDX
L31:
	CMP	DWORD [-1808+EBP],271
	JE	L99
L32:
	CMP	DWORD [-1808+EBP],315
	JE	L100
L34:
	CMP	DWORD [-1808+EBP],316
	JE	L101
L36:
	CMP	DWORD [-1808+EBP],343
	JE	L102
L38:
	MOV	EAX,DWORD [-1808+EBP]
	CMP	EAX,298
	JE	L103
L39:
	CMP	EAX,310
	JE	L104
L40:
	CMP	EAX,426
	JE	L105
L41:
	CMP	EAX,438
	JE	L106
L42:
	CMP	EAX,314
	JE	L107
L43:
	CMP	DWORD [-1808+EBP],325
	JE	L108
L44:
	CMP	DWORD [-1808+EBP],326
	JE	L109
L45:
	MOV	EAX,DWORD [-1808+EBP]
	CMP	EAX,506
	JE	L110
L46:
	CMP	EAX,510
	JNE	L14
	CALL	_wait_KBC_sendready
	PUSH	DWORD [-1868+EBP]
	PUSH	96
	CALL	_io_out8
	POP	ESI
	POP	EAX
	JMP	L14
L110:
	MOV	DWORD [-1868+EBP],-1
	JMP	L46
L109:
	PUSH	237
	LEA	EBX,DWORD [-76+EBP]
	PUSH	EBX
	XOR	DWORD [-1864+EBP],1
	CALL	_fifo32_put
	PUSH	DWORD [-1864+EBP]
	PUSH	EBX
	CALL	_fifo32_put
	ADD	ESP,16
	JMP	L45
L108:
	PUSH	237
	LEA	EBX,DWORD [-76+EBP]
	PUSH	EBX
	XOR	DWORD [-1864+EBP],2
	CALL	_fifo32_put
	PUSH	DWORD [-1864+EBP]
	PUSH	EBX
	CALL	_fifo32_put
	ADD	ESP,16
	JMP	L44
L107:
	PUSH	237
	LEA	EBX,DWORD [-76+EBP]
	PUSH	EBX
	XOR	DWORD [-1864+EBP],4
	CALL	_fifo32_put
	PUSH	DWORD [-1864+EBP]
	PUSH	EBX
	CALL	_fifo32_put
	ADD	ESP,16
	JMP	L43
L106:
	AND	DWORD [-1860+EBP],-3
	JMP	L42
L105:
	AND	DWORD [-1860+EBP],-2
	JMP	L41
L104:
	OR	DWORD [-1860+EBP],2
	JMP	L40
L103:
	OR	DWORD [-1860+EBP],1
	JMP	L39
L102:
	MOV	EDX,DWORD [-1852+EBP]
	MOV	EAX,DWORD [16+EDX]
	CMP	EAX,2
	JLE	L38
	DEC	EAX
	PUSH	EAX
	PUSH	DWORD [24+EDX]
	CALL	_sheet_updown
	POP	EAX
	POP	EDX
	JMP	L38
L101:
	CMP	DWORD [-1860+EBP],0
	JE	L36
	TEST	EDI,EDI
	JE	L37
	PUSH	EDI
	CALL	_keywin_off
	POP	ECX
L37:
	PUSH	DWORD [-1848+EBP]
	PUSH	DWORD [-1852+EBP]
	CALL	_open_console
	PUSH	4
	PUSH	32
	MOV	EDI,EAX
	PUSH	EAX
	CALL	_sheet_slide
	MOV	EAX,DWORD [-1852+EBP]
	PUSH	DWORD [16+EAX]
	PUSH	EDI
	CALL	_sheet_updown
	PUSH	EDI
	CALL	_keywin_on
	ADD	ESP,32
	JMP	L36
L100:
	CMP	DWORD [-1860+EBP],0
	JE	L34
	TEST	EDI,EDI
	JE	L34
	MOV	EBX,DWORD [36+EDI]
	TEST	EBX,EBX
	JE	L34
	CMP	DWORD [52+EBX],0
	JE	L34
	PUSH	LC1
	PUSH	DWORD [164+EBX]
	CALL	_cons_putstr0
	CALL	_io_cli
	LEA	EAX,DWORD [48+EBX]
	MOV	DWORD [84+EBX],EAX
	MOV	DWORD [76+EBX],_asm_end_app
	CALL	_io_sti
	PUSH	0
	PUSH	-1
	PUSH	EBX
	CALL	_task_run
	ADD	ESP,20
	JMP	L34
L99:
	TEST	EDI,EDI
	JE	L32
	PUSH	EDI
	CALL	_keywin_off
	MOV	ECX,DWORD [24+EDI]
	DEC	ECX
	POP	ESI
	JNE	L33
	MOV	EAX,DWORD [-1852+EBP]
	MOV	ECX,DWORD [16+EAX]
	DEC	ECX
L33:
	MOV	EDX,DWORD [-1852+EBP]
	MOV	EDI,DWORD [20+EDX+ECX*4]
	PUSH	EDI
	CALL	_keywin_on
	POP	EBX
	JMP	L32
L28:
	MOV	AL,BYTE [_keytable1.1-256+EDX]
	JMP	L86
L27:
	MOV	BYTE [-124+EBP],0
	JMP	L30
L24:
	MOV	EDX,DWORD [-1852+EBP]
	MOV	EAX,DWORD [16+EDX]
	MOV	EDI,DWORD [16+EDX+EAX*4]
	PUSH	EDI
	CALL	_keywin_on
	POP	ECX
	JMP	L25
L89:
	CMP	DWORD [-1832+EBP],0
	JNS	L111
	CMP	DWORD [-1840+EBP],2147483647
	JNE	L112
	PUSH	DWORD [-1876+EBP]
	CALL	_task_sleep
	CALL	_io_sti
	JMP	L83
L112:
	CALL	_io_sti
	JMP	L85
L111:
	CALL	_io_sti
	PUSH	DWORD [-1836+EBP]
	PUSH	DWORD [-1832+EBP]
	PUSH	DWORD [-1872+EBP]
	CALL	_sheet_slide
	MOV	DWORD [-1832+EBP],-1
	JMP	L84
L88:
	PUSH	EBX
	CALL	_fifo32_get
	MOV	DWORD [-1868+EBP],EAX
	CALL	_wait_KBC_sendready
	PUSH	DWORD [-1868+EBP]
	PUSH	96
	CALL	_io_out8
	ADD	ESP,12
	JMP	L17
L2:
	PUSH	145472
	PUSH	3932160
	CALL	_memman_alloc_4k
	XOR	EDX,EDX
	POP	ESI
	MOV	ECX,EAX
	MOV	DWORD [-1808+EBP],0
	POP	EAX
L8:
	MOV	AL,BYTE [_hankaku+EDX]
	MOV	BYTE [EDX+ECX*1],AL
	MOV	EAX,DWORD [-1808+EBP]
	INC	EAX
	MOV	DWORD [-1808+EBP],EAX
	MOV	EDX,EAX
	CMP	EAX,4095
	JLE	L8
	MOV	DWORD [-1808+EBP],4096
	MOV	EAX,4096
L13:
	MOV	BYTE [EAX+ECX*1],-1
	MOV	EAX,DWORD [-1808+EBP]
	INC	EAX
	MOV	DWORD [-1808+EBP],EAX
	CMP	EAX,145471
	JLE	L13
	JMP	L3
	GLOBAL	_keywin_off
_keywin_off:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EBX
	PUSH	0
	MOV	EBX,DWORD [8+EBP]
	PUSH	EBX
	CALL	_change_wtitle8
	TEST	BYTE [28+EBX],32
	POP	ECX
	POP	EAX
	JNE	L115
L113:
	MOV	EBX,DWORD [-4+EBP]
	LEAVE
	RET
L115:
	PUSH	3
	MOV	EAX,DWORD [36+EBX]
	ADD	EAX,16
	PUSH	EAX
	CALL	_fifo32_put
	POP	EAX
	POP	EDX
	JMP	L113
	GLOBAL	_keywin_on
_keywin_on:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EBX
	PUSH	1
	MOV	EBX,DWORD [8+EBP]
	PUSH	EBX
	CALL	_change_wtitle8
	TEST	BYTE [28+EBX],32
	POP	ECX
	POP	EAX
	JNE	L118
L116:
	MOV	EBX,DWORD [-4+EBP]
	LEAVE
	RET
L118:
	PUSH	2
	MOV	EAX,DWORD [36+EBX]
	ADD	EAX,16
	PUSH	EAX
	CALL	_fifo32_put
	POP	EAX
	POP	EDX
	JMP	L116
	GLOBAL	_open_constask
_open_constask:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	ESI
	PUSH	EBX
	CALL	_task_alloc
	PUSH	512
	PUSH	3932160
	MOV	EBX,EAX
	CALL	_memman_alloc_4k
	PUSH	65536
	PUSH	3932160
	MOV	ESI,EAX
	CALL	_memman_alloc_4k
	MOV	EDX,DWORD [8+EBP]
	MOV	DWORD [76+EBX],_console_task
	MOV	DWORD [172+EBX],EAX
	ADD	EAX,65524
	MOV	DWORD [100+EBX],EAX
	MOV	DWORD [116+EBX],8
	MOV	DWORD [120+EBX],16
	MOV	DWORD [124+EBX],8
	MOV	DWORD [128+EBX],8
	MOV	DWORD [132+EBX],8
	MOV	DWORD [136+EBX],8
	MOV	DWORD [4+EAX],EDX
	MOV	EDX,DWORD [100+EBX]
	MOV	EAX,DWORD [12+EBP]
	MOV	DWORD [8+EDX],EAX
	PUSH	2
	PUSH	2
	PUSH	EBX
	CALL	_task_run
	LEA	EAX,DWORD [16+EBX]
	PUSH	EBX
	PUSH	ESI
	PUSH	128
	PUSH	EAX
	CALL	_fifo32_init
	LEA	ESP,DWORD [-8+EBP]
	MOV	EAX,EBX
	POP	EBX
	POP	ESI
	POP	EBP
	RET
[SECTION .data]
LC3:
	DB	"console",0x00
[SECTION .text]
	GLOBAL	_open_console
_open_console:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	ESI
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_sheet_alloc
	PUSH	43725
	PUSH	3932160
	MOV	EBX,EAX
	CALL	_memman_alloc_4k
	PUSH	-1
	PUSH	165
	MOV	ESI,EAX
	PUSH	256
	PUSH	EAX
	PUSH	EBX
	CALL	_sheet_setbuf
	ADD	ESP,32
	PUSH	0
	PUSH	LC3
	PUSH	165
	PUSH	256
	PUSH	ESI
	CALL	_make_window8
	PUSH	0
	PUSH	128
	PUSH	240
	PUSH	28
	PUSH	8
	PUSH	EBX
	CALL	_make_textbox8
	ADD	ESP,44
	PUSH	DWORD [12+EBP]
	PUSH	EBX
	CALL	_open_constask
	OR	DWORD [28+EBX],32
	MOV	DWORD [36+EBX],EAX
	LEA	ESP,DWORD [-8+EBP]
	MOV	EAX,EBX
	POP	EBX
	POP	ESI
	POP	EBP
	RET
	GLOBAL	_close_constask
_close_constask:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EBX
	MOV	EBX,DWORD [8+EBP]
	PUSH	EBX
	CALL	_task_sleep
	PUSH	65536
	PUSH	DWORD [172+EBX]
	PUSH	3932160
	CALL	_memman_free_4k
	PUSH	512
	PUSH	DWORD [16+EBX]
	PUSH	3932160
	CALL	_memman_free_4k
	MOV	DWORD [4+EBX],0
	MOV	EBX,DWORD [-4+EBP]
	LEAVE
	RET
	GLOBAL	_close_console
_close_console:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	ESI
	PUSH	EBX
	MOV	EBX,DWORD [8+EBP]
	MOV	ESI,DWORD [36+EBX]
	PUSH	43725
	PUSH	DWORD [EBX]
	PUSH	3932160
	CALL	_memman_free_4k
	PUSH	EBX
	CALL	_sheet_free
	MOV	DWORD [8+EBP],ESI
	ADD	ESP,16
	LEA	ESP,DWORD [-8+EBP]
	POP	EBX
	POP	ESI
	POP	EBP
	JMP	_close_constask
