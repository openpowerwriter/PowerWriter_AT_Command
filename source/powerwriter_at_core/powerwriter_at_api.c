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
#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif

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

	//Initial AT cmd frame header
	strcpy(ch->m_cmdOutput.m_frameHeader, PW_AT_FRAME_HDR_STR);

	return true;
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

/* Set last error */
static void _cmdSetLastError(S_ATChannel *ch, E_ATCmdError error) {
	ch->m_config.m_lastError = error;
}

/* set Writer last error from response */
static bool _cmdRspLastErrorUpdate(S_ATChannel * ch)
{
	if (ch) {
		switch (ch->m_cmdInput.m_payload.m_cmdType)
		{
		case ATCmdStatusError:
			_cmdSetLastError(ch, ch->m_cmdInput.m_payload.m_cmdProperty.m_ATCmdStatusError.property.m_errorCode);
			return false;
		case ATCmdStatusOK:
			_cmdSetLastError(ch, ATErrorNone);
			break;
		default:
			break;
		}
	}
	return true;
}

/* Reset Last Event */
static void _cmdResetLastEvent(S_ATChannel *ch) {
	ch->m_config.m_lastEvent = ATEventNone;
}

/* Get last Event */
static S_ATCmdEvent _cmdGetLastEvent(S_ATChannel * ch) {
	return ch->m_config.m_lastEvent;
}

/* Set last Event */
static void _cmdSetLastEvent(S_ATChannel * ch, S_ATCmdEvent event) {
	ch->m_config.m_lastEvent = event;
}


/* send event */
static void _cmdCallEvent(
	S_ATChannel * ch, 
	S_ATCmdEvent event)
{
	_cmdSetLastEvent(ch, event);
	if (ch->m_config.m_eventOut) {
			(*ch->m_config.m_eventOut)(ch, event);
	}
}

/* Reset RX & send event */
void _cmdResetRXSendErrorEvent(S_ATChannel * ch) {
	ch->m_rxBuffer.m_index = 0;
	_cmdSetLastError(ch, ATErrorPacket);
	_cmdCallEvent(ch, ATEventError);
}
/* Data analysis */
bool	_cmdDataAnalysis(S_ATChannel * ch)
{
	S_ATCmdFrame * pf = (S_ATCmdFrame *)&ch->m_rxBuffer.m_buffer;
	/* check header */
	if (memcmp(pf->m_frameHeader, PW_AT_FRAME_HDR_STR,sizeof(pf->m_frameHeader))) {
		if (ch->m_rxBuffer.m_index >= sizeof(pf->m_frameHeader)) {
			_cmdResetRXSendErrorEvent(ch);
		}
		return false;
	}
	/* check frame length */
	if (ch->m_rxBuffer.m_index < sizeof(pf->m_frameHeader) + sizeof(pf->m_frameLength)) {
		return false;	/* continue */
	}
	/* frame overflow */
	if (pf->m_frameLength >= sizeof(ch->m_rxBuffer.m_buffer)) {
		_cmdResetRXSendErrorEvent(ch);
		return false;
	}
	/* waiting or check */
	if (ch->m_rxBuffer.m_index >= pf->m_frameLength) {
		/* size */
		size_t crc_size = pf->m_frameLength - sizeof(pf->m_crc32);

		size_t payload_size = crc_size -
			sizeof(pf->m_frameHeader) -
			sizeof(pf->m_frameLength);

		/* decryption */
		if (ch->m_config.m_encryptEnable) {
			powerwriter_at_encrypt(&pf->m_payload, payload_size, false);
		}
		/* crc32 */
		uint32_t m_crc_c = GetCrc32(&pf->m_frameHeader, crc_size);
		uint32_t m_crc_r = *((uint32_t *)((uint8_t *)pf + crc_size));
		if (m_crc_c != m_crc_r) {
			_cmdResetRXSendErrorEvent(ch);
			return false;
		}
		/* Copy to Input frame */
		memcpy(&ch->m_cmdInput, pf, crc_size);
		ch->m_cmdInput.m_crc32 = m_crc_r;

		/* Notify event */
		_cmdCallEvent(ch, ATEventCmd);

		return true;
	}
	return false;
}

