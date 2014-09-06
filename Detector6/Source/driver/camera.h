// カメラの制御クラス

#pragma once

#include <sam.h>
#include <stdint.h>
#include "define.h"
#include "nvic.h"
#include "rtx/cmsis_os.h"



// デバイスインスタンスの宣言
class clCamera;
extern clCamera Camera;



// カメラ関連の名前空間
namespace nsCamera{
	static const uint32_t F_EXPTC = F_CPU / 2;	// [Hz]
	static const uint32_t F_AFEC = 20000000;	// [Hz]
	static const uint32_t SAMPLERATE = 800000;	// [Hz]
	
	static const uint32_t PWMCH_BASE = 0;
	static const uint32_t PWMCH_CAM1 = 1;	// PWMH1
	static const uint32_t PWMCH_CAM2 = 2;	// PWMH2
	
	static const uint32_t ADCCH_CAM1 = 2;	// AFEC0_AD2
	static const uint32_t ADCCH_CAM2 = 2;	// AFEC1_AD2
	
	static TcChannel *const EXPTC = &TC0->TC_CHANNEL[1];	// TC1
	static const IRQn EXPTC_IRQn = TC1_IRQn;
	
	static const uint32_t MINIMUM_EXPOSURE = 200;	// [us]
	static const uint32_t MAXIMUM_EXPOSURE = 10000;	// [us]
	static const uint32_t DEFAULT_EXPOSURE = 1000;	// [us]
	
	static const uint32_t RESOLUTION = 128;	// ピクセル数
	static const uint32_t BLACK_CYCLE = 18;	// 露出されないサイクル数
	
	
	
}



