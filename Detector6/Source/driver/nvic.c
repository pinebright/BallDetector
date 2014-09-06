// NVICの制御関数

#include "nvic.h"
#include <string.h>





#define NVIC_USER_IRQ_OFFSET 16



// 割り込みベクター(ROM)
extern const DeviceVectors exception_table_rom;

// 割り込みベクター(RAM)
extern DeviceVectors exception_table_ram;



// NVICベクターをRAMに移動する
void NVIC_Migration(void){
	memcpy(&exception_table_ram, &exception_table_rom, sizeof(DeviceVectors));
	SCB->VTOR = (uint32_t)&exception_table_ram;
}

// NVICベクターを動的に設定する
void NVIC_SetVector(IRQn_Type IRQn, uint32_t vector) {
	uint32_t *vectors = (uint32_t*)&exception_table_ram;
	vectors[NVIC_USER_IRQ_OFFSET + IRQn] = vector;
}

// NVICベクターを取得する
uint32_t NVIC_GetVector(IRQn_Type IRQn) {
	uint32_t *vectors = (uint32_t*)&exception_table_ram;
	return vectors[NVIC_USER_IRQ_OFFSET + IRQn];
}


