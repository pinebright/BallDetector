// PIOの制御関数

#pragma once

#include <sam.h>



#define IN_LOW		0
#define IN_HIGH		1

#define OUT_LOW		0
#define OUT_HIGH	1

#define DIR_IN		0
#define DIR_OUT		1

#define PINMODE_PU	1
#define PINMODE_PD	2
#define PINMODE_OD	4

#define PIO_DISABLE	0
#define PIO_ENABLE	1

#define PINMUX_A	0
#define PINMUX_B	1
#define PINMUX_C	2



// [0]=PIOA, [1]=PIOB, [2]=PIOC, [3]=PIOD, [4]=PIOE
static Pio *const PIOs[5] = {PIOA, PIOB, 0, PIOD, 0};

// 出力を設定
static inline void SetOut(int pin, int out){
	((out == OUT_LOW) ? PIOs[pin >> 5]->PIO_CODR : PIOs[pin >> 5]->PIO_SODR) = 1 << (pin & 0x1F);
}

// 方向を設定
static inline void SetDir(int pin, int dir){
	((dir == DIR_IN) ? PIOs[pin >> 5]->PIO_ODR : PIOs[pin >> 5]->PIO_OER) = 1 << (pin & 0x1F);
}

// 入力を取得
static inline int GetIn(int pin){
	return PIOs[pin >> 5]->PIO_PDSR & (1 << (pin & 0x1F)) ? IN_HIGH : IN_LOW;
}

// PIO機能を設定
static inline void SetPIO(int pin, int en_ds){
	((en_ds == PIO_DISABLE) ? PIOs[pin >> 5]->PIO_PDR : PIOs[pin >> 5]->PIO_PER) = 1 << (pin & 0x1F);
}






#ifdef __cplusplus

// I/Oピンの制御クラス
template<int pin>
class clDigitalIO{
public:
	// 出力を設定
	inline void SetOut(int out){::SetOut(pin, out);}
	
	// 方向を設定
	inline void SetDir(int dir){::SetDir(pin, dir);}
	
	// 入力を取得
	inline int GetIn(void){return ::GetIn(pin);}
		
	// PIO機能を設定
	inline void SetPIO(int en_ds){::SetPIO(pin, en_ds);}
};



// I/Oピンをまとめて初期化するクラス
class clDigitalIOInitializer{
private:
	class initializer{
	private:
		struct{
			int pio_clr;
			int dir_set;
			int out_set;
			int pu_clr;
			int pd_set;
			int od_set;
			int persel1;
			int persel2;
		} m_pio;
		
	public:
		// コンストラクタ
		inline initializer(void){
			m_pio.pio_clr	= 0;
			m_pio.dir_set	= 0;
			m_pio.out_set	= 0;
			m_pio.pu_clr	= 0;
			m_pio.pd_set	= 0;
			m_pio.od_set	= 0;
			m_pio.persel1	= 0;
			m_pio.persel2	= 0;
		}
		
		// I/Oピンを設定
		inline void Set(int pin, int dir, int out, int pinmode){
			int mask = 1 << (pin & 0x1F);
			m_pio.dir_set	|= (dir == DIR_OUT)			? mask : 0;
			m_pio.out_set	|= (out == OUT_HIGH)		? mask : 0;
			m_pio.pu_clr	|= (~pinmode & PINMODE_PU)	? mask : 0;
			m_pio.pd_set	|= (pinmode & PINMODE_PD)	? mask : 0;
			m_pio.od_set	|= (pinmode & PINMODE_OD)	? mask : 0;
		}
		
		// ペリフェラルを選択
		inline void Mux(int pin, int mux, int en_ds){
			int mask = 1 << (pin & 0x1F);
			m_pio.pio_clr	|= (en_ds == PIO_DISABLE)	? mask : 0;
			m_pio.persel1	|= (mux & 0x1)				? mask : 0;
			m_pio.persel2	|= (mux & 0x2)				? mask : 0;
		}
		
		// 設定値を適用
		inline void Apply(int port){
			if (m_pio.pio_clr != 0)	PIOs[port]->PIO_PDR			= m_pio.pio_clr;
			if (m_pio.dir_set != 0)	PIOs[port]->PIO_OER			= m_pio.dir_set;
			if (m_pio.out_set != 0)	PIOs[port]->PIO_SODR		= m_pio.out_set;
			if (m_pio.pu_clr != 0)	PIOs[port]->PIO_PUDR		= m_pio.pu_clr;
			if (m_pio.pd_set != 0)	PIOs[port]->PIO_PPDER		= m_pio.pd_set;
			if (m_pio.od_set != 0)	PIOs[port]->PIO_MDER		= m_pio.od_set;
			if (m_pio.persel1 != 0)	PIOs[port]->PIO_ABCDSR[0]	= m_pio.persel1;
			if (m_pio.persel2 != 0)	PIOs[port]->PIO_ABCDSR[1]	= m_pio.persel2;
		}
	};
	
private:
	initializer m_porta, m_portb, m_portd;
	
public:
	// コンストラクタ
	inline clDigitalIOInitializer(void) : m_porta(), m_portb(), m_portd(){}
	
	// I/Oピンを設定
	inline void Set(int pin, int dir, int out, int pinmode = 0){
		if ((pin >> 5) == 0) m_porta.Set(pin, dir, out, pinmode);
		if ((pin >> 5) == 1) m_portb.Set(pin, dir, out, pinmode);
		if ((pin >> 5) == 3) m_portd.Set(pin, dir, out, pinmode);
	}
	
	// ペリフェラルを選択
	inline void Mux(int pin, int mux, int en_ds){
		if ((pin >> 5) == 0) m_porta.Mux(pin, mux, en_ds);
		if ((pin >> 5) == 1) m_portb.Mux(pin, mux, en_ds);
		if ((pin >> 5) == 3) m_portd.Mux(pin, mux, en_ds);
	}
		
	// 設定値を適用
	inline void Apply(void){
		m_porta.Apply(0);
		m_portb.Apply(1);
		m_portd.Apply(3);
	}
};


#endif