/*
 * @brief   Fill data to AT command interface
 * @pram 	ch: AT channel object
 *          data: Whether the encryption
 *          size: AT commander send pacakage callback
 * @return  none
 */
bool powerwriter_at_datain(
	S_ATChannel *ch,
	void *data,
	size_t size)
{
	AT_CHECK_PARAM(ch, false)
	AT_CHECK_PARAM(data, false)
	
	size_t i = 0;
	uint8_t * p_data = (uint8_t *)data;

	for (i = 0; i < size; i++) {
		if (ch->m_rxBuffer.m_index >= sizeof(ch->m_rxBuffer.m_buffer)) {
			ch->m_rxBuffer.m_index = 0;
		}
		ch->m_rxBuffer.m_buffer[ch->m_rxBuffer.m_index++] = *p_data++;
	}

	return _cmdDataAnalysis(ch);
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
	return &ch->m_cmdInput;
}


/* command property size */
static	size_t	_cmdGetPropertySize(
	S_ATCmdFrame * pf,
	E_ATCmdType cmd) {
	switch (cmd)
	{
	case ATCmdGetWriterInfo:						return sizeof(S_ATCmdGetWriterInfo);						// Get information 
	case ATCmdGetWriterCfg:							return sizeof(S_ATCmdGetWriterCfg);							// Get configuration
	case ATCmdSetWriterCfg:							return sizeof(S_ATCmdSetWriterCfg);							// Set Writer configure
	case ATCmdSetBaudRate:							return sizeof(S_ATCmdSetBaudRate);							// Set baud rate
	case ATCmdConnectTarget:						return sizeof(S_ATCmdConnectTarget);						// Init target connect
	case ATCmdGetTargetStatus:					return sizeof(S_ATCmdGetTargetStatus);					// Get target status
	case ATCmdGetTargetChipID:					return sizeof(S_ATCmdGetTargetChipID);					// Get target id
	case ATCmdReadTargetMemory:					return sizeof(S_ATCmdReadTargetMemory);					// Read target memory
	case ATCmdEraseTarget:							return sizeof(S_ATCmdEraseTarget);							// Erase target chip
	case ATCmdEraseTargetSectors:				return sizeof(S_ATCmdEraseTargetSectors);				// Erase target chip sector
	case ATCmdWriteTargetMemoryPrepare:	return sizeof(S_ATCmdWriteTargetMemoryPrepare);	//Prepare write target memory 
	case ATCmdWriteTargetMemory:																												// Write target memory 
		return sizeof(pf->m_payload.m_cmdProperty.m_ATCmdWriteTargetMemory.m_address) + 
					sizeof(pf->m_payload.m_cmdProperty.m_ATCmdWriteTargetMemory.m_size) + 
					pf->m_payload.m_cmdProperty.m_ATCmdWriteTargetMemory.m_size;
	case ATCmdReadTargetOptionByte:	return sizeof(S_ATCmdReadTargetOptionByte);					//Read target option byte
	default:
		return 0;
	}
}

/* command payload size*/
static size_t	_cmdGetPayloadSize(
	S_ATCmdFrame * pf,
	E_ATCmdType cmd
) {
	size_t	size = _cmdGetPropertySize(pf,cmd);
	size += sizeof(pf->m_payload.m_cmdType);
	size += sizeof(pf->m_payload.m_cmdSize);
	return size;
}


