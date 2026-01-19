/**
 * @file    powerwriter_at_log.h
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

#ifndef __POWERWRITER_AT_LOG_h
#define __POWERWRITER_AT_LOG_h

#include <stdio.h>
#include "powerwriter_at_config.h"

#ifdef POWERWRITER_AT_LOGGER_ENABLE

// Log type
typedef enum E_POWERWRITER_AT_LOG_TYPE
{
	LOGN,
	LOGI,
	LOGD,
	LOGW,
	LOGE,
	__LOG_TYPE_MAX
} E_POWERWRITER_AT_LOG_TYPE;

// log type
static const char *S_POWERWRITER_AT_LOG_PREFIX[__LOG_TYPE_MAX] = {
	"",
	"[Info ]:",
	"[Debug]:",
	"[Warn ]:",
	"[Error]:"};

/* exports api */
// print log
#define powerwriter_at_log(type, format, ...) printf("%s" format, S_POWERWRITER_AT_LOG_PREFIX[type], ##__VA_ARGS__)
#else
#define powerwriter_at_log(type, format, ...)
#endif

#endif
