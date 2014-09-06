// 共通の定義・定数

#pragma once

#include <sam.h>



// 型
#undef NULL
#define NULL	0



// CPUクロック
#define F_CPU			120000000

// ペリフェラルクロック
#define F_PER			120000000

// ホストとの通信ボーレート
#define HOSTIF_BAUDRATE	250000







// 割り込み優先度
#define HOSTIF_IRQ_PRIORITY		1
#define USB_IRQ_PRIORITY		2
#define CAMERA_IRQ_PRIORITY		0









// 強制リセットに使うGPBR
#define RESET_GPBR		GPBR->SYS_GPBR[0]





// I/Oピン
#define PIN_HOST_TX				PIO_PA9_IDX		// PA9/URXD0
#define PIN_HOST_RX				PIO_PA10_IDX	// PA10/UTXD0
#define PIN_CAM2_CLK			PIO_PA13_IDX	// PA13/PWMH2
#define PIN_CAM1_A0P			PIO_PA19_IDX	// PA19/AFE0_AD2
#define PIN_CAM2_A0P			PIO_PA21_IDX	// PA21/AFE1_AD2
#define PIN_nSW1				PIO_PA22_IDX	// PA22
#define PIN_LED_ENABLE			PIO_PA26_IDX	// PA26/TIOA2
#define PIN_CAM1_CLK			PIO_PB1_IDX		// PB1/PWMH1
#define PIN_TDI					PIO_PB4_IDX		// PB4/TDI
#define PIN_TDO					PIO_PB5_IDX		// PB5/TDO/SWO
#define PIN_TMS					PIO_PB6_IDX		// PB6/TMS/SWDIO
#define PIN_TCK					PIO_PB7_IDX		// PB7/TCK/SWCLK
#define PIN_CLK12M				PIO_PB9_IDX		// PB9/XIN
#define PIN_USB_DM				PIO_PB10_IDX	// PB10/DDM
#define PIN_USB_DP				PIO_PB11_IDX	// PB11/DDP
#define PIN_CAM1_SI				PIO_PD0_IDX		// PD0
#define PIN_USB_VBUS			PIO_PD4_IDX		// PD4
#define PIN_LED1				PIO_PD19_IDX	// PD19
#define PIN_CAM2_SI				PIO_PD30_IDX	// PD30



