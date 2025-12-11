#include "powerwriter_at_opt.h"
#include "powerwriter_at_log.h"
#include <iostream>

PowerWriter_At_Opt* PowerWriter_At_Opt::g_pPwAtApp = NULL;

PowerWriter_At_Opt::PowerWriter_At_Opt() {
	PowerWriter_At_Opt::g_pPwAtApp = this;
	m_serialPort.OnReadReadyCallBack.connect(this, &PowerWriter_At_Opt::OnReceve);
	m_serialPort.OnDisconnectCallBack.connect(this, &PowerWriter_At_Opt::DisconnectSerialPort);
}

PowerWriter_At_Opt::~PowerWriter_At_Opt() {
	PowerWriter_At_Opt::g_pPwAtApp = NULL;
	this->DisconnectSerialPort();
}

bool PowerWriter_At_Opt::ConnectSerialPort(
	std::string Device,
	int BaudRate ,
	itas109::Parity Parity ,
	itas109::DataBits DataBits ,
	itas109::StopBits StopBits ) 
{
	try
	{
		DisconnectSerialPort();

		m_serialPort.init(Device.c_str(), BaudRate, Parity, DataBits, StopBits);
		m_serialPort.open();
		if (m_serialPort.isOpened()) {
			return true;
		}
	}
	catch (const std::exception& ex)
	{
		powerwriter_at_log(LOGE, "ConnectSerialPort: [%s]\r\n", ex.what());
	}
	return false;
}

void PowerWriter_At_Opt::DisconnectSerialPort()
{
	try
	{
		if (m_serialPort.isOpened())
		{
			m_serialPort.close();
		}
	}
	catch (const std::exception& ex) 
	{
		powerwriter_at_log(LOGE, "DisconnectSerialPort: [%s]\r\n", ex.what());
	}
}

bool PowerWriter_At_Opt::OnSend(void* data, size_t size) {
	try
	{
		if (m_serialPort.isOpened()) 
			return m_serialPort.writeData((char*)data, size) == size;
	}
	catch (const std::exception& ex)
	{
		powerwriter_at_log(LOGE, "OnSend: [%s]\r\n", ex.what());
	}
	return false;
}

void PowerWriter_At_Opt::OnReceve()
{
	try
	{
		vector<char> m_curRead;
		int iRet = m_serialPort.readAllData(m_curRead);
		if (iRet > 0) {
			//object_print(m_curRead.data(), iRet, "Recived data");
			powerwriter_at_datain(&this->m_atCmdChannel, m_curRead.data(), iRet);
		}
	}
	catch (const std::exception& ex)
	{
		powerwriter_at_log(LOGE, "OnReceve: [%s]\r\n", ex.what());
	}
}

S_ATChannel& PowerWriter_At_Opt::getATChannel() {
	return m_atCmdChannel;
}

bool PowerWriter_At_Opt::OnSendAtCommand(S_ATCmdFrame* pf, int timeout)
{
	if (PowerWriter_At_Opt::g_pPwAtApp == NULL)
		return false;

	return PowerWriter_At_Opt::g_pPwAtApp->OnSend(pf, pf->m_frameLength);
}

void PowerWriter_At_Opt::OnReceveAtEvent(void* obj, S_ATCmdEvent event) {
	S_ATChannel* ch = (S_ATChannel*)obj;

	switch (event)
	{
		/* received package */
	case ATEventCmd:
	{
		const S_ATCmdFrame* frame;
		if (frame = powerwriter_at_received_frame(ch)) {
			if(ATCmdStatusOK == frame->m_payload.m_cmdType)
				powerwriter_at_log(LOGD, "AT received cmd: [ok]\r\n");
			else if (ATCmdStatusError == frame->m_payload.m_cmdType)
				powerwriter_at_log(LOGD, "AT received cmd: [error]\r\n");
			else
				powerwriter_at_log(LOGD, "AT received cmd: [%04X]\r\n", frame->m_payload.m_cmdType);
		}
	}
	break;
	case ATEventError:
	{
		powerwriter_at_log(LOGE, "AT received error: [%04X]\r\n", powerwriter_at_last_error(ch));
		break;
	}
	default:
		break;
	}
}

void PowerWriter_At_Opt::PwAtIntroduction() {
	powerwriter_at_introduction();
}

E_ATCmdError PowerWriter_At_Opt::PwAtBenchmark(bool encrypt) {
	PowerWriter_At_Opt* pTmp = NULL;

	if (PowerWriter_At_Opt::g_pPwAtApp != NULL)
		pTmp = PowerWriter_At_Opt::g_pPwAtApp;

	PowerWriter_At_Opt* pNewPwAtApp = new PowerWriter_At_Opt();
	PowerWriter_At_Opt::g_pPwAtApp = pNewPwAtApp;

	vector<SerialPortInfo>  m_SerialPortInfo = CSerialPortInfo::availablePortInfos();
	powerwriter_at_log(LOGI, "The serial port is as follows:\r\n");
	for (auto s : m_SerialPortInfo) {
		powerwriter_at_log(LOGI, "[Port:%s]:%s\r\n", s.portName.c_str(), s.description.c_str());
		if (!pNewPwAtApp->ConnectSerialPort(s.portName)) {
			powerwriter_at_log(LOGE, "Unable to connect to port:%s\r\n", s.portName.c_str());
			continue;
		}
		powerwriter_at_log(LOGI, ">>>benchmark...\r\n");

		if (!powerwriter_at_benchmark(&(pNewPwAtApp->getATChannel()), encrypt, PowerWriter_At_Opt::OnSendAtCommand, NULL)) {
			powerwriter_at_log(LOGE, "%s benchmark failed...\r\n", s.portName.c_str());
			continue;
		}
		powerwriter_at_log(LOGD, ">>>All passed...\r\n");
	}

	delete pNewPwAtApp;
	pNewPwAtApp = NULL;
	PowerWriter_At_Opt::g_pPwAtApp = NULL;

	if (pTmp != NULL)
		PowerWriter_At_Opt::g_pPwAtApp = pTmp;
	return ATErrorNone;
}

