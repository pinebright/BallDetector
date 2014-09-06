/**	@file
	@brief USB関係の構造体
*/

#pragma once


#define USB_DRQ_DIR_Mask				0x80
#define USB_DRQ_DIR_HOST_TO_DEVICE		0x00
#define USB_DRQ_DIR_DEVICE_TO_HOST		0x80

#define USB_DRQ_TYPE_Mask				0x60
#define USB_DRQ_TYPE_BASIC				0x00
#define USB_DRQ_TYPE_CLASS				0x20
#define USB_DRQ_TYPE_VENDOR				0x40

#define USB_DRQ_TARGET_Mask				0x1F
#define USB_DRQ_TARGET_DEVICE			0x00
#define USB_DRQ_TARGET_INTERFACE		0x01
#define USB_DRQ_TARGET_ENDPOINT			0x02
#define USB_DRQ_TARGET_OTHER			0x03

#define USB_DRQ_RQ_GET_STATUS			0
#define USB_DRQ_RQ_CLEAR_FEATURE		1
#define USB_DRQ_RQ_SET_FEATURE			3
#define USB_DRQ_RQ_SET_ADDRESS			5
#define USB_DRQ_RQ_GET_DESCRIPTOR		6
#define USB_DRQ_RQ_SET_DESCRIPTOR		7
#define USB_DRQ_RQ_GET_CONFIGURATION	8
#define USB_DRQ_RQ_SET_CONFIGURATION	9
#define USB_DRQ_RQ_GET_INTERFACE		10
#define USB_DRQ_RQ_SET_INTERFACE		11
#define USB_DRQ_RQ_SYNC_FRAME			12
#define USB_DRQ_RQ_HID_GET_REPORT		1
#define USB_DRQ_RQ_HID_SET_REPORT		9

#define USB_DESC_DEVICE					0x01
#define USB_DESC_CONFIGURATION			0x02
#define USB_DESC_STRING					0x03
#define USB_DESC_INTERFACE				0x04
#define USB_DESC_ENDPOINT				0x05
#define USB_DESC_HID					0x21
#define USB_DESC_HID_REPORT				0x22

#define USB_FEATURE_ENDPOINT_HALT			0
#define USB_FEATURE_DEVICE_REMOTE_WAKEUP	1
#define USB_FEATURE_TEST_MODE				2
#define USB_FEATURE_B_HNP_ENABLE			3
#define USB_FEATURE_A_HNP_SUPPORT			4
#define USB_FEATURE_A_ALT_HNP_SUPPORT		5



// デバイスリクエスト
struct DeviceRequest_t{
	unsigned char bmRequestType;
	unsigned char bRequest;
	unsigned short wValue;
	unsigned short wIndex;
	unsigned short wLength;
} __attribute__((__packed__));



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

// ストリング ディスクリプタ
struct StringDescriptor_t{
	unsigned char bLength;
	unsigned char bDescriptorType;
	union{
		unsigned short *wLANGID;
		unsigned short *bString;
	};
} __attribute__((__packed__));

// HID クラス ディスクリプタ
struct HIDClassDescriptor_t{
	unsigned char bLength;
	unsigned char bDescriptorType;
	unsigned short bcdHID;
	unsigned char bCountryCode;
	unsigned char bNumClassDescriptors;
	unsigned char bClassDescriptorType;
	unsigned short wClassDescriptorLength;
} __attribute__((__packed__));


