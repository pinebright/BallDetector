// USB�f�o�C�X�̊�{�N���X

#pragma once

#include <sam.h>
#include <stdint.h>
#include "usb_struct.h"
#include "gpio.h"
#include "nvic.h"
#include "critical_section.h"



namespace nsUSBDevice{
	// �p�P�b�g�T�C�Y
	static const uint32_t EPPACKETSIZE[8] = {
		64, 64, 64, 64, 512, 512, 64, 64
	};
	
	// �o�b�t�@�T�C�Y
	static const uint32_t EP0BUFSIZE = 256;
	
	// EP0�̏��
	enum EP0_STATE_e{
		EP0_STATE_IDLE = 0,		// SETUP�p�P�b�g�E�]���҂�
		EP0_STATE_STALL,		// �X�g�[����
		EP0_STATE_OUT_DATA,		// �z�X�g����f�o�C�X�ւ̓]��
		EP0_STATE_OUT_STATUS,	// �z�X�g����f�o�C�X�ւ̓]���̃X�e�[�^�X
		EP0_STATE_IN_DATA,		// �f�o�C�X����z�X�g�ւ̓]��
		EP0_STATE_IN_STATUS,	// �f�o�C�X����z�X�g�ւ̓]���̃X�e�[�^�X
	};
	
	// EP0�̏�Ԃ��Ǘ�����\����
	struct EP0_t{
		EP0_STATE_e state;
		uint32_t size;
		uint32_t next;
		char buf[EP0BUFSIZE];
	};
	
	// PingPong�]�����T�|�[�g���Ă���G���h�|�C���g
	static const uint32_t EPDUALBANK = 0b11110110;
	
	// �o�X�C�x���g
	enum BUS_EVENT_e{
		BUS_EVENT_NONE,			// �����N���Ă��Ȃ�
		BUS_EVENT_ATTACHED,		// USB�ɐڑ����ꂽ
		BUS_EVENT_DETACHED,		// USB��ؒf���ꂽ
		BUS_EVENT_SOF,			// SOF����M����
		BUS_EVENT_RESET,		// USB���Z�b�g���N����
		BUS_EVENT_SUSPENDED,	// USB���T�X�y���h����
		BUS_EVENT_RESUMED,		// USB�����W���[������
		BUS_EVENT_ADDRESSED,	// �A�h���X�����蓖�Ă�ꂽ
		BUS_EVENT_CONFIGURED,	// �R���t�B�O���[�V�������ݒ肳�ꂽ
		BUS_EVENT_DECONFIGURED,	// �R���t�B�O���[�V�����������ɂȂ���
	};
	
	// ���b�Z�[�W�L���[�T�C�Y
	//static const uint32_t QUEUESIZE = 16;
	
	
}



// USB�f�o�C�X�̊�{�N���X
class iUSBDevice{
protected:
	static iUSBDevice *m_instance;		// �C���X�^���X
	
private:
	static bool m_Enabled;				// USB���L��
	static bool m_Powered;				// USB�d������������Ă���
	static uint32_t m_DefaultIER;		// �W���ŗL���Ȋ��荞�݃}�X�N
	static DeviceRequest_t m_Request;	// �f�o�C�X���N�G�X�g
	static nsUSBDevice::EP0_t m_EP0;	// EP0�̏�Ԃ��Ǘ�����
	static uint32_t m_PingPongBank;		// PingPong�]���ł̎g�p�o���N
	
public:
	// ������
	static void Init(iUSBDevice *inst, uint32_t irq_priority, bool sof = false);
	
public:
	// VBUS�̒l���|�[�����O����
	static inline void PollVBUS(int pin){
		bool powered = (GetIn(pin) == IN_HIGH) ? true : false;
		UpdateConnection(m_Enabled, powered);
	}
	
	// USB��L���ɂ���
	static inline void Enable(bool enabled){
		UpdateConnection(enabled, m_Powered);
	}
	
	// USB�ɐڑ�����Ă��邩�H
	static inline bool IsConnected(void){
		return m_Enabled && m_Powered;
	}
	
private:
	// �ڑ���Ԃ�ύX����
	static void UpdateConnection(bool enabled, bool powered);
	
	// ���荞�݃n���h��
	static void ISR(void);
	
	// EP0�`7��������
	static uint32_t EP0to7_Init(void);
	
	// EP0������
	static void EP0_Proc(void);
	
	// EP0��SETUP������
	static bool EP0_ProcSETUP(const DeviceRequest_t *req);
	
	// EP0�̃��N�G�X�g����������
	static void EP0_EndOfRequest(void);
	
	// EP0���X�g�[������
	static void EP0_SetSTALL(void);
	
	// EP0�Ńz�X�g�փf�[�^�𑗐M����
	static bool EP0_SendData(void);
	
	// EP0�Ńz�X�g����f�[�^����M����
	static bool EP0_ReceiveData(void);
	
	// EP1�`7������
	static void EP1to7_Proc(uint32_t ep);
	
	// FIFO�֏�������
	static inline void WriteFIFO(uint32_t ep, const void *data_, uint32_t length){
		const char *data = (const char*)data_;
		while(length--){
			UDP->UDP_FDR[ep] = *data++;
		}
	}
	
	// FIFO����ǂݍ���
	static inline void ReadFIFO(uint32_t ep, void *data_, uint32_t length){
		char *data = (char*)data_;
		while(length--){
			*data++ = UDP->UDP_FDR[ep];
		}
	}
	
	
	
protected:
	// �f�o�C�X�f�B�X�N���v�^���擾
	virtual const void* GetDeviceDescriptor(void) = 0;
	
	// �R���t�B�O���[�V�����f�B�X�N���v�^���擾
	virtual const void* GetConfigDescriptor(void) = 0;
	
	// �X�g�����O�f�B�X�N���v�^�̃��X�g���擾
	virtual const void** GetStringDescriptors(void) = 0;
	
	// �o�X�C�x���g���N�����Ƃ��ɌĂ΂��
	virtual void BusEventOccured(nsUSBDevice::BUS_EVENT_e event){}
	
	// �R���t�B�M�����[�V�������ύX���ꂽ�Ƃ��ɌĂ΂��
	virtual void SetConfiguration(bool configured) = 0;
	
	// EP0��OUT�����ւ̃��N�G�X�g
	virtual bool EP0_OutRequest(const DeviceRequest_t *req, const void *out_data, uint32_t out_length);
	
	// EP0��IN�����ւ̃��N�G�X�g
	// in_length�ɂ̓o�b�t�@�T�C�Y������A�f�[�^�T�C�Y��Ԃ�
	virtual bool EP0_InRequest(const DeviceRequest_t *req, void *in_data, uint32_t &in_length);
	
	// EP1�`7����z�X�g�ɑ��M�����Ƃ��ɌĂ΂��
	virtual bool EP1to7_Sent(uint32_t ep){return false;}
	
	// EP1�`7�Ńz�X�g�����M�����Ƃ��ɌĂ΂��
	virtual bool EP1to7_Received(uint32_t ep, uint32_t length){return false;}
	
	// EP1�`7����z�X�g�ɑ��M���\���H
	static bool EP1to7_IsSendable(uint32_t ep);
	
	// EP1�`7����z�X�g�ɑ��M
	static bool EP1to7_Send(uint32_t ep, const void *data = nullptr, uint32_t length = 0, bool wait = false);
	
	// EP1�`7�Ńz�X�g�����M
	static bool EP1to7_Receive(uint32_t ep, void *data = nullptr);
	
	
};


