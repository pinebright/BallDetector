/**
 * \file
 *
 * \brief USB Device Controller (UDC)
 *
 * Copyright (c) 2009 - 2013 Atmel Corporation. All rights reserved.
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

#include <stdint.h>
#include "conf_usb.h"
#include "usb_protocol.h"
#include "udd.h"
//#include "udc_desc.h"
//#include "udi.h"
#include "udc.h"
#include "driver/uart.h"
#define DEBUGOUT Uart0.printf

/**
 * \ingroup udc_group
 * \defgroup udc_group_interne Implementation of UDC
 *
 * Internal implementation
 * @{
 */




// デバイス ディスクリプタ
struct DeviceDescriptor_t{
	unsigned char bLength;
	unsigned char bDescriptorType;
	unsigned short bcdUSB;
	unsigned char bDeviceClass;
	unsigned char bDeviceSubClass;
	unsigned char bDeviceProtocol;
	unsigned char bMaxPacketSize0;
	unsigned short idVendor;
	unsigned short idProduct;
	unsigned short bcdDevice;
	unsigned char iManufacturer;
	unsigned char iProduct;
	unsigned char iSerialNumber;
	unsigned char bNumConfigurations;
} __attribute__((__packed__));

// コンフィグレーション ディスクリプタ
struct ConfigurationDescriptor_t{
	unsigned char bLength;
	unsigned char bDescriptorType;
	unsigned short wTotalLength;
	unsigned char bNumInterfaces;
	unsigned char bConfigurationValue;
	unsigned char iConfiguration;
	unsigned char bmAttributes;
	unsigned char bMaxPower;
} __attribute__((__packed__));

// IAD ディスクリプタ
struct IADescriptor_t{
	unsigned char bLength;
	unsigned char bDescriptorType;
	unsigned char bFirstInterface;
	unsigned char bInterfaceCount;
	unsigned char bFunctionClass;
	unsigned char bFunctionSubClass;
	unsigned char bFunctionProtocol;
	unsigned char iFunction;
} __attribute__((__packed__));

// インターフェース ディスクリプタ
struct InterfaceDescriptor_t{
	unsigned char bLength;
	unsigned char bDescriptorType;
	unsigned char bInterfaceNumber;
	unsigned char bAlternateSetting;
	unsigned char bNumEndpoints;
	unsigned char bInterfaceClass;
	unsigned char bInterfaceSubClass;
	unsigned char bInterfaceProtocol;
	unsigned char iInterface;
} __attribute__((__packed__));

// エンドポイント ディスクリプタ
struct EndpointDescriptor_t{
	unsigned char bLength;
	unsigned char bDescriptorType;
	unsigned char bEndpointAddress;
	unsigned char bmAttributes;
	unsigned short wMaxPacketSize;
	unsigned char bInterval;
} __attribute__((__packed__));





/**
 * \brief Change the address of device
 * Callback called at the end of request set address
 */
static void udc_valid_address(void)
{
	udd_set_address(udd_g_ctrlreq.req.wValue & 0x7F);
}

/**
 * \brief Standard device request to get device string descriptor
 *
 * \return true if success
 */
static bool udc_req_std_dev_get_str_desc(void)
{
	// ストリング ディスクリプタ0 (LANGID)
	static const char StringDescriptor0[] = {
		4,					// bLength
		0x03,				// bDescriptorType
		0x09, 0x04			// wLANGID
							// 0x409 English only
	};
	
	// ストリング ディスクリプタ1 (Manufacturer)
	static const char StringDescriptor1[] = {
		10,					// bLength
		0x03,				// bDescriptorType
		'F', 0x00,			// bString
		'T', 0x00,			// "FTDI"
		'D', 0x00,
		'I', 0x00
	};
	
	// ストリング ディスクリプタ2 (Product)
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
	
	// ストリング ディスクリプタ3 (Serial Number)
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
	
	
	
	
	
	// Link payload pointer to the string corresponding at request
	switch (udd_g_ctrlreq.req.wValue & 0xff) {
	case 0:
		udd_set_setup_payload((uint8_t *)&StringDescriptor0, sizeof(StringDescriptor0));
		break;
		
	case 1:
		udd_set_setup_payload((uint8_t *)&StringDescriptor1, sizeof(StringDescriptor1));
		break;

	case 2:
		udd_set_setup_payload((uint8_t *)&StringDescriptor2, sizeof(StringDescriptor2));
		break;
		
	case 3:
		udd_set_setup_payload((uint8_t *)&StringDescriptor3, sizeof(StringDescriptor3));
		break;
		
	default:
		return false;
	}
	
	return true;
}

/**
 * \brief Standard device request to get descriptors about USB device
 *
 * \return true if success
 */
