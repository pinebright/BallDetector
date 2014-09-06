// シリアル通信のインターフェースクラス
// ChaN氏のxprintfより

#include <stdarg.h>
#include "serial.h"
#include "rtx/cmsis_os.h"

#undef getc



// 文字列を出力
void iSerial::puts(const char *s){
	while(*s){
		putc(*s++);
	}
}

// 形式を指定して文字列を出力
void iSerial::printf(const char *fmt, ...){
	va_list arp;
	va_start(arp, fmt);
	//xvprintf(fmt, arp);
	
	unsigned int r, i, j, w, f;
	unsigned long v;
	char s[16], c, d, *p;
	
	for (;;) {
		c = *fmt++;					/* Get a char */
		if (!c) break;				/* End of format? */
		if (c != '%') {				/* Pass through it if not a % sequense */
			putc(c); continue;
		}
		f = 0;
		c = *fmt++;					/* Get first char of the sequense */
		if (c == '0') {				/* Flag: '0' padded */
			f = 1; c = *fmt++;
		} else {
			if (c == '-') {			/* Flag: left justified */
				f = 2; c = *fmt++;
			}
		}
		for (w = 0; c >= '0' && c <= '9'; c = *fmt++)	/* Minimum width */
			w = w * 10 + c - '0';
		if (c == 'l' || c == 'L') {	/* Prefix: Size is long int */
			f |= 4; c = *fmt++;
		}
		if (!c) break;				/* End of format? */
		d = c;
		if (d >= 'a') d -= 0x20;
		switch (d) {				/* Type is... */
		case 'S' :					/* String */
			p = va_arg(arp, char*);
			for (j = 0; p[j]; j++) ;
			while (!(f & 2) && j++ < w) putc(' ');
			puts(p);
			while (j++ < w) putc(' ');
			continue;
		case 'C' :					/* Character */
			putc((char)va_arg(arp, int)); continue;
		case 'B' :					/* Binary */
			r = 2; break;
		case 'O' :					/* Octal */
			r = 8; break;
		case 'D' :					/* Signed decimal */
		case 'U' :					/* Unsigned decimal */
			r = 10; break;
		case 'X' :					/* Hexdecimal */
			r = 16; break;
		default:					/* Unknown type (passthrough) */
			putc(c); continue;
		}

		/* Get an argument and put it in numeral */
		v = (f & 4) ? va_arg(arp, long) : ((d == 'D') ? (long)va_arg(arp, int) : (long)va_arg(arp, unsigned int));
		if (d == 'D' && (v & 0x80000000)) {
			v = 0 - v;
			f |= 8;
		}
		i = 0;
		do {
			d = (char)(v % r); v /= r;
			if (d > 9) d += (c == 'x') ? 0x27 : 0x07;
			s[i++] = d + '0';
		} while (v && (i < sizeof(s)));
		if (f & 8) s[i++] = '-';
		j = i; d = (f & 1) ? '0' : ' ';
		while (!(f & 2) && j++ < w) putc(d);
		do putc(s[--i]); while(i);
		while (j++ < w) putc(' ');
	}
	
	va_end(arp);
}

// データを書き込む
uint32_t iSerial::write(const void *buf, uint32_t size){
	if (lock() == false) return 0;
	
	while(size){
		int c = putc(*(const char*)buf);
		if (c != EOF){
			buf = (char*)buf + 1;
			size--;
		}else{
			osThreadYield();
		}
	}
	
	unlock();
	
	return size;
}

// データを読み込む
uint32_t iSerial::read(void *buf, uint32_t size){
	if (lock() == false) return 0;
	
	uint32_t result = 0;
	
	while(result < size){
		int c = getc();
		if (c == EOF){
			break;
		}
		*(char*)buf = c;
		buf = (char*)buf + 1;
		result++;
	}
	
	unlock();
	
	return result;
}


