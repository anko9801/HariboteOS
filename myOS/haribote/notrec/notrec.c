#include "apilib.h"

void HariMain(void) {
	int win;
	char buf[150 * 70];
	win = api_openwin(buf, 150, 70, 255, "hello");
	api_boxfillwin(win, 0, 50, 34, 69, 255);
	api_boxfillwin(win, 115, 50, 149, 69, 255);
	api_boxfillwin(win, 50, 30, 99, 49, 255);
	for (;;) {
		if (api_getkey(1) == 0x0a) {
			break;
		}
	}
	api_end();
}
