// USB�f�o�C�X�̊�{�N���X

#include "usb_device.h"
#include <string.h>



#if 1
// �f�o�b�O�o�͗L��
#include "uart.h"
#define DEBUGOUT Uart0.printf
#else
// �f�o�b�O�o�͖���
static inline void DEBUGOUT(const char *fmt, ...){}
#endif



#define UDP_IER_EP0to7INT	(UDP_IER_EP7INT | UDP_IER_EP6INT | UDP_IER_EP5INT | UDP_IER_EP4INT | UDP_IER_EP3INT | UDP_IER_EP2INT | UDP_IER_EP1INT | UDP_IER_EP0INT)
#define UDP_IDR_EP0to7INT	UDP_IER_EP0to7INT
#define UDP_ISR_EP0to7INT	UDP_IER_EP0to7INT

#define UDP_CSR_NOEFFECT	(UDP_CSR_RX_DATA_BK1 | UDP_CSR_STALLSENT | UDP_CSR_RXSETUP | UDP_CSR_RX_DATA_BK0 | UDP_CSR_TXCOMP)



// ���N���b�N�҂�
static void wait_a_moment(void){
	for(int cnt = 15; 0 < cnt; cnt--){
		__NOP();
	}
}

// UDP_CSR�̃r�b�g���Z�b�g
static inline void Set_UDP_CSR(uint32_t ep, uint32_t val){
	UDP->UDP_CSR[ep] = UDP->UDP_CSR[ep] | UDP_CSR_NOEFFECT | val;
	wait_a_moment();
}

// UDP_CSR�̃r�b�g���N���A
static inline void Clear_UDP_CSR(uint32_t ep, uint32_t val){
	UDP->UDP_CSR[ep] = (UDP->UDP_CSR[ep] | UDP_CSR_NOEFFECT) & ~val;
	wait_a_moment();
}

// UDP_CSR�Ƀr�b�g����������
static inline void Write_UDP_CSR(uint32_t ep, uint32_t val, uint32_t mask){
	UDP->UDP_CSR[ep] = ((UDP->UDP_CSR[ep] | UDP_CSR_NOEFFECT) & ~val) | (val & mask);
	wait_a_moment();
}




iUSBDevice *iUSBDevice::m_instance;
bool iUSBDevice::m_Enabled;
bool iUSBDevice::m_Powered;
uint32_t iUSBDevice::m_DefaultIER;
DeviceRequest_t iUSBDevice::m_Request;
nsUSBDevice::EP0_t iUSBDevice::m_EP0;
uint32_t iUSBDevice::m_PingPongBank;



// ������
void iUSBDevice::Init(iUSBDevice *inst, uint32_t irq_priority, bool sof){
	using namespace nsUSBDevice;
	
	// �ϐ���������
	m_instance = inst;
	m_DefaultIER = UDP_IER_RXSUSP | ((sof == true) ? UDP_IER_SOFINT : 0);
	
	// ���W�X�^��ݒ�
	//UDP->UDP_GLB_STAT = UDP_GLB_STAT_RMWUPE;
	//UDP->UDP_FADDR	= 0;
	UDP->UDP_TXVC	= UDP_TXVC_TXVDIS;
	
	// ���荞�݂�ݒ�
	NVIC_SetVector(UDP_IRQn, (uint32_t)ISR);
	NVIC_EnableIRQ(UDP_IRQn);
	NVIC_SetPriority(UDP_IRQn, irq_priority);
	
	DEBUGOUT("INITIALIZED\n");
}

