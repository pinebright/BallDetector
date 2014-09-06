/**
 * \file
 *
 * \brief USB Device Driver for UDP. Compliant with common UDD driver.
 *
 * Copyright (c) 2012 - 2013 Atmel Corporation. All rights reserved.
 *
 * \asf_license_start
 *
 * \page License
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. The name of Atmel may not be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * 4. This software may only be redistributed and used in connection with an
 *    Atmel microcontroller product.
 *
 * THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
 * EXPRESSLY AND SPECIFICALLY DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * \asf_license_stop
 *
 */

#include "conf_usb.h"
//#include "sysclk.h"
#include "udd.h"
#include "udp_device.h"
#include <string.h>
#include <stdint.h>
#include "driver/critical_section.h"
#include "driver/uart.h"
#define DEBUGOUT Uart0.printf

/*#ifndef UDD_NO_SLEEP_MGR
#  include "sleep.h"
#  include "sleepmgr.h"
#endif

#if !(SAM3S || SAM4S || SAM4E)
#  error The current UDP Device Driver supports only SAM3S and SAM4S devices.
#endif

#ifndef UDD_USB_INT_LEVEL
#  define UDD_USB_INT_LEVEL 5 // By default USB interrupt have low priority
#endif*/

/**
 * \ingroup udd_group
 * \defgroup udd_udp_group USB Device Port Driver
 *
 * \section UDP_CONF UDP Custom configuration
 * The following UDP driver configuration must be included in the conf_usb.h
 * file of the application.
 *
 * UDD_USB_INT_LEVEL<br>
 * Option to change the interrupt priority (0 to 15) by default 5 (recommended).
 *
 * UDD_USB_INT_FUN<br>
 * Option to fit interrupt function to what defined in exception table.
 * 
 * \section Callbacks management
 * The USB driver is fully managed by interrupt and does not request periodic
 * task. Thereby, the USB events use callbacks to transfer the information.
 * The callbacks are declared in static during compilation or in variable during
 * code execution.
 *
 * Static declarations defined in conf_usb.h:
 * - UDC_VBUS_EVENT(bool b_present)<br>
 *   To signal Vbus level change
 * - UDC_SUSPEND_EVENT()<br>
 *   Called when USB bus enter in suspend mode
 * - UDC_RESUME_EVENT()<br>
 *   Called when USB bus is wakeup
 * - UDC_SOF_EVENT()<br>
 *   Called for each received SOF, Note: Each 1ms in HS/FS mode only.
 *
 * Dynamic callbacks, called "endpoint job" , are registered
 * in udd_ep_job_t structure via the following functions:
 * - udd_ep_run()<br>
 *   To call it when a transfer is finish
 * - udd_ep_wait_stall_clear()<br>
 *   To call it when a endpoint halt is disabled
 *
 * \section Power mode management
 * The Sleep modes authorized :
 * - in USB IDLE state, the UDP needs of USB clock and authorizes up to sleep mode WFI.
 * - in USB SUSPEND state, the UDP no needs USB clock and authorizes up to sleep mode WAIT.
 * @{
 */






/**
 * \name Control endpoint low level management routine.
 *
 * This function performs control endpoint management.
 * It handle the SETUP/DATA/HANDSHAKE phases of a control transaction.
 */
//@{

//! Global variable to give and record information about setup request management
udd_ctrl_request_t udd_g_ctrlreq __attribute__((aligned(4)));

// EP0の状態
typedef enum{
	EP0_STATE_IDLE = 0,		// SETUPパケット・転送待ち
	EP0_STATE_STALL,		// ストール中
	EP0_STATE_OUT_DATA,		// ホストからデバイスへの転送
	EP0_STATE_OUT_STATUS,	// ホストからデバイスへの転送のステータス
	EP0_STATE_IN_DATA,		// デバイスからホストへの転送
	EP0_STATE_IN_STATUS,	// デバイスからホストへの転送のステータス
} EP0_STATE_e;


//! State of the endpoint control management
static EP0_STATE_e m_EP0_State;

//! Total number of data received/sent during data packet phase with previous payload buffers
static uint16_t udd_ctrl_prev_payload_nb_trans;

//! Number of data received/sent to/from udd_g_ctrlreq.payload buffer
static uint16_t udd_ctrl_payload_nb_trans;

