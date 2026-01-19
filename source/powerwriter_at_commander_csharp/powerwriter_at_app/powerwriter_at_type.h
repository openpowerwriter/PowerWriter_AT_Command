/**
 * @file    powerwriter_at_type.h
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

#ifndef __powerwriter_at_type_h
#define __powerwriter_at_type_h

#include <stdint.h>
#include <stdbool.h>
#include "powerwriter_at_error.h"
#include "powerwriter_at_config.h"

#ifdef __cplusplus
extern "C"
{
#endif

	// PowerWriter AT command type
	typedef enum E_ATCmdType
	{
		// Null command for reserved
		ATCmdNull = 0,

		// Query and configuration
		ATCmdGetWriterInfo = 1, // Get writer information
		ATCmdRspWriterInfo,		// Response writer information

		ATCmdGetWriterCfg, // Get writer configuration
		ATCmdRspWriterCfg, // Response writer configuration
		ATCmdSetWriterCfg, // Update writer configuration
		ATCmdSetBaudRate,  // Set AT hardware commander baudRate

		// Online mode target chip operation
		ATCmdConnectTarget = 100, // Connect target chip (manual operation)
		ATCmdGetTargetStatus,	  // Get target chip status

		ATCmdGetTargetChipID, // Get target chip id
		ATCmdRspTargetChipID, // Response target chip id

		ATCmdReadTargetMemory, // Read target memory
		ATCmdRspTargetMemory,  // Response target memory content

		ATCmdEraseTarget,		 // Erase target chip (full)
		ATCmdEraseTargetSectors, // Erase target sectors

		ATCmdWriteTargetMemoryPrepare, // Prepare to Write target memory, ( Note:
									   // Reports the total length of data that needs to be written)
									   // Double buffering to improve write speed

		ATCmdWriteTargetMemory, // Write target memory

		ATCmdReadTargetOptionByte,		  // Read target option byte
		ATCmdRspTargetOptionByte,		  // Response target option byte
		ATCmdWriteTargetVendorOptionByte, // Write vendor's default option byte to target
		ATCmdWriteTargetUserOptionByte,	  // Write user's option byte to target

		ATCmdTargetReset, // AT Reset target

		// Offline mode target chip operation
		ATCmdGetProjectInfo = 200, // Get project info from PowerWriter
		ATCmdRspProjectInfo,

		ATCmdLoadProject,	  // Load project to PowerWriter
		ATCmdLoadProjectSend, // Load project to PowerWriter send package
		ATCmdDisableProject,  // Delete project from PowerWriter (Mark as invalid)

		ATCmdStartOffline,	   // Start offline programming
		ATCmdGetOfflineStatus, // Get offline programming status

		ATCmdSwitchOfflineProject, // Switch offline project
								   // Benchmark instruction
		ATCmdFactoryRunSRAMFW = 300, // Load & run factory SRAM firmware
		ATCmdFactoryRunFlashFW,		 // Load & run factory Flash firmware

		// Other command fields
		ATCmdBroadcast = 400, // Broadcast data
							  //...
		ATCmdSleep = 500,	  // Sleep

		// State instruction
		ATCmdStatusOK = (PW_ENUM_MAX - 100), // Status Ok
		ATCmdStatusError,					 // Status error with error code
		ATCmdStatusProgress,				 // Status busy (progress)

		// Align to 4 bytes, compiler independent
		_ATCmdTypeMax = PW_ENUM_MAX
	} E_ATCmdType;

	/* command payload */