// �ڑ���Ԃ�ύX����
void iUSBDevice::UpdateConnection(bool enabled, bool powered){
	using namespace nsUSBDevice;
	
	bool old_state = m_Enabled && m_Powered;
	bool new_state = enabled && powered;
	BUS_EVENT_e event = BUS_EVENT_NONE;
	
	EnterCritical();
	
	m_Enabled = enabled;
	m_Powered = powered;
	if ((old_state == true) && (new_state == false)){
		// �ؒf
		UDP->UDP_GLB_STAT	= 0;
		UDP->UDP_FADDR	= 0;
		UDP->UDP_IDR	= -1;
		UDP->UDP_ICR	= -1;
		UDP->UDP_RST_EP	= 0xFF;				// ���ׂĂ�EP�����Z�b�g
		UDP->UDP_TXVC	= UDP_TXVC_TXVDIS;	// �g�����V�[�o�����E�v���A�b�v����
		
		DEBUGOUT("DETACHED\n");
		event = BUS_EVENT_DETACHED;
	}else if ((old_state == false) && (new_state == true)){
		// �ڑ�
		UDP->UDP_RST_EP	= 0;
		UDP->UDP_TXVC	= UDP_TXVC_PUON;	// �g�����V�[�o�L���E�v���A�b�v�L��
		UDP->UDP_IER	= m_DefaultIER | UDP_IER_WAKEUP | UDP_IER_EXTRSM | UDP_IER_RXRSM | UDP_IER_RXSUSP;
		
		DEBUGOUT("ATTACHED\n");
		event = BUS_EVENT_ATTACHED;
	}
	
	LeaveCritical();
	
	if (event != BUS_EVENT_NONE){
		m_instance->BusEventOccured(event);
	}
}

// ���荞�݃n���h��
void iUSBDevice::ISR(void){
	using namespace nsUSBDevice;
	
	uint32_t sr = UDP->UDP_ISR & UDP->UDP_IMR;
	
	if (sr & UDP_ISR_SOFINT){
		// SOF
		UDP->UDP_ICR = UDP_ICR_SOFINT;
		m_instance->BusEventOccured(BUS_EVENT_SOF);
		return;
	}
	
	if (sr & UDP_IER_EP0to7INT){
		// EP0�`7
		uint32_t ep = __CLZ(__RBIT(sr));
		//DEBUGOUT("EP%d:", ep);
		if (ep == 0){
			DEBUGOUT("EP0:");
			EP0_Proc();
			DEBUGOUT("\n");
		}else{
			EP1to7_Proc(ep);
		}
		//DEBUGOUT("\n");
		return;
	}
	
	if (sr & (UDP_ISR_WAKEUP | UDP_ISR_EXTRSM | UDP_ICR_RXRSM)){
		// ���W���[��
		DEBUGOUT("RESUMED\n");
		UDP->UDP_ICR = UDP_ICR_WAKEUP | UDP_ICR_EXTRSM | UDP_ICR_RXRSM | UDP_ICR_RXSUSP;
		UDP->UDP_IDR = UDP_IDR_WAKEUP | UDP_IDR_EXTRSM | UDP_IDR_RXRSM;
		UDP->UDP_IER = UDP_IER_RXSUSP;
		m_instance->BusEventOccured(BUS_EVENT_RESUMED);
		return;
	}
	
	if (sr & UDP_ISR_RXSUSP){
		// �T�X�y���h
		DEBUGOUT("SUSPENDED\n");
		UDP->UDP_ICR = UDP_ICR_RXSUSP;
		UDP->UDP_IDR = UDP_IDR_RXSUSP;
		UDP->UDP_IER = UDP_IER_WAKEUP | UDP_IER_EXTRSM | UDP_IER_RXRSM;
		m_instance->BusEventOccured(BUS_EVENT_SUSPENDED);
		return;
	}
	
	if (sr & UDP_ISR_ENDBUSRES){
		// USB���Z�b�g
		DEBUGOUT("RESET");
		UDP->UDP_ICR = UDP_ICR_WAKEUP | UDP_ICR_ENDBUSRES | UDP_ICR_RXRSM | UDP_ICR_RXSUSP;
		
		// ���W�X�^�̏�����
		UDP->UDP_GLB_STAT = UDP_GLB_STAT_RMWUPE;
		UDP->UDP_FADDR = UDP_FADDR_FEN;
		
		// �G���h�|�C���g�̏�����
		uint32_t ier_mask;
		m_PingPongBank = 0;
		UDP->UDP_RST_EP	= -1;
		UDP->UDP_RST_EP	= 0x00;
		ier_mask = EP0to7_Init();
		
		// ���荞�݂�ݒ�
		UDP->UDP_IDR = -1;
		UDP->UDP_IER = m_DefaultIER | ier_mask;
		
		DEBUGOUT("\n");
		m_instance->BusEventOccured(BUS_EVENT_RESET);
		m_instance->SetConfiguration(false);
		return;
	}
	
	//DEBUGOUT("Unexpected Interrupt (%08X,%08X)\n", UDP->UDP_ISR, UDP->UDP_IMR);
	
}

