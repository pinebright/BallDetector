// �V���A���ʐM�̃C���^�[�t�F�[�X�N���X

#pragma once

#include <stdint.h>




// UART�̐���N���X
class iSerial{
public:
	// �I�[�L��
	static const int EOF = -1;
	
private:
	
	
	
public:
	// ��������o��
	void puts(const char *s);
	/*inline void printf(const char *fmt){
		puts(fmt);
	}*/
	
	// �`�����w�肵�ĕ�������o��
	void printf(const char *fmt, ...);
	
	
	
	
	// �f�[�^����������
	// �X���b�h����̂݌Ăяo����
	// �����̊֐���puts��printf�Ɠ����Ɏg�p���ׂ��ł͂Ȃ�
	uint32_t write(const void *buf, uint32_t size);
	
	// �f�[�^��ǂݍ���
	uint32_t read(void *buf, uint32_t size);
	
public:
	// �ꕶ�����M
	virtual int putc(char c) = 0;
	
	// �ꕶ����M
	virtual int getc(void) = 0;
	
	// ���M�\���H
	virtual bool writable(void) = 0;
	
	// ��M�\���H
	virtual bool readable(void) = 0;
	
private:
	// ���b�N����
	virtual bool lock(void){return true;}
	
	// �A�����b�N����
	virtual void unlock(void){}
};


