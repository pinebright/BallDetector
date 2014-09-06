// UARTの制御クラス

// uart.hからインクルードされていないときは本体をコンパイルしない
#ifdef _UART_CPP_

#include "critical_section.h"



template<int uart_idx> nsUART::Tx_t clUART<uart_idx>::m_Tx;
template<int uart_idx> nsUART::Rx_t clUART<uart_idx>::m_Rx;
template<int uart_idx> uint32_t clUART<uart_idx>::m_os_mutex[3];
template<int uart_idx> osMutexId clUART<uart_idx>::m_MutexID;



// 割り込みハンドラ
template<int uart_idx> void clUART<uart_idx>::ISR(void){
	using namespace nsUART;
	
	uint32_t sr = UARTs[uart_idx]->UART_SR;
	if (sr & UART_SR_TXBUFE){
		// 送信DMAが終了
		uint32_t pdc_start, pdc_size1;
		int32_t pdc_size2;
		
		m_Tx.size -= m_Tx.pdc_size;
		m_Tx.pdc_size = m_Tx.size;
		if (m_Tx.size == 0){
			// 送信データは存在しない
			UARTs[uart_idx]->UART_IDR = UART_IDR_TXBUFE;
		}else{
			// 次の送信DMAを準備
			pdc_start = (m_Tx.put_index - m_Tx.size) % TXBUFSIZE;
			
			pdc_size1 = m_Tx.pdc_size;
			pdc_size2 = pdc_start + pdc_size1 - TXBUFSIZE;
			
			if (0 < pdc_size2){
				pdc_size1 = TXBUFSIZE - pdc_start;
				UARTs[uart_idx]->UART_TPR = (uint32_t)m_Tx.buf + pdc_start;
				UARTs[uart_idx]->UART_TCR = pdc_size1;
				pdc_start = 0;
				pdc_size1 = pdc_size2;
			}
			UARTs[uart_idx]->UART_TNPR = (uint32_t)m_Tx.buf + pdc_start;
			UARTs[uart_idx]->UART_TNCR = pdc_size1;
		}
	}
	
	if (sr & UART_SR_RXBUFF){
		// 受信DMAが終了
		uint32_t pdc_start;
		pdc_start = m_Rx.pdc_end;
		m_Rx.pdc_end = m_Rx.get_index;
		UARTs[uart_idx]->UART_RPR = (uint32_t)m_Rx.buf + pdc_start;
		if (pdc_start <= m_Rx.pdc_end){
			//UARTs[uart_idx]->UART_RPR = (uint32_t)m_Rx.buf + pdc_start;
			UARTs[uart_idx]->UART_RCR = m_Rx.pdc_end - pdc_start;
		}else{
			//UARTs[uart_idx]->UART_RPR = (uint32_t)m_Rx.buf + pdc_start;
			UARTs[uart_idx]->UART_RCR = RXBUFSIZE - pdc_start;
			UARTs[uart_idx]->UART_RNPR = (uint32_t)m_Rx.buf;
			UARTs[uart_idx]->UART_RNCR = m_Rx.pdc_end;
		}
		UARTs[uart_idx]->UART_IDR = UART_IDR_RXBUFF;
	}
}

// 一文字送信
template<int uart_idx> int clUART<uart_idx>::putc(char c){
	using namespace nsUART;
	
	int result;
	uint32_t threshould = (c != '\n') ? (TXBUFSIZE - 1) : TXBUFSIZE;	// 改行コードは優先して送信
	
	EnterCritical();
	
	if (m_Tx.size < threshould){
	//if (m_Tx.size < TXBUFSIZE){
		// バッファに一文字追加
		m_Tx.buf[m_Tx.put_index] = c;
		m_Tx.put_index = (m_Tx.put_index + 1) % TXBUFSIZE;
		m_Tx.size++;
		
		UARTs[uart_idx]->UART_IER = UART_IER_TXBUFE;
		
		result = c;
	}else{
		result = EOF;
	}
	
	LeaveCritical();
	
	return result;
}

// 一文字受信
template<int uart_idx> int clUART<uart_idx>::getc(void){
	using namespace nsUART;
	
	int result;
	
	EnterCritical();
	
	// (pdc_start == pdc_end) はDMA残量がRXBUFSIZEあるとみなす
	// そのため、定期的なgetc()を怠るとデータはすべて欠損する
	uint32_t pdc_start = UARTs[uart_idx]->UART_RPR - (uint32_t)m_Rx.buf;
	if ((m_Rx.get_index < pdc_start) || ((m_Rx.pdc_end <= m_Rx.get_index) && (pdc_start < m_Rx.pdc_end))){
		// バッファから一文字取得
		result = (uint8_t)m_Rx.buf[m_Rx.get_index];
		m_Rx.get_index = (m_Rx.get_index + 1) % RXBUFSIZE;
		
		UARTs[uart_idx]->UART_IER = UART_IER_RXBUFF;
	}else{
		result = EOF;
	}
	
	LeaveCritical();
	
	return result;
}

// 送信可能か？
template<int uart_idx> bool clUART<uart_idx>::writable(void){
	return m_Tx.size < nsUART::TXBUFSIZE;
}

// 受信可能か？
template<int uart_idx> bool clUART<uart_idx>::readable(void){
	using namespace nsUART;
	uint32_t pdc_start = UARTs[uart_idx]->UART_RPR - (uint32_t)m_Rx.buf;
	return (m_Rx.get_index < pdc_start) || ((m_Rx.pdc_end <= m_Rx.get_index) && (pdc_start < m_Rx.pdc_end));
}

// ロックする
template<int uart_idx> bool clUART<uart_idx>::lock(void){
	return osMutexWait(m_MutexID, osWaitForever) == osOK;
}

// アンロックする
template<int uart_idx> void clUART<uart_idx>::unlock(void){
	osMutexRelease(m_MutexID);
}



#endif
