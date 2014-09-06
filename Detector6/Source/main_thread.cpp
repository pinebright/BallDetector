// ラインセンサー式ボールディテクター

#include "define.h"
#include "rtx/cmsis_os.h"
#include "driver/nvic.h"
#include "driver/gpio.h"
#include "driver/camera.h"
#include "driver/uart.h"
#include "driver/usb_serial.h"
#include "camera_thread.h"
//#include "driver/udc/udd.h"


// 各デバイスインスタンスの宣言
clUART<UART_0> Uart0;
clUSBSerial USBSerial;
clCamera Camera;




// ペリフェラルの初期化
// RTX RTOSの開始前に呼ばれる
extern "C" void init(void){
	// WDTを無効にする
	WDT->WDT_MR		= WDT_MR_WDIDLEHLT | WDT_MR_WDDBGHLT | (0xFFF << WDT_MR_WDD_Pos) | WDT_MR_WDDIS | (0xFFF << WDT_MR_WDV_Pos);
	
	// RSWDTは標準で無効になっている
	
	// BODリセットは標準で有効になっている
	
	// 1度、強制的にリセットする(OpenOCDによるデバッグのため)
	if (RESET_GPBR == 0){
		RESET_GPBR = 1;
		RSTC->RSTC_CR = RSTC_CR_KEY_PASSWD | RSTC_CR_PERRST | RSTC_CR_PROCRST;
	}else{
		RESET_GPBR = 0;
	}
	
	// FPUを有効にする
	SCB->CPACR		= 0x00F00000;
	
	// キャッシュを有効にする(キャッシュはROMとFlash領域のみ有効)
	//CMCC->CMCC_CTRL	= CMCC_CTRL_CEN;
	
	// フラッシュのウェイト数を設定
	EFC->EEFC_FMR	= EEFC_FMR_CLOE | EEFC_FMR_FWS(5);	// 最大129MHz
	
	// システムクロックを設定
	// SLCK=32kHz, MAINCK=12MHz, PLLACK=240MHz, USB_48M=48MHz, MCK=120MHz
	PMC->CKGR_MOR	= CKGR_MOR_MOSCSEL | CKGR_MOR_KEY_PASSWD | CKGR_MOR_MOSCRCF_4_MHz | CKGR_MOR_MOSCRCEN | CKGR_MOR_MOSCXTBY;
	while(~PMC->PMC_SR & PMC_SR_MOSCSELS);
	PMC->CKGR_MOR	= CKGR_MOR_MOSCSEL | CKGR_MOR_KEY_PASSWD | CKGR_MOR_MOSCXTBY;
	PMC->CKGR_PLLAR	= CKGR_PLLAR_ONE | CKGR_PLLAR_MULA(20) | CKGR_PLLAR_PLLACOUNT(16) | CKGR_PLLAR_DIVA(1);
	while(~PMC->PMC_SR & PMC_SR_LOCKA);
	PMC->PMC_USB	= PMC_USB_USBDIV(5 - 1);
	PMC->PMC_MCKR	= PMC_MCKR_PRES_CLK_2 | PMC_MCKR_CSS_MAIN_CLK;
	while(~PMC->PMC_SR & PMC_SR_MCKRDY);
	PMC->PMC_MCKR	= PMC_MCKR_PRES_CLK_2 | PMC_MCKR_CSS_PLLA_CLK;
	while(~PMC->PMC_SR & PMC_SR_MCKRDY);
	
	// クロック供給を有効にする
	// 31:AFEC1, 30:AFEC0, 23:TC2, 22:TC1, 21:TC0, 20:DMAC, 12:PIOD, 10:PIOB, 9:PIOA, 7:UART0
	// 36:PWM, 35:UDP
	PMC->PMC_PCER0	= PMC_PCER0_PID31 | PMC_PCER0_PID30 | PMC_PCER0_PID23 | PMC_PCER0_PID22 | PMC_PCER0_PID21 | PMC_PCER0_PID20 | PMC_PCER0_PID12 | PMC_PCER0_PID10 | PMC_PCER0_PID9 | PMC_PCER0_PID7;
	PMC->PMC_PCER1	= PMC_PCER1_PID36 | PMC_PCER1_PID35;
	PMC->PMC_SCER	= PMC_SCER_UDP;
	
	// NVICのベクターをRAMに移動
	NVIC_Migration();
	
	// I/Oピンの初期化
	clDigitalIOInitializer IOInitializer;
	IOInitializer.Set(PIN_HOST_TX, DIR_IN, OUT_LOW, PINMODE_PU);
	IOInitializer.Set(PIN_HOST_RX, DIR_OUT, OUT_HIGH);
	IOInitializer.Set(PIN_CAM1_CLK, DIR_OUT, OUT_LOW);
	IOInitializer.Set(PIN_CAM2_CLK, DIR_OUT, OUT_LOW);
	IOInitializer.Set(PIN_CAM1_SI, DIR_OUT, OUT_LOW);
	IOInitializer.Set(PIN_CAM2_SI, DIR_OUT, OUT_LOW);
	IOInitializer.Set(PIN_CAM1_A0P, DIR_IN, OUT_LOW, PINMODE_PU);
	IOInitializer.Set(PIN_CAM2_A0P, DIR_IN, OUT_LOW, PINMODE_PU);
	IOInitializer.Set(PIN_USB_VBUS, DIR_IN, OUT_LOW);
	IOInitializer.Set(PIN_nSW1, DIR_IN, OUT_LOW, PINMODE_PU);
	IOInitializer.Set(PIN_LED1, DIR_OUT, OUT_LOW);
	IOInitializer.Set(PIN_LED_ENABLE, DIR_OUT, OUT_LOW);
	IOInitializer.Mux(PIN_HOST_TX, PINMUX_A, PIO_DISABLE);
	IOInitializer.Mux(PIN_HOST_RX, PINMUX_A, PIO_DISABLE);
	IOInitializer.Mux(PIN_CAM1_CLK, PINMUX_A, PIO_DISABLE);
	IOInitializer.Mux(PIN_CAM2_CLK, PINMUX_B, PIO_DISABLE);
	IOInitializer.Apply();
	
	/* OSリソースの作成を伴わないデバイスインスタンスの初期化を行う */
	
	
	
	
	
}



