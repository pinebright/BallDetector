// UARTの制御クラス

#pragma once

#include <sam.h>
#include <stdint.h>
#include "define.h"
#include "nvic.h"
#include "base/serial.h"
#include "rtx/cmsis_os.h"



// UARTのポート
typedef enum{
	UART_0 = 0,
	UART_1 = 1
} UARTName;

// デバイスインスタンスの宣言
template<int> class clUART;
extern clUART<UART_0> Uart0;
extern clUART<UART_1> Uart1;



// UART関連の名前空間
namespace nsUART{
	// [0]=UART0, [1]=UART1
	static Uart *const UARTs[2] = {UART0, UART1};
	static const IRQn IRQs[2] = {UART0_IRQn, UART1_IRQn};
	
	static const uint32_t TXBUFSIZE = 4096;
	static const uint32_t RXBUFSIZE = 256;
	
	// 送信リングバッファ
	struct Tx_t{
		uint32_t put_index;
		uint32_t pdc_size;
		uint32_t size;
		char buf[TXBUFSIZE];
	};
	
	// 受信リングバッファ
	struct Rx_t{
		uint32_t get_index;
		uint32_t pdc_end;
		char buf[RXBUFSIZE];
	};
}



// UARTの制御クラス
template<int uart_idx>
class clUART : public iSerial{
private:
	static nsUART::Tx_t m_Tx;
	static nsUART::Rx_t m_Rx;
	static uint32_t m_os_mutex[3];
	static osMutexId m_MutexID;
	
public:
	// 初期化
	static void Init(uint32_t baudrate, uint32_t irq_priority){
		using namespace nsUART;
		
		// ミューテックスを作成
		osMutexDef_t omd = {m_os_mutex};
		m_MutexID = osMutexCreate(&omd);
		
		// UARTを設定
		SetBaudrate(baudrate);
		UARTs[uart_idx]->UART_MR	= UART_MR_CHMODE_NORMAL | UART_MR_PAR_NO;
		UARTs[uart_idx]->UART_CR	= UART_CR_RSTSTA | UART_CR_TXEN | UART_CR_RXEN;
		
		// PDC_UARTを設定
		UARTs[uart_idx]->UART_RPR	= (uint32_t)m_Rx.buf;
		UARTs[uart_idx]->UART_RCR	= RXBUFSIZE;
		UARTs[uart_idx]->UART_PTCR	= UART_PTCR_TXTEN | UART_PTCR_RXTEN;
		
		// 割り込みを設定
		NVIC_SetVector(IRQs[uart_idx], (uint32_t)ISR);
		NVIC_EnableIRQ(IRQs[uart_idx]);
		NVIC_SetPriority(IRQs[uart_idx], irq_priority);
	}
	
	// ボーレートを変更
	static inline void SetBaudrate(uint32_t baudrate){
		nsUART::UARTs[uart_idx]->UART_BRGR	= F_CPU / (16 * baudrate);
	}
	

private:
	// 割り込みハンドラ
	static void ISR(void);
	
	
	
	
public:
	// 一文字送信
	virtual int putc(char c) override;
	
	// 一文字受信
	virtual int getc(void) override;
	
	// 送信可能か？
	virtual bool writable(void) override;
	
	// 受信可能か？
	virtual bool readable(void) override;
	
private:
	// ロックする
	virtual bool lock(void) override;
	
	// アンロックする
	virtual void unlock(void) override;
};







// テンプレートクラスの実装はヘッダーに書く必要があるため、ここでインクルード
#ifndef _UART_CPP_
#define _UART_CPP_
#include "uart.cpp"
#endif

