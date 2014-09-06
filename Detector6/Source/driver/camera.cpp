// �J�����̐���N���X

#include "camera.h"
#include "gpio.h"
#include "critical_section.h"



uint32_t clCamera::m_Exposure = nsCamera::DEFAULT_EXPOSURE;
uint16_t clCamera::m_Image[2][nsCamera::RESOLUTION];
bool clCamera::m_EndOfTransfer;
volatile bool clCamera::m_Busy;
osThreadId clCamera::m_ThreadID;
uint32_t clCamera::m_SignalFlags;



// ���荞�݃n���h��(EXPTC)
void clCamera::EXPTC_ISR(void){
	using namespace nsCamera;
	
	EXPTC->TC_SR;
	
	// CAMn_CLK�̗������҂���CAMn_CLK�̏o�͂��~�߂�
	PWM->PWM_ISR1;
	while(~PWM->PWM_ISR1 & PWM_ISR1_CHID0);
	PWM->PWM_DIS = (PWM_ENA_CHID0 << PWMCH_CAM2) | (PWM_ENA_CHID0 << PWMCH_CAM1) | (PWM_ENA_CHID0 << PWMCH_BASE);
	while(~PWM->PWM_ISR1 & PWM_ISR1_CHID0);
	
	if (m_Busy == false){
		// AFEC��DMA��ݒ�
		AFEC0->AFEC_CDR;
		AFEC1->AFEC_CDR;
		AFEC0->AFEC_RPR = (uint32_t)m_Image[0];
		AFEC1->AFEC_RPR = (uint32_t)m_Image[1];
		AFEC0->AFEC_RCR = RESOLUTION;
		AFEC1->AFEC_RCR = RESOLUTION;
		AFEC0->AFEC_IER = AFEC_IER_ENDRX;
		AFEC1->AFEC_IER = AFEC_IER_ENDRX;
	}
	
	// CAMn_SI��1�N���b�N����H�ɂ���
	SetOut(PIN_CAM1_SI, OUT_HIGH);
	SetOut(PIN_CAM2_SI, OUT_HIGH);
	
	// CAMn_CLK���Ăяo�͂���
	PWM->PWM_ENA = (PWM_ENA_CHID0 << PWMCH_CAM2) | (PWM_ENA_CHID0 << PWMCH_CAM1) | (PWM_ENA_CHID0 << PWMCH_BASE);
	PWM->PWM_CMPM0 = PWM_CMPM_CEN;
	
	while(~PWM->PWM_ISR1 & PWM_ISR1_CHID0);
	SetOut(PIN_CAM1_SI, OUT_LOW);
	SetOut(PIN_CAM2_SI, OUT_LOW);
	
	if (m_Busy == true){
		PWM->PWM_CMPM0 = 0;
		
		// �I�o�^�C�}�[���X�^�[�g
		Start();
	}
}

// ���荞�݃n���h��(AFEC0)
void clCamera::AFEC0_ISR(void){
	AFEC0->AFEC_IDR = AFEC_IDR_ENDRX;
	AFEC_CommonISR();
}

// ���荞�݃n���h��(AFEC1)
void clCamera::AFEC1_ISR(void){
	AFEC1->AFEC_IDR = AFEC_IDR_ENDRX;
	AFEC_CommonISR();
}

// ���荞�݃n���h��(AFEC0,1����)
void clCamera::AFEC_CommonISR(void){
	using namespace nsCamera;
	
	if (m_EndOfTransfer == true){
		PWM->PWM_CMPM0 = 0;
		m_Busy = true;
		
		// �I�o�^�C�}�[���X�^�[�g
		Start();
		
		// �X���b�h���N������
		if (m_SignalFlags != 0){
			osSignalSet(m_ThreadID, m_SignalFlags);
			m_SignalFlags = 0;
		}
	}
	m_EndOfTransfer = !m_EndOfTransfer;
}

// �J��������摜�擾���n�߂�
void clCamera::Start(void){
	using namespace nsCamera;
	
	uint32_t a = m_Exposure * (F_EXPTC / 1000000);
	uint32_t b = (RESOLUTION - BLACK_CYCLE) * (F_EXPTC / SAMPLERATE);
	if (a <= b) a = b + 1;
	EXPTC->TC_RC = a - b;
	EXPTC->TC_CCR = TC_CCR_SWTRG | TC_CCR_CLKEN;
}

