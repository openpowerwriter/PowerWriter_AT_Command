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
	extern bool powerwriter_at_benchmark(S_ATChannel *, bool, ATCmdStreamOut, ATCmdEventOut);
	// Initial PowerWriter AT commander
	extern bool powerwriter_at_init(S_ATChannel *, bool, ATCmdStreamOut, ATCmdEventOut);
	// Fill data to PowerWriter AT commander
	extern bool powerwriter_at_datain(S_ATChannel *ch, void *data, size_t size);
	// Get recevied frame object
	extern const S_ATCmdFrame *powerwriter_at_received_frame(S_ATChannel *ch);
	// Get last error code
	extern E_ATCmdError powerwriter_at_last_error(S_ATChannel *ch);
	// Get PowerWriter Information
	extern bool powerwriter_at_get_writerinfo(S_ATChannel *ch, S_ATCmdRspWriterInfo *info);
	// Get PowerWriter configuration
	extern bool powerwriter_at_get_writerconfig(S_ATChannel *ch, S_ATCmdRspWriterCfg *cfg);
	// Set PowerWriter configuration
	extern bool powerwriter_at_set_writerconfig(S_ATChannel *ch, const S_ATCmdRspWriterCfg *cfg);
	// Set PowerWriter AT baudrate
	extern bool powerwriter_at_set_baudrate(S_ATChannel *ch, int baudrate);
	// Init target connnect
	extern bool powerwriter_at_target_connect(S_ATChannel *ch);
	// Get target status
	extern bool powerwriter_at_target_status(S_ATChannel *ch);
	// Get target id
	extern bool powerwriter_at_target_id(S_ATChannel *ch, S_ATCmdRspTargetChipID *rsp);
	// Read target memory
	extern bool powerwriter_at_target_read(S_ATChannel *ch, uint32_t addr, uint32_t size, S_ATCmdRspTargetMemory **memory);
	// Erase target chip
	extern bool powerwriter_at_target_erase(S_ATChannel *ch, int timout_ms);
	// Erase target flash memory
	extern bool powerwriter_at_target_erase_sector(S_ATChannel *ch, uint32_t addr, uint32_t size, int timout_ms);
	// Write target flash memory
	extern bool powerwriter_at_target_write_prepare(S_ATChannel *ch, uint32_t total);
	extern bool powerwriter_at_target_write(S_ATChannel *ch, uint32_t addr, void *buffer, size_t buffersize);
	// Read target option byte
	extern bool powerwriter_at_target_read_ob(S_ATChannel *ch, S_ATCmdRspTargetOptionByte **ppob);
	// Write target vendor default option byte
	extern bool powerwriter_at_target_write_vendor_ob(S_ATChannel *ch, int timout_ms);
	// Write target user's option byte
	extern bool powerwriter_at_target_write_user_ob(S_ATChannel *ch, int timout_ms);
	// Reset target chip
	extern bool powerwriter_at_target_reset(S_ATChannel *ch, E_resetType type);

	// Get offline project information
	extern bool powerwriter_at_project_info(S_ATChannel *ch, S_ATCmdRspProjectInfo **ppproject);
	// Disable offline project
	extern bool powerwriter_at_project_disable(S_ATChannel *ch);
	// Load offline project
	// Note: 
	// The Chinese file names in PW200/PW300 device should use GB2312 encoding (default),
	// The Chinese file names for PWX1 device should use UTF-8 encoding,
	// Using powerwriter_at_get_writerinfo to get device type.
	extern bool powerwriter_at_project_load(S_ATChannel *ch, const char * prj_name, const char *password, const void *prj_data, size_t prj_size, ATProgress p_cb);
	// start offline program
	extern bool powerwriter_at_offline_start(S_ATChannel *ch);
	// query offline status
	extern bool powerwriter_at_offline_status(S_ATChannel *ch, S_ATCmdStatus *ps);

	// easy broadcast no rsp
	extern bool powerwriter_at_easy_broadcast_no_rsp(S_ATChannel *ch, const void *bcdata, size_t bcsize, S_ATCmdBroadcastDir bcdir);
	// broadcast
	extern bool powerwriter_at_broadcast(S_ATChannel *ch, const void *bcdata, size_t bcsize, S_ATCmdBroadcastDir bcdir, bool keepframe,
										 bool waitrsp, S_ATCmdBroadcast *prsp, int waitrsptimeout);
	/* factory test */
	// run factory sram firmware
	bool powerwriter_at_run_factory_sram_fw(S_ATChannel *ch, int timeout);
	// run factory flash firmware
	bool powerwriter_at_run_factory_flash_fw(S_ATChannel *ch, int timeout);

#ifdef __cplusplus
}
#endif

#endif
