/**
 * \file
 *
 * \brief Common API for USB Device Drivers (UDD)
 *
 * Copyright (c) 2009 - 2012 Atmel Corporation. All rights reserved.
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

#ifndef _UDD_H_
#define _UDD_H_

#include <stdint.h>
#include "usb_protocol.h"
//#include "udc_desc.h"



/**
 * \ingroup usb_device_group
 * \defgroup udd_group USB Device Driver (UDD)
 *
 * The UDD driver provides a low-level abstraction of the device
 * controller hardware. Most events coming from the hardware such as
 * interrupts, which may cause the UDD to call into the UDC and UDI.
 *
 * @{
 */

//! \brief Endpoint identifier
typedef uint8_t udd_ep_id_t;

//! \brief Endpoint transfer status
//! Returned in parameters of callback register via udd_ep_run routine.
typedef enum {
	UDD_EP_TRANSFER_OK = 0,
	UDD_EP_TRANSFER_ABORT = 1,
} udd_ep_status_t;

/**
 * \brief Global variable to give and record information of the setup request management
 *
 * This global variable allows to decode and response a setup request.
 * It can be updated by udc_process_setup() from UDC or *setup() from UDIs.
 */
typedef struct {
	//! Data received in USB SETUP packet
	//! Note: The swap of "req.wValues" from uin16_t to le16_t is done by UDD.
	usb_setup_req_t req;

	//! Point to buffer to send or fill with data following SETUP packet
	uint8_t *payload;

	//! Size of buffer to send or fill, and content the number of byte transfered
	uint16_t payload_size;

	//! Callback called after reception of ZLP from setup request
	void (*callback) (void);

	//! Callback called when the buffer given (.payload) is full or empty.
	//! This one return false to abort data transfer, or true with a new buffer in .payload.
	bool(*over_under_run) (void);
} udd_ctrl_request_t;
extern udd_ctrl_request_t udd_g_ctrlreq;

//! Return true if the setup request \a udd_g_ctrlreq indicates IN data transfer
#define  Udd_setup_is_in()       \
      (USB_REQ_DIR_IN == (udd_g_ctrlreq.req.bmRequestType & USB_REQ_DIR_MASK))

//! Return true if the setup request \a udd_g_ctrlreq indicates OUT data transfer
#define  Udd_setup_is_out()      \
      (USB_REQ_DIR_OUT == (udd_g_ctrlreq.req.bmRequestType & USB_REQ_DIR_MASK))

//! Return the type of the SETUP request \a udd_g_ctrlreq. \see usb_reqtype.
#define  Udd_setup_type()        \
      (udd_g_ctrlreq.req.bmRequestType & USB_REQ_TYPE_MASK)

//! Return the recipient of the SETUP request \a udd_g_ctrlreq. \see usb_recipient
#define  Udd_setup_recipient()   \
      (udd_g_ctrlreq.req.bmRequestType & USB_REQ_RECIP_MASK)





/**
 * \brief Enables the USB Device mode
 */
void udd_enable(void);

/**
 * \brief Disables the USB Device mode
 */
void udd_disable(void);

/**
 * \brief Attach device to the bus when possible
 *
 * \warning If a VBus control is included in driver,
 * then it will attach device when an acceptable Vbus
 * level from the host is detected.
 */
void udd_attach(void);

/**
 * \brief Detaches the device from the bus
 *
 * The driver must remove pull-up on USB line D- or D+.
 */
void udd_detach(void);

/**
 * \brief Changes the USB address of device
 *
 * \param address    New USB address
 */
void udd_set_address(uint8_t address);

/*! \brief The USB driver sends a resume signal called Upstream Resume
 */
void udd_send_remotewakeup(void);

/**
 * \brief Load setup payload
 *
 * \param payload       Pointer on payload
 * \param payload_size  Size of payload
 */
void udd_set_setup_payload( uint8_t *payload, uint16_t payload_size );




//@}






#endif // _UDD_H_
