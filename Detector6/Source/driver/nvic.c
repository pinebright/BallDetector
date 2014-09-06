// NVIC�̐���֐�

#include "nvic.h"
#include <string.h>





#define NVIC_USER_IRQ_OFFSET 16



// ���荞�݃x�N�^�[(ROM)
extern const DeviceVectors exception_table_rom;

// ���荞�݃x�N�^�[(RAM)
extern DeviceVectors exception_table_ram;



// NVIC�x�N�^�[��RAM�Ɉړ�����
void NVIC_Migration(void){
	memcpy(&exception_table_ram, &exception_table_rom, sizeof(DeviceVectors));
	SCB->VTOR = (uint32_t)&exception_table_ram;
}

// NVIC�x�N�^�[�𓮓I�ɐݒ肷��
void NVIC_SetVector(IRQn_Type IRQn, uint32_t vector) {
	uint32_t *vectors = (uint32_t*)&exception_table_ram;
	vectors[NVIC_USER_IRQ_OFFSET + IRQn] = vector;
}

// NVIC�x�N�^�[���擾����
uint32_t NVIC_GetVector(IRQn_Type IRQn) {
	uint32_t *vectors = (uint32_t*)&exception_table_ram;
	return vectors[NVIC_USER_IRQ_OFFSET + IRQn];
}


