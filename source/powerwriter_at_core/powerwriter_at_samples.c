/**
 * @file    powerwriter_at_samples.c
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
#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif
#include "powerwriter_at_api.h"

//PowerWriter At interface information
void powerwriter_at_introduction()
{
    powerwriter_at_log(LOGI, "\t\tPowerWriter open communication interface\r\n");
    powerwriter_at_log(LOGI, "\r\n");
    powerwriter_at_log(LOGI, "The PowerWriter AT open interface allows you to control PowerWriter behavior, implement \r\n");
    powerwriter_at_log(LOGI, "highly flexible personalized and customized requirements, native hardware support, and  \r\n");
    powerwriter_at_log(LOGI, "cross-platform.For more information, visit: \r\n");
    powerwriter_at_log(LOGI, "https://docs.powerwriter.com/docs/powerwriter_for_arm/reference/ATCommand\r\n");
    powerwriter_at_log(LOGI, "\r\n");
    powerwriter_at_log(LOGI, "ICWorkshop HPT Dep Team(PowerWriter)\r\n");
    powerwriter_at_log(LOGI, "Technical support: csh@icworkshop.com\r\n");
    powerwriter_at_log(LOGI, "https://www.icworkshop.com / https://www.powerwriter.com\r\n");
    powerwriter_at_log(LOGI, "\r\n");
}

//Print PowerWriter information
void powerwriter_info_print(S_ATCmdRspWriterInfo * info) {
	if (info) {
		powerwriter_at_log(LOGD, ">print info\r\n");
		powerwriter_at_log(LOGD, "\t<type>: %s\r\n", info->m_oem);
		powerwriter_at_log(LOGD, "\t<SN>: %.32s\r\n", info->m_sn); // PW_SN_LENGTH
		powerwriter_at_log(LOGD, "\t<hardware version>: %s\r\n", info->m_hardwareVersion);
		powerwriter_at_log(LOGD, "\t<bootloader version>: %s\r\n", info->m_bootloaderVersion);
		powerwriter_at_log(LOGD, "\t<interface version>: %s\r\n", info->m_interfaceVersion);
	}
}

//Print PowerWriter configuration
void powerwriter_cfg_print(S_ATCmdRspWriterCfg * cfg) {
	if (cfg) {
		powerwriter_at_log(LOGD, ">print config\r\n");
		powerwriter_at_log(LOGD, "\tnames\r\n");
		powerwriter_at_log(LOGD, "\t<vendor>: %.16s\r\n", cfg->m_targetName.m_targetVendor);
		powerwriter_at_log(LOGD, "\t<series>: %.16s\r\n", cfg->m_targetName.m_targetSeries);
		powerwriter_at_log(LOGD, "\t<model>: %.16s\r\n", cfg->m_targetName.m_targetModel);

		powerwriter_at_log(LOGD, "\tbase config\r\n");
		powerwriter_at_log(LOGD, "\t<erase>: %d\r\n", cfg->m_baseCfg.m_eraseType);
		powerwriter_at_log(LOGD, "\t<vext>: %d\r\n", cfg->m_baseCfg.m_outputVEXTType);
		powerwriter_at_log(LOGD, "\t<clock>: %d\r\n", cfg->m_baseCfg.m_clockType);
		powerwriter_at_log(LOGD, "\t<buzzer>: %d\r\n", cfg->m_baseCfg.m_buzzerEnable);
		powerwriter_at_log(LOGD, "\t<option byte type>: %d\r\n", cfg->m_baseCfg.m_obUpdateType);

		powerwriter_at_log(LOGD, "\toffline config\r\n");
		powerwriter_at_log(LOGD, "\t<limit enable>: %d\r\n", cfg->m_offlineCfg.m_limitOfNumberEnable);
		powerwriter_at_log(LOGD, "\t<limit number>: %d\r\n", cfg->m_offlineCfg.m_limitOfNumber);
		powerwriter_at_log(LOGD, "\t<auto>: %d\r\n", cfg->m_offlineCfg.m_targetAutoEnable);
		powerwriter_at_log(LOGD, "\t<in debounce>: %d ms\r\n", cfg->m_offlineCfg.m_targetAutoInDebounce);
		powerwriter_at_log(LOGD, "\t<out debounce>: %d ms\r\n", cfg->m_offlineCfg.m_targetAutoOutDebounce);

		powerwriter_at_log(LOGD, "\toutput config\r\n");
		powerwriter_at_log(LOGD, "\t<disable power after programming>: %d\r\n", cfg->m_outputCtrlCfg.m_disablePowerAP);
		powerwriter_at_log(LOGD, "\t<run target after programming>: %d\r\n", cfg->m_outputCtrlCfg.m_runAP);
		powerwriter_at_log(LOGD, "\t<power on debounce>: %d\r\n", cfg->m_outputCtrlCfg.m_powerOnDebounce);
		powerwriter_at_log(LOGD, "\t<power off debounce>: %d\r\n", cfg->m_outputCtrlCfg.m_powerOffDebounce);
		powerwriter_at_log(LOGD, "\t<reset pin ctrl>: %d\r\n", cfg->m_outputCtrlCfg.m_resetType);
	}
}

//PowerWriter At interface benchmarking
bool powerwriter_at_benchmark(
	S_ATChannel  * channel,
	bool				   encrypt,
	ATCmdStreamOut  pfDataOut,
	ATCmdEventOut	 pfEvent
)
{
	/* Initial */
	if (!powerwriter_at_init(channel, encrypt, pfDataOut, pfEvent)) {
		powerwriter_at_log(LOGE, "powerwriter AT Init failed...\r\n");
		return false;
	}
	powerwriter_at_log(LOGE, "powerwriter AT Init passed ...\r\n");
	/* Get PowerWriter Info */
	S_ATCmdRspWriterInfo info;
	if(!powerwriter_at_get_writerinfo(channel, &info)){
		powerwriter_at_log(LOGE, "[%08X]:powerwriter AT get writer information failed...\r\n",
			powerwriter_at_last_error(channel));
		return false;
	}
	powerwriter_at_log(LOGD, "powerwriter AT get writer information passed ...\r\n");
	/* Print writer information */
	powerwriter_info_print(&info);

	/* Get PowerWriter Configuration */
	S_ATCmdRspWriterCfg cfg;
	if (!powerwriter_at_get_writerconfig(channel, &cfg)) {
		powerwriter_at_log(LOGE, "[%08X]:powerwriter AT get writer configuration failed...\r\n",
			powerwriter_at_last_error(channel));
		return false;
	}
	powerwriter_at_log(LOGD, "powerwriter AT get writer configuration passed ...\r\n");
	/* Print writer information */
	powerwriter_cfg_print(&cfg);

	/* Set writer config */
	/* can't change */
	strcpy(cfg.m_targetName.m_targetVendor, "vendor");
	strcpy(cfg.m_targetName.m_targetSeries, "Series");
	strcpy(cfg.m_targetName.m_targetModel, "model");
	cfg.m_offlineCfg.m_limitOfNumberEnable = true;
	cfg.m_offlineCfg.m_limitOfNumber = 100;
	/* can change */
	cfg.m_offlineCfg.m_targetAutoEnable = 1;
	//...

	if (!powerwriter_at_set_writerconfig(channel, &cfg)) {
		powerwriter_at_log(LOGE, "[%08X]:powerwriter AT set writer configuration failed...\r\n",
			powerwriter_at_last_error(channel));
		return false;
	}
	powerwriter_at_log(LOGD, "powerwriter AT set writer configuration passed ...\r\n");
	powerwriter_at_get_writerconfig(channel, &cfg);

	/* Set AT baud rate */
	if (!powerwriter_at_set_baudrate(channel, 115200)) {
		powerwriter_at_log(LOGE, "[%08X]:powerwriter AT set baudrate failed...\r\n",
			powerwriter_at_last_error(channel));
		return false;
	}
	powerwriter_at_log(LOGD, "powerwriter AT set baudrate passed ...\r\n");
	powerwriter_at_log(LOGD, "Note: you need to change the baud rate of the host UART port to the latest baud rate ...\r\n");

	//Target online bechmark
	powerwriter_at_log(LOGD, ">>>Target online bechmark ...\r\n");
	/* Init target connnect */
	if (!powerwriter_at_target_connect(channel)) {
		powerwriter_at_log(LOGE, "[%08X]:powerwriter initial connect target failed ...\r\n",
			powerwriter_at_last_error(channel));
		return false;
	}
	powerwriter_at_log(LOGD, "powerwriter initial connect target successfully ...\r\n");
	/* Get target status */
	uint32_t ts = GetSystemTick();
	uint32_t te = ts;
	powerwriter_at_log(LOGD, "Target connecting >");
	do {
		DelayMs(50);
		if (powerwriter_at_target_status(channel)) {
			powerwriter_at_log(LOGN, "powerwriter target connected...");
			break;
		}
		powerwriter_at_log(LOGN, ">>");
		te = GetSystemTick();
	} while (te - ts < 10000);
	powerwriter_at_log(LOGN, "\r\n");
	/* Get target id */
	S_ATCmdRspTargetChipID m_target_id;
	if (!powerwriter_at_target_id(channel,&m_target_id)) {
		powerwriter_at_log(LOGE, "[%08X]:powerwriter get target id failed ...\r\n",
		powerwriter_at_last_error(channel));
		return false;
	}
	object_print(m_target_id.m_CIDData, m_target_id.m_CIDSize, "Target chip id");
	powerwriter_at_log(LOGD, "powerwriter get target id successfully ...\r\n");

	/* Read Target memory */
	//example is G32F350xB ,128 KB Flash & 16K sram
	int i = 0;
	powerwriter_at_log(LOGD, "powerwriter read target memory starting ...\r\n");
	S_ChipMemoryCfg m_chip_memory[] = {
		{
			.m_s_addr = 0x20000000,
			.m_e_addr = 0x20004000,
			.m_name = "16K SRAM"
		},
		{
			.m_s_addr = 0x08000000,
			.m_e_addr = 0x08020000,
			.m_name = "128K Flash"
		},
	};
	S_ATCmdRspTargetMemory * mem = 0;
	for (i = 0; i < ARRAYSIZE(m_chip_memory); i++)
	{
		uint32_t addr = m_chip_memory[i].m_s_addr;
		do {
			if (!powerwriter_at_target_read(channel, addr, PW_PACKAGE_SIZE, &mem)) {
				powerwriter_at_log(LOGE, "[%08X]:powerwriter read target memory failed ...\r\n",
					powerwriter_at_last_error(channel));
				return false;
			}
			powerwriter_at_log(LOGD, "(%s)memmory addr: 0x%08X, memory size: %d\r\n", m_chip_memory[i].m_name,
				mem->m_address, mem->m_size);
			object_print(mem->m_buffer, mem->m_size, "data block:");
			addr += mem->m_size;
		} while (addr < m_chip_memory[i].m_e_addr);
	}
	powerwriter_at_log(LOGD, "powerwriter read target memory test passed ...\r\n");

	//erase test
	powerwriter_at_log(LOGD, "powerwriter erase target chip ...\r\n");
	if (!powerwriter_at_target_erase(channel, 10000)) { 
		powerwriter_at_log(LOGE, "[%08X]:powerwriter erase target chip failed ...\r\n",
			powerwriter_at_last_error(channel));
		return false; 
	}
	powerwriter_at_log(LOGD, "powerwriter erase target chip test passed ...\r\n");


	/* Result */
	return true;
}
