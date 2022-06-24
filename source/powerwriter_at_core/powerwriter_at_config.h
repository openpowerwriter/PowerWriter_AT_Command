/**
 * @file    powerwriter_at_config.h
 * @brief   PowerWriter open communication interface
 *
 * PowerWriter AT
 * Copyright (c) 2009-2021, ICWorkshop Limited, All Rights Reserved
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef __powerwriter_at_CONFIG_h
#define __powerwriter_at_CONFIG_h

#include <stdint.h>

// The global control
#define POWERWRITER_AT_LOGGER_ENABLE  /* Enable Logger       */
//#define POWERWRITER_AT_HWCRC_ENABLE /* Use hardware CRC32  */
#define POWERWRITER_AT_ENCRYPT_ENABLE /* Enable Data Encrypt */

//Const defined
#define POWERWRITER_AT_PACKAGE_ALIGN    16  /* package align size */

// AES128-CBC Config
#if defined(POWERWRITER_AT_ENCRYPT_ENABLE)
//#define POWERWRITER_AT_ENCRYPT_HW_AES     /* Use hardware AES */
// AES128Bit-CBC Encrypt Key & IV For PowerWriter AT Command
// F1A5A400C1BC992822D4169C3B6476B6
static uint8_t m_at_encrypt_key[] = {0xf1, 0xa5, 0xa4, 0x00, 0xc1, 0xbc, 0x99, 0x28, 0x22, 0xd4, 0x16, 0x9c, 0x3b, 0x64, 0x76, 0xb6};
// CA511B6819D6442A7B772A0C66C31282
static uint8_t m_at_encrypt_iv_[] = {0xca, 0x51, 0x1b, 0x68, 0x19, 0xd6, 0x44, 0x2a, 0x7b, 0x77, 0x2a, 0x0c, 0x66, 0xc3, 0x12, 0x82};
#endif

#endif