/**
 * \brief Reset control endpoint
 *
 * Called after a USB line reset or when UDD is enabled
 */
static void udd_reset_ep_ctrl(void);

/**
 * \brief Reset control endpoint management
 *
 * Called after a USB line reset or at the end of SETUP request (after ZLP)
 */
static void udd_ctrl_init(void);

//! \brief Managed reception of SETUP packet on control endpoint
static void udd_ctrl_setup_received(void);

//! \brief Managed reception of IN packet on control endpoint
static void udd_ctrl_in_sent(void);

//! \brief Managed reception of OUT packet on control endpoint
static void udd_ctrl_out_received(void);

//! \brief Managed stall event of IN/OUT packet on control endpoint
static void udd_ctrl_stall_data(void);

//! \brief Send a ZLP IN on control endpoint
static void udd_ctrl_send_zlp_in(void);

//! \brief Send a ZLP OUT on control endpoint
static void udd_ctrl_send_zlp_out(void);

//! \brief Call callback associated to setup request
static void udd_ctrl_endofrequest(void);


/**
 * \brief Main interrupt routine for control endpoint
 *
 * This switches control endpoint events to correct sub function.
 *
 * \return \c 1 if an event about control endpoint is occurred, otherwise \c 0.
 */
static bool udd_ctrl_interrupt(void);

//@}





//--------------------------------------------------------
//--- INTERNAL ROUTINES TO MANAGED GLOBAL EVENTS

/**
 * \internal
 * \brief Function called by UDP interrupt to manage USB Device interrupts
 *
 * USB Device interrupt events are split in three parts:
 * - USB line events (SOF, reset, suspend, resume, wakeup)
 * - control endpoint events (setup reception, end of data transfer, underflow, overflow, stall)
 * - bulk/interrupt/isochronous endpoints events (end of data transfer)
 *
 */
extern "C" void UDP_Handler(void){
	
	if ((UDP->UDP_IMR & UDP->UDP_ISR) & UDP_ISR_SOFINT){
		UDP->UDP_ICR = UDP_ICR_SOFINT;
		//udc_sof_notify();	// コールバック
		//main_sof_action();	// コールバック
		return;
	}

	if (udd_ctrl_interrupt()) {
		return; // Interrupt acked by control endpoint managed
	}

	if ((UDP->UDP_IMR & UDP->UDP_ISR) & (UDP_ISR_WAKEUP | UDP_ISR_RXRSM | UDP_ISR_EXTRSM)){
		// Ack wakeup interrupt and enable suspend interrupt
		UDP->UDP_ICR = UDP_ICR_RXRSM | UDP_ICR_EXTRSM | UDP_ICR_WAKEUP;
		// Do resume operations
		UDP->UDP_IDR = UDP_IDR_RXRSM | UDP_IDR_EXTRSM | UDP_IDR_WAKEUP;

		//udd_sleep_mode(true); // Enter in IDLE mode
		// main_resume_action();	// コールバック
		DEBUGOUT("RESUMED\n");
		
		UDP->UDP_ICR = UDP_ICR_RXSUSP;
		UDP->UDP_IER = UDP_IER_RXSUSP;
		UDP->UDP_IER = UDP_IER_SOFINT;
		return;
	}

	if ((UDP->UDP_IMR & UDP->UDP_ISR) & UDP_ISR_RXSUSP){
		// Ack suspend interrupt and enable resume interrupt
		UDP->UDP_ICR = UDP_ICR_RXSUSP;
		UDP->UDP_IDR = UDP_IDR_RXSUSP;
		UDP->UDP_IER = UDP_IER_WAKEUP;
		UDP->UDP_IER = UDP_IER_RXRSM;
		UDP->UDP_IER = UDP_IER_EXTRSM;
		
		//udd_sleep_mode(false); // Enter in SUSPEND mode
		//main_suspend_action();	// コールバック
		DEBUGOUT("SUSPENDED\n");
		
		return;
	}
	if (UDP->UDP_ISR & UDP_ISR_ENDBUSRES){
		// USB bus reset detection
		UDP->UDP_ICR = UDP_ICR_ENDBUSRES;

		// Abort all jobs on-going
//#if (0 != USB_DEVICE_MAX_EP)
//		udd_ep_job_table_kill();
//#endif
		// Reset USB Device Stack Core
		//udc_reset();	// コールバック
		DEBUGOUT("RESET\n");
		// Reset device state
		UDP->UDP_GLB_STAT &= ~UDP_GLB_STAT_FADDEN;
		UDP->UDP_GLB_STAT &= ~UDP_GLB_STAT_CONFG;
		// Reset endpoint control
		udd_reset_ep_ctrl();
		// Reset endpoint control management
		udd_ctrl_init();
		// After a USB reset, the suspend and SOF interrupt masks has been reseted
		// Thus, re-enable these
		UDP->UDP_IER = UDP_IER_RXSUSP;
		UDP->UDP_IER = UDP_IER_SOFINT;
		return;
	}
}




