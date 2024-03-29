#include <stdio.h>
#include "apilib.h"

void HariMain(void) {
	char *buf[160 * 100], s[12];
	int win, timer, sec = 0, min = 0, hou = 0;
	api_initmalloc();
	win = api_openwin(buf, 160, 100, -1, "noodle");
	timer = api_alloctimer();
	api_inittimer(timer, 128);
	for (;;) {
		sprintf(s, "%5d:%02d:%02d", hou, min, sec);
		api_boxfillwin(win, 28, 27, 115, 41, 7);
		api_putstrwin(win, 28, 27, 0, 11, s);
		api_settimer(timer, 100);
		if (api_getkey(1) != 128) {
			break;
		}
		sec++;
		if (sec == 60) {
			sec = 0;
			min++;
			if (min == 60) {
				min = 0;
				hou++;
			}
		}
	}
	api_closewin(win);
	api_end();
}
