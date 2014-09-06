// USB�V���A���ʐM�N���X

#include "usb_serial.h"
#include <string.h>



#if 1
// �f�o�b�O�o�͗L��
#include "uart.h"
#define DEBUGOUT Uart0.printf
#else
// �f�o�b�O�o�͖���
static inline void DEBUGOUT(const char *fmt, ...){}
#endif



namespace nsUSBSerial{
	static uint16_t VID		= 0x0403;
	static uint16_t PID		= 0x6001;
	static uint16_t DEVICE	= 0x0600;
	
	static uint32_t EP_IN	= 1;
	static uint32_t EP_OUT	= 2;
	
	static uint32_t EP_IN_SIZE	= 64;
	static uint32_t EP_OUT_SIZE	= 64;
	
	static const DeviceDescriptor_t DeviceDescriptor = {
		18,			// bLength
		0x01,		// bDescriptorType
		0x0200,		// bcdUSB
		0x00,		// bDeviceClass
		0x00,		// bDeviceSubClass
		0x00,		// bDeviceProtocol
		64,			// bMaxPacketSize0
		VID,		// idVendor
		PID,		// idProduct
		DEVICE,		// bcdDevice
		1,			// iManufacturer
		2,			// iProduct
		3,			// iSerialNumber
		1			// bNumConfigurations
	};
	
	static const struct{
		ConfigurationDescriptor_t	Configuration;
		InterfaceDescriptor_t		Interface;
		EndpointDescriptor_t		Endpoint1;
		EndpointDescriptor_t		Endpoint2;
	} __attribute__((__packed__)) ConfigurationDescriptor = {
		{	// �R���t�B�O���[�V���� �f�B�X�N���v�^
			9,				// bLength
			0x02,			// bDescriptorType
			sizeof(ConfigurationDescriptor),	// wTotalLength
			1,				// bNumInterfaces
			1,				// bConfigurationValue
			0,				// iConfiguration
			0x80,			// bmAttributes (Bus Powered)
			50				// bMaxPower (100mA)
		},
		{	// �C���^�[�t�F�[�X �f�B�X�N���v�^
			9,				// bLength
			0x04,			// bDescriptorType
			0,				// bInterfaceNumber
			0,				// bAlternateSetting
			2,				// bNumEndpoints
			0xFF,			// bInterfaceClass
			0x00,			// bInterfaceSubClass
			0x00,			// bInterfaceProtocol
			2				// iInterface
		},
		{	// �G���h�|�C���g1 �f�B�X�N���v�^
			7,				// bLength
			0x05,			// bDescriptorType
			0x81,			// bEndpointAddress (EP1, IN)
			0x02,			// bmAttributes (Bulk)
			64,				// wMaxPacketSize
			0				// bInterval
		},
		{	// �G���h�|�C���g2 �f�B�X�N���v�^
			7,				// bLength
			0x05,			// bDescriptorType
			0x02,			// bEndpointAddress (EP2, OUT)
			0x02,			// bmAttributes (Bulk)
			64,				// wMaxPacketSize
			0				// bInterval
		}
	};
	
	// �X�g�����O �f�B�X�N���v�^0 (LANGID)
	static const char StringDescriptor0[] = {
		4,					// bLength
		0x03,				// bDescriptorType
		0x09, 0x04			// wLANGID
							// 0x409 English only
	};
	
	// �X�g�����O �f�B�X�N���v�^1 (Manufacturer)
	static const char StringDescriptor1[] = {
		10,					// bLength
		0x03,				// bDescriptorType
		'F', 0x00,			// bString
		'T', 0x00,			// "FTDI"
		'D', 0x00,
		'I', 0x00
	};
	
	// �X�g�����O �f�B�X�N���v�^2 (Product)
	static const char StringDescriptor2[] = {
		34,					// bLength
		0x03,				// bDescriptorType
		'F', 0x00,			// bString
		'T', 0x00,			// "FT232R USB UART"
		'2', 0x00,
		'3', 0x00,
		'2', 0x00,
		'R', 0x00,
		'L', 0x00,
		' ', 0x00,
		'U', 0x00,
		'S', 0x00,
		'B', 0x00,
		' ', 0x00,
		'U', 0x00,
		'A', 0x00,
		'R', 0x00,
		'T', 0x00,
	};
	
	// �X�g�����O �f�B�X�N���v�^3 (Serial Number)
	static const char StringDescriptor3[] = {
		18,					// bLength
		0x03,				// bDescriptorType
		'0', 0x00,			// bString
		'0', 0x00,			// "00000000"
		'0', 0x00,
		'0', 0x00,
		'0', 0x00,
		'0', 0x00,
		'0', 0x00,
		'0', 0x00
	};
	