/* Fill send Package */
/* cmd : cmd type */
/* cmd Data: cmd data*/
static bool	_cmdSetOutPackageData(
	S_ATChannel * ch,
	E_ATCmdType cmd) 
{

	S_ATCmdFrame * pf = &ch->m_cmdOutput;

	/* Set payload  information */
	pf->m_payload.m_cmdType = cmd;
	pf->m_payload.m_cmdSize = _cmdGetPropertySize(pf,cmd);
	
	/* frame length */
	// payload_size
	size_t payload_size = _cmdGetPayloadSize(pf,cmd);
	if (ch->m_config.m_encryptEnable) {
		payload_size = utils_round_up(payload_size, POWERWRITER_AT_PACKAGE_ALIGN);
	}
	// crc size
	size_t crc_size = sizeof(pf->m_frameHeader) + sizeof(pf->m_frameLength) + payload_size;
	
	//frame length
	pf->m_frameLength = crc_size + sizeof(pf->m_crc32);

	/* crc32 */
	pf->m_crc32 = GetCrc32(&pf->m_frameHeader, crc_size);

	/* encryption */
	if (ch->m_config.m_encryptEnable) {
		powerwriter_at_encrypt(&pf->m_payload, payload_size, true);
	}
	/* move crc16 to  linear addresses*/
	uint32_t * p_crc = (uint32_t *)(((uint8_t *)&pf->m_payload) + payload_size);
	*p_crc = pf->m_crc32;

	return true;
}


/* Reset RX Buffer */
static void _cmdResetRXBuffer(S_ATChannel *ch) {
	ch->m_rxBuffer.m_index = 0;
}



/* Wait event */
/*
 *notes: the CPU usage is released by sleep,
 *But here, for simplicity and cross-platform purposes,
 *the simplest approach is used
 *You can use the event bus instead event flag, such as
 *(1): CreatEvent、ResetEvent、SetEvent、WaitSingleObject at Windows platform , or
 *(2): boost signals and slots��thread in unix (like)...
 *(3): pevents 、eventbus in opensource c++ library...
 *							by:cshsoft、csh@icworkshop.com
 */
static bool _cmdWaitEvent(
	S_ATChannel * ch, 
	S_ATCmdEvent event, 
	uint32_t timeout) 
{
	uint32_t ts = GetSystemTick();
	while (GetSystemTick() - ts < timeout) {
		ATSleep(1);
		if (_cmdGetLastEvent(ch) == event) {
			return _cmdRspLastErrorUpdate(ch);
		}
	}
	/* time out */
	_cmdSetLastError(ch, ATErrorTimeout);
	return false;
}

/* Send AT command & Read back response package */
static bool	_cmdSendCommand(
	S_ATChannel *ch,
	E_ATCmdType cmd,
	int timeout) {

	/* fill command package */
	_cmdSetOutPackageData(ch, cmd);
	/*reset*/
	_cmdResetLastEvent(ch);
	_cmdResetRXBuffer(ch);
	
	if (ch->m_config.m_streamOut) {
		/* Send frame */
		if (false == (ch->m_config.m_streamOut)(&ch->m_cmdOutput, timeout)) {
			_cmdSetLastError(ch, ATErrorPort);
			return false;
		}
		// wait event  
		return _cmdWaitEvent(ch, ATEventCmd, timeout);
	}
	_cmdSetLastError(ch, ATErrorNullValue);
	return false;
}


/*
 * @brief Send PowerWriter AT command & return E_ATCmdStatusOk
 * @pram 	ch: AT channel object
 *				cmd: command type
 *				timeout:	time out
 * @return  Returns true on success, false otherwise
 */
bool _powerwriter_at_send_command(S_ATChannel *ch, E_ATCmdType cmd, int timeout) {
	if (_cmdSendCommand(ch, cmd, timeout)) {
		return ch->m_cmdInput.m_payload.m_cmdType == ATCmdStatusOK;
	}
	return false;
}


/*
 * @brief Get PowerWriter information
 * @pram 	ch: AT channel object
 *				info: Out PowerWriter information
 * @return  Returns true on success, false otherwise
 */
bool powerwriter_at_get_writerinfo(
	S_ATChannel *ch, 
	S_ATCmdRspWriterInfo * info) {
	AT_CHECK_PARAM(ch, false)
	AT_CHECK_PARAM(info, false)
	
	if (_cmdSendCommand(ch, ATCmdGetWriterInfo, PW_AT_TIMEOUT_BASE)) {
		if(ch->m_cmdInput.m_payload.m_cmdType == ATCmdRspWriterInfo){
			*info = ch->m_cmdInput.m_payload.m_cmdProperty.m_ATCmdRspWriterInfo;
			return true;
		}
	}
	return false;
}

/*
 * @brief Get PowerWriter configuration
 * @pram 	ch: AT channel object
 *				cfg: Out PowerWriter configuration
 * @return  Returns true on success, false otherwise
 */
bool powerwriter_at_get_writerconfig(
	S_ATChannel *ch,
	S_ATCmdRspWriterCfg * cfg) {
	AT_CHECK_PARAM(ch, false)
	AT_CHECK_PARAM(cfg, false)

	if (_cmdSendCommand(ch, ATCmdGetWriterCfg, PW_AT_TIMEOUT_BASE)) {
		if (ch->m_cmdInput.m_payload.m_cmdType == ATCmdRspWriterCfg) {
			*cfg = ch->m_cmdInput.m_payload.m_cmdProperty.m_ATCmdRspWriterCfg;
			return true;
		}
	}
	return false;
}


/*
 * @brief Set PowerWriter configuration
 * @pram 	ch: AT channel object
 *				cfg: In PowerWriter configuration
 * @return  Returns true on success, false otherwise
 */
bool powerwriter_at_set_writerconfig(
	S_ATChannel *ch,
	const S_ATCmdRspWriterCfg * cfg) {
	AT_CHECK_PARAM(ch, false)
	AT_CHECK_PARAM(cfg, false)
	//Set property
	ch->m_cmdOutput.m_payload.m_cmdProperty.m_ATCmdSetWriterCfg = *cfg;
	return _powerwriter_at_send_command(ch, ATCmdSetWriterCfg, PW_AT_TIMEOUT_BASE);
}

/*
 * @brief Set PowerWriter AT baud rate
 * @pram 	ch: AT channel object
 *				cfg: In PowerWriter configuration
 * @return  Returns true on success, false otherwise
 */
bool powerwriter_at_set_baudrate(
	S_ATChannel *ch,
	int baudrate) {
	AT_CHECK_PARAM(ch, false)
	//Set property
	ch->m_cmdOutput.m_payload.m_cmdProperty.m_ATCmdSetBaudRate.property.m_baudRate = baudrate;
	return _powerwriter_at_send_command(ch, ATCmdSetBaudRate, PW_AT_TIMEOUT_BASE);
}

/*
 * @brief Init target connect
 * @pram 	ch: AT channel object
 * @return  Returns true on success, false otherwise
 */

bool powerwriter_at_target_connect(
	S_ATChannel *ch) {
	AT_CHECK_PARAM(ch, false)
	return _powerwriter_at_send_command(ch, ATCmdConnectTarget, PW_AT_TIMEOUT_BASE);
}

/*
 * @brief Get target connect status
 * @pram 	ch: AT channel object
 *				timeout:	time out
 * @return  Returns true on success, false otherwise
 */

bool powerwriter_at_target_status(
	S_ATChannel *ch) {
	AT_CHECK_PARAM(ch, false)
	return _powerwriter_at_send_command(ch, ATCmdGetTargetStatus, PW_AT_TIMEOUT_BASE);
}

/*
 * @brief Get target id
 * @pram 	ch: AT channel object
 * @return  Returns true on success, false otherwise
 */

bool powerwriter_at_target_id(
	S_ATChannel *ch,
	S_ATCmdRspTargetChipID * rsp) {
	AT_CHECK_PARAM(ch, false)
	AT_CHECK_PARAM(rsp, false)
	if (_cmdSendCommand(ch, ATCmdGetTargetChipID, PW_AT_TIMEOUT_BASE)) {
		if (ch->m_cmdInput.m_payload.m_cmdType == ATCmdRspTargetChipID) {
			*rsp = ch->m_cmdInput.m_payload.m_cmdProperty.m_ATCmdRspTargetChipID;
			return true;
		}
	}
	return false;
}

/*
 * @brief Read target memory
 * @pram 	ch: AT channel object
 * @return  Returns true on success, false otherwise
 */