void udd_enable(void)
{
	EnterCritical();

	// Enable USB hardware
	//udd_enable_periph_ck();
	//sysclk_enable_usb();
	// Cortex, uses NVIC, no need to register IRQ handler
	NVIC_SetPriority(UDP_IRQn, 2);
	NVIC_EnableIRQ(UDP_IRQn);

	// Reset internal variables
//#if (0!=USB_DEVICE_MAX_EP)
//	udd_ep_job_table_reset();
//#endif

	// Always authorize asynchronous USB interrupts to exit of sleep mode
	//pmc_set_fast_startup_input(PMC_FSMR_USBAL);

/*#ifndef UDD_NO_SLEEP_MGR
	// Initialize the sleep mode authorized for the USB suspend mode
	udd_b_idle = false;
	sleepmgr_lock_mode(UDP_SLEEP_MODE_USB_SUSPEND);
#endif*/
	
	
	udd_attach();
	
	LeaveCritical();
}


void udd_disable(void)
{
	EnterCritical();

	udd_detach();
	
	//udd_disable_periph_ck();
	//sysclk_disable_usb();
	
	LeaveCritical();
}


void udd_attach(void)
{
	EnterCritical();

	// At startup the USB bus state is unknown,
	// therefore the state is considered IDLE to not miss any USB event
	//udd_sleep_mode(true);

	// Enable peripheral clock and USB clock
	//udd_enable_periph_ck();

	// Authorize attach if VBus is present
	UDP->UDP_TXVC &= ~UDP_TXVC_TXVDIS;
	UDP->UDP_TXVC |= UDP_TXVC_PUON;
	
	// Enable USB line events
	UDP->UDP_IER = UDP_IER_RXSUSP;
	UDP->UDP_IER = UDP_IER_WAKEUP;
	UDP->UDP_IER = UDP_IER_RXRSM;
	UDP->UDP_IER = UDP_IER_EXTRSM;
	UDP->UDP_IER = UDP_IER_SOFINT;

	LeaveCritical();
}


void udd_detach(void)
{
	// Disable transceiver
	UDP->UDP_TXVC |= UDP_TXVC_TXVDIS;
	// Detach device from the bus
	UDP->UDP_TXVC &= ~UDP_TXVC_PUON;
	//udd_sleep_mode(false);
}


void udd_set_address(uint8_t address)
{
	UDP->UDP_GLB_STAT &= ~UDP_GLB_STAT_FADDEN;
	UDP->UDP_FADDR &= ~UDP_FADDR_FEN;
	if (address != 0){
		UDP->UDP_FADDR = (UDP->UDP_FADDR & ~UDP_FADDR_FADD_Msk) | (address << UDP_FADDR_FADD_Pos);
		UDP->UDP_FADDR |= UDP_FADDR_FEN;
		UDP->UDP_GLB_STAT |= UDP_GLB_STAT_FADDEN;
	}
}


void udd_send_remotewakeup(void)
{
	//udd_sleep_mode(true); // Enter in IDLE mode
	//udd_enable_periph_ck();
	UDP->UDP_GLB_STAT |= UDP_GLB_STAT_ESR;
	UDP->UDP_GLB_STAT &= ~UDP_GLB_STAT_ESR;
}


void udd_set_setup_payload( uint8_t *payload, uint16_t payload_size )
{
	udd_g_ctrlreq.payload = payload;
	udd_g_ctrlreq.payload_size = payload_size;
}




//--------------------------------------------------------
//--- INTERNAL ROUTINES TO MANAGED THE CONTROL ENDPOINT

