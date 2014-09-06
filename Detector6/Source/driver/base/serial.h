// シリアル通信のインターフェースクラス

#pragma once

#include <stdint.h>




// UARTの制御クラス
class iSerial{
public:
	// 終端記号
	static const int EOF = -1;
	
private:
	
	
	
public:
	// 文字列を出力
	void puts(const char *s);
	/*inline void printf(const char *fmt){
		puts(fmt);
	}*/
	
	// 形式を指定して文字列を出力
	void printf(const char *fmt, ...);
	
	
	
	
	// データを書き込む
	// スレッドからのみ呼び出せる
	// これらの関数はputsやprintfと同時に使用すべきではない
	uint32_t write(const void *buf, uint32_t size);
	
	// データを読み込む
	uint32_t read(void *buf, uint32_t size);
	
public:
	// 一文字送信
	virtual int putc(char c) = 0;
	
	// 一文字受信
	virtual int getc(void) = 0;
	
	// 送信可能か？
	virtual bool writable(void) = 0;
	
	// 受信可能か？
	virtual bool readable(void) = 0;
	
private:
	// ロックする
	virtual bool lock(void){return true;}
	
	// アンロックする
	virtual void unlock(void){}
};


