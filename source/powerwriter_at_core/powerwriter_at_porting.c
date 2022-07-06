/**
 * @file    powerwriter_porting.c
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
 
#include "powerwriter_at_porting.h"
#include "3rd/crc/crc.h"

#ifdef 	__arm__		
#include <stdio.h>
#include "stm32f1xx_hal.h"
#else
#include <time.h>
#endif

//Sleep
#ifdef WIN32
#include <windows.h>
#elif defined(__GNUC__)
#include <unistd.h>
#endif

/*
 Get System ticks
 */ 
uint32_t	GetSystemTick()
{
#ifdef 	__arm__		/* arm complier */
	return HAL_GetTick();
#else				/* other complier in client */
	return (int)clock();
#endif	
	
}

/*
 Sleep
*/
void ATSleep(uint32_t ms) {
#ifdef WIN32
	Sleep(ms);
#elif defined(__GNUC__)
	usleep(ms);
#else
	uint32_t ts = GetSystemTick();
	while (GetSystemTick() - ts < ms);
#endif
	//add a sleep interface to your platform or operating system ...
	//...

}

/* log enable ?*/
#ifdef POWERWRITER_AT_LOGGER_ENABLE
#ifdef __arm__

extern UART_HandleTypeDef huart1;
extern "C"
{
	int fputc(int ch, FILE *f)
	{
			HAL_UART_Transmit(&huart1,(uint8_t *)&ch,1,10);
			return (ch);
	}
}
#endif
#endif

/* crc */
uint32_t	GetCrc32(const void * data, size_t size)
{
#ifdef POWERWRITER_AT_HWCRC_ENABLE
	/*
		CRC Setting Reference
		Polynomial 				: 0x04C11DB7
		Initial/Final remainder	: 0xffffffff
		Input/Output reverse	: yes
	*/
#error "You must implement the hardware AES128-CBC on the current platform"
#else
	return crc32(data, (int)size);
#endif
}