static void udd_reset_ep_ctrl(void)
{
	// Reset USB address to 0
	UDP->UDP_FADDR |= UDP_FADDR_FEN;
	UDP->UDP_FADDR &= ~UDP_FADDR_FADD_Msk;
	
	// Alloc and configure control endpoint in OUT direction
	udd_configure_endpoint(0, USB_EP_TYPE_CONTROL, 0);
	udd_enable_endpoint(0);

	EnterCritical();
	UDP->UDP_IER = UDP_IER_EP0INT;
	LeaveCritical();
}

static void udd_ctrl_init(void)
{
	udd_g_ctrlreq.callback = NULL;
	udd_g_ctrlreq.over_under_run = NULL;
	udd_g_ctrlreq.payload_size = 0;
	m_EP0_State = EP0_STATE_IDLE;
}

extern bool udc_process_setup(void);
static void udd_ctrl_setup_received(void)
{
	uint8_t i;
	uint32_t length = (UDP->UDP_CSR[0] & UDP_CSR_RXBYTECNT_Msk) >> UDP_CSR_RXBYTECNT_Pos;
	
	DEBUGOUT("SETUP(%d)", length);
	
	if (EP0_STATE_IDLE != m_EP0_State) {
		// May be a hidden DATA or ZLP phase
		// or protocol abort
		udd_ctrl_endofrequest();

		// Reinitializes control endpoint management
		udd_ctrl_init();
	}
	// Fill setup request structure
	if (8 != length){
		udp_clear_csr(0, UDP_CSR_RXSETUP);
		udd_ctrl_stall_data();
		return; // Error data number doesn't correspond to SETUP packet
	}
	for (i = 0; i < 8; i++) {
		((uint8_t *)&udd_g_ctrlreq.req)[i] = UDP->UDP_FDR[0];
	}
	
	DEBUGOUT("[%02X %02X %04X %04X %04X]",
				udd_g_ctrlreq.req.bmRequestType, udd_g_ctrlreq.req.bRequest,
				udd_g_ctrlreq.req.wValue, udd_g_ctrlreq.req.wIndex, udd_g_ctrlreq.req.wLength);
	
	// Decode setup request
	if (udc_process_setup() == false){
		// Setup request unknown then stall it
		udp_clear_csr(0, UDP_CSR_RXSETUP);
		udd_ctrl_stall_data();
		return;
	}

	if (Udd_setup_is_in()) {
		// Set DIR
		udp_set_csr(0, UDP_CSR_DIR);
		udp_clear_csr(0, UDP_CSR_RXSETUP);
		// IN data phase requested
		udd_ctrl_prev_payload_nb_trans = 0;
		udd_ctrl_payload_nb_trans = 0;
		m_EP0_State = EP0_STATE_IN_DATA;
		udd_ctrl_in_sent(); // Send first data transfer
	} else {
		udp_clear_csr(0, UDP_CSR_RXSETUP);
		if (0 == udd_g_ctrlreq.req.wLength) {
			// No data phase requested
			// Send IN ZLP to ACK setup request
			udd_ctrl_send_zlp_in();
			return;
		}
		// OUT data phase requested
		udd_ctrl_prev_payload_nb_trans = 0;
		udd_ctrl_payload_nb_trans = 0;
		m_EP0_State = EP0_STATE_OUT_DATA;
	}
}