// メインスレッド
extern "C" int main(void){
	clDigitalIO<PIN_LED1> PinLED1;
	
	/* OSリソースの作成を伴うデバイスインスタンスの初期化を行う */
	
	// カメラの初期化
	Camera.Init(CAMERA_IRQ_PRIORITY);
	
	// UART0の初期化
	Uart0.Init(HOSTIF_BAUDRATE, HOSTIF_IRQ_PRIORITY);
	
	// USBの初期化
	USBSerial.Init(USB_IRQ_PRIORITY);
	
	
	
	
	
	//osThreadSetPriority(osThreadGetId(), osPriorityRealtime);
	
	
	
	
	/* スレッドを起動 */
	osThreadDef(CameraThread, osPriorityHigh, 1, 0);
	osThreadCreate(osThread(CameraThread), nullptr);
	
	//udd_enable();
	
	
	// テストメッセージ出力
	Uart0.printf("usb test\n");
	//USBSerial.printf("usb test\n");
	
	// USBを有効化
	USBSerial.Enable(true);
	
	while(true){
		USBSerial.PollVBUS(GetIn(PIN_USB_VBUS));
		
		PinLED1.SetOut(true);
		osDelay(50);
		PinLED1.SetOut(false);
		osDelay(50);
		
		/*int c;
		while((c = Uart0.getc()) != iSerial::EOF){
			Uart0.putc(c);
			USBSerial.putc(c);
		}*/
		
		/*while((c = USBSerial.getc()) != iSerial::EOF){
			Uart0.putc(c);
			USBSerial.putc(c);
		}*/
		
    }
	
	return 0;
}



extern "C" void _exit(int status){
	while(true);
}

extern "C" void __cxa_pure_virtual(void){
	while(true);
}

