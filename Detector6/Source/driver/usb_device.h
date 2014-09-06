// USBデバイスの基本クラス

#pragma once

#include <sam.h>
#include <stdint.h>
#include "usb_struct.h"
#include "gpio.h"
#include "nvic.h"
#include "critical_section.h"



namespace nsUSBDevice{
	// パケットサイズ
	static const uint32_t EPPACKETSIZE[8] = {
		64, 64, 64, 64, 512, 512, 64, 64
	};
	
	// バッファサイズ
	static const uint32_t EP0BUFSIZE = 256;
	
	// EP0の状態
	enum EP0_STATE_e{
		EP0_STATE_IDLE = 0,		// SETUPパケット・転送待ち
		EP0_STATE_STALL,		// ストール中
		EP0_STATE_OUT_DATA,		// ホストからデバイスへの転送
		EP0_STATE_OUT_STATUS,	// ホストからデバイスへの転送のステータス
		EP0_STATE_IN_DATA,		// デバイスからホストへの転送
		EP0_STATE_IN_STATUS,	// デバイスからホストへの転送のステータス
	};
	
	// EP0の状態を管理する構造体
	struct EP0_t{
		EP0_STATE_e state;
		uint32_t size;
		uint32_t next;
		char buf[EP0BUFSIZE];
	};
	
	// PingPong転送をサポートしているエンドポイント
	static const uint32_t EPDUALBANK = 0b11110110;
	
	// バスイベント
	enum BUS_EVENT_e{
		BUS_EVENT_NONE,			// 何も起きていない
		BUS_EVENT_ATTACHED,		// USBに接続された
		BUS_EVENT_DETACHED,		// USBを切断された
		BUS_EVENT_SOF,			// SOFを受信した
		BUS_EVENT_RESET,		// USBリセットが起きた
		BUS_EVENT_SUSPENDED,	// USBがサスペンドした
		BUS_EVENT_RESUMED,		// USBがリジュームした
		BUS_EVENT_ADDRESSED,	// アドレスが割り当てられた
		BUS_EVENT_CONFIGURED,	// コンフィグレーションが設定された
		BUS_EVENT_DECONFIGURED,	// コンフィグレーションが無効になった
	};
	
	// メッセージキューサイズ
	//static const uint32_t QUEUESIZE = 16;
	
	
}



// USBデバイスの基本クラス
class iUSBDevice{
protected:
	static iUSBDevice *m_instance;		// インスタンス
	
private:
	static bool m_Enabled;				// USBが有効
	static bool m_Powered;				// USB電源が供給されている
	static uint32_t m_DefaultIER;		// 標準で有効な割り込みマスク
	static DeviceRequest_t m_Request;	// デバイスリクエスト
	static nsUSBDevice::EP0_t m_EP0;	// EP0の状態を管理する
	static uint32_t m_PingPongBank;		// PingPong転送での使用バンク
	
public:
	// 初期化
	static void Init(iUSBDevice *inst, uint32_t irq_priority, bool sof = false);
	
public:
	// VBUSの値をポーリングする
	static inline void PollVBUS(int pin){
		bool powered = (GetIn(pin) == IN_HIGH) ? true : false;
		UpdateConnection(m_Enabled, powered);
	}
	
	// USBを有効にする
	static inline void Enable(bool enabled){
		UpdateConnection(enabled, m_Powered);
	}
	
	// USBに接続されているか？
	static inline bool IsConnected(void){
		return m_Enabled && m_Powered;
	}
	
private:
	// 接続状態を変更する
	static void UpdateConnection(bool enabled, bool powered);
	
	// 割り込みハンドラ
	static void ISR(void);
	
	// EP0～7を初期化
	static uint32_t EP0to7_Init(void);
	
	// EP0を処理
	static void EP0_Proc(void);
	
	// EP0のSETUPを処理
	static bool EP0_ProcSETUP(const DeviceRequest_t *req);
	
	// EP0のリクエストを処理した
	static void EP0_EndOfRequest(void);
	
	// EP0をストールする
	static void EP0_SetSTALL(void);
	
	// EP0でホストへデータを送信する
	static bool EP0_SendData(void);
	
	// EP0でホストからデータを受信する
	static bool EP0_ReceiveData(void);
	
	// EP1～7を処理
	static void EP1to7_Proc(uint32_t ep);
	
	// FIFOへ書き込む
	static inline void WriteFIFO(uint32_t ep, const void *data_, uint32_t length){
		const char *data = (const char*)data_;
		while(length--){
			UDP->UDP_FDR[ep] = *data++;
		}
	}
	
	// FIFOから読み込む
	static inline void ReadFIFO(uint32_t ep, void *data_, uint32_t length){
		char *data = (char*)data_;
		while(length--){
			*data++ = UDP->UDP_FDR[ep];
		}
	}
	
	
	
protected:
	// デバイスディスクリプタを取得
	virtual const void* GetDeviceDescriptor(void) = 0;
	
	// コンフィグレーションディスクリプタを取得
	virtual const void* GetConfigDescriptor(void) = 0;
	
	// ストリングディスクリプタのリストを取得
	virtual const void** GetStringDescriptors(void) = 0;
	
	// バスイベントが起きたときに呼ばれる
	virtual void BusEventOccured(nsUSBDevice::BUS_EVENT_e event){}
	
	// コンフィギュレーションが変更されたときに呼ばれる
	virtual void SetConfiguration(bool configured) = 0;
	
	// EP0のOUT方向へのリクエスト
	virtual bool EP0_OutRequest(const DeviceRequest_t *req, const void *out_data, uint32_t out_length);
	
	// EP0のIN方向へのリクエスト
	// in_lengthにはバッファサイズが入り、データサイズを返す
	virtual bool EP0_InRequest(const DeviceRequest_t *req, void *in_data, uint32_t &in_length);
	
	// EP1～7からホストに送信したときに呼ばれる
	virtual bool EP1to7_Sent(uint32_t ep){return false;}
	
	// EP1～7でホストから受信したときに呼ばれる
	virtual bool EP1to7_Received(uint32_t ep, uint32_t length){return false;}
	
	// EP1～7からホストに送信が可能か？
	static bool EP1to7_IsSendable(uint32_t ep);
	
	// EP1～7からホストに送信
	static bool EP1to7_Send(uint32_t ep, const void *data = nullptr, uint32_t length = 0, bool wait = false);
	
	// EP1～7でホストから受信
	static bool EP1to7_Receive(uint32_t ep, void *data = nullptr);
	
	
};