static bool udc_req_std_dev_get_descriptor(void)
{
	static const DeviceDescriptor_t DeviceDescriptor = {
		18,			// bLength
		0x01,		// bDescriptorType
		0x0200,		// bcdUSB
		0x00,		// bDeviceClass
		0x00,		// bDeviceSubClass
		0x00,		// bDeviceProtocol
		64,			// bMaxPacketSize0
		0x0404,		// idVendor
		0x6001,		// idProduct
		0x0600,		// bcdDevice
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
		{	// コンフィグレーション ディスクリプタ
			9,				// bLength
			0x02,			// bDescriptorType
			sizeof(ConfigurationDescriptor),	// wTotalLength
			1,				// bNumInterfaces
			1,				// bConfigurationValue
			0,				// iConfiguration
			0x80,			// bmAttributes (Bus Powered)
			50				// bMaxPower (100mA)
		},
		{	// インターフェース ディスクリプタ
			9,				// bLength
			0x04,			// bDescriptorType
			0,				// bInterfaceNumber
			0,				// bAlternateSetting
			2,				// bNumEndpoints
			0xFF,			// bInterfaceClass
			0xFF,			// bInterfaceSubClass
			0xFF,			// bInterfaceProtocol
			2				// iInterface
		},
		{	// エンドポイント1 ディスクリプタ
			7,				// bLength
			0x05,			// bDescriptorType
			0x81,			// bEndpointAddress (EP1, IN)
			0x02,			// bmAttributes (Bulk)
			64,				// wMaxPacketSize
			0				// bInterval
		},
		{	// エンドポイント2 ディスクリプタ
			7,				// bLength
			0x05,			// bDescriptorType
			0x02,			// bEndpointAddress (EP2, OUT)
			0x02,			// bmAttributes (Bulk)
			64,				// wMaxPacketSize
			0				// bInterval
		}
	};
	
	
	
	// Check descriptor ID
	switch ((uint8_t) (udd_g_ctrlreq.req.wValue >> 8)) {
	case USB_DT_DEVICE:
		// Device descriptor requested
		udd_set_setup_payload((uint8_t *)&DeviceDescriptor, sizeof(DeviceDescriptor));
		break;

	case USB_DT_CONFIGURATION:
		// Configuration descriptor requested
		udd_set_setup_payload((uint8_t *)&ConfigurationDescriptor, sizeof(ConfigurationDescriptor));
		break;

	case USB_DT_STRING:
		// String descriptor requested
		if (!udc_req_std_dev_get_str_desc()) {
			return false;
		}
		break;

	default:
		// Unknown descriptor requested
		return false;
	}
	// if the descriptor is larger than length requested, then reduce it
	if (udd_g_ctrlreq.req.wLength < udd_g_ctrlreq.payload_size) {
		udd_g_ctrlreq.payload_size = udd_g_ctrlreq.req.wLength;
	}
	return true;
}

/**
 * \brief Main routine to manage the USB SETUP request.
 *
 * This function parses a USB SETUP request and submits an appropriate
 * response back to the host or, in the case of SETUP OUT requests
 * with data, sets up a buffer for receiving the data payload.
 *
 * The main standard requests defined by the USB 2.0 standard are handled
 * internally. The interface requests are sent to UDI, and the specific request
 * sent to a specific application callback.
 *
 * \return true if the request is supported, else the request is stalled by UDD
 */
bool udc_process_setup(void)
{
	// By default no data (receive/send) and no callbacks registered
	udd_g_ctrlreq.payload_size = 0;
	udd_g_ctrlreq.callback = nullptr;
	udd_g_ctrlreq.over_under_run = nullptr;

	if (Udd_setup_is_in()) {
		if (udd_g_ctrlreq.req.wLength == 0) {
			return false; // Error from USB host
		}
	}

	// If standard request then try to decode it in UDC
	if (Udd_setup_type() == USB_REQ_TYPE_STANDARD) {
		if (Udd_setup_is_in()) {
			// GET Standard Requests
			if (udd_g_ctrlreq.req.wLength == 0) {
				return false; // Error for USB host
			}

			if (USB_REQ_RECIP_DEVICE == Udd_setup_recipient()) {
				// Standard Get Device request
				switch (udd_g_ctrlreq.req.bRequest) {
				case USB_REQ_GET_DESCRIPTOR:
					DEBUGOUT(" GetDescriptor(%d,%d)", udd_g_ctrlreq.req.wValue >> 8, udd_g_ctrlreq.req.wValue && 0xFF);
					return udc_req_std_dev_get_descriptor();
				default:
					break;
				}
			}

			if (USB_REQ_RECIP_INTERFACE == Udd_setup_recipient()) {
				// Standard Get Interface request
				switch (udd_g_ctrlreq.req.bRequest) {
				default:
					break;
				}
			}
		} else {
			// SET Standard Requests
			if (USB_REQ_RECIP_DEVICE == Udd_setup_recipient()) {
				// Standard Set Device request
				switch (udd_g_ctrlreq.req.bRequest) {
				case USB_REQ_SET_ADDRESS:
					DEBUGOUT(" SetAddress(%d)", udd_g_ctrlreq.req.wValue);
					udd_g_ctrlreq.callback = udc_valid_address;
					return true;
					
				case USB_REQ_SET_CONFIGURATION:
					DEBUGOUT(" SetConfiguration(%d)", udd_g_ctrlreq.req.wValue);
					return true;
					
				default:
					break;
				}
			}

			if (USB_REQ_RECIP_INTERFACE == Udd_setup_recipient()) {
				// Standard Set Interface request
				switch (udd_g_ctrlreq.req.bRequest) {
				case USB_REQ_SET_INTERFACE:
					DEBUGOUT(" SetInterface(%d,%d)", udd_g_ctrlreq.req.wValue, udd_g_ctrlreq.req.wIndex);
					return true;
				default:
					break;
				}
			}
		}
		return false;
	}

	// If interface request then try to decode it in UDI
	if (Udd_setup_recipient() == USB_REQ_RECIP_INTERFACE) {
		
	}

	// If endpoint request then try to decode it in UDI
	if (Udd_setup_recipient() == USB_REQ_RECIP_ENDPOINT) {
	}

	// Here SETUP request unknown by UDC and UDIs
	return false;
}

//! @}
