#define _CRT_SECURE_NO_WARNINGS
#pragma once

#include "./powerwriter_at_api.h"

#include "./3rd/CSerialPort/SerialPort.h"
#include "./3rd/CSerialPort/SerialPortInfo.h"
#include "./NLock.h"

using namespace itas109;

class PowerWriter_At_Opt : public has_slots<>
{
public:
	PowerWriter_At_Opt();
	~PowerWriter_At_Opt();

public:
	/* Connect Device */
	bool ConnectSerialPort(
		std::string Device,
		int BaudRate = PW_AT_DEFAULT_BAUDRATE,
		itas109::Parity Parity = itas109::Parity::ParityNone,
		itas109::DataBits DataBits = itas109::DataBits::DataBits8,
		itas109::StopBits StopBits = itas109::StopBits::StopOne );
	/* Close serial port */
	void DisconnectSerialPort();
	/* Serial port send data */
	bool OnSend(void* data, size_t size);
	/* Serial port recv data */
	void OnReceve();
	/* Get S_ATChannel object */
	S_ATChannel& getATChannel();

public:
	/* Send AT Command, api callback function */
	static bool OnSendAtCommand(S_ATCmdFrame* pf, int timeout);
	/* Receive AT event, api callback function*/
	static void OnReceveAtEvent(void* obj, S_ATCmdEvent event);
	/* This point */
	static PowerWriter_At_Opt* g_pPwAtApp;

public:
	/* export api for powerwriter AT commander */
	static void PwAtIntroduction();
	/* Run AT benchmark */
	static E_ATCmdError PwAtBenchmark(bool encrypt);

public:
	/* Initial PowerWriter AT commander */
	bool PwAtInit(bool encrypt);
	/* Get last error code */
	E_ATCmdError PwAtLastError();
	/* Get PowerWriter Information */
	bool PwAtGetWriterinfo(S_ATCmdRspWriterInfo* info);
	/* Get PowerWriter configuration */
	bool  PwAtGetWriterconfig(S_ATCmdWriterCfg* cfg);
	/* Set PowerWriter configuration */
	bool PwAtSetWriterconfig(const S_ATCmdWriterCfg* cfg);
	/* Set PowerWriter AT baudrate */
	bool PwAtSetBaudrate(int baudrate);
	/* Init target connnect */
	bool PwAtTargetConnect();
	/* Get target status */
	bool PwAtTargetStatus();
	/* Get target id */
	bool PwAtTargetId(S_ATCmdRspTargetChipID* rsp);
	/* Read target memory */
	bool PwAtTargetRead(uint32_t addr, uint32_t size, S_ATCmdTargetMemory** memory);
	/* Erase target chip */
	bool PwAtTargetErase(int timout_ms);
	/* Erase target flash memory */
	bool PwAtTargetEraseSector(uint32_t addr, uint32_t size, int timout_ms);
	/* Write target flash memory */
	bool PwAtTargetWritePrepare(uint32_t total);
	bool PwAtTargetWrite(uint32_t addr, void* buffer, size_t buffersize);
	/* Read target option byte */
	bool PwAtTargetReadOb(S_ATCmdRspTargetOptionByte** ppob);
	/* Write target vendor default option byte */
	bool PwAtTargetWriteVendorOb(int timout_ms);
	/* Write target user's option byte */
	bool PwAtTargetWriteUserOb(int timout_ms);
	/* Reset target chip */
	bool  PwAtTargetReset(E_resetType type);

	/* Get offline project information */
	bool PwAtProjectInfo(S_ATCmdRspProjectInfo** ppproject);
	/* Disable offline project*/
	bool PwAtProjectDisable();
	/* Load offline project */
	bool PwAtProjectLoad(const char *prj_name, const char* password, const void* prj_data, size_t prj_size, ATProgress p_cb);
	/* start offline program */
	bool PwAtOffLineStart();
	/* query offline status */
	bool PwAtOffLineStatus( S_ATCmdStatus* ps);
	/* switch offline project */
	bool PwAtProjectSwitch(S_SwitchPrjReloadType reload_type, const char* prj_name, const char* password);

	/* easy broadcast no rsp */
	bool PwAtEasyBroadcastNoRsp( const void* bcdata, size_t bcsize, S_ATCmdBroadcastDir bcdir);
	/* broadcast */
	bool PwAtBroadcast( const void* bcdata, size_t bcsize, S_ATCmdBroadcastDir bcdir, bool keepframe,
		bool waitrsp, S_ATCmdBroadcast* prsp, int waitrsptimeout);
private:
	S_ATChannel					m_atCmdChannel;
	CSerialPort					m_serialPort;
};