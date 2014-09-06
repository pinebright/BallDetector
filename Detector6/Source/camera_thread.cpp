// カメラスレッド

#include "camera_thread.h"
#include "define.h"
#include "rtx/cmsis_os.h"
#include "driver/camera.h"
#include "driver/usb_serial.h"
#include <string.h>



static bool term_mode;
static bool term_continues;
static uint32_t term_x, term_y;

static void MoveTo(uint32_t x, uint32_t y){
	term_mode = true;
	term_continues = false;
	term_x = x;
	term_y = y;
	USBSerial.putc(0x1D);		// GS
	USBSerial.putc(0x20 | ((y >> 5) & 0x1F));	// yhigh
	USBSerial.putc(0x60 | (y & 0x1F));			// ylow
	USBSerial.putc(0x20 | ((x >> 5) & 0x1F));	// xhigh
	USBSerial.putc(0x40 | (x & 0x1F));			// xlow
}

static void LineTo(uint32_t x, uint32_t y){
	if ((term_mode == false) || (term_continues = false)){
		MoveTo(term_x, term_y);
	}
	term_continues = true;
	term_x = x;
	term_y = y;
	USBSerial.putc(0x20 | ((y >> 5) & 0x1F));	// yhigh
	USBSerial.putc(0x60 | (y & 0x1F));			// ylow
	USBSerial.putc(0x20 | ((x >> 5) & 0x1F));	// xhigh
	USBSerial.putc(0x40 | (x & 0x1F));			// xlow
}

static void ClearScreen(void){
	term_mode = false;
	term_continues = false;
	USBSerial.putc(0x1B);		// ESC
	USBSerial.putc(0x0C);		// FF
}

static void SwitchToTextMode(void){
	if (term_mode == true){
		USBSerial.putc(0x1F);	// US
		USBSerial.putc(0x1B);	// ESC
		USBSerial.putc('[');
		USBSerial.putc('H');
		term_mode = false;
		term_continues = false;
	}
}



static bool offset_calb;
static int16_t offset[2][nsCamera::RESOLUTION];

// カメラスレッド
void CameraThread(void const *arg){
	// カメラを起動
	Camera.Start();
	
	uint32_t tick = osKernelSysTick();
	uint32_t integ = 1000;
	char led_on = ' ';
	Camera.Start();
    while(true){
		const int16_t *image = (const int16_t*)Camera.BeginCopy(0x1, 20);
		if (image != nullptr){
			const int16_t *p = image;
			uint32_t max1 = 0, min1 = -1, avg1 = 0;
			uint32_t max2 = 0, min2 = -1, avg2 = 0;
			
			for(uint32_t cnt = 0; cnt < nsCamera::RESOLUTION; cnt++){
				uint16_t c = *p++;
				if (max1 < c) max1 = c;
				if (c < min1) min1 = c;
				avg1 += c;
			}
			for(uint32_t cnt = 0; cnt < nsCamera::RESOLUTION; cnt++){
				uint16_t c = *p++;
				if (max2 < c) max2 = c;
				if (c < min2) min2 = c;
				avg2 += c;
			}
			avg1 /= nsCamera::RESOLUTION;
			avg2 /= nsCamera::RESOLUTION;
			
			if (offset_calb == true){
				offset_calb = false;
				memcpy(offset[0], image, sizeof(offset));
			}
			
			uint32_t now = osKernelSysTick();
			uint32_t delta = osKernelSysTickMicroSec(200000);
			if (delta <= (now - tick)){
				tick = now;
				
				int16_t *o = offset[0];
				
				ClearScreen();
				MoveTo(0, (*image++ - *o++) / 8 + 256);
				for(uint32_t cnt = 1; cnt < nsCamera::RESOLUTION; cnt++){
					LineTo(cnt * 8, (*image++ - *o++) / 8 + 256);
				}
				
				MoveTo(0, (*image++ - *o++) / 8 + 256);
				for(uint32_t cnt = 1; cnt < nsCamera::RESOLUTION; cnt++){
					LineTo(cnt * 8, (*image++ - *o++) / 8 + 256);
				}
				
				SwitchToTextMode();
				
				USBSerial.printf("(%d<%d<%d)(%d<%d<%d) e=%d %c\n", min1, avg1, max1, min2, avg2, max2, integ, led_on);
			}
			
			Camera.EndCopy();
		}
		
		int c;
		int new_integ = integ;
		while((c = USBSerial.getc()) != iSerial::EOF){
			if (c == '-') new_integ -= 100;
			if (c == ';') new_integ += 100;
			if (c == 'e') led_on = '*';
			if (c == 'd') led_on = ' ';
			if (c == 'o') offset_calb = true;
			if (c == 'i') memset(offset[0], 0x00, sizeof(offset));
		}
		if (new_integ < 0) new_integ = 0;
		if (new_integ != (int)integ){
			integ = Camera.SetExposure(new_integ);
			//USBSerial.printf("exposure=%d[us]\n", integ);
		}
		SetOut(PIN_LED_ENABLE, (led_on == '*') ? OUT_HIGH : OUT_LOW);
    }
}


