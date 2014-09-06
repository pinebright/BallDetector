// UART�̐���N���X

#pragma once

#include <sam.h>
#include <stdint.h>
#include "define.h"
#include "nvic.h"
#include "base/serial.h"
#include "rtx/cmsis_os.h"



// UART�̃|�[�g
typedef enum{
	UART_0 = 0,
	UART_1 = 1
} UARTName;

// �f�o�C�X�C���X�^���X�̐錾
template<int> class clUART;
extern clUART<UART_0> Uart0;
extern clUART<UART_1> Uart1;



// UART�֘A�̖��O���
namespace nsUART{
	// [0]=UART0, [1]=UART1
	static Uart *const UARTs[2] = {UART0, UART1};
	static const IRQn IRQs[2] = {UART0_IRQn, UART1_IRQn};
	
	static const uint32_t TXBUFSIZE = 4096;
	static const uint32_t RXBUFSIZE = 256;
	
	// ���M�����O�o�b�t�@
	struct Tx_t{
		uint32_t put_index;
		uint32_t pdc_size;
		uint32_t size;
		char buf[TXBUFSIZE];
	};
	
	// ��M�����O�o�b�t�@
	struct Rx_t{
		uint32_t get_index;
		uint32_t pdc_end;
		char buf[RXBUFSIZE];
	};
}



// UART�̐���N���X
template<int uart_idx>
class clUART : public iSerial{
private:
	static nsUART::Tx_t m_Tx;
	static nsUART::Rx_t m_Rx;
	static uint32_t m_os_mutex[3];
	static osMutexId m_MutexID;
	
public:
	// ������
	static void Init(uint32_t baudrate, uint32_t irq_priority){
		using namespace nsUART;
		
		// �~���[�e�b�N�X���쐬
		osMutexDef_t omd = {m_os_mutex};
		m_MutexID = osMutexCreate(&omd);
		
		// UART��ݒ�
		SetBaudrate(baudrate);
		UARTs[uart_idx]->UART_MR	= UART_MR_CHMODE_NORMAL | UART_MR_PAR_NO;
		UARTs[uart_idx]->UART_CR	= UART_CR_RSTSTA | UART_CR_TXEN | UART_CR_RXEN;
		
		// PDC_UART��ݒ�
		UARTs[uart_idx]->UART_RPR	= (uint32_t)m_Rx.buf;
		UARTs[uart_idx]->UART_RCR	= RXBUFSIZE;
		UARTs[uart_idx]->UART_PTCR	= UART_PTCR_TXTEN | UART_PTCR_RXTEN;
		
		// ���荞�݂�ݒ�
		NVIC_SetVector(IRQs[uart_idx], (uint32_t)ISR);
		NVIC_EnableIRQ(IRQs[uart_idx]);
		NVIC_SetPriority(IRQs[uart_idx], irq_priority);
	}
	
	// �{�[���[�g��ύX
	static inline void SetBaudrate(uint32_t baudrate){
		nsUART::UARTs[uart_idx]->UART_BRGR	= F_CPU / (16 * baudrate);
	}
	

private:
	// ���荞�݃n���h��
	static void ISR(void);
	
	
	
	
public:
	// �ꕶ�����M
	virtual int putc(char c) override;
	
	// �ꕶ����M
	virtual int getc(void) override;
	
	// ���M�\���H
	virtual bool writable(void) override;
	
	// ��M�\���H
	virtual bool readable(void) override;
	
private:
	// ���b�N����
	virtual bool lock(void) override;
	
	// �A�����b�N����
	virtual void unlock(void) override;
};







// �e���v���[�g�N���X�̎����̓w�b�_�[�ɏ����K�v�����邽�߁A�����ŃC���N���[�h
#ifndef _UART_CPP_
#define _UART_CPP_
#include "uart.cpp"
#endif

