/**
 * @file    powerwriter_at_type.h
 * @brief   PowerWriter open communication interface
 *
 * PowerWriter AT
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

#ifndef __powerwriter_at_type_h
#define __powerwriter_at_type_h

#include <stdint.h>
#include "powerwriter_at_config.h"

// PowerWriter open communication interface types
#define PW_OEM_LENGTH 8       // PowerWriter OEM length
#define PW_SN_LENGTH 32       // PowerWriter SN length
#define PW_VERSION_LENGTH 8   // PowerWriter version information length
#define PW_TARGET_NAME_MAX 16 // PowerWriter target name max length
#define PW_TARGET_ID_MAX 16   // Target chip ID MAX size
#define PW_PACKAGE_SIZE 256     // Buffer size of block data
#define PW_OB_MAX 1024        // Target chip option byte MAX size;
#define PW_PROJECT_PWD_SIZE		// PowerWriter project password max size 

#ifdef __cplusplus
extern "C"
{
#endif

    // PowerWriter AT command type
    typedef enum E_ATcmdType
    {
        // Null command for reserved
        ATCmdNull = 0,

        // Query and configuration
        ATCmdGetWriterInfo = 1, // Get writer information
        ATCmdRspWriterInfo,     // Respone writer information

        ATCmdGetWriterCfg, // Get writer configuration
        ATCmdRspWriterCfg, // Respone writer configuration
        ATCmdSetWriterCfg, // Update writer confuguration
        ATCmdSetBaudrate,  // Set AT hardware commander baudrate

        // Online mode target chip operation
        ATCmdConnectTarget = 100, // Connnect target chip (manual operation)
        ATCmdGetTargetStatus,     // Get target chip status

        ATCmdGetTargetChipID, // Get target chip id
        ATCmdRspTargetChipID, // Respone target chip id

        ATCmdReadTargetMemory, // Read target memory
        ATCmdRspTargetMemory,  // Respone target memory content

        ATCmdEraseTarget,        // Erase target chip (full)
        ATCmdEraseTargetSectors, // Erase target sectors

        ATCmdWriteTargetMemory, // Write target memory

        ATCmdReadTargetOptionByte,        // Read target option byte
        ATCmdRspTargetOptionByte,         // Respone target option byte
        ATCmdWriteTargetVendorOptionByte, // Write vendor's default option byte to target
        ATCmdWriteTargetUserOptionByte,   // Write user's option byte to target

        // Offline mode target chip operation
        ATCmdGetProjectInfo = 200, // Get project info from PowerWriter
        ATCmdRspProjectInfo,

        ATCmdLoadProject,   // Load project to PowerWriter
		ATCmdLoadProjectSend,	//Load project to PowerWriter send package
        ATCmdDisableProject, // Delete project from PowerWriter (Mark as invalid)

        ATCmdStartOffline,     // Start offline programming
        ATCmdGetOfflineStatus, // Get offline programming status

        // Benchmark instruction
        ATCmdFactoryRunSRAMFW = 300, // Load & run factory SRAM firmware
        ATCmdFactoryRunFlashFW,      // Load & run factory Flash firmware

        // Other command fields
        ATCmdBroadcast = 400, // Broadcast data
                              //...

        // State instruction
        ATCmdStatusOK = (UINT32_MAX - 100), // Status Ok
        ATCmdStatusError,                   // Status error with error code
        ATCmdStatusProgress,                // Status busy (progress)

        // Align to 4 bytes, compiler independent
        _ATCmdTypeMax = UINT32_MAX
    } E_ATcmdType;

	

/* command payload */
#pragma pack(push, 1)
    // No arguments command standard structure
    typedef struct S_ATCmdObject
    {
        union powerwriter_at_type
        {
            uint32_t m_placeholder; // An placeholder for empty structure
            uint32_t m_baudrate;    // Set UART AT new baudrate;
            uint32_t m_errorcode;   // Status error code
        } property;
    } S_ATCmdGetWriterInfo,
        S_ATCmdGetWriterCfg,
        S_ATCmdStatusOK,
        S_ATCmdStatusError,
        S_ATCmdConnectTarget,
        S_ATCmdGetTargetStatus,
        S_ATCmdSetBaudrate,
        S_ATCmdGetTargetChipID,
        S_ATCmdEraseTarget,
        S_ATCmdReadTargetOptionByte,
        S_ATCmdWriteTargetVendorOptionByte,
		S_ATCmdGetProjectInfo,
        S_ATCmdWriteTargetUserOptionByte,
		S_ATCmdDisableProject,
		S_ATCmdStartOffline,
		S_ATCmdGetOfflineStatus,
		S_ATCmdFactoryRunSRAMFW,
		S_ATCmdFactoryRunFlashFW;

    // ATCmdStatusProgress
    typedef struct S_ATCmdStatusProgress
    {
        uint32_t m_total;     // Total size
        uint32_t m_processed; // Processed size
    } S_ATCmdStatusProgress;

    // ATCmdRspWriterInfo
    typedef struct S_ATCmdRspWriterInfo
    {
        uint8_t m_oem[PW_OEM_LENGTH]; // PowerWriter oem, such as PW200,PW300,PWLINK etc...
        uint8_t m_sn[PW_SN_LENGTH];   // PowerWriter sn, formated as "xxxxxxxxxxxx..."

        uint8_t m_hardwareVersion[PW_VERSION_LENGTH];   // PowerWriter hardware version, formated as "x.xx.xx"
        uint8_t m_bootloaderVersion[PW_VERSION_LENGTH]; // PowerWriter bootloader(hal driver) version, formated as "x.xx.xx"
        uint8_t m_interfaceVersion[PW_VERSION_LENGTH];  // PowerWriter interface(application) version, formated as "x.xx.xx"
    } S_ATCmdRspWriterInfo;

    // ATCmdRspWriterCfg,
    // Target names
    typedef struct S_TargetName
    {
        uint8_t m_targetVendor[PW_TARGET_NAME_MAX]; // target chip vendor,such as 'nations' (notice: You can only view, but cannot change !!!)
        uint8_t m_targetSeries[PW_TARGET_NAME_MAX]; // target chip series,such as 'N32G020' (notice: You can only view, but cannot change !!!)
        uint8_t m_targetModel[PW_TARGET_NAME_MAX];  // target chip model,such as 'N32G020G5' (notice: You can only view, but cannot change !!!)
    } S_TargetName;

    // Base setting
    typedef struct S_BaseWriterCfg
    {
        uint8_t m_eraseType;      // Erase type: 0(no erase),1(chip erase),2(sector erase)
        uint8_t m_outputVextType; // Output VEXT: 0(1.8V),1(3.3V),2(5.0V),3(refer to external power supply)
        uint8_t m_clockType;      // Colok: 0(20Mhz fast mode),1(10Mhz default),2(5Mhz),3(2Mhz),4(1Mhz), etc ...
        uint8_t m_buzzerEnable;   // 0: disable 1: enable
        uint8_t m_obUpdateType;   // 0: No operation before programming, no operation after programming
                                  // 1: No operation is performed before programming, and user - defined OptionByte is written after flash programming
                                  // 2: Restore default values is performed before programming, no operation after programming.
                                  // 3: Restore default values is performed before programming, and user - defined OptionByte is written after flash programming

    } S_BaseWriterCfg;
    // Offline configure
    typedef struct S_OfflineWriterCfg
    {
        uint8_t m_limitOfNumberEnable;  // 0 : disable 1: enable    (notice: You can only view, but cannot change !!!)
        uint32_t m_limitOfNumber;       // Current remaining quantity (notice: You can only view, but cannot change !!!)
        uint8_t m_targetAutoEnable;     // 0: disable 1:enable
        uint16_t m_targetAutoInDebonce; // Target connected debonce time
        uint16_t m_chipAutoChkOut;      // Target disconnected debonce time
    } S_OfflineWriterCfg;
    // Output Ctrl configure
    typedef struct S_OutputCtrlWriterCfg
    {
        uint8_t m_disablePowerAP;    // 0 : disable 1:enable (Power off when programming is complete)
        uint8_t m_runAP;             // 0 : disbale 1:enable (Run when programming is complete)
        uint16_t m_poweronDebonce;   // Debonce the output power supply (ms)
        uint16_t m_powerdownDebonce; // Debonce the output power off (ms)
        uint8_t m_resetType;         // 0 : Keep low
                                     // 1 : Off, high resistance
                                     // 2 : Reset output then to off
    } S_OutputCtrlWriterCfg;

    // Writer configure for currrent project
    typedef struct S_ATCmdWriterCfg
    {
        S_TargetName m_targetName;             // Target names
        S_BaseWriterCfg m_baseCfg;             // Base config
        S_OfflineWriterCfg m_offlineCfg;       // Offline configure
        S_OutputCtrlWriterCfg m_outputCtrlCfg; // Output control configure
    } S_ATCmdRspWriterCfg, S_ATCmdSetWriterCfg;

    // Target chip id respone
    typedef struct S_ATCmdRspTargetChipID
    {
        uint8_t m_CIDSize;                   // Target chip ID size
        uint8_t m_CIDData[PW_TARGET_ID_MAX]; // Target chip ID data
    } S_ATCmdRspTargetChipID;

    // Read target chip memory
    // Erase target chip
    typedef struct S_ATCmdReadTargetMemory
    {
        uint32_t m_address; // Target chip address, support such as SRAM、Flash、EEPROM、OTP etc...
        uint32_t m_size;    // Data size of a single read (Must be less than 256)
    } S_ATCmdReadTargetMemory,
        S_ATCmdEraseTargetSectors;

    // Respone target chip memory
    // Write target chip memory
    typedef struct S_ATCmdTargetMemory
    {
        uint32_t m_address;              // Current data address
        uint32_t m_size;                 // Current data size
        uint8_t m_buffer[PW_PACKAGE_SIZE]; // Current data buffer (fixed length)
    } S_ATCmdRspTargetMemory,
        S_ATCmdWriteTargetMemory;

    // Respone target chip option byte
    typedef struct S_ATCmdRspTargetOptionByte
    {
        uint32_t m_OBsize;           // Option byte size
        uint8_t m_OBData[PW_OB_MAX]; // Option byte data buffer
    } S_ATCmdRspTargetOptionByte;

	// Respone offline project infomation
	typedef struct S_ATCmdRspProjectInfo{
		uint8_t		m_activate;			// 0 : Inactivate 1: Activate
		uint32_t	m_projectSize;		// Offline project size
		uint32_t	m_projectcrc32;		// Offline project crc32
	}S_ATCmdRspProjectInfo;
	
	//Load offline project to PowerWriter
	typedef struct S_ATCmdLoadProject
	{
		uint8_t			m_password[PW_PROJECT_PWD_SIZE]		//Project password 
		uint32_t		m_projectSize;						//Project Size
		uint32_t		m_projectCRC32;						//Project crc32
	}S_ATCmdLoadProject;
	
	//Load offline project to PowerWriter send
	typedef struct S_ATCmdLoadProjectSend
	{
		uint32_t		m_offset;							//offset of project
		uint32_t		m_Size;								//currrent acitvate 
		uint8_t			m_data[PW_PACKAGE_SIZE];			//data buffer
	}S_ATCmdLoadProjectSend;
	
	//Broadcast
	typedef enum S_ATCmdBroadcastDirection{
		DIR_CDC2UART,										//Forwarding from USB to UART
		DIR_UART2CDC,										//Forwarding from UART to USB
		
		_DIR_MAX_ = UINT32_MAX
	}S_ATCmdBroadcastDirection;
	
	typedef struct S_ATCmdBroadcast
	{
		uint8_t					m_keepATFrame;				//0 : Forwarding valid data, 1: forwarding Full AT frame data
		S_ATCmdBroadcastDirection	m_dirType;				//Direction
		uint32_t				m_size;						//Activate size
		uint8_t					m_data[PW_PACKAGE_SIZE]		//data
	}S_ATCmdBroadcast;
	
