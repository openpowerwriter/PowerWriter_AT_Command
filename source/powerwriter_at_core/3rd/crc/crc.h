/**
 * @file    crc.h
 * @brief   CRC functions
 */

#ifndef _CRC_H_
#define _CRC_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

uint32_t crc32(const void *data, int nBytes);

#ifdef __cplusplus
}
#endif

#endif
