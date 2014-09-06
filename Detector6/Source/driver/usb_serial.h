// USBシリアル通信クラス

#pragma once

#include "usb_device.h"
#include "base/serial.h"
#include "rtx/cmsis_os.h"



// デバイスインスタンスの宣言
class clUSBSerial;
extern clUSBSerial USBSerial;



namespace nsUSBSerial{
	static const uint32_t TXBUFSIZE = 1024;
	static const uint32_t RXBUFSIZE = 256;
	
	// 送信リングバッファ
	struct Tx_t{
		uint32_t put_index;
		uint32_t tx_index;
		uint32_t tx_size;
		uint32_t size;
		char buf[TXBUFSIZE];
	};
	
	// 受信リングバッファ
	struct Rx_t{
		uint32_t get_index;
		uint32_t rx_index;
		uint32_t size;
		char buf[RXBUFSIZE];
	};
}



// USBシリアル通信クラス
class clUSBSerial : public iUSBDevice, public iSerial{
private:
	static nsUSBSerial::Tx_t m_Tx;
	static nsUSBSerial::Rx_t m_Rx;
	static uint16_t m_ModemStatus;	// モデムの状態
	static uint32_t m_os_mutex[3];
	static osMutexId m_MutexID;
	
public:
	// 初期化
	void Init(uint32_t irq_priority);
	
protected:
	// デバイスディスクリプタを取得
	virtual const void* GetDeviceDescriptor(void) override;
	
	// コンフィグレーションディスクリプタを取得
	virtual const void* GetConfigDescriptor(void) override;
	
	// ストリングディスクリプタのリストを取得
	virtual const void** GetStringDescriptors(void) override;
	
	// バスイベントが起きたときに呼ばれる
	virtual void BusEventOccured(nsUSBDevice::BUS_EVENT_e event) override;
	
	// コンフィギュレーションが変更されたときに呼ばれる
	virtual void SetConfiguration(bool configured) override;
	
	// EP0のOUT方向へのリクエスト
	virtual bool EP0_OutRequest(const DeviceRequest_t *req, const void *out_data, uint32_t out_length) override;
	
	// EP0のIN方向へのリクエスト
	// in_lengthにはバッファサイズが入り、データサイズを返す
	virtual bool EP0_InRequest(const DeviceRequest_t *req, void *in_data, uint32_t &in_length) override;
	
	// EP1～7からホストに送信したときに呼ばれる
	virtual bool EP1to7_Sent(uint32_t ep) override;
	
	// EP1～7でホストから受信したときに呼ばれる
	virtual bool EP1to7_Received(uint32_t ep, uint32_t length) override;
	
public:
	// 一文字送信
	virtual int putc(char c) override;
	
	// 一文字受信
	virtual int getc(void) override;
	
	// 送信可能か？
	virtual bool writable(void) override;
	
	// 受信可能か？
	virtual bool readable(void) override;
	
private:
	// ロックする
	virtual bool lock(void) override;
	
	// アンロックする
	virtual void unlock(void) override;
};