// EP0�`7��������
uint32_t iUSBDevice::EP0to7_Init(void){
	using namespace nsUSBDevice;
	
	uint32_t used_mask = 1;
	
	// EP0�̏�����
	m_EP0.state = EP0_STATE_IDLE;
	UDP->UDP_CSR[0] = UDP_CSR_EPEDS | UDP_CSR_EPTYPE_CTRL | UDP_CSR_NOEFFECT;
	
	// EP1�`7�̏�����
	// �f�B�X�N���v�^���Q�Ƃ��Ȃ��珉����
	const uint8_t *config = (const uint8_t*)m_instance->GetConfigDescriptor();
	uint32_t total = ((const ConfigurationDescriptor_t*)config)->wTotalLength;
	while(true){
		// �f�B�X�N���v�^�̃T�C�Y���`�F�b�N
		uint32_t length;
		length = config[0];
		if (length < 2) break;
		if (total < length) break;
		total -= length;
		
		if ((length == sizeof(EndpointDescriptor_t)) && (config[1] == USB_DESC_ENDPOINT)){
			// �G���h�|�C���g�f�B�X�N���v�^
			const EndpointDescriptor_t *ep = (const EndpointDescriptor_t*)config;
			uint32_t ep_addr = ep->bEndpointAddress & 0xF;
			if ((1 <= ep_addr) && (ep_addr < USB_DEVICE_MAX_EP)){
				uint32_t type = (ep->bEndpointAddress >> 5) | (ep->bmAttributes & 0x3);
				UDP->UDP_CSR[ep_addr] = UDP_CSR_EPEDS | (type << UDP_CSR_EPTYPE_Pos) | UDP_CSR_NOEFFECT;
				used_mask |= 1 << ep_addr;
			}
		}
		
		config += length;
	}
	
	// �g�p���Ă��Ȃ��G���h�|�C���g�𖳌���
	for(uint32_t mask = 1 << (USB_DEVICE_MAX_EP - 1); 0 != mask; mask >>= 1){
		uint32_t ep_addr = __CLZ(__RBIT(mask));
		if (~used_mask & mask){
			UDP->UDP_CSR[ep_addr] = UDP_CSR_NOEFFECT;
			//DEBUGOUT("EP%d=Disabled ", ep_addr);
		}else{
			static const char *name_table[8] = {
				"CTRL", "ISO_OUT", "BULK_OUT", "INT_OUT",
				"Invalid", "ISO_IN", "BULK_IN", "INT_IN"
			};
			uint32_t type = (UDP->UDP_CSR[ep_addr] & UDP_CSR_EPTYPE_Msk) >> UDP_CSR_EPTYPE_Pos;
			DEBUGOUT(" EP%d=%s", ep_addr, name_table[type]);
		}
	}
	
	//return 1;
	return used_mask;
}

