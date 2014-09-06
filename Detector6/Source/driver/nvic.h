// NVICの制御関数

#pragma once

#include <sam.h>



#ifdef __cplusplus
extern "C" {
#endif

// NVICベクターをRAMに移動する
void NVIC_Migration(void);

// NVICベクターを設定する
void NVIC_SetVector(IRQn_Type IRQn, uint32_t vector);

// NVICベクターを取得する
uint32_t NVIC_GetVector(IRQn_Type IRQn);

#ifdef __cplusplus
}
#endif


