#define _CRT_SECURE_NO_WARNINGS
#pragma once

#include <iostream>

/* PowerWriter AT Commander */
#include "./../../powerwriter_at_core/powerwriter_at_api.h"

/* A serial port */
#include "./CSerialPort/SerialPort.h"
#include "./CSerialPort/SerialPortInfo.h"
#include "NLock.h"

using namespace itas109;

class SerialPortApp : public has_slots<>
{
public:
	SerialPortApp() {
		m_SerialPort.OnReadReadyCallBack.connect(this, &SerialPortApp::OnReceve);
		m_SerialPort.OnDisconnectCallBack.connect(this, &SerialPortApp::DisconnectSerialPort);
	}
	~SerialPortApp() {
		this->DisconnectSerialPort();
	}


	/* Run AT benchmark */
	E_ATCmdError RunATBenchmark(
		bool				   encrypt,
		ATCmdStreamOut pfDataOut,
		ATCmdEventOut	pfEvent)
	{
		vector<SerialPortInfo>  m_SerialPortInfo = CSerialPortInfo::availablePortInfos();
		powerwriter_at_log(LOGI, "The serial port is as follows:\r\n");
		for (auto s : m_SerialPortInfo) {
			powerwriter_at_log(LOGI, "[Port:%s]:%s\r\n", s.portName.c_str(), s.description.c_str());
			if (!ConnectSerialPort(s.portName)) {
				powerwriter_at_log(LOGE, "Unable to connect to port:%s\r\n", s.portName.c_str());
				continue;
			}
			powerwriter_at_log(LOGI, ">>>benchmark...\r\n");
			if (!powerwriter_at_benchmark(&this->m_ATCmdApp, encrypt, pfDataOut, pfEvent)) {
				powerwriter_at_log(LOGE, "%s benchmark failed...\r\n", s.portName.c_str());
				continue;
			}
			powerwriter_at_log(LOGD, ">>>All passed...\r\n");
		}
		return ATErrorNone;
	}

	/* AT send data */
	bool OnSend(void * data, size_t size) {
		//object_print(data, size, "Send command");
		if (m_SerialPort.isOpened()) {
			return m_SerialPort.writeData((char *)data, size) == size;
		}
		return false;
	}

	/* Connect Device */
	bool ConnectSerialPort(
		std::string Device,
		int BaudRate = 256000,
		itas109::Parity Parity = itas109::Parity::ParityNone,
		itas109::DataBits DataBits = itas109::DataBits::DataBits8,
		itas109::StopBits StopBits = itas109::StopBits::StopOne
	){
		try
		{
			DisconnectSerialPort();
			m_SerialPort.init(Device.c_str(), BaudRate, Parity, DataBits, StopBits);
			m_SerialPort.open();
			if (m_SerialPort.isOpened()){
				return true;
			}
		}
		catch (const std::exception& e)
		{
			std::cout << e.what() << endl;
		}
		return false;
	}

	/* Close serial port */
	void DisconnectSerialPort()
	{
		try
		{
			if (m_SerialPort.isOpened())
			{
				m_SerialPort.close();
			}
		}
		catch (const std::exception& e){
			std::cout << e.what() << endl;
		}
	}

	/* public command */
public:

	/* private inner */
private:
	
	//recv data
	void OnReceve()
	{
		try
		{
			vector<char> m_curRead;
			int iRet = m_SerialPort.readAllData(m_curRead);
			if (iRet > 0) {
				//object_print(m_curRead.data(), iRet, "Recived data");
				powerwriter_at_datain(&this->m_ATCmdApp, m_curRead.data(), iRet);
			}
		}
		catch (const std::exception & ex)
		{
			std::cout << std::string("AT commander port exception: ") + ex.what();
		}
	}

private:
	S_ATChannel					m_ATCmdApp;			
	CSerialPort					m_SerialPort;
};