bool powerwriter_at_target_read(
	S_ATChannel *ch,
	uint32_t addr,
	uint32_t size,
	S_ATCmdRspTargetMemory ** memory) {
	AT_CHECK_PARAM(ch, false)
	AT_CHECK_PARAM(memory, false);
	ch->m_cmdOutput.m_payload.m_cmdProperty.m_ATCmdReadTargetMemory.m_address = addr;
	ch->m_cmdOutput.m_payload.m_cmdProperty.m_ATCmdReadTargetMemory.m_size = MIN(PW_PACKAGE_SIZE, size);
	if (_cmdSendCommand(ch, ATCmdReadTargetMemory, PW_AT_TIMEOUT_BASE)) {
		if (ch->m_cmdInput.m_payload.m_cmdType == ATCmdRspTargetMemory) {
			*memory = &ch->m_cmdInput.m_payload.m_cmdProperty.m_ATCmdRspTargetMemory;
			return true;
		}
	}
	*memory = NULL;
	return false;
}

/*
 * @brief erase target chip
 * @pram 	ch: AT channel object
 *				timeout: time out  
 * @return  Returns true on success, false otherwise
 */
bool powerwriter_at_target_erase(
	S_ATChannel *ch,
	int timout_ms) {
	AT_CHECK_PARAM(ch, false)
	return _powerwriter_at_send_command(ch, ATCmdEraseTarget, timout_ms);
}


/*
 * @brief erase target memory sector
 * @pram 	ch: AT channel object
 *				addr: erase flash addr
 *				size:	erase length
 *				timeout: time out
 * @return  Returns true on success, false otherwise
 */
bool powerwriter_at_target_erase_sector(
	S_ATChannel *ch,
	uint32_t addr,
	uint32_t size,
	int timout_ms) {
	AT_CHECK_PARAM(ch, false)
	ch->m_cmdOutput.m_payload.m_cmdProperty.m_ATCmdEraseTargetSectors.m_address = addr;
	ch->m_cmdOutput.m_payload.m_cmdProperty.m_ATCmdEraseTargetSectors.m_size = size;
	return _powerwriter_at_send_command(ch, ATCmdEraseTargetSectors, timout_ms);
}


/*
 * @brief Write target memory
 * @pram 	ch: AT channel object
 * @return  Returns true on success, false otherwise
 */

bool powerwriter_at_target_write_prepare(
	S_ATChannel *ch,
	uint32_t	total
) {
	AT_CHECK_PARAM(ch, false)
	ch->m_cmdOutput.m_payload.m_cmdProperty.m_ATCmdWriteTargetMemoryPrepare.property.m_totalsize = total;
	return _powerwriter_at_send_command(ch, ATCmdWriteTargetMemoryPrepare, PW_AT_TIMEOUT_BASE);
}
bool powerwriter_at_target_write(
	S_ATChannel *ch,
	uint32_t	addr,
	void * buffer,
	size_t buffersize) {
	AT_CHECK_PARAM(ch, false)
	ch->m_cmdOutput.m_payload.m_cmdProperty.m_ATCmdWriteTargetMemory.m_size = MIN(PW_PACKAGE_SIZE, buffersize);
	ch->m_cmdOutput.m_payload.m_cmdProperty.m_ATCmdWriteTargetMemory.m_address = addr;
	memcpy(ch->m_cmdOutput.m_payload.m_cmdProperty.m_ATCmdWriteTargetMemory.m_buffer, buffer,
		ch->m_cmdOutput.m_payload.m_cmdProperty.m_ATCmdWriteTargetMemory.m_size);

	return _powerwriter_at_send_command(ch, ATCmdWriteTargetMemory, PW_AT_TIMEOUT_BASE);
}

/*
 * @brief Read target option byte
 * @pram 	ch: AT channel object
					
 * @return  Returns true on success, false otherwise
 */

bool powerwriter_at_target_read_ob(
	S_ATChannel *ch,
	S_ATCmdRspTargetOptionByte ** ppob) {
	AT_CHECK_PARAM(ch, false)
	AT_CHECK_PARAM(ppob, false)
	if (_cmdSendCommand(ch, ATCmdReadTargetOptionByte, PW_AT_TIMEOUT_BASE)) {
		if (ch->m_cmdInput.m_payload.m_cmdType == ATCmdRspTargetOptionByte) {
			*ppob = &ch->m_cmdInput.m_payload.m_cmdProperty.m_ATCmdRspTargetOptionByte;
			return true;
		}
	}
	*ppob = NULL;
	return false;
}