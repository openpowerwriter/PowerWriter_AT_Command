/**
 * @file    powerwriter_at_api.h
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

#ifndef __powerwriter_at_api_h
#define __powerwriter_at_api_h

#include "powerwriter_at_type.h"
#include "powerwriter_at_utils.h"
#include "powerwriter_at_cert.h"
#include "powerwriter_at_porting.h"

#ifdef __cplusplus
extern "C"
{
#endif

#include "powerwriter_at_log.h"

  /* export api for powerwriter AT commander */
  extern void powerwriter_at_introduction(void);
	// Run PowerWriter AT command self benchmark
  extern bool powerwriter_at_benchmark(S_ATChannel *,bool, ATCmdStreamOut ,  ATCmdEventOut );
  // Initial PowerWriter AT commander
  extern bool powerwriter_at_init(S_ATChannel *,bool ,ATCmdStreamOut  , ATCmdEventOut  );
  // Fill data to PowerWriter AT commander
  extern bool powerwriter_at_datain(S_ATChannel *ch,void *data,size_t size);
	// Get recevied frame object
	extern const S_ATCmdFrame * powerwriter_at_received_frame(S_ATChannel *ch);
	// Get last error code
	extern E_ATCmdError powerwriter_at_last_error(S_ATChannel *ch);
	// Get PowerWriter Information
	extern bool powerwriter_at_get_writerinfo(S_ATChannel *ch, S_ATCmdRspWriterInfo * info);
	// Get PowerWriter configuration
	extern bool	powerwriter_at_get_writerconfig(S_ATChannel *ch, S_ATCmdRspWriterCfg * cfg);
	// Set PowerWriter configuration
	extern bool powerwriter_at_set_writerconfig(S_ATChannel *ch, const S_ATCmdRspWriterCfg * cfg);
	// Set PowerWriter AT baudrate
	extern bool powerwriter_at_set_baudrate(S_ATChannel *ch, int baudrate);
	// Init target connnect
	extern bool powerwriter_at_target_connect(S_ATChannel *ch);

#ifdef __cplusplus
}
#endif

#endif