#pragma pack(push, 1)
	// No arguments command standard structure
	typedef struct S_ATCmdDefault
	{
		union powerwriter_at_type
		{
			uint32_t m_placeholder; // An placeholder for empty structure
			uint32_t m_baudRate;	// Set UART AT new baudRate;
			uint32_t m_errorCode;	// Status error code
			uint32_t m_totalsize;	// total size
			uint32_t m_resetType;	// Reset type
		} property;
	} S_ATCmdGetWriterInfo,
		S_ATCmdGetWriterCfg,
		S_ATCmdStatusOK,
		S_ATCmdStatusError,
		S_ATCmdConnectTarget,
		S_ATCmdGetTargetStatus,
		S_ATCmdSetBaudRate,
		S_ATCmdGetTargetChipID,
		S_ATCmdEraseTarget,
		S_ATCmdWriteTargetMemoryPrepare,
		S_ATCmdReadTargetOptionByte,
		S_ATCmdWriteTargetVendorOptionByte,
		S_ATCmdGetProjectInfo,
		S_ATCmdWriteTargetUserOptionByte,
		S_ATCmdDisableProject,
		S_ATCmdStartOffline,
		S_ATCmdGetOfflineStatus,
		S_ATCmdFactoryRunSRAMFW,
		S_ATCmdFactoryRunFlashFW,
		S_ATCmdTargetReset;

	// ATCmdStatusProgress
	typedef struct S_ATCmdStatusProgress
	{
		uint32_t m_total;	  // Total size
		uint32_t m_processed; // Processed size
	} S_ATCmdStatusProgress;

	// AT Cmd Status
	typedef enum E_ATStatus
	{
		ATStatusUnknown = 0,
		ATStatusOk = 0,
		ATStatusProgress,
		ATStatusError,
		_ATStatusMax = PW_ENUM_MAX
	} E_ATStatus;
	typedef struct S_ATCmdStatus
	{
		E_ATStatus m_statusType;
		union
		{
			S_ATCmdStatusProgress m_progress;
		} param;
	} S_ATCmdStatus;

	// ATCmdRspWriterInfo
	typedef struct S_ATCmdRspWriterInfo
	{
		uint8_t m_oem[PW_OEM_LENGTH]; // PowerWriter oem, such as PW200,PW300 etc...
		uint8_t m_sn[PW_SN_LENGTH];	  // PowerWriter sn, formatted as "XXX..."

		uint8_t m_hardwareVersion[PW_VERSION_LENGTH];	// PowerWriter hardware version, formatted as "x.xx.xx"
		uint8_t m_bootloaderVersion[PW_VERSION_LENGTH]; // PowerWriter bootloader(hal driver) version, formatted as "x.xx.xx"
		uint8_t m_interfaceVersion[PW_VERSION_LENGTH];	// PowerWriter interface(application) version, formatted as "x.xx.xx"
	} S_ATCmdRspWriterInfo;

	// ATCmdRspWriterCfg,
	// Target names
	typedef struct S_TargetName
	{
		uint8_t m_targetVendor[PW_TARGET_NAME_MAX]; // target chip vendor,such as 'nations' (notice: You can only view, but cannot change !!!)
		uint8_t m_targetSeries[PW_TARGET_NAME_MAX]; // target chip series,such as 'N32G020' (notice: You can only view, but cannot change !!!)
		uint8_t m_targetModel[PW_TARGET_NAME_MAX];	// target chip model,such as 'N32G020G5' (notice: You can only view, but cannot change !!!)
	} S_TargetName;

	// Base setting
	typedef struct S_BaseWriterCfg
	{
		uint8_t m_eraseType;	  // Erase type: 0(no erase),1(chip erase),2(sector erase)
		uint8_t m_outputVEXTType; // Output VDD: 0(1.8V),1(3.3V),2(5.0V),3(refer to external power supply)
		uint8_t m_clockType;	  // Clock: 0(20Mhz fast mode),1(10Mhz default),2(5Mhz),3(2Mhz),4(1Mhz), etc ...
		uint8_t m_buzzerEnable;	  // 0: disable 1: enable
		uint8_t m_obUpdateType;	  // 0: No operation before programming, no operation after programming
								  // 1: No operation is performed before programming, and user - defined OptionByte is written after flash programming
								  // 2: Restore default values is performed before programming, no operation after programming.
								  // 3: Restore default values is performed before programming, and user - defined OptionByte is written after flash programming

	} S_BaseWriterCfg;
	// Offline configure
	typedef struct S_OfflineWriterCfg
	{
		uint8_t m_limitOfNumberEnable;	  // 0 : disable 1: enable    (notice: You can only view, but cannot change !!!)
		uint32_t m_limitOfNumber;		  // Current remaining quantity (notice: You can only view, but cannot change !!!)
		uint8_t m_targetAutoEnable;		  // 0: disable 1:enable
		uint16_t m_targetAutoInDebounce;  // Target connected debounce time
		uint16_t m_targetAutoOutDebounce; // Target disconnected debounce time
	} S_OfflineWriterCfg;
	// Output Ctrl configure
	typedef struct S_OutputCtrlWriterCfg
	{
		uint8_t m_disablePowerAP;	 // 0 : disable 1:enable (Power off when programming is complete)
		uint8_t m_runAP;			 // 0 : disable 1:enable (Run when programming is complete)
		uint16_t m_powerOnDebounce;	 // Debounce the output power supply (ms)
		uint16_t m_powerOffDebounce; // Debounce the output power off (ms)
		uint8_t m_resetType;		 // 0 : Keep low
									 // 1 : Off, high resistance
									 // 2 : Reset output then to off
	} S_OutputCtrlWriterCfg;

	// Writer configure for current project
	typedef struct S_ATCmdWriterCfg
	{
		S_TargetName m_targetName;			   // Target names
		S_BaseWriterCfg m_baseCfg;			   // Base config
		S_OfflineWriterCfg m_offlineCfg;	   // Offline configure
		S_OutputCtrlWriterCfg m_outputCtrlCfg; // Output control configure
	} S_ATCmdRspWriterCfg, S_ATCmdSetWriterCfg;

	// Target chip id response
	typedef struct S_ATCmdRspTargetChipID
	{
		uint8_t m_CIDSize;					 // Target chip ID size
		uint8_t m_CIDData[PW_TARGET_ID_MAX]; // Target chip ID data
	} S_ATCmdRspTargetChipID;

	// Read target chip memory
	// Erase target chip
	typedef struct S_ATCmdReadTargetMemory
	{
		uint32_t m_address; // Target chip address, support such as SRAM、Flash、EEPROM、OTP etc...
		uint32_t m_size;	// Data size of a single read (Must be less than 256)
	} S_ATCmdReadTargetMemory,
		S_ATCmdEraseTargetSectors;

	// Response target chip memory
	// Write target chip memory
	typedef struct S_ATCmdTargetMemory
	{
		uint32_t m_address;				   // Current data address
		uint32_t m_size;				   // Current data size
		uint8_t m_buffer[PW_PACKAGE_SIZE]; // Current data buffer (fixed length)
	} S_ATCmdRspTargetMemory,
		S_ATCmdWriteTargetMemory;

	// Response target chip option byte
	typedef struct S_ATCmdRspTargetOptionByte
	{
		uint32_t m_OBsize;			 // Option byte size
		uint8_t m_OBData[PW_OB_MAX]; // Option byte data buffer
	} S_ATCmdRspTargetOptionByte;

	// Reset Target type
	typedef enum E_resetType
	{
		HWKeepLow,	   // Hardware Keeplow
		HWNoneReset,   // Hardware high resistance state
		HWReset,	   // Hardware reset
		HWCoreReset,   // Hardware & core reset
		CoreReset,	   // Soft Core Reset
		VectorReset,   // Soft Vector Reset
		POROnly,	   // Power On Reset
		PORAndRelease, // Power On Reset and release port

		_TARGET_RESET_ = PW_ENUM_MAX
	} E_resetType;

	// Response offline project information
	typedef struct S_ATCmdRspProjectInfo
	{
		uint8_t m_activate;		 // 0 : Inactivate 1: Activate
		uint32_t m_projectSize;	 // Offline project size
		uint32_t m_projectCrc32; // Offline project crc32
	} S_ATCmdRspProjectInfo;

	// Load offline project to PowerWriter
	typedef struct S_ATCmdLoadProject
	{
		uint8_t m_password[PW_PROJECT_PWD_SIZE]; // Project password
		uint32_t m_projectSize;					 // Project Size
		uint32_t m_projectCRC32;				 // Project crc32
		char m_name[PW_MAX_FILE_NAME];			 // Project name
	} S_ATCmdLoadProject;

	// Load offline project to PowerWriter send
	typedef struct S_ATCmdLoadProjectSend
	{
		uint32_t m_offset;				 // offset of project
		uint32_t m_Size;				 // current activated size
		uint8_t m_data[PW_PACKAGE_SIZE]; // data buffer
	} S_ATCmdLoadProjectSend;

	// Mode when switching projects
	typedef enum S_SwitchPrjReloadType
	{
		SWITCH_PROJECT_TYPE_RESUME = 0, /* Resume previous project progress */
		SWITCH_PROJECT_TYPE_RELOAD,		/* Reload project */

		SWITCH_PROJECT_TYPE_MAX = PW_ENUM_MAX
	} S_SwitchPrjReloadType;

	typedef struct S_ATCmdSwitchOfflineProject
	{
		S_SwitchPrjReloadType m_reloadType;		 // Reload type
		uint8_t m_password[PW_PROJECT_PWD_SIZE]; // Project password
		char m_name[PW_MAX_FILE_NAME];			 // Project name
	} S_ATCmdSwitchOfflineProject;

	// Broadcast
	typedef enum S_ATCmdBroadcastDir
	{
		DIR_CDC2UART, // Forwarding from USB to UART
		DIR_UART2CDC, // Forwarding from UART to USB

		_DIR_MAX_ = PW_ENUM_MAX
	} S_ATCmdBroadcastDir;

	typedef struct S_ATCmdBroadcast
	{
		uint8_t m_keepATFrame;			 // 0 : Forwarding valid data, 1: forwarding Full AT frame data
		S_ATCmdBroadcastDir m_dirType;	 // Direction
		uint32_t m_size;				 // Activate size
		uint8_t m_data[PW_PACKAGE_SIZE]; // data
	} S_ATCmdBroadcast;

	typedef struct S_ChipMemoryCfg
	{
		uint32_t m_s_addr;
		uint32_t m_e_addr;
		char *m_name;
	} S_ChipMemoryCfg;