static void udd_ctrl_in_sent(void)
{
	static bool b_shortpacket = false;
	uint16_t nb_remain;
	uint8_t i;
	uint8_t *ptr_src;
	
	if (EP0_STATE_OUT_STATUS == m_EP0_State) {
		// Ack
		udp_clear_csr(0, UDP_CSR_TXCOMP);
		// ZLP on IN is sent, then valid end of setup request
		udd_ctrl_endofrequest();
		// Reinitializes control endpoint management
		udd_ctrl_init();
		return;
	}
	//Assert(m_EP0_State == EP0_STATE_IN_DATA);
	while(m_EP0_State != EP0_STATE_IN_DATA);

	nb_remain = udd_g_ctrlreq.payload_size - udd_ctrl_payload_nb_trans;
	if (0 == nb_remain) {
		// All content of current buffer payload are sent
		// Update number of total data sending by previous payload buffer
		udd_ctrl_prev_payload_nb_trans += udd_ctrl_payload_nb_trans;
		if ((udd_g_ctrlreq.req.wLength == udd_ctrl_prev_payload_nb_trans)
				|| b_shortpacket) {
			// All data requested are transfered or a short packet has been sent
			// then it is the end of data phase.
			// Generate an OUT ZLP for handshake phase.
			udd_ctrl_send_zlp_out();
			udp_clear_csr(0, UDP_CSR_TXCOMP);
			return;
		}
		// Need of new buffer because the data phase is not complete
		if ((!udd_g_ctrlreq.over_under_run)
				|| (!udd_g_ctrlreq.over_under_run())) {
			// Underrun then send zlp on IN
			// Here nb_remain=0 and allows to send a IN ZLP
		} else {
			// A new payload buffer is given
			udd_ctrl_payload_nb_trans = 0;
			nb_remain = udd_g_ctrlreq.payload_size;
		}
	}
	// Continue transfer and send next data
	if (nb_remain >= USB_DEVICE_EP_CTRL_SIZE) {
		nb_remain = USB_DEVICE_EP_CTRL_SIZE;
		b_shortpacket = false;
	} else {
		b_shortpacket = true;
	}
	// Fill buffer of endpoint control
	ptr_src = udd_g_ctrlreq.payload + udd_ctrl_payload_nb_trans;
	//** Critical section
	// Only in case of DATA IN phase abort without USB Reset signal after.
	// The IN data don't must be written in endpoint 0 DPRAM during
	// a next setup reception in same endpoint 0 DPRAM.
	// Thereby, an OUT ZLP reception must check before IN data write
	// and if no OUT ZLP is received the data must be written quickly (800us)
	// before an eventually ZLP OUT and SETUP reception
	EnterCritical();
	if (UDP->UDP_CSR[0] & UDP_CSR_RX_DATA_BK0) {
		// IN DATA phase aborted by OUT ZLP
		LeaveCritical();
		m_EP0_State = EP0_STATE_IN_STATUS;
		udp_clear_csr(0, UDP_CSR_TXCOMP);
		DEBUGOUT(" Aborted");
		return; // Exit of IN DATA phase
	}
	// Write quickly the IN data
	for (i = 0; i < nb_remain; i++) {
		UDP->UDP_FDR[0] = *ptr_src++;
	}
	udd_ctrl_payload_nb_trans += nb_remain;
	// Validate and send the data available in the control endpoint buffer
	udp_set_csr(0, UDP_CSR_TXPKTRDY);
	udp_clear_csr(0, UDP_CSR_TXCOMP);
	DEBUGOUT(" Tx(%d)", nb_remain);

	// In case of abort of DATA IN phase, no need to enable nak OUT interrupt
	// because OUT endpoint is already free and ZLP OUT accepted.
	LeaveCritical();
}