// EP0������
void iUSBDevice::EP0_Proc(void){
	using namespace nsUSBDevice;
	
	uint32_t csr = UDP->UDP_CSR[0];
	
	if (csr & UDP_CSR_RXSETUP){
		// SETUP����M����
		uint32_t length = (csr & UDP_CSR_RXBYTECNT_Msk) >> UDP_CSR_RXBYTECNT_Pos;
		DEBUGOUT("SETUP(%d)", length);
		
		if (m_EP0.state != EP0_STATE_IDLE){
			// IDLE�X�e�[�g�̂Ƃ��ȊO��SETUP��������
			EP0_EndOfRequest();
		}
		
		// �f�o�C�X���N�G�X�g��ǂݏo��
		if (length == sizeof(DeviceRequest_t)){
			ReadFIFO(0, &m_Request, sizeof(DeviceRequest_t));
			
			DEBUGOUT("[%02X %02X %04X %04X %04X]",
				m_Request.bmRequestType, m_Request.bRequest,
				m_Request.wValue, m_Request.wIndex, m_Request.wLength);
			
			// ���N�G�X�g������
			if (m_Request.bmRequestType & USB_DRQ_DIR_DEVICE_TO_HOST){
				// IN����
				bool result;
				m_EP0.size = (m_Request.wLength < EP0BUFSIZE) ? m_Request.wLength : EP0BUFSIZE;
				
				// �h���N���X�����N�G�X�g�������ł��邩���ׂ�
				result = m_instance->EP0_InRequest(&m_Request, m_EP0.buf, m_EP0.size);
				
				// iUSBDevice�����N�G�X�g�������ł��邩���ׂ�
				if (result == false) result = m_instance->iUSBDevice::EP0_InRequest(&m_Request, m_EP0.buf, m_EP0.size);
				
				// �����ł�����f�[�^���z�X�g�֑���
				if (result == true){
					Set_UDP_CSR(0, UDP_CSR_DIR);
					Clear_UDP_CSR(0, UDP_CSR_RXSETUP);
					m_EP0.next = 0;
					m_EP0.state = EP0_STATE_IN_DATA;
					if (EP0_SendData() == false){
						m_EP0.state = EP0_STATE_IN_STATUS;
					}
					return;
				}
			}else{
				// OUT����
				Clear_UDP_CSR(0, UDP_CSR_RXSETUP);
				m_EP0.size = (m_Request.wLength < EP0BUFSIZE) ? m_Request.wLength : EP0BUFSIZE;
				m_EP0.next = 0;
				if (m_Request.wLength == 0){
					// ZLP���z�X�g�֑���
					Set_UDP_CSR(0, UDP_CSR_TXPKTRDY);
					m_EP0.state = EP0_STATE_OUT_STATUS;
				}else{
					// �f�[�^���󂯎�鏀��������
					m_EP0.state = EP0_STATE_OUT_DATA;
				}
				return;
			}
		}
		
		// �����G���[���N����
		Clear_UDP_CSR(0, UDP_CSR_RXSETUP);
		EP0_SetSTALL();
		return;
	}
	
	if (csr & UDP_CSR_TXCOMP){
		// IN�𑗐M����
		DEBUGOUT("IN");
		
		switch(m_EP0.state){
		case EP0_STATE_IDLE:
			break;
			
		case EP0_STATE_IN_STATUS:
			break;
			
		case EP0_STATE_OUT_STATUS:
			EP0_EndOfRequest();
			break;
		
		case EP0_STATE_IN_DATA:
			if (EP0_SendData() == false){
				m_EP0.state = EP0_STATE_IN_STATUS;
			}
			break;
			
		default:
			EP0_SetSTALL();
			break;
		}
		
		Clear_UDP_CSR(0, UDP_CSR_TXCOMP);
		return;
	}
	
	if (csr & UDP_CSR_RX_DATA_BK0){
		// OUT����M����
		DEBUGOUT("OUT");
		bool status = false;
		
		switch(m_EP0.state){
		case EP0_STATE_IDLE:
			break;
			
		case EP0_STATE_IN_STATUS:
		case EP0_STATE_IN_DATA:
			EP0_EndOfRequest();
			break;
		
		case EP0_STATE_OUT_DATA:
			if (EP0_ReceiveData() == false){
				status = true;
				m_EP0.state = EP0_STATE_OUT_STATUS;
			}
			break;
			
		default:
			EP0_SetSTALL();
			break;
		}
		
		Clear_UDP_CSR(0, UDP_CSR_RX_DATA_BK0);
		if (status == true){
			Set_UDP_CSR(0, UDP_CSR_TXPKTRDY);
		}
		return;
	}
	
	if (csr & UDP_CSR_STALLSENT){
		// �X�g�[������
		DEBUGOUT("STALLed");
		Clear_UDP_CSR(0, UDP_CSR_STALLSENT);
		return;
	}
}

