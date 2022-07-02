/**
 * @file    powerwriter_at_utils.c
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

#include "powerwriter_at_utils.h"
#include "powerwriter_at_log.h"

// round up
size_t	utils_round_up(size_t number, size_t base) {
	if (number % base) {
		return (number / base + 1) * base;
	}
	return number;
}

// print object 
void object_print(void * obj, size_t size, const char *objname) {
	powerwriter_at_log(LOGD, "$%s[%d]:{", objname, size);
	uint8_t * p = (uint8_t *)obj;
	size_t  count = 0;
	do
	{
		count++;
		powerwriter_at_log(LOGN, "0x%02X,", *p++);
	} while (--size);
	powerwriter_at_log(LOGN, "}\r\n");
}