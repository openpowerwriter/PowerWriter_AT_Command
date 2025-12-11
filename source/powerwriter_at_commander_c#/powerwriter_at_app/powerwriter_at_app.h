#pragma once
#include "powerwriter_at_type.h"
#include "powerwriter_at_global.h"

/* export api for powerwriter AT commander */
PW_AT_APP_EXPORT void PwAtIntroduction();
/* Run AT benchmark */
PW_AT_APP_EXPORT E_ATCmdError PwAtBenchmark(bool encrypt);

/* Initial PowerWriter AT commander */
PW_AT_APP_EXPORT bool PwAtInit(char* portName, int baudrate, bool encrypt);
/* Initial PowerWriter AT commander */
PW_AT_APP_EXPORT void PwAtUnInit();

/* Get last error code */
PW_AT_APP_EXPORT E_ATCmdError PwAtLastError();
/* Get PowerWriter Information */
PW_AT_APP_EXPORT bool PwAtGetWriterinfo(S_ATCmdRspWriterInfo* info);
/* Get PowerWriter configuration */
PW_AT_APP_EXPORT bool PwAtGetWriterconfig(S_ATCmdWriterCfg* cfg);
/* Set PowerWriter configuration */
PW_AT_APP_EXPORT bool PwAtSetWriterconfig(const S_ATCmdWriterCfg* cfg);
/* Set PowerWriter AT baudrate */
PW_AT_APP_EXPORT bool PwAtSetBaudrate(int baudrate);
/* Init target connnect */
PW_AT_APP_EXPORT bool PwAtTargetConnect();
/* Get target status */
PW_AT_APP_EXPORT bool PwAtTargetStatus();
/* Get target id */
PW_AT_APP_EXPORT bool PwAtTargetId(S_ATCmdRspTargetChipID* rsp);
/* Read target memory */
PW_AT_APP_EXPORT bool PwAtTargetRead(uint32_t addr, uint32_t size, S_ATCmdTargetMemory* memory);
/* Erase target chip */
PW_AT_APP_EXPORT bool PwAtTargetErase(int timout_ms);
/* Erase target flash memory */
PW_AT_APP_EXPORT bool PwAtTargetEraseSector(uint32_t addr, uint32_t size, int timout_ms);
/* Write target flash memory */
PW_AT_APP_EXPORT bool PwAtTargetWritePrepare(uint32_t total);
PW_AT_APP_EXPORT bool PwAtTargetWrite(uint32_t addr, void* buffer, size_t buffersize);
/* Read target option byte */
PW_AT_APP_EXPORT bool PwAtTargetReadOb(S_ATCmdRspTargetOptionByte* pob);
/* Read target option byte */
PW_AT_APP_EXPORT bool PwAtTargetWriteVendorOb(int timout_ms);
/* Write target user's option byte */
PW_AT_APP_EXPORT bool PwAtTargetWriteUserOb(int timout_ms);
/* Reset target chip */
PW_AT_APP_EXPORT bool  PwAtTargetReset(E_resetType type);

/* Get offline project information */
PW_AT_APP_EXPORT bool PwAtProjectInfo(S_ATCmdRspProjectInfo* pproject);
/* Disable offline project*/
PW_AT_APP_EXPORT bool PwAtProjectDisable();
/* Load offline project */
PW_AT_APP_EXPORT bool PwAtProjectLoad(const char *prj_name, const char* password, const void* prj_data, size_t prj_size, ATProgress p_cb);
/* start offline program */
PW_AT_APP_EXPORT bool PwAtOffLineStart();
/* query offline status */
PW_AT_APP_EXPORT bool PwAtOffLineStatus(S_ATCmdStatus* ps);

/* easy broadcast no rsp */
PW_AT_APP_EXPORT bool PwAtEasyBroadcastNoRsp(const void* bcdata, size_t bcsize, S_ATCmdBroadcastDir bcdir);
/* broadcast */
PW_AT_APP_EXPORT bool PwAtBroadcast(const void* bcdata, size_t bcsize, S_ATCmdBroadcastDir bcdir, bool keepframe,
	bool waitrsp, S_ATCmdBroadcast* prsp, int waitrsptimeout);