// EP0�̃��N�G�X�g����������
void iUSBDevice::EP0_EndOfRequest(void){
	using namespace nsUSBDevice;
	
	if (m_EP0.state == EP0_STATE_OUT_STATUS){
		// �z�X�g����f�[�^���󂯎����
		if (m_EP0.size == m_EP0.next){
			DEBUGOUT(" Received(%d)", m_EP0.size);
			
			// �h���N���X�����N�G�X�g�������ł��邩���ׂ�
			bool result;
			result = m_instance->EP0_OutRequest(&m_Request, m_EP0.buf, m_EP0.size);
			
			// iUSBDevice�����N�G�X�g�������ł��邩���ׂ�
			if (result == false) result = m_instance->iUSBDevice::EP0_OutRequest(&m_Request, m_EP0.buf, m_EP0.size);
			
			if (result == false){
				DEBUGOUT(" Through");
			}
		}else{
			DEBUGOUT(" Received(%d,%d)Error", m_EP0.size, m_EP0.next);
		}
	}else if (m_EP0.state == EP0_STATE_IN_STATUS){
		if (m_EP0.size == m_EP0.next){
			DEBUGOUT(" Sent(%d)", m_EP0.size);
		}else{
			DEBUGOUT(" Sent(%d,%d)Error", m_EP0.size, m_EP0.next);
		}
	}
	m_EP0.state = EP0_STATE_IDLE;
}

// EP0���X�g�[������
void iUSBDevice::EP0_SetSTALL(void){
	using namespace nsUSBDevice;
	
	DEBUGOUT(" SetSTALL");
	
	m_EP0.state = EP0_STATE_STALL;
	Set_UDP_CSR(0, UDP_CSR_FORCESTALL);
}

// EP0�Ńz�X�g�փf�[�^�𑗐M����
bool iUSBDevice::EP0_SendData(void){
	using namespace nsUSBDevice;
	
	if (UDP->UDP_CSR[0] & UDP_CSR_RX_DATA_BK0){
		DEBUGOUT(" Aborted");
		return false;
	}
	
	if (m_EP0.size <= m_EP0.next){
		// ZLP�𑗂�
		DEBUGOUT(" Tx(%d)", 0);
		if (UDP->UDP_CSR[0] & UDP_CSR_RXSETUP){
			DEBUGOUT(" Overwrite");
		}
		Set_UDP_CSR(0, UDP_CSR_TXPKTRDY);
		return false;
	}
	
	uint32_t length = m_EP0.size - m_EP0.next;
	uint32_t tlength = (length < EPPACKETSIZE[0]) ? length : EPPACKETSIZE[0];
	
	/*DEBUGOUT(" Tx(%d)[", tlength);
	char *p = m_EP0.buf + m_EP0.next;
	for(uint32_t cnt = 0; cnt < tlength; cnt++){
		if (cnt != 0) DEBUGOUT(" ");
		DEBUGOUT("%02X", *p++);
	}
	DEBUGOUT("]");*/
	
	WriteFIFO(0, m_EP0.buf + m_EP0.next, tlength);
	m_EP0.next += tlength;
	
	DEBUGOUT(" Tx(%d)", tlength);
	if (UDP->UDP_CSR[0] & UDP_CSR_RXSETUP){
		DEBUGOUT(" Overwrite");
	}
	Set_UDP_CSR(0, UDP_CSR_TXPKTRDY);
	return (tlength <= length) && (tlength == EPPACKETSIZE[0]);
}

