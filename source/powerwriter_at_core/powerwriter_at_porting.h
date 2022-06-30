/**
 * @file    powerwriter_at_porting.h
 * @brief   ICWorkShop Safety License Shield Api Functions
 *
 * Safety License Shield
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
 
#ifndef powerwriter_at_porting_h		
#define powerwriter_at_porting_h 		

#include <stddef.h>
#include "powerwriter_at_config.h"

#ifdef __cplusplus
extern "C" {
#endif

uint32_t	GetSystemTick(void);									/* Get System Tick */
uint32_t	GetCrc32(void * data, size_t size);		/* Get crc16 */

#ifdef __cplusplus
}
#endif

#endif