#pragma pack(pop)

    // PowerWriter AT command proprety (union)
    typedef union U_ATCmdProprety
    {
        S_ATCmdGetWriterInfo m_ATCmdGetWriterInfo;
        S_ATCmdRspWriterInfo m_ATCmdRspWriterInfo;

        S_ATCmdGetWriterCfg m_ATCmdGetWriterCfg;
        S_ATCmdRspWriterCfg m_ATCmdRspWriterCfg;
        S_ATCmdSetWriterCfg m_ATCmdSetWriterCfg;
        S_ATCmdSetBaudrate m_ATCmdSetBaudrate;

        S_ATCmdConnectTarget m_ATCmdConnectTarget;
        S_ATCmdGetTargetStatus m_ATCmdGetTargetStatus;
        S_ATCmdGetTargetChipID m_ATCmdGetTargetChipID;
        S_ATCmdRspTargetChipID m_ATCmdRspTargetChipID;
        S_ATCmdReadTargetMemory m_ATCmdReadTargetMemory;
        S_ATCmdRspTargetMemory m_ATCmdRspTargetMemory;
        S_ATCmdEraseTarget m_ATCmdEraseTarget;
        S_ATCmdEraseTargetSectors m_ATCmdEraseTargetSectors;
        S_ATCmdWriteTargetMemory m_ATCmdWriteTargetMemory;
        S_ATCmdReadTargetOptionByte m_ATCmdReadTargetOptionByte;
        S_ATCmdRspTargetOptionByte m_ATCmdRspTargetOptionByte;
        S_ATCmdWriteTargetVendorOptionByte m_ATCmdWriteTargetVendorOptionByte;
        S_ATCmdWriteTargetUserOptionByte m_ATCmdWriteTargetUserOptionByte;
		
		S_ATCmdGetProjectInfo	m_ATCmdGetProjectInfo;
		S_ATCmdRspProjectInfo	m_ATCmdRspProjectInfo;
		S_ATCmdLoadProject		m_ATCmdLoadProject;
		S_ATCmdLoadProjectSend	m_ATCmdLoadProjectSend;
		S_ATCmdDisableProject	m_ATCmdDisableProject;
		S_ATCmdStartOffline		m_ATCmdStartOffline;
		S_ATCmdGetOfflineStatus	m_ATCmdGetOfflineStatus;
		
		
		S_ATCmdFactoryRunSRAMFW		m_ATCmdFactoryRunSRAMFW;
		S_ATCmdFactoryRunFlashFW	m_ATCmdFactoryRunSRAMFW;
		
		S_ATCmdBroadcast	m_ATCmdBroadcast;

        S_ATCmdStatusOK m_ATCmdStatusOk;
        S_ATCmdStatusError m_ATCmdStatusError;
        S_ATCmdStatusProgress m_ATCmdStatusProgress;
    } U_ATCmdProprety;

    // PowerWriter AT command payload
    typedef struct S_ATCmdObject
    {
        E_ATcmdType m_cmdType;           // Type
        uint32_t m_cmdSize;              // Size
        U_ATCmdProprety *m_cmdPropretyp; // Payload
    } S_ATCmdObject;

#ifdef __cplusplus
}
#endif

#endif
