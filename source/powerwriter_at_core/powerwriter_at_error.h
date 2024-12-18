/**
 * @file    powerwriter_at_error.h
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

#ifndef __powerwriter_error_h
#define __powerwriter_error_h

#include <limits.h>
#include "powerwriter_at_config.h"

#ifdef __cplusplus
extern "C"
{
#endif
	/* Error code */
	typedef enum E_ATCmdError
	{
		ATErrorNone = 0, // None error ...
		ATErrorCRC,		 // Data(package) crc is incorrect...
		ATErrorType,	 // Product type does not match...
		ATErrorBusy,	 // Is busy ...
		ATErrorUsed,	 // Is in use...
		_ATErrorPrivate_HD,
		ATErrorWriterConfig, // Configuration error...
		_ATErrorPrivate_ALG,

		ATErrorTargetOB,	  // Target option byte configuration error...
		ATErrorTargetConnect, // Target not connected...
		ATErrorTargetErase,	  // Target erase failed...
		ATErrorTargetWrite,	  // Target write data failed...
		ATErrorTargetRead,	  // Target read data failed...

		ATErrorTimeout,		   // Time out ...
		ATErrorExtFlashInit,   // The extends flash initial failed...
		ATErrorExtFlashErase,  // The extends flash erase failed...
		ATErrorExtFlashWrite,  // The extends flash write failed...
		ATErrorExtFlashVerify, // The extends flash verify failed...
		ATErrorExtFlashRead,   // The extends flash read failed...

		ATErrorPacketSize, // The package size error...
		ATErrorChipType,   // Target chip type error...
		ATErrorReadChipID, // Target read unique id failed...
		ATErrorUpdate,	   // The writer update firmware failed...
		ATErrorRDP,		   // Target chip protection is enabled...

		ATErrorWFlashData, // Target write flash failed...
		ATErrorWriteOB,	   // Target write option byte failed...
		ATErrorWriteSN,	   // The writer SN error or don't match...
		ATErrorWriteUID,   // Target write matrix license failed...
		ATErrorWriteUKEY,  // Target write Ikey license failed...

		ATErrorGetUID,	// The project matrix license version error...
		ATErrorGetUKEY, // The Ikey failed to request a signature...

		ATErrorWriteTimes,	   // The project of offline times has used up...
		ATErrorOfflineVer,	   // The project of version error...
		ATErrorOfflineOem,	   // The project of oem error...
		ATErrorOfflineMagic,   // The project of magic tag error...
		ATErrorOfflineData,	   // The project of data corruption...
		ATErrorOfflineDisable, // The project disabled...

		ATErrorSize,		   // The package size error...
		ATErrorPort,		   // The communication port error...
		ATErrorPacket,		   // The communication package error...
		ATErrorNeedDisconnect, // The writer needs to be disconnected from the online connection....
		ATErrorComSend,		   // The communication port send package error...
		ATErrorComRec,		   // The communication port waiting response time out...
		ATErrorCmd,			   // The command is unsupported ...
		ATErrorNullValue,	   // The config is(has) null value ...
		ATErrorAlgo,		   // Target flash algorithm config error...
		ATErrorKey,			   // The Incorrect authentication password...
		ATErrorRunEnv,		   // Disconnect the device and power it on again to complete the upgrade...

		ATErrorICWKeyConnect,  // IKey device not connect...
		ATErrorVoltageOutput,  // The voltage error (abnormal power supply)...
		ATWarnDebuggerConnect, // The debugger is connected...
		ATWarnWirelessOnline,  // The wireless is connecting...

		_ATErrorPrivate_1,
		_ATErrorPrivate_2,

		_ATErrorPrivate_3,
		_ATErrorPrivate_4,

		_ATErrorPrivate_5,
		ATErrorPkgSnLimit,	// Writer sn is limited ...
		ATErrorPkgUidLimit, // Target unique ID is limited...

		ATErrorPkgVersion, // The project version is too low...
		_ATErrorPrivate_6,
		ATErrorNonMassPDC,			   // Target FT(CP) validation fails ...
		ATErrorKPROMConfig,			   // Target password error(such as KPROM)...
		ATErrorSPIFlash,			   // Target SPI flash not connected(such as NUVOTON) ...
		ATErrorAbnormalAccessDetected, // Target abnormal access detected...

		ATErrorUpdateKPROM,			// Target write KPROM failed...
		ATErrorUpdateXOM,			// Target write XOM failed...
		ATErrorUpdateSecureSetting, // Target write secure setting failed...
		ATErrorUpdateMTP,			// Target write MTP failed...

		ATErrorFUS_NOT_Running,					 // The FUS not running ...
		ATErrorStack_NOT_Running,				 // The stack not running ...
		ATErrorUpgradeFUS,						 // FUS upgrade error ...
		ATErrorUpgradeStack,					 // Stack upgrade error ...
		ATErrorFUS_STATE_IMAGE_NONE,			 // FUS state image not found...
		ATErrorFUS_STATE_IMAGE_CORRUPT,			 // FUS state image corrupt...
		ATErrorFUS_STATE_IMAGE_NOT_AUTHENTIC,	 // FUS state image not authentic...
		ATErrorFUS_STATE_IMAGE_NOT_ENOUGH_SPACE, // FUS state image not enough space...
		ATErrorFUS_STATE_USRABORT,				 // FUS state user abort...
		ATErrorFUS_STATE_ERSERROR,				 // FUS state erase error...
		ATErrorFUS_STATE_WRTERROR,				 // FUS state write error...
		ATErrorFUS_AUTH_TAG_ST_NOTFOUND,		 // FUS authorization tag was not found...
		ATErrorAUTH_TAG_CUST_NOTFOUND,			 // FUS custom authorization tag was not found...
		ATErrorAUTH_KEY_LOCKED,					 // FUS authorization key locked...
		ATErrorFUS_UFB_CORRUPT,					 // FUS UFB corrupt...
		ATErrorFUS_STATE_OTHER_ERROR,			 // FUS state other error ...
		ATErrorStackTypeError,					 // Stack type error ...

		_ATErrorPrivate_SOF,
		ATErrorVendorSignCrush, // The vendor signature data is corrupted
		ATErrorVendorNoSign,	// The current target chip has no signature
			
		ATErrorFactoryTestDisable,			//Factory test not enable
		ATErrorFactoryTestSRAMFWNone,		//Factory test no SRAM firmware
		ATErrorFactoryTestFlashFWNone,	//Factory test no flash firmware
		ATErrorWriteSRAM,								//Write SRAM failure
		ATErrorBaudrate,								//AT baudrate 
		ATErrorBroadcastDir,						//Broadcast direction error
		ATErrorBroadcastKeep,						// Need keep AT frame to send
		ATErrorAtUartDisable,						// AT UART AT disabled
		ATErrorFactoryTestFailed,				// AT factory test failed

		_ATErrorMAX = PW_ENUM_MAX
	} E_ATCmdError;

#ifdef __cplusplus
}
#endif
#endif
