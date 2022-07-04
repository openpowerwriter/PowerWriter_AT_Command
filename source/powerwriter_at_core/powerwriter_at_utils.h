/**
 * @file    powerwriter_at_utils.h
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

#ifndef __powerwriter_at_utils_h
#define __powerwriter_at_utils_h

#include "powerwriter_at_config.h"

#ifdef __cplusplus
extern "C"
{
#endif
	size_t	utils_round_up(size_t number, size_t base);		//Round up
	void		object_print(void * obj, size_t size, const char *objname);//object print
#ifdef __cplusplus
}
#endif

#endif