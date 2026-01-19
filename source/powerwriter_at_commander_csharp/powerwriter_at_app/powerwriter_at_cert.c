/**
 * @file    POWERWRITER_AT_encrypt.c
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

#include "powerwriter_at_cert.h"
#include "3rd/crc/crc.h"
#include "3rd/aes/aes.h"
/*
 * @brief   Decrypt PowerWriter At command frame data
 * @param
 * 			data	:The object data
 * 			size	:The object size
 * 			encrypt	:true for encrypt, otherwise for decrypt
 * @RetVal 	True indicates success
 */

bool powerwriter_at_encrypt(void *data, size_t size, bool encrypt)
{
#ifdef POWERWRITER_AT_ENCRYPT_ENABLE

#ifdef POWERWRITER_AT_ENCRYPT_HW_AES
#error "You must implement the hardware AES128-CBC on the current platform"
#else
    struct AES_ctx ctx;
    AES_init_ctx_iv(&ctx, m_at_encrypt_key, m_at_encrypt_iv_);
    if (encrypt)
    {
        AES_CBC_encrypt_buffer(&ctx, data, size);
    }
    else
    {
        AES_CBC_decrypt_buffer(&ctx, data, size);
    }
    return true;
#endif
#else
    return true;
#endif
}