static void udd_ctrl_out_received(void)
{
	uint8_t i;
	uint16_t nb_data;

	if (EP0_STATE_OUT_DATA != m_EP0_State) {
		if ((EP0_STATE_IN_DATA == m_EP0_State) || (EP0_STATE_IN_STATUS == m_EP0_State)) {
			// End of SETUP request:
			// - Data IN Phase aborted,
			// - or last Data IN Phase hidden by ZLP OUT sending quickly,
			// - or ZLP OUT received normally.
			udd_ctrl_endofrequest();
		} else {
			// Protocol error during SETUP request
			udd_ctrl_stall_data();
		}
		udp_clear_csr(0, UDP_CSR_RX_DATA_BK0);
		// Reinitializes control endpoint management
		udd_ctrl_init();
		return;
	}
	// Read data received during OUT phase
	nb_data = ((UDP->UDP_CSR[0] & UDP_CSR_RXBYTECNT_Msk) >> UDP_CSR_RXBYTECNT_Pos);
	if (udd_g_ctrlreq.payload_size < (udd_ctrl_payload_nb_trans + nb_data)) {
		// Payload buffer too small
		nb_data = udd_g_ctrlreq.payload_size -
				udd_ctrl_payload_nb_trans;
	}
	uint8_t *ptr_dest = udd_g_ctrlreq.payload + udd_ctrl_payload_nb_trans;
	for (i = 0; i < nb_data; i++) {
		*ptr_dest++ = UDP->UDP_FDR[0];
	}
	udd_ctrl_payload_nb_trans += nb_data;
	DEBUGOUT(" Rx(%d)", nb_data);

	if ((USB_DEVICE_EP_CTRL_SIZE != nb_data)
			|| (udd_g_ctrlreq.req.wLength <=
			(udd_ctrl_prev_payload_nb_trans +
			udd_ctrl_payload_nb_trans))) {
		// End of reception because it is a short packet
		// Before send ZLP, call intermediate callback
		// in case of data receive generate a stall
		udd_g_ctrlreq.payload_size = udd_ctrl_payload_nb_trans;
		if (NULL != udd_g_ctrlreq.over_under_run) {
			if (!udd_g_ctrlreq.over_under_run()) {
				// Stall ZLP
				udd_ctrl_stall_data();
				// Ack reception of OUT to replace NAK by a STALL
				udp_clear_csr(0, UDP_CSR_RX_DATA_BK0);
				return;
			}
		}
		// Send IN ZLP to ACK setup request
		udp_clear_csr(0, UDP_CSR_RX_DATA_BK0);
		udd_ctrl_send_zlp_in();
		DEBUGOUT(" Tx(%d)", 0);
		return;
	}

	if (udd_g_ctrlreq.payload_size == udd_ctrl_payload_nb_trans) {
		// Overrun then request a new payload buffer
		if (!udd_g_ctrlreq.over_under_run) {
			// No callback available to request a new payload buffer
			udd_ctrl_stall_data();
			// Ack reception of OUT to replace NAK by a STALL
			udp_clear_csr(0, UDP_CSR_RX_DATA_BK0);
			return;
		}
		if (!udd_g_ctrlreq.over_under_run()) {
			// No new payload buffer delivered
			udd_ctrl_stall_data();
			// Ack reception of OUT to replace NAK by a STALL
			udp_clear_csr(0, UDP_CSR_RX_DATA_BK0);
			return;
		}
		// New payload buffer available
		// Update number of total data received
		udd_ctrl_prev_payload_nb_trans += udd_ctrl_payload_nb_trans;
		// Reinit reception on payload buffer
		udd_ctrl_payload_nb_trans = 0;
	}
	// Free buffer of control endpoint to authorize next reception
	udp_clear_csr(0, UDP_CSR_RX_DATA_BK0);
}


static void udd_ctrl_stall_data(void)
{
	// Stall all packets on IN & OUT control endpoint
	m_EP0_State = EP0_STATE_STALL;
	udp_set_csr(0, UDP_CSR_FORCESTALL);
	
	DEBUGOUT(" Stall");
}


static void udd_ctrl_send_zlp_in(void)
{
	m_EP0_State = EP0_STATE_OUT_STATUS;
	// Validate and send empty IN packet on control endpoint
	// Send ZLP on IN endpoint
	udp_set_csr(0, UDP_CSR_TXPKTRDY);
}


static void udd_ctrl_send_zlp_out(void)
{
	m_EP0_State = EP0_STATE_IN_STATUS;
	// No action is necessary to accept OUT ZLP
	// because the buffer of control endpoint is already free
}


static void udd_ctrl_endofrequest(void)
{
	DEBUGOUT(" EndOfRequest");
	
	// If a callback is registered then call it
	if (udd_g_ctrlreq.callback) {
		udd_g_ctrlreq.callback();
	}
}


static bool udd_ctrl_interrupt(void){
	if ((UDP->UDP_IMR & UDP->UDP_ISR) & UDP_ISR_EP0INT){
		DEBUGOUT("EP0:");
		do{
			// Search event on control endpoint
			if (UDP->UDP_CSR[0] & UDP_CSR_RXSETUP) {
				// SETUP packet received
				udd_ctrl_setup_received();
				break;
			}
			if (UDP->UDP_CSR[0] & UDP_CSR_TXCOMP) {
				// IN packet sent
				DEBUGOUT("IN");
				udd_ctrl_in_sent();
				break;
			}
			if (UDP->UDP_CSR[0] & UDP_CSR_RX_DATA_BK0) {
				// OUT packet received
				DEBUGOUT("OUT");
				udd_ctrl_out_received();
				break;
			}
			if (UDP->UDP_CSR[0] & UDP_CSR_STALLSENT) {
				// STALLed
				DEBUGOUT("STALLed");
				udp_clear_csr(0, UDP_CSR_STALLSENT);
				break;
			}
		}while(false);
		DEBUGOUT("\n");
		return true;
	}
	return false;
}


