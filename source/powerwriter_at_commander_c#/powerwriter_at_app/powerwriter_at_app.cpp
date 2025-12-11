#include "powerwriter_at_app.h"
#include "powerwriter_at_opt.h"

static PowerWriter_At_Opt* g_pPwAtOpt = NULL;

void PwAtIntroduction() {
	PowerWriter_At_Opt::PwAtIntroduction();
}

E_ATCmdError PwAtBenchmark(bool encrypt) {
	return PowerWriter_At_Opt::PwAtBenchmark(encrypt);
}

bool PwAtInit(char* portName, int baudrate, bool encrypt) {
	if (g_pPwAtOpt != NULL) {
		delete g_pPwAtOpt;
		g_pPwAtOpt = NULL;
	}
	g_pPwAtOpt = new PowerWriter_At_Opt();
	g_pPwAtOpt->ConnectSerialPort(std::string(portName), baudrate);
	return g_pPwAtOpt->PwAtInit(encrypt);
}

void PwAtUnInit() {
	if (g_pPwAtOpt != NULL) {
		g_pPwAtOpt->DisconnectSerialPort();
		delete g_pPwAtOpt;
		g_pPwAtOpt = NULL;
	}
}

E_ATCmdError PwAtLastError() {
	if (g_pPwAtOpt == NULL)
		return ATErrorNone;
	return g_pPwAtOpt->PwAtLastError();
}

bool PwAtGetWriterinfo(S_ATCmdRspWriterInfo* info) {
	if (g_pPwAtOpt == NULL || info == NULL)
		return false;
	return g_pPwAtOpt->PwAtGetWriterinfo(info);
}

bool  PwAtGetWriterconfig(S_ATCmdWriterCfg* cfg) {
	if (g_pPwAtOpt == NULL || cfg == NULL)
		return false;
	return g_pPwAtOpt->PwAtGetWriterconfig(cfg);
}

bool PwAtSetWriterconfig(const S_ATCmdWriterCfg* cfg) {
	if (g_pPwAtOpt == NULL || cfg == NULL)
		return false;
	return g_pPwAtOpt->PwAtSetWriterconfig(cfg);
}

bool PwAtSetBaudrate(int baudrate) {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtSetBaudrate(baudrate);
}

bool PwAtTargetConnect() {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtTargetConnect();
}

bool PwAtTargetStatus() {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtTargetStatus();
}

bool PwAtTargetId(S_ATCmdRspTargetChipID* rsp) {
	if (g_pPwAtOpt == NULL || rsp == NULL)
		return false;
	return g_pPwAtOpt->PwAtTargetId(rsp);
}

bool PwAtTargetRead(uint32_t addr, uint32_t size, S_ATCmdTargetMemory* memory) {
	if (g_pPwAtOpt == NULL || memory == NULL)
		return false;
	
	S_ATCmdTargetMemory* pTmpMemory = NULL;
	if (g_pPwAtOpt->PwAtTargetRead(addr, size, &pTmpMemory) && pTmpMemory != NULL) {
		memset(memory, 0x0, sizeof(S_ATCmdTargetMemory));
		memcpy(memory, pTmpMemory, sizeof(S_ATCmdTargetMemory));
		return true;
	}
	return false;
}

bool PwAtTargetErase(int timout_ms) {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtTargetErase(timout_ms);
}

bool PwAtTargetEraseSector(uint32_t addr, uint32_t size, int timout_ms) {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtTargetEraseSector(addr, size, timout_ms);
}

bool PwAtTargetWritePrepare(uint32_t total) {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtTargetWritePrepare(total);
}

bool PwAtTargetWrite(uint32_t addr, void* buffer, size_t buffersize) {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtTargetWrite(addr, buffer, buffersize);
}

bool PwAtTargetReadOb(S_ATCmdRspTargetOptionByte* pob) {
	if (g_pPwAtOpt == NULL || pob == NULL)
		return false;

	S_ATCmdRspTargetOptionByte* pTmpOb = NULL;
	if (g_pPwAtOpt->PwAtTargetReadOb(&pTmpOb) && pTmpOb != NULL) {
		memset(pob, 0x0, sizeof(S_ATCmdRspTargetOptionByte));
		memcpy(pob, pTmpOb, sizeof(S_ATCmdRspTargetOptionByte));
		return true;
	}
	return false;
}

bool PwAtTargetReadOb(S_ATCmdRspTargetOptionByte** ppob) {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtTargetReadOb(ppob);
}

bool PwAtTargetWriteVendorOb(int timout_ms) {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtTargetWriteVendorOb(timout_ms);
}

bool PwAtTargetWriteUserOb(int timout_ms) {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtTargetWriteUserOb(timout_ms);
}

bool  PwAtTargetReset(E_resetType type) {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtTargetReset(type);
}

bool PwAtProjectInfo(S_ATCmdRspProjectInfo* pproject) {
	if (g_pPwAtOpt == NULL || pproject == NULL)
		return false;

	S_ATCmdRspProjectInfo* pTmpProject = NULL;
	if (g_pPwAtOpt->PwAtProjectInfo(&pTmpProject) && pTmpProject != NULL) {
		memset(pproject, 0x00, sizeof(S_ATCmdRspProjectInfo));
		memcpy(pproject, pTmpProject, sizeof(S_ATCmdRspProjectInfo));
		return true;
	}
	return false;
}

bool PwAtProjectDisable() {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtProjectDisable();
}

bool PwAtProjectLoad(const char *prj_name, const char* password, const void* prj_data, size_t prj_size, ATProgress p_cb) {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtProjectLoad(prj_name, password, prj_data, prj_size, p_cb);
}

bool PwAtOffLineStart() {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtOffLineStart();
}

bool PwAtOffLineStatus(S_ATCmdStatus* ps) {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtOffLineStatus(ps);
}

bool PwAtEasyBroadcastNoRsp(const void* bcdata, size_t bcsize, S_ATCmdBroadcastDir bcdir) {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtEasyBroadcastNoRsp(bcdata, bcsize, bcdir);
}

bool PwAtBroadcast(const void* bcdata, size_t bcsize, S_ATCmdBroadcastDir bcdir, bool keepframe,
	bool waitrsp, S_ATCmdBroadcast* prsp, int waitrsptimeout) {
	if (g_pPwAtOpt == NULL)
		return false;
	return g_pPwAtOpt->PwAtBroadcast(bcdata, bcsize, bcdir, keepframe,
		waitrsp, prsp, waitrsptimeout);
}