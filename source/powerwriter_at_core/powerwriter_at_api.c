/**
 * @file    powerwriter_at_api.c
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

#include "powerwriter_at_api.h"

/*
 * @brief   Initialize the AT command interface
 * @pram 	ch: AT channel object
 *          encrypt: Whether the encryption
 *          pfDataOut: AT commander send pacakage callback
 *          pfEvent: AT commander event output callback
 * @return  Returns true on success, false otherwise
 */
bool powerwriter_at_init(
	S_ATChannel *ch,
	bool encrypt,
	ATCmdStreamOut  pfDataOut,
	ATCmdEventOut  pfEvent)
{
	AT_CHECK_PARAM(ch, false)
	AT_CHECK_PARAM(pfDataOut, false)
	//AT_CHECK_PARAM(pfEvent, false)
	
	ZERO_PTR(ch);

	ch->m_config.m_encryptEnable = encrypt;
	ch->m_config.m_streamOut = pfDataOut;
	ch->m_config.m_eventOut = pfEvent;

	return true;
}

/*
 * @brief   Fill data to AT command interface
 * @pram 	ch: AT channel object
 *          data: Whether the encryption
 *          size: AT commander send pacakage callback
 * @return  none
 */
void powerwriter_at_datain(
	S_ATChannel *ch,
	void *data,
	size_t size)
{

}

/*
 * @brief Get the received package 
 * @pram 	ch: AT channel object
 * @return  const S_ATCmdFrame * 
 */
const S_ATCmdFrame * powerwriter_at_received_frame(
	S_ATChannel *ch
) {
	AT_CHECK_PARAM(ch, NULL)
	return &ch->m_cmdOutput;
}

/*
 * @brief Get the last error code
 * @pram 	ch: AT channel object
 * @return  E_ATCmdError
 */
E_ATCmdError powerwriter_at_last_error(
	S_ATChannel *ch
) {
	AT_CHECK_PARAM(ch, ATErrorNone)
	return ch->m_config.m_lastError;
}