// EP0�Ńz�X�g����f�[�^����M����
bool iUSBDevice::EP0_ReceiveData(void){
	using namespace nsUSBDevice;
	
	uint32_t length = ((UDP->UDP_CSR[0] & UDP_CSR_RXBYTECNT_Msk) >> UDP_CSR_RXBYTECNT_Pos);
	
	if ((m_EP0.next + length) <= m_EP0.size){
		ReadFIFO(0, m_EP0.buf + m_EP0.next, length);
		m_EP0.next += length;
		DEBUGOUT(" Rx(%d)", length);
	}else{
		DEBUGOUT(" Rx(%d)OV", length);
	}
	
	return (length == EPPACKETSIZE[0]) && ((int)m_EP0.next <= (int)(m_EP0.size - EPPACKETSIZE[0]));
}



// EP1�`7������
void iUSBDevice::EP1to7_Proc(uint32_t ep){
	using namespace nsUSBDevice;
	
	uint32_t csr = UDP->UDP_CSR[ep];
	
	if (csr & UDP_CSR_TXCOMP){
		// IN�𑗐M����
		//DEBUGOUT("IN");
		if (m_instance->EP1to7_Sent(ep) == true){
			Clear_UDP_CSR(ep, UDP_CSR_TXCOMP);
		}else{
			UDP->UDP_IDR = UDP_IDR_EP0INT << ep;
		}
		return;
	}
	
	if (csr & (UDP_CSR_RX_DATA_BK1 | UDP_CSR_RX_DATA_BK0)){
		uint32_t length = (UDP->UDP_CSR[ep] & UDP_CSR_RXBYTECNT_Msk) >> UDP_CSR_RXBYTECNT_Pos;
		if ((csr & UDP_CSR_RX_DATA_BK0) && (~m_PingPongBank & (1 << ep))){
			// OUT����M����(DATA0)
			//DEBUGOUT("OUT0");
			if (m_instance->EP1to7_Received(ep, length) == true){
				Clear_UDP_CSR(ep, UDP_CSR_RX_DATA_BK0);
				m_PingPongBank |= (1 << ep) & EPDUALBANK;
			}else{
				UDP->UDP_IDR = UDP_IDR_EP0INT << ep;
			}
		}else if ((csr & UDP_CSR_RX_DATA_BK1) && (m_PingPongBank & (1 << ep))){
			// OUT����M����(DATA1)
			//DEBUGOUT("OUT1");
			if (m_instance->EP1to7_Received(ep, length) == true){
				Clear_UDP_CSR(ep, UDP_CSR_RX_DATA_BK1);
				m_PingPongBank ^= 1 << ep;
			}else{
				UDP->UDP_IDR = UDP_IDR_EP0INT << ep;
			}
		}else if (csr & UDP_CSR_RX_DATA_BK0){
			// �o���N���ُ킾���AOUT����M����(DATA0)
			//DEBUGOUT("OUT0Error");
			DEBUGOUT("EP%d:OUT0Error", ep);
			Clear_UDP_CSR(ep, UDP_CSR_RX_DATA_BK0);
		}else if (csr & UDP_CSR_RX_DATA_BK1){
			// �o���N���ُ킾���AOUT����M����(DATA1)
			//DEBUGOUT("OUT1Error");
			DEBUGOUT("EP%d:OUT1Error", ep);
			Clear_UDP_CSR(ep, UDP_CSR_RX_DATA_BK1);
		}
		return;
	}
	
	if (csr & UDP_CSR_STALLSENT){
		// �X�g�[������
		//DEBUGOUT("STALLed");
		DEBUGOUT("EP%d:STALLed\n", ep);
		Clear_UDP_CSR(ep, UDP_CSR_STALLSENT);
		return;
	}
}