bool PowerWriter_At_Opt::PwAtInit(bool encrypt) {
	return powerwriter_at_init(&this->m_atCmdChannel, encrypt, PowerWriter_At_Opt::OnSendAtCommand, PowerWriter_At_Opt::OnReceveAtEvent);
}

E_ATCmdError PowerWriter_At_Opt::PwAtLastError() {
	return powerwriter_at_last_error(&this->m_atCmdChannel);
}

bool PowerWriter_At_Opt::PwAtGetWriterinfo(S_ATCmdRspWriterInfo* info) {
	return powerwriter_at_get_writerinfo(&this->m_atCmdChannel, info);
}

bool  PowerWriter_At_Opt::PwAtGetWriterconfig(S_ATCmdWriterCfg* cfg) {
	return powerwriter_at_get_writerconfig(&this->m_atCmdChannel, cfg);
}

bool PowerWriter_At_Opt::PwAtSetWriterconfig(const S_ATCmdWriterCfg* cfg) {
	return powerwriter_at_set_writerconfig(&this->m_atCmdChannel, cfg);
}

bool PowerWriter_At_Opt::PwAtSetBaudrate(int baudrate) {
	return powerwriter_at_set_baudrate(&this->m_atCmdChannel, baudrate);
}

bool PowerWriter_At_Opt::PwAtTargetConnect() {
	return powerwriter_at_target_connect(&this->m_atCmdChannel);
}

bool PowerWriter_At_Opt::PwAtTargetStatus() {
	return powerwriter_at_target_status(&this->m_atCmdChannel);
}

bool PowerWriter_At_Opt::PwAtTargetId(S_ATCmdRspTargetChipID* rsp) {
	return powerwriter_at_target_id(&this->m_atCmdChannel, rsp);
}

bool PowerWriter_At_Opt::PwAtTargetRead(uint32_t addr, uint32_t size, S_ATCmdTargetMemory** memory) {
	return powerwriter_at_target_read(&this->m_atCmdChannel, addr, size, memory);
}

bool PowerWriter_At_Opt::PwAtTargetErase(int timout_ms) {
	return powerwriter_at_target_erase(&this->m_atCmdChannel, timout_ms);
}

bool PowerWriter_At_Opt::PwAtTargetEraseSector(uint32_t addr, uint32_t size, int timout_ms) {
	return powerwriter_at_target_erase_sector(&this->m_atCmdChannel, addr, size, timout_ms);
}

bool PowerWriter_At_Opt::PwAtTargetWritePrepare(uint32_t total) {
	return powerwriter_at_target_write_prepare(&this->m_atCmdChannel, total);
}

bool PowerWriter_At_Opt::PwAtTargetWrite(uint32_t addr, void* buffer, size_t buffersize) {
	return powerwriter_at_target_write(&this->m_atCmdChannel, addr, buffer, buffersize);
}

bool PowerWriter_At_Opt::PwAtTargetReadOb(S_ATCmdRspTargetOptionByte** ppob) {
	return powerwriter_at_target_read_ob(&this->m_atCmdChannel, ppob);
}

bool PowerWriter_At_Opt::PwAtTargetWriteVendorOb(int timout_ms) {
	return powerwriter_at_target_write_vendor_ob(&this->m_atCmdChannel, timout_ms);
}

bool PowerWriter_At_Opt::PwAtTargetWriteUserOb(int timout_ms) {
	return powerwriter_at_target_write_user_ob(&this->m_atCmdChannel, timout_ms);
}

bool PowerWriter_At_Opt::PwAtTargetReset(E_resetType type) {
	return powerwriter_at_target_reset(&this->m_atCmdChannel, type);
}

bool PowerWriter_At_Opt::PwAtProjectInfo(S_ATCmdRspProjectInfo** ppproject) {
	return powerwriter_at_project_info(&this->m_atCmdChannel, ppproject);
}

bool PowerWriter_At_Opt::PwAtProjectDisable() {
	return powerwriter_at_project_disable(&this->m_atCmdChannel);
}

bool PowerWriter_At_Opt::PwAtProjectLoad(const char *prj_name, const char* password, const void* prj_data, size_t prj_size, ATProgress p_cb) {
	return powerwriter_at_project_load(&this->m_atCmdChannel, prj_name, password, prj_data, prj_size, p_cb);
}

bool PowerWriter_At_Opt::PwAtOffLineStart() {
	return powerwriter_at_offline_start(&this->m_atCmdChannel);
}

bool PowerWriter_At_Opt::PwAtOffLineStatus(S_ATCmdStatus* ps) {
	return powerwriter_at_offline_status(&this->m_atCmdChannel, ps);
}

bool PowerWriter_At_Opt::PwAtEasyBroadcastNoRsp(const void* bcdata, size_t bcsize, S_ATCmdBroadcastDir bcdir) {
	return powerwriter_at_easy_broadcast_no_rsp(&this->m_atCmdChannel, bcdata, bcsize, bcdir);
}

bool PowerWriter_At_Opt::PwAtBroadcast(const void* bcdata, size_t bcsize, S_ATCmdBroadcastDir bcdir, bool keepframe,
	bool waitrsp, S_ATCmdBroadcast* prsp, int waitrsptimeout) {
	return powerwriter_at_broadcast(&this->m_atCmdChannel, bcdata, bcsize, bcdir, keepframe,
		waitrsp, prsp, waitrsptimeout);
}