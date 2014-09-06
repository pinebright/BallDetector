// USB�V���A���ʐM�N���X

#pragma once

#include "usb_device.h"
#include "base/serial.h"
#include "rtx/cmsis_os.h"



// �f�o�C�X�C���X�^���X�̐錾
class clUSBSerial;
extern clUSBSerial USBSerial;



namespace nsUSBSerial{
	static const uint32_t TXBUFSIZE = 1024;
	static const uint32_t RXBUFSIZE = 256;
	
	// ���M�����O�o�b�t�@
	struct Tx_t{
		uint32_t put_index;
		uint32_t tx_index;
		uint32_t tx_size;
		uint32_t size;
		char buf[TXBUFSIZE];
	};
	
	// ��M�����O�o�b�t�@
	struct Rx_t{
		uint32_t get_index;
		uint32_t rx_index;
		uint32_t size;
		char buf[RXBUFSIZE];
	};
}



// USB�V���A���ʐM�N���X
class clUSBSerial : public iUSBDevice, public iSerial{
private:
	static nsUSBSerial::Tx_t m_Tx;
	static nsUSBSerial::Rx_t m_Rx;
	static uint16_t m_ModemStatus;	// ���f���̏��
	static uint32_t m_os_mutex[3];
	static osMutexId m_MutexID;
	
public:
	// ������
	void Init(uint32_t irq_priority);
	
protected:
	// �f�o�C�X�f�B�X�N���v�^���擾
	virtual const void* GetDeviceDescriptor(void) override;
	
	// �R���t�B�O���[�V�����f�B�X�N���v�^���擾
	virtual const void* GetConfigDescriptor(void) override;
	
	// �X�g�����O�f�B�X�N���v�^�̃��X�g���擾
	virtual const void** GetStringDescriptors(void) override;
	
	// �o�X�C�x���g���N�����Ƃ��ɌĂ΂��
	virtual void BusEventOccured(nsUSBDevice::BUS_EVENT_e event) override;
	
	// �R���t�B�M�����[�V�������ύX���ꂽ�Ƃ��ɌĂ΂��
	virtual void SetConfiguration(bool configured) override;
	
	// EP0��OUT�����ւ̃��N�G�X�g
	virtual bool EP0_OutRequest(const DeviceRequest_t *req, const void *out_data, uint32_t out_length) override;
	
	// EP0��IN�����ւ̃��N�G�X�g
	// in_length�ɂ̓o�b�t�@�T�C�Y������A�f�[�^�T�C�Y��Ԃ�
	virtual bool EP0_InRequest(const DeviceRequest_t *req, void *in_data, uint32_t &in_length) override;
	
	// EP1�`7����z�X�g�ɑ��M�����Ƃ��ɌĂ΂��
	virtual bool EP1to7_Sent(uint32_t ep) override;
	
	// EP1�`7�Ńz�X�g�����M�����Ƃ��ɌĂ΂��
	virtual bool EP1to7_Received(uint32_t ep, uint32_t length) override;
	
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