// EP0��OUT�����ւ̃��N�G�X�g
bool iUSBDevice::EP0_OutRequest(const DeviceRequest_t *req, const void *out_data, uint32_t out_length){
	using namespace nsUSBDevice;
	
	uint32_t req_id;
	req_id = ((uint32_t)req->bmRequestType << 8) | ((uint32_t)req->bRequest);
	
	switch(req_id){
	case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_BASIC | USB_DRQ_TARGET_ENDPOINT) << 8) | USB_DRQ_RQ_CLEAR_FEATURE):{
			// CLEAR_FEATURE
			uint32_t ep = req->wIndex & 0xF;
			DEBUGOUT(" ClearFeature(%d,%d)", req->wValue, ep);
			if (req->wValue == USB_FEATURE_ENDPOINT_HALT){
				if (ep < USB_DEVICE_MAX_EP){
					Clear_UDP_CSR(ep, UDP_CSR_FORCESTALL);
					UDP->UDP_RST_EP = 1 << ep;
					UDP->UDP_RST_EP = 0;
					m_PingPongBank &= ~(1 << ep);
					Clear_UDP_CSR(ep, UDP_CSR_STALLSENT);
				}
				return true;
			}
		}
		break;
	
	case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_BASIC | USB_DRQ_TARGET_DEVICE) << 8) | USB_DRQ_RQ_SET_ADDRESS):
		// SET_ADDRESS
		DEBUGOUT(" SetAddress(%d)", req->wValue);
		UDP->UDP_FADDR = UDP_FADDR_FEN | UDP_FADDR_FADD(req->wValue);
		UDP->UDP_GLB_STAT |= UDP_GLB_STAT_FADDEN;
		m_instance->BusEventOccured(BUS_EVENT_ADDRESSED);
		return true;
	
	case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_BASIC | USB_DRQ_TARGET_DEVICE) << 8) | USB_DRQ_RQ_SET_CONFIGURATION):
		// SET_CONFIGURATION
		DEBUGOUT(" SetConfiguration(%d)", req->wValue);
		if (req->wValue != 0){
			UDP->UDP_GLB_STAT |= UDP_GLB_STAT_CONFG;
			m_instance->BusEventOccured(BUS_EVENT_CONFIGURED);
			m_instance->SetConfiguration(true);
		}else{
			UDP->UDP_GLB_STAT &= ~UDP_GLB_STAT_CONFG;
			m_instance->BusEventOccured(BUS_EVENT_DECONFIGURED);
			m_instance->SetConfiguration(false);
		}
		return true;
		
	case (((USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_BASIC | USB_DRQ_TARGET_INTERFACE) << 8) | USB_DRQ_RQ_SET_INTERFACE):
		// SET_INTERFACE
		DEBUGOUT(" SetInterface(%d,%d)", req->wValue, req->wIndex);
		return true;
	}
	return false;
}
	
// EP0��IN�����ւ̃��N�G�X�g
bool iUSBDevice::EP0_InRequest(const DeviceRequest_t *req, void *in_data, uint32_t &in_length){
	using namespace nsUSBDevice;
	
	uint32_t req_id;
	req_id = ((uint32_t)req->bmRequestType << 8) | ((uint32_t)req->bRequest);
	
	switch(req_id){
	/*case (((USB_DRQ_DIR_DEVICE_TO_HOST | USB_DRQ_TYPE_BASIC | USB_DRQ_TARGET_DEVICE) << 8) | USB_DRQ_RQ_GET_STATUS):{
			// GET_STATUS (Device)
			DEBUGOUT(" GetStatus()");
			uint16_t status = (((const ConfigurationDescriptor_t*)m_instance->GetConfigDescriptor())->bmAttributes & 0x40) ? 1 : 0;
			uint32_t length = (2 < in_length) ? 2 : in_length;
			in_length = length;
			memcpy(in_data, &status, length);
		}
		return true;*/
		
	case (((USB_DRQ_DIR_DEVICE_TO_HOST | USB_DRQ_TYPE_BASIC | USB_DRQ_TARGET_DEVICE) << 8) | USB_DRQ_RQ_GET_DESCRIPTOR):
		// GET_DESCRIPTOR
		DEBUGOUT(" GetDescriptor(%d,%d,%d)", req->wValue >> 8, req->wValue & 0xFF, req->wIndex);
		switch(req->wValue >> 8){
		case USB_DESC_DEVICE:{
				// �f�o�C�X�f�B�X�N���v�^
				uint32_t total = sizeof(DeviceDescriptor_t);
				uint32_t length = (total < in_length) ? total : in_length;
				in_length = length;
				memcpy(in_data, m_instance->GetDeviceDescriptor(), length);
			}
			return true;
		
		case USB_DESC_CONFIGURATION:{
				// �R���t�B�O���[�V�����f�B�X�N���v�^
				const void *config = m_instance->GetConfigDescriptor();
				uint32_t total = ((const ConfigurationDescriptor_t*)config)->wTotalLength;
				uint32_t length = (total < in_length) ? total : in_length;
				in_length = length;
				memcpy(in_data, config, length);
			}
			return true;
		
		case USB_DESC_STRING:{
				// �X�g�����O�f�B�X�N���v�^
				const void **string_list = m_instance->GetStringDescriptors();
				const void *string;
				uint32_t index = req->wValue & 0xFF;
				uint32_t cnt = 0;
				while((string = string_list[cnt]) != nullptr){
					if (cnt == index) break;
					cnt++;
				}
				if (string != nullptr){
					uint32_t total = ((const uint8_t*)string)[0];
					uint32_t length = (total < in_length) ? total : in_length;
					in_length = length;
					memcpy(in_data, string, length);
					return true;
				}
			}
			break;
		}
		break;
	}
	return false;
}




// EP1�`7����z�X�g�ɑ��M���\���H
bool iUSBDevice::EP1to7_IsSendable(uint32_t ep){
	return (UDP->UDP_GLB_STAT & UDP_GLB_STAT_CONFG) && (~UDP->UDP_CSR[ep] & UDP_CSR_TXPKTRDY);
}

// EP1�`7����z�X�g�ɑ��M
bool iUSBDevice::EP1to7_Send(uint32_t ep, const void *data, uint32_t length, bool wait){
	bool result;
	bool error = false;
	
//retry:
	//EnterCritical();
	if (UDP->UDP_GLB_STAT & UDP_GLB_STAT_CONFG){
		if (data != nullptr){
			if (~UDP->UDP_CSR[ep] & UDP_CSR_TXPKTRDY){
				WriteFIFO(ep, data, length);
				Set_UDP_CSR(ep, UDP_CSR_TXPKTRDY);
				result = true;
			}else{
				result = false;
			}
		}else{
			UDP->UDP_IER = UDP_IER_EP0INT << ep;
			result = true;
		}
	}else{
		error = true;
		result = true;
	}
	//LeaveCritical();
	
	/*if ((wait == true) && (result == false)){
		osThreadYield();
		goto retry;
	}*/
	
	return result & !error;
}
	
// EP1�`7�Ńz�X�g�����M
bool iUSBDevice::EP1to7_Receive(uint32_t ep, void *data){
	bool result = false;
	
	//EnterCritical();
	if (UDP->UDP_GLB_STAT & UDP_GLB_STAT_CONFG){
		if (data != nullptr){
			uint32_t csr = UDP->UDP_CSR[ep];
			uint32_t length = (csr & UDP_CSR_RXBYTECNT_Msk) >> UDP_CSR_RXBYTECNT_Pos;
			if ((csr & UDP_CSR_RX_DATA_BK0) && (~m_PingPongBank & (1 << ep))){
				ReadFIFO(ep, data, length);
				result = true;
			}else if ((csr & UDP_CSR_RX_DATA_BK1) && (m_PingPongBank & (1 << ep))){
				ReadFIFO(ep, data, length);
				result = true;
			}
		}else{
			UDP->UDP_IER = UDP_IER_EP0INT << ep;
			result = true;
		}
	}
	//LeaveCritical();
	
	return result;
}





