#include "bootpack.h"

void init_palette(void) {
	static unsigned char table_rgb[16 * 3] = {
		0x00, 0x00, 0x00,	/*  0:$B9u(B */
		0xff, 0x00, 0x00,	/*  1:$BL@$k$$@V(B */
		0x00, 0xff, 0x00,	/*  2:$BL@$k$$NP(B */
		0xff, 0xff, 0x00,	/*  3:$BL@$k$$2+?'(B */
		0x00, 0x00, 0xff,	/*  4:$BL@$k$$@D(B */
		0xff, 0x00, 0xff,	/*  5:$BL@$k$$;g(B */
		0x00, 0xff, 0xff,	/*  6:$BL@$k$$?e?'(B */
		0xff, 0xff, 0xff,	/*  7:$BGr(B */
		0xc6, 0xc6, 0xc6,	/*  8:$BL@$k$$3%?'(B */
		0x84, 0x00, 0x00,	/*  9:$B0E$$@V(B */
		0x00, 0x84, 0x00,	/* 10:$B0E$$NP(B */
		0x84, 0x84, 0x00,	/* 11:$B0E$$2+?'(B */
		0x00, 0x00, 0x84,	/* 12:$B0E$$@D(B */
		0x84, 0x00, 0x84,	/* 13:$B0E$$;g(B */
		0x00, 0x84, 0x84,	/* 14:$B0E$$?e?'(B */
		0x84, 0x84, 0x84	/* 15:$B0E$$3%?'(B */
	};
	set_palette(0, 15, table_rgb);
	return;

	/* static char $BL?Na$O!"%G!<%?$K$7$+;H$($J$$$1$I(BDB$BL?NaAjEv(B */
}

void set_palette(int start, int end, unsigned char *rgb) {
	int i, eflags;
	eflags = io_load_eflags();	/* $B3d$j9~$_5v2D%U%i%0$NCM$r5-O?$9$k(B */
	io_cli(); 					/* $B5v2D%U%i%0$r(B0$B$K$7$F3d$j9~$_6X;_$K$9$k(B */
	io_out8(0x03c8, start);
	for (i = start; i <= end; i++) {
		io_out8(0x03c9, rgb[0] / 4);
		io_out8(0x03c9, rgb[1] / 4);
		io_out8(0x03c9, rgb[2] / 4);
		rgb += 3;
	}
	io_store_eflags(eflags);	/* $B3d$j9~$_5v2D%U%i%0$r85$KLa$9(B */
	return;
}

void boxfill8(unsigned char *vram, int xsize, unsigned char c, int x0, int y0, int x1, int y1) {
	int x, y;
	for (y = y0; y <= y1; y++) {
		for (x = x0; x <= x1; x++)
			vram[y * xsize + x] = c;
	}
	return;
}

void init_screen8(char *vram, int x, int y) {
	boxfill8(vram, x, COL8_008484,  0,     0,      x -  1, y - 29);
	boxfill8(vram, x, COL8_C6C6C6,  0,     y - 28, x -  1, y - 28);
	boxfill8(vram, x, COL8_FFFFFF,  0,     y - 27, x -  1, y - 27);
	boxfill8(vram, x, COL8_C6C6C6,  0,     y - 26, x -  1, y -  1);

	boxfill8(vram, x, COL8_FFFFFF,  3,     y - 24, 59,     y - 24);
	boxfill8(vram, x, COL8_FFFFFF,  2,     y - 24,  2,     y -  4);
	boxfill8(vram, x, COL8_848484,  3,     y -  4, 59,     y -  4);
	boxfill8(vram, x, COL8_848484, 59,     y - 23, 59,     y -  5);
	boxfill8(vram, x, COL8_000000,  2,     y -  3, 59,     y -  3);
	boxfill8(vram, x, COL8_000000, 60,     y - 24, 60,     y -  3);

	boxfill8(vram, x, COL8_848484, x - 47, y - 24, x -  4, y - 24);
	boxfill8(vram, x, COL8_848484, x - 47, y - 23, x - 47, y -  4);
	boxfill8(vram, x, COL8_FFFFFF, x - 47, y -  3, x -  4, y -  3);
	boxfill8(vram, x, COL8_FFFFFF, x -  3, y - 24, x -  3, y -  3);
	return;
}

void putfont8(char *vram, int xsize, int x, int y, char c, char *font) {
	int i;
	char *p, d /* data */;
	for (i = 0; i < 16; i++) {
		p = vram + (y + i) * xsize + x;
		d = font[i];
		if ((d & 0x80) != 0) { p[0] = c; }
		if ((d & 0x40) != 0) { p[1] = c; }
		if ((d & 0x20) != 0) { p[2] = c; }
		if ((d & 0x10) != 0) { p[3] = c; }
		if ((d & 0x08) != 0) { p[4] = c; }
		if ((d & 0x04) != 0) { p[5] = c; }
		if ((d & 0x02) != 0) { p[6] = c; }
		if ((d & 0x01) != 0) { p[7] = c; }
	}
	return;
}

void putfonts8_asc(char *vram, int xsize, int x, int y, char c, unsigned char *s) {
	extern char hankaku[4096];
	for (;*s != 0x00;s++) {
		putfont8(vram, xsize, x, y, c, hankaku + *s * 16);
		x += 8;
	}
	return;
}

void init_mouse_cursor8(char *mouse, char bc) {
	static char cursor[16][10] = {
		"**........",
		"*O*.......",
		"*OO*......",
		"*OOO*.....",
		"*OOOO*....",
		"*OOOOO*...",
		"*OOOOOO*..",
		"*OOOOOOO*.",
		"*OOOOO***.",
		"*OOOO*....",
		"*O**O*....",
		"**..*O*...",
		"....*O*...",
		".....*O*..",
		".....*O*..",
		"......**.."
	};
	int x, y;

	for (y = 0;y < 16;y++) {
		for (x = 0;x < 10;x++) {
			if (cursor[y][x] == '*') {
				mouse[y * 10 + x] = COL8_000000;
			}else if (cursor[y][x] == 'O') {
				mouse[y * 10 + x] = COL8_FFFFFF;
			}else if (cursor[y][x] == '.') {
				mouse[y * 10 + x] = 99;
			}
		}
	}
	return;
}

void putblock8_8(char *vram, int vxsize, /*$BBg$-$5(B*/int pxsize, int pysize, /*$B:8>e(B*/int px0, int py0, char *buf, /*pxsize$B$HF1$8(B*/int bxsize) {
	int x, y;
	for (y = 0;y < pysize;y++) {
		for (x = 0;x < pxsize;x++) {
			vram[(py0 + y) * vxsize + (px0 + x)] = buf[y * bxsize + x];
		}
	}
	return;
}
