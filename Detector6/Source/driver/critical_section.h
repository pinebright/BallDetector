// クリティカルセクション

#pragma once

#include <sam.h>
#include <stdint.h>



// クリティカルセクションに入る
#define EnterCritical() uint32_t _primask; asm volatile("mrs %0, primask\n\tcpsid I\n\tdmb" : "=r"(_primask)); 
//#define EnterCritical() uint32_t _primask = __get_PRIMASK(); __disable_irq(); __sync_synchronize()

// クリティカルセクションを出る
#define LeaveCritical() asm volatile("dmb\n\tmsr primask, %0" :: "r"(_primask))
//#define LeaveCritical() __set_PRIMASK(_primask); __sync_synchronize()