// カメラの制御クラス
class clCamera{
private:
	static uint32_t m_Exposure;
	static uint16_t m_Image[2][nsCamera::RESOLUTION];
	static bool m_EndOfTransfer;
	static volatile bool m_Busy;
	static osThreadId m_ThreadID;
	static uint32_t m_SignalFlags;
	
public:
	// 初期化
	static inline void Init(uint32_t irq_priority){
		using namespace nsCamera;
		
		// PWMを設定
		PWM->PWM_CH_NUM[PWMCH_BASE].PWM_CPRD = F_CPU / SAMPLERATE;
		PWM->PWM_CH_NUM[PWMCH_CAM1].PWM_CPRD = F_CPU / SAMPLERATE;
		PWM->PWM_CH_NUM[PWMCH_CAM2].PWM_CPRD = F_CPU / SAMPLERATE;
		PWM->PWM_CH_NUM[PWMCH_CAM1].PWM_CDTY = F_CPU / SAMPLERATE / 2;
		PWM->PWM_CH_NUM[PWMCH_CAM2].PWM_CDTY = F_CPU / SAMPLERATE / 2;
		PWM->PWM_CMPV0		= 1;
		PWM->PWM_ELMR[0]	= PWM_ELMR_CSEL0;
		PWM->PWM_ENA		= (PWM_ENA_CHID0 << PWMCH_CAM2) | (PWM_ENA_CHID0 << PWMCH_CAM1) | (PWM_ENA_CHID0 << PWMCH_BASE);
		
		// AFECを設定
		AFEC0->AFEC_MR		= AFEC_MR_TRANSFER(0) | AFEC_MR_TRACKTIM(3) | AFEC_MR_ANACH_ALLOWED | AFEC_MR_SETTLING_AST3 | AFEC_MR_STARTUP_SUT960 | AFEC_MR_PRESCAL(F_CPU / F_AFEC / 2 - 1) | AFEC_MR_TRGSEL_AFEC_TRIG4 | AFEC_MR_TRGEN_EN;
		AFEC1->AFEC_MR		= AFEC_MR_TRANSFER(0) | AFEC_MR_TRACKTIM(3) | AFEC_MR_ANACH_ALLOWED | AFEC_MR_STARTUP_SUT960 | AFEC_MR_SETTLING_AST3 | AFEC_MR_PRESCAL(F_CPU / F_AFEC / 2 - 1) | AFEC_MR_TRGSEL_AFEC_TRIG4 | AFEC_MR_TRGEN_EN;
		AFEC0->AFEC_CHER	= AFEC_CHER_CH0 << ADCCH_CAM1;
		AFEC1->AFEC_CHER	= AFEC_CHER_CH0 << ADCCH_CAM2;
		AFEC0->AFEC_CDOR	= AFEC_CDOR_OFF0 << ADCCH_CAM1;
		AFEC1->AFEC_CDOR	= AFEC_CDOR_OFF0 << ADCCH_CAM2;
		AFEC0->AFEC_CSELR	= AFEC_CSELR_CSEL(ADCCH_CAM1);
		AFEC1->AFEC_CSELR	= AFEC_CSELR_CSEL(ADCCH_CAM2);
		AFEC0->AFEC_COCR	= AFEC_COCR_AOFF(2048);
		AFEC1->AFEC_COCR	= AFEC_COCR_AOFF(2048);
		AFEC0->AFEC_CR		= AFEC_CR_AUTOCAL;
		while(~AFEC0->AFEC_ISR & AFEC_ISR_EOCAL);
		AFEC1->AFEC_CR		= AFEC_CR_AUTOCAL;
		while(~AFEC1->AFEC_ISR & AFEC_ISR_EOCAL);
		AFEC0->AFEC_PTCR	= UART_PTCR_RXTEN;
		AFEC1->AFEC_PTCR	= UART_PTCR_RXTEN;
		
		// 露出タイマーを設定
		EXPTC->TC_CMR		= TC_CMR_WAVE | TC_CMR_WAVSEL_UP_RC | TC_CMR_CPCDIS | TC_CMR_TCCLKS_TIMER_CLOCK1;
		EXPTC->TC_IER		= TC_IER_CPCS;
		
		// 割り込みを設定
		NVIC_SetVector(EXPTC_IRQn, (uint32_t)EXPTC_ISR);
		NVIC_SetVector(AFEC0_IRQn, (uint32_t)AFEC0_ISR);
		NVIC_SetVector(AFEC1_IRQn, (uint32_t)AFEC1_ISR);
		NVIC_EnableIRQ(EXPTC_IRQn);
		NVIC_EnableIRQ(AFEC0_IRQn);
		NVIC_EnableIRQ(AFEC1_IRQn);
		NVIC_SetPriority(EXPTC_IRQn, irq_priority);
		NVIC_SetPriority(AFEC0_IRQn, irq_priority);
		NVIC_SetPriority(AFEC1_IRQn, irq_priority);
	}
	
	// 露出を変更
	static inline uint32_t SetExposure(uint32_t exposure){
		using namespace nsCamera;
		if (exposure < MINIMUM_EXPOSURE) exposure = MINIMUM_EXPOSURE;
		else if (MAXIMUM_EXPOSURE < exposure) exposure = MAXIMUM_EXPOSURE;
		m_Exposure = exposure;
		return exposure;
	}
	
	// カメラから画像取得を始める
	static void Start(void);
	
	// 取得した画像のコピーを始める
	static const uint16_t* BeginCopy(uint32_t flags = 0, uint32_t timeout = 0){
		if (flags == 0){
			return &m_Image[0][0];
		}else{
			m_ThreadID = osThreadGetId();
			m_SignalFlags = flags;
			osEvent event = osSignalWait(flags, timeout);
			if (event.status == osEventSignal){
				return &m_Image[0][0];
			}else{
				return nullptr;
			}
		}
	}
	
	// 取得した画像のコピーを完了する
	static void EndCopy(void){
		m_Busy = false;
	}
	
	
	
private:
	// 割り込みハンドラ(EXPTC)
	static void EXPTC_ISR(void);
	
	// 割り込みハンドラ(AFEC0)
	static void AFEC0_ISR(void);
	
	// 割り込みハンドラ(AFEC1)
	static void AFEC1_ISR(void);
	
	// 割り込みハンドラ(AFEC0,1共通)
	static void AFEC_CommonISR(void);
	
	
	
public:
	
	
	
	
	
	
};


