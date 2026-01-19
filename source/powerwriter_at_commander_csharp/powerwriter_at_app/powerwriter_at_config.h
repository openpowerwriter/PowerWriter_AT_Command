/**
 * @file    powerwriter_at_config.h
 * @brief   PowerWriter open communication interface
 *
 * PowerWriter AT
 * Copyright (c) 2009-2021, ICWorkshop Limited, All Rights Reserved
 * SPDX-License-Identifier: MIT
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
#include <string.h>

// The global control
#define POWERWRITER_AT_LOGGER_ENABLE /* Enable Logger       */
//#define POWERWRITER_AT_HWCRC_ENABLE /* Use hardware CRC32  */
//#define POWERWRITER_AT_ENCRYPT_ENABLE /* Enable Data Encrypt */
#define POWERWRITER_AT_ASSERT_ENABLE /*Enable AT ASSERT */

// Const defined
#define POWERWRITER_AT_PACKAGE_ALIGN 16 /* package align size */

// AES128-CBC Config
#if defined(POWERWRITER_AT_ENCRYPT_ENABLE)
//#define POWERWRITER_AT_ENCRYPT_HW_AES     /* Use hardware AES */
// AES128Bit-CBC Encrypt Key & IV For PowerWriter AT Command
	//AES128Bit-CBC Encrypt Key & IV For PowerWriter AT Command
	//72C634F2CF2EF3D5F740DA5CEEBE4018
static	uint8_t m_at_encrypt_key[] = { 0x72,0xc6,0x34,0xf2,0xcf,0x2e,0xf3,0xd5,0xf7,0x40,0xda,0x5c,0xee,0xbe,0x40,0x18 };
//4BFEB618B2F1F1C92C7E4C376DF0B28A
static	uint8_t m_at_encrypt_iv_[] = { 0x4b,0xfe,0xb6,0x18,0xb2,0xf1,0xf1,0xc9,0x2c,0x7e,0x4c,0x37,0x6d,0xf0,0xb2,0x8a }; 
#endif

// PowerWriter open communication interface types
/* Do not try to change the following definitions !!!! */
#define PW_OEM_LENGTH 8							// PowerWriter OEM length
#define PW_SN_LENGTH 32							// PowerWriter SN length
#define PW_VERSION_LENGTH 8						// PowerWriter version information length
#define PW_TARGET_NAME_MAX 16					// PowerWriter target name max length
#define PW_TARGET_ID_MAX 16						// Target chip ID MAX size
#define PW_PACKAGE_SIZE 256						// Buffer size of block data
#define PW_OB_MAX 1024							// Target chip option byte MAX size;
#define PW_MAX_FILE_NAME	255					// PowerWriter max path size
#define PW_PROJECT_PWD_SIZE 16					// PowerWriter project password max size
#define PW_ENUM_MAX INT32_MAX					// PowerWriter default enum max value
#define PW_AT_CACHE_CMDS_MIN 1					// The number of instructions allowed to be cached ( >= 1)
#define PW_AT_FRAME_HDR_SIZE 4					// PowerWriter AT command frame header size
#define PW_AT_FRAME_HDR_STR "PWAT"				// PowerWriter AT command frame header string
#define PW_AT_DEFAULT_BAUDRATE 9600				// PowerWriter AT command default baud rate
#define PW_AT_TIMEOUT_BASE 5000					// PowerWriter AT command timeout general
#define PW_AT_TIMEOUT_MIN 100					// PowerWriter AT command timeout min
#define PW_AT_DEFAULT_PASSWORD 0x00				// Default powerwriter project key
/* multi threading */
#ifndef __arm__
//#include <thread>
//#include <mutex>
#define MACRO_THREAD_TYPE						// std::mutex	m_thread_lock;
#define MACRO_THREAD_LOCK(ch)					// std::lock_guard<std::mutex> m_thread_mutex(ch->m_ATConfig.m_thread_lock);
#define MACRO_THREAD_EXIT
#else
#define MACRO_THREAD_TYPE						/* Threads locked to your operating system!  */
#define MACRO_THREAD_LOCK(ch)					/* Threads locked to your operating system! */
#define MACRO_THREAD_EXIT						/* Threads locked to your operating system! */
#endif											// ! __arm__

/* Macro utils */
#ifdef POWERWRITER_AT_ASSERT_ENABLE
#define AT_CHECK_PARAM(CH, RET) \
    if (NULL == CH)             \
    {                           \
        return RET;             \
    }
#else
#define AT_CHECK_PARAM(CH, RET)
#endif

#define AT_CHECK_PARAM_VOID(CH) AT_CHECK_PARAM(CH, )

#define ZERO(obj) memset(&obj, 0, sizeof(obj))
#define ZERO_PTR(p_obj) memset(p_obj, 0, sizeof(*p_obj))

#ifndef MIN
#define MIN(a, b) ((a) < (b) ? (a) : (b))
#endif

#ifndef ARRAYSIZE
#define ARRAY_SIZE(T) (sizeof(T) / sizeof(T[0]))
#endif

#endif