#pragma pack(pop)

	// PowerWriter AT command property (union)
	typedef union U_ATCmdProperty
	{
		S_ATCmdGetWriterInfo m_ATCmdGetWriterInfo;
		S_ATCmdRspWriterInfo m_ATCmdRspWriterInfo;

		S_ATCmdGetWriterCfg m_ATCmdGetWriterCfg;
		S_ATCmdRspWriterCfg m_ATCmdRspWriterCfg;
		S_ATCmdSetWriterCfg m_ATCmdSetWriterCfg;
		S_ATCmdSetBaudRate m_ATCmdSetBaudRate;

		S_ATCmdConnectTarget m_ATCmdConnectTarget;
		S_ATCmdGetTargetStatus m_ATCmdGetTargetStatus;
		S_ATCmdGetTargetChipID m_ATCmdGetTargetChipID;
		S_ATCmdRspTargetChipID m_ATCmdRspTargetChipID;
		S_ATCmdReadTargetMemory m_ATCmdReadTargetMemory;
		S_ATCmdRspTargetMemory m_ATCmdRspTargetMemory;
		S_ATCmdEraseTarget m_ATCmdEraseTarget;
		S_ATCmdEraseTargetSectors m_ATCmdEraseTargetSectors;
		S_ATCmdWriteTargetMemoryPrepare m_ATCmdWriteTargetMemoryPrepare;
		S_ATCmdWriteTargetMemory m_ATCmdWriteTargetMemory;
		S_ATCmdReadTargetOptionByte m_ATCmdReadTargetOptionByte;
		S_ATCmdRspTargetOptionByte m_ATCmdRspTargetOptionByte;
		S_ATCmdWriteTargetVendorOptionByte m_ATCmdWriteTargetVendorOptionByte;
		S_ATCmdWriteTargetUserOptionByte m_ATCmdWriteTargetUserOptionByte;
		S_ATCmdTargetReset m_ATCmdTargetReset;

		S_ATCmdGetProjectInfo m_ATCmdGetProjectInfo;
		S_ATCmdRspProjectInfo m_ATCmdRspProjectInfo;
		S_ATCmdLoadProject m_ATCmdLoadProject;
		S_ATCmdLoadProjectSend m_ATCmdLoadProjectSend;
		S_ATCmdSwitchOfflineProject m_ATCmdSwitchOfflineProject;
		S_ATCmdDisableProject m_ATCmdDisableProject;
		S_ATCmdStartOffline m_ATCmdStartOffline;
		S_ATCmdGetOfflineStatus m_ATCmdGetOfflineStatus;

		S_ATCmdFactoryRunSRAMFW m_ATCmdFactoryRunSRAMFW;
		S_ATCmdFactoryRunFlashFW m_ATCmdFactoryRunFlashFW;

		S_ATCmdBroadcast m_ATCmdBroadcast;

		S_ATCmdStatusOK m_ATCmdStatusOk;
		S_ATCmdStatusError m_ATCmdStatusError;
		S_ATCmdStatusProgress m_ATCmdStatusProgress;
	} U_ATCmdProperty;

	// PowerWriter AT command payload
	typedef struct S_ATCmdPayload
	{
		E_ATCmdType m_cmdType;							// Type
		uint32_t m_cmdSize;								// Size
		U_ATCmdProperty m_cmdProperty;					// Payload
		uint8_t _m_align[POWERWRITER_AT_PACKAGE_ALIGN]; // align for encrypt
	} S_ATCmdPayload;

	// PowerWriter AT Command Frame
	typedef struct S_ATCmdFrame
	{
		uint8_t m_frameHeader[PW_AT_FRAME_HDR_SIZE]; // Frame header
		uint32_t m_frameLength;						 // Frame length
		S_ATCmdPayload m_payload;					 // Frame payload
		uint32_t m_crc32;							 // Frame Crc32
	} S_ATCmdFrame;

	// PowerWriter AT command buffer
	typedef struct S_ATCmdBuffer
	{
		uint32_t m_index;											   // current buffer
		uint8_t m_buffer[sizeof(S_ATCmdFrame) * PW_AT_CACHE_CMDS_MIN]; // cache buffer
	} S_ATCmdBuffer;

	// PowerWriter AT command event
	typedef enum S_ATCmdEvent
	{
		ATEventNone = 0, /* No event */
		ATEventCmd,		 /* Command event */
		ATEventError,	 /* Error event */
		_MaxATEvent = PW_ENUM_MAX
	} S_ATCmdEvent;

	// PowerWriter AT command config
	typedef void (*ATCmdEventOut)(void *obj, S_ATCmdEvent event);
	typedef bool (*ATCmdStreamOut)(S_ATCmdFrame *pf, int timeout);
	typedef void (*ATProgress)(S_ATCmdStatusProgress *pp);

	typedef struct S_ATCmdConfig
	{
		bool m_encryptEnable;		/* encrypt ? */
		ATCmdStreamOut m_streamOut; /* Stream out */
		ATCmdEventOut m_eventOut;	/* Event out */
		/* Status */
		S_ATCmdEvent m_lastEvent; /* Last event */
		E_ATCmdError m_lastError; /* Last error */
								  /* multithreading */
								  // MACRO_THREAD_TYPE  m_thread_lock;    /* multithreading lock */
	} S_ATCmdConfig;

	// Complete configuration of a single AT command channel
	typedef struct S_ATChannel
	{
		/* Cache RX buffer */
		volatile S_ATCmdBuffer m_rxBuffer;

		/*PowerWriter AT command config */
		S_ATCmdConfig m_config;

		/* Stores the current input/output commands */
		S_ATCmdFrame m_cmdInput;  // AT command Input
		S_ATCmdFrame m_cmdOutput; // AT command Output
	} S_ATChannel;

#ifdef __cplusplus
}
#endif

#endif