	// �X�g�����O �f�B�X�N���v�^�̃e�[�u��
	static const void *StringDescriptors[] = {
		StringDescriptor0,
		StringDescriptor1,
		StringDescriptor2,
		StringDescriptor3,
		nullptr
	};
	
	// FT232R��EEPROM�̈�
	static uint16_t EEPROM[] = {
		0x4000, 0x0403, 0x6001, 0x0000, 0x2DA0, 0x0008, 0x0000, 0x0A98,
		0x20A2, 0x12C2, 0x1023, 0x0005, 0x030A, 0x0046, 0x0054, 0x0044,
		0x0049, 0x0320, 0x0046, 0x0054, 0x0032, 0x0033, 0x0032, 0x0052,
		0x0020, 0x0055, 0x0053, 0x0042, 0x0020, 0x0055, 0x0041, 0x0052,
		0x0054, 0x0312, 0x0030, 0x0030, 0x0030, 0x0030, 0x0030, 0x0030,
		0x0030, 0x0030, 0x781A, 0x9010, 0x0000, 0x0000, 0x0000, 0x0000,
		0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
		0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0xE436,
		0x042E, 0xFBD1, 0x0000, 0x781A, 0x9010, 0x0000, 0x0000, 0x0000,
		0x0000, 0x0000, 0x0000, 0x0000, 0x3030, 0x3030, 0x3030, 0x3030
	};
	
	// ���f���̏��
	enum MODEM_e{
		MODEM_CTS		= 0x10,
		MODEM_DSR		= 0x20,
		MODEM_RI		= 0x40,
		MODEM_DCD		= 0x80,
		MODEM_DR		= 0x100,
		MODEM_OE		= 0x200,
		MODEM_PE		= 0x400,
		MODEM_FE		= 0x800,
		MODEM_BI		= 0x1000,
		MODEM_THRE		= 0x2000,
		MODEM_TEMT		= 0x4000,
		MODEM_RXFIFOE	= 0x8000
	};
	
	
}



nsUSBSerial::Tx_t clUSBSerial::m_Tx;
nsUSBSerial::Rx_t clUSBSerial::m_Rx;
uint16_t clUSBSerial::m_ModemStatus = nsUSBSerial::MODEM_DCD | nsUSBSerial::MODEM_DSR | nsUSBSerial::MODEM_CTS;
uint32_t clUSBSerial::m_os_mutex[3];
osMutexId clUSBSerial::m_MutexID;



// ������
void clUSBSerial::Init(uint32_t irq_priority){
	using namespace nsUSBSerial;
	
	// ��{�N���X��������
	iUSBDevice::Init(this, irq_priority);
	
	// �~���[�e�b�N�X���쐬
	osMutexDef_t omd = {m_os_mutex};
	m_MutexID = osMutexCreate(&omd);
	
	
	
	
	
}

// �f�o�C�X�f�B�X�N���v�^���擾
const void* clUSBSerial::GetDeviceDescriptor(void){
	return &nsUSBSerial::DeviceDescriptor;
}

// �R���t�B�O���[�V�����f�B�X�N���v�^���擾
const void* clUSBSerial::GetConfigDescriptor(void){
	return &nsUSBSerial::ConfigurationDescriptor;
}

// �X�g�����O�f�B�X�N���v�^�̃��X�g���擾
const void** clUSBSerial::GetStringDescriptors(void){
	return nsUSBSerial::StringDescriptors;
}

// �o�X�C�x���g���N�����Ƃ��ɌĂ΂��
void clUSBSerial::BusEventOccured(nsUSBDevice::BUS_EVENT_e event){
	
}

// �R���t�B�M�����[�V�������ύX���ꂽ�Ƃ��ɌĂ΂��
void clUSBSerial::SetConfiguration(bool configured){
	if (configured == true){
		EP1to7_Send(nsUSBSerial::EP_IN, &m_ModemStatus, 2);
	}
}

// EP0��OUT�����ւ̃��N�G�X�g
bool clUSBSerial::EP0_OutRequest(const DeviceRequest_t *req, const void *out_data, uint32_t out_length){
	using namespace nsUSBSerial;
	
	uint32_t req_id;
	req_id = ((uint32_t)req->bmRequestType << 8) | ((uint32_t)req->bRequest);
	
	switch(req_id){
	/*case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_VENDOR | USB_DRQ_TARGET_DEVICE) << 8) | 0x00):
		// SIO_RESET
		DEBUGOUT(" Reset()");
		return true;
		
	case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_VENDOR | USB_DRQ_TARGET_DEVICE) << 8) | 0x01):
		// SIO_SET_MODEM_CTRL
		DEBUGOUT(" SetModem(%04X)", req->wValue);
		return true;
		
	case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_VENDOR | USB_DRQ_TARGET_DEVICE) << 8) | 0x02):
		// SIO_SET_FLOW_CTRL
		DEBUGOUT(" SetFlow(%04X)", req->wValue);
		return true;
		
	case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_VENDOR | USB_DRQ_TARGET_DEVICE) << 8) | 0x03):
		// SIO_SET_BAUDRATE
		DEBUGOUT(" SetBaudrate(%04X)", req->wValue);
		return true;
		
	case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_VENDOR | USB_DRQ_TARGET_DEVICE) << 8) | 0x04):
		// SIO_SET_DATA
		DEBUGOUT(" SetData(%04X)", req->wValue);
		return true;
		
	case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_VENDOR | USB_DRQ_TARGET_DEVICE) << 8) | 0x06):
		// SIO_SET_EVENT_CHAR
		DEBUGOUT(" SetEventChar()");
		return true;
		
	case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_VENDOR | USB_DRQ_TARGET_DEVICE) << 8) | 0x07):
		// SIO_SET_ERROR_CHAR
		DEBUGOUT(" SetErrorChar()");
		return true;
		
	case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_VENDOR | USB_DRQ_TARGET_DEVICE) << 8) | 0x08):
		// SIO_SET_BITMODE
		DEBUGOUT(" SetBitMode()");
		return true;
		
	case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_VENDOR | USB_DRQ_TARGET_DEVICE) << 8) | 0x09):
		// SIO_SET_LATENCY_TIMER
		DEBUGOUT(" SetLatency(%d)", req->wValue);
		return true;
		
	case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_VENDOR | USB_DRQ_TARGET_DEVICE) << 8) | 0x91):
		// SIO_WRITE_EEPROM
		DEBUGOUT(" WriteEEPROM(%02X,%04X)", req->wIndex, req->wValue);
		return true;
		
	case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_VENDOR | USB_DRQ_TARGET_DEVICE) << 8) | 0x92):
		// SIO_ERASE_EEPROM
		DEBUGOUT(" EraseEEPROM(%02X)", req->wIndex);
		return true;*/
		
	default:
		if (req->bmRequestType == (USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_VENDOR | USB_DRQ_TARGET_DEVICE)){
			// 0x00 SIO_RESET
			// 0x01 SIO_SET_MODEM_CTRL
			// 0x02 SIO_SET_FLOW_CTRL
			// 0x03 SIO_SET_BAUDRATE
			// 0x04 SIO_SET_DATA
			// 0x06 SIO_SET_EVENT_CHAR
			// 0x07 SIO_SET_ERROR_CHAR
			// 0x08 SIO_SET_BITMODE
			// 0x09 SIO_SET_LATENCY_TIMER
			// 0x91 SIO_WRITE_EEPROM
			// 0x92 SIO_ERASE_EEPROM
			DEBUGOUT(" Set%02X(%04X)", req->bRequest, req->wValue);
			return true;
		}
		break;
	}
	return false;
}
	
// EP0��IN�����ւ̃��N�G�X�g
bool clUSBSerial::EP0_InRequest(const DeviceRequest_t *req, void *in_data, uint32_t &in_length){
	using namespace nsUSBSerial;
	
	uint32_t req_id;
	req_id = ((uint32_t)req->bmRequestType << 8) | ((uint32_t)req->bRequest);
	
	switch(req_id){
	case (((USB_DRQ_DIR_DEVICE_TO_HOST | USB_DRQ_TYPE_VENDOR | USB_DRQ_TARGET_DEVICE) << 8) | 0x05):{
			// SIO_POLL_MODEM_STATUS
			DEBUGOUT(" PollModem()");
			uint32_t length = (2 < in_length) ? 2 : in_length;
			in_length = length;
			memcpy(in_data, &m_ModemStatus, length);
		}
		return true;
	
	case (((USB_DRQ_DIR_DEVICE_TO_HOST | USB_DRQ_TYPE_VENDOR | USB_DRQ_TARGET_DEVICE) << 8) | 0x90):{
			// SIO_READ_EEPROM
			DEBUGOUT(" ReadEEPROM(%02X)", req->wIndex);
			uint32_t length = (2 < in_length) ? 2 : in_length;
			uint16_t data = (req->wIndex < sizeof(EEPROM)/2) ? EEPROM[req->wIndex] : 0xFFFF;
			in_length = length;
			memcpy(in_data, &data, length);
		}
		return true;
	
	default:
		// 0x0C SIO_READ_PINS
		break;
	}
	return false;
}

// EP1�`7����z�X�g�ɑ��M�����Ƃ��ɌĂ΂��
bool clUSBSerial::EP1to7_Sent(uint32_t ep){
	using namespace nsUSBSerial;
	
	m_Tx.tx_index = (m_Tx.tx_index + m_Tx.tx_size) % TXBUFSIZE;
	m_Tx.size -= m_Tx.tx_size;
	m_Tx.tx_size = (m_Tx.size < (EP_IN_SIZE - 2)) ? m_Tx.size : (EP_IN_SIZE - 2);
	if (m_Tx.size == 0){
		// ���M�f�[�^�͑��݂��Ȃ�
		EP1to7_Send(EP_IN, &m_ModemStatus, 2);
	}else{
		// ���̑��M�f�[�^���R�s�[
		char buf[EP_IN_SIZE];
		((uint16_t*)buf)[0] = m_ModemStatus;
	
		if (TXBUFSIZE < (m_Tx.tx_index + m_Tx.tx_size)){
			uint32_t size1 = TXBUFSIZE - m_Tx.tx_index;
			memcpy(buf + 2, m_Tx.buf + m_Tx.tx_index, size1);
			memcpy(buf + 2 + size1, m_Tx.buf, m_Tx.tx_size - size1);
		}else{
			memcpy(buf + 2, m_Tx.buf + m_Tx.tx_index, m_Tx.tx_size);
		}
		EP1to7_Send(EP_IN, buf, m_Tx.tx_size + 2);
	}
	return true;
}

// EP1�`7�Ńz�X�g�����M�����Ƃ��ɌĂ΂��
bool clUSBSerial::EP1to7_Received(uint32_t ep, uint32_t length){
	using namespace nsUSBSerial;
	
	if ((m_Rx.size + length) <= RXBUFSIZE){
		char buf[EP_OUT_SIZE];
		EP1to7_Receive(ep, buf);
		if (RXBUFSIZE < (m_Rx.rx_index + length)){
			uint32_t size1 = RXBUFSIZE - m_Rx.rx_index;
			memcpy(m_Rx.buf + m_Rx.rx_index, buf, size1);
			memcpy(m_Rx.buf, buf + size1, length - size1);
		}else{
			memcpy(m_Rx.buf + m_Rx.rx_index, buf, length);
		}
		m_Rx.size += length;
		m_Rx.rx_index = (m_Rx.rx_index + length) % RXBUFSIZE;
		
		return true;
	}else{
		// �o�b�t�@�Ɏ��܂�Ȃ�
		return false;
	}
}




// �ꕶ�����M
int clUSBSerial::putc(char c){
	using namespace nsUSBSerial;
	
	int result;
	uint32_t threshould = (c != '\n') ? (TXBUFSIZE - 1) : TXBUFSIZE;	// ���s�R�[�h�͗D�悵�đ��M
	
	EnterCritical();
	
	if (m_Tx.size < threshould){
	//if (m_Tx.size < TXBUFSIZE){
		// �o�b�t�@�Ɉꕶ���ǉ�
		m_Tx.buf[m_Tx.put_index] = c;
		m_Tx.put_index = (m_Tx.put_index + 1) % TXBUFSIZE;
		m_Tx.size++;
		//EP1to7_Send(EP_IN);
		
		result = c;
	}else{
		result = EOF;
	}
	
	LeaveCritical();
	
	return result;
}

// �ꕶ����M
int clUSBSerial::getc(void){
	using namespace nsUSBSerial;
	
	int result;
	
	EnterCritical();
	
	if (0 < m_Rx.size){
		result = (uint8_t)m_Rx.buf[m_Rx.get_index];
		m_Rx.get_index = (m_Rx.get_index + 1) % RXBUFSIZE;
		m_Rx.size--;
		if (m_Rx.size <= (RXBUFSIZE - EP_OUT_SIZE)){
			EP1to7_Receive(EP_OUT);
		}
	}else{
		result = EOF;
	}
	
	LeaveCritical();
	
	return result;
	//return EOF;
}

// ���M�\���H
bool clUSBSerial::writable(void){
	return m_Tx.size < nsUART::TXBUFSIZE;
}

// ��M�\���H
bool clUSBSerial::readable(void){
	return false;
}

// ���b�N����
bool clUSBSerial::lock(void){
	return osMutexWait(m_MutexID, osWaitForever) == osOK;
}

// �A�����b�N����
void clUSBSerial::unlock(void){
	osMutexRelease(m_MutexID);
}




