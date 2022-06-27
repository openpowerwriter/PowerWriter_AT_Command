#define _CRT_SECURE_NO_WARNINGS
#pragma once

#include <iostream>

/* A serial port */
#include "./CSerialPort/SerialPort.h"
#include "./CSerialPort/SerialPortInfo.h"
#include "./utils/NLock.h"
#include "./../../powerwriter_protocol.h"
#include "./../../powerwriter_firmware.h"
#include "./../../powerwriter_instruction_paser.h"


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


	S_WriterDateTime GetDateTime()
	{

		auto now = std::chrono::system_clock::now();
		uint64_t dis_millseconds = std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch()).count()
			- std::chrono::duration_cast<std::chrono::seconds>(now.time_since_epoch()).count() * 1000;
		time_t tt = std::chrono::system_clock::to_time_t(now);
		auto time_tm = localtime(&tt);
		
		S_WriterDateTime t;
		t.m_year = time_tm->tm_year + 1900;
		t.m_month = time_tm->tm_mon + 1;
		t.m_day = time_tm->tm_mday;

		t.m_hour = time_tm->tm_hour;
		t.m_minute = time_tm->tm_min;
		t.m_second = time_tm->tm_sec;
		t.m_millisecond = (uint32_t)dis_millseconds;

		t.m_timestamp = (uint32_t)tt;

		return t;
	}

	S_TinyDateTime GetTinyDateTime()
	{
		S_WriterDateTime m_datetime = GetDateTime();
		S_TinyDateTime   m_tinydatetime;

		m_tinydatetime.m_year = m_datetime.m_year - 2000;
		m_tinydatetime.m_month = m_datetime.m_month;
		m_tinydatetime.m_day = m_datetime.m_day;
		m_tinydatetime.m_hour = m_datetime.m_hour;
		m_tinydatetime.m_min = m_datetime.m_minute;
		m_tinydatetime.m_sec = m_datetime.m_second;
		m_tinydatetime.m_ms = m_datetime.m_millisecond;

		return m_tinydatetime;
	}

	/* Run test */
	void RunTest(uint8_t * pDataT,size_t sDataT)
	{
		vector<SerialPortInfo>  m_SerialPortInfo = CSerialPortInfo::availablePortInfos();
		LogPrint(LOG_DEBUG, "扫描到的串口信息汇总:\r\n");
		for (auto s : m_SerialPortInfo) {
			LogPrint(LOG_DEBUG, "端口号:%s\t端口描述:%s\r\n", s.portName.c_str(), s.description.c_str());
			if (!ConnectSerialPort(s.portName)) {
				LogPrint(LOG_ERROR, "初始化串口失败:%s\r\n", s.portName.c_str());
				continue;
			}
			if (!WriterCmdFindCurrent(&m_PowerWriterCmdApp)) {
				LogPrint(LOG_ERROR, "%s\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
				continue;
			}
			WriterPrintVersion(&m_PowerWriterCmdApp);
			break;
		}
		
		/* disconnect */
		if (!WriterCmdDisconnect(&m_PowerWriterCmdApp)) {
			LogPrint(LOG_ERROR, "%s\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}
		LogPrint(LOG_DEBUG, "Disconnect...\r\n");
		
		/* connect  */
		S_WriterDateTime t = GetDateTime();

		if (!WriterCmdConnect(&m_PowerWriterCmdApp,t)) {
			LogPrint(LOG_ERROR, "%s\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}
		LogPrint(LOG_DEBUG, "connected..\r\n");
		
		/* get status */
		bool running = true;
		S_cmdWriterStatusRsp m_status;
		while (WriterCmdGetStatus(&m_PowerWriterCmdApp, &m_status) && running) {
			switch (m_status.m_WriterStatus) {
			case WriterStatusIdle:
				running = false;
				break;
			case WriterStatusBusy:
				LogPrint(LOG_DEBUG, "Progress :%.02f \tLastError:%s\t\r\n", ((float)m_status.m_WriterProgress.m_processed / m_status.m_WriterProgress.m_total) * 100
				,	WriterGetLastErrorString(&m_PowerWriterCmdApp));
				LogPrint(LOG_DEBUG, "UID Records:%d,%d,[", m_status.m_TargetRecords.m_uidEnable, m_status.m_TargetRecords.m_uidSize);
				for (size_t i = 0;i< m_status.m_TargetRecords.m_uidSize;i++){
					LogPrint(LOG_NORMAL, "%02X", m_status.m_TargetRecords.m_uid[i]);
				}
				LogPrint(LOG_NORMAL, "]\r\n");
				break;
			}

			switch (m_status.m_TargetRecords.m_status)
			{
			case StatusOffline:
				LogPrint(LOG_NORMAL, "target offline\r\n");
				break;
			case StatusOnline:
				LogPrint(LOG_NORMAL, "target online\r\n");
				break;
			case StatusOnlineError:
				LogPrint(LOG_NORMAL, "target online but mismatch ! \r\n");
				break;
			}
		}

		/* set & get writer user data */
		S_WriterUserData data;
		powerwriter_rand(&data.m_usrData, sizeof(data.m_usrData));
		WriterSetUserData(&m_PowerWriterCmdApp, data.m_usrData, sizeof(data.m_usrData));

		if (!WriterCmdWriteUserData(&m_PowerWriterCmdApp)) {
			LogPrint(LOG_ERROR, "Writer set user data failed, %s ..\r\n",WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}
		LogPrint(LOG_DEBUG, "Writer set user data ok...\r\n");

		if (!WriterCmdReadUserData(&m_PowerWriterCmdApp)) {
			LogPrint(LOG_ERROR, "Writer get user data failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}
		LogPrint(LOG_DEBUG, "Writer get user data ok...\r\n");

		S_WriterUserData * usrd = WriterGetUserData(&m_PowerWriterCmdApp);
		if ((!usrd) || memcmp(usrd->m_usrData, data.m_usrData, sizeof(data.m_usrData))) {
			LogPrint(LOG_ERROR, "Writer user data verify failed ..\r\n");
			return;
		}
		LogPrint(LOG_ERROR, "Writer user data verify passed ..\r\n");

		/* set writer config */
		U_WriterConfig * cfg = WriterGetConfig(&m_PowerWriterCmdApp);

		WriterSetCfgVersion(cfg, WriterVersion1);								
		WriterSetCfgEraseType(cfg, sectorErase);						
		WriterSetCfgVoltageType(cfg, VDD50V);
		WriterSetCfgSpeedType(cfg, Speed10Mhz);
		WriterSetCfgSpeakerType(cfg, SpeakerVocal);
		WriterSetCfgOptionByteType(cfg, OBFactory2Nop);

		S_WriterSNType * cfg1 = WriterGetCfgSNType(cfg);
		cfg1->m_enable = WriterEnable;
		cfg1->m_start = 1;
		cfg1->m_step = 4;
		cfg1->m_addr = 0x08003000;
		cfg1->m_endian = WriterLittleEndian;
		WriterSetCfgSNType(cfg, cfg1);

		S_WriterDateTimeType * cfg2 = WriterGetCfgDateTimeType(cfg);
		cfg2->m_type = WriterDateTimeString;
		cfg2->m_addr = 0x08004500;
		WriterSetCfgDateTimeType(cfg, cfg2);

		S_WriterAccessType * cfg3 = WriterGetCfgAccessType(cfg);
		cfg3->m_numOfTimeslimit.m_numOfTimeslimitEnable = WriterEnable;
		cfg3->m_numOfTimeslimit.m_numOfTimeslimit = 145;
		cfg3->m_snlimit.m_enable = WriterEnable;
		for (size_t i = 0; i < ARRAYSIZE(cfg3->m_snlimit.m_SN); i++) {
			cfg3->m_snlimit.m_SN[i].m_itemEnable = WriterEnable;
			powerwriter_rand_hexstring(cfg3->m_snlimit.m_SN[i].m_itemSN, sizeof(cfg3->m_snlimit.m_SN[i].m_itemSN) - 1);
		}
		cfg3->m_uidlimit.m_enable = WriterEnable;
		powerwriter_rand(cfg3->m_uidlimit.m_idl, sizeof(cfg3->m_uidlimit.m_idl));
		powerwriter_rand(cfg3->m_uidlimit.m_idh, sizeof(cfg3->m_uidlimit.m_idh));

		WriterSetCfgAccessType(cfg, cfg3);

		S_WriterAutoType * cfg4 = WriterGetCfgAutoType(cfg);
		cfg4->m_targetAutoCheck = WriterEnable;
		cfg4->m_targetInsertDelay = 250;
		cfg4->m_targetTakeoutDelay = 260;
		WriterSetCfgAutoType(cfg, cfg4);

		S_TargetControlType * cfg5 = WriterGetCfgControlType(cfg);
		cfg5->m_rst = TargetRstKeepHigh;
		cfg5->m_ctrl = TargetCtrlPowerOff;
		cfg5->m_poweroffDelay = 123;
		cfg5->m_poweronDelay = 456;
		WriterSetCfgControlType(cfg, cfg5);

		S_TargetLicenseType * cfg6 = WriterGetCfgLicenseType(cfg);
		cfg6->m_matrix.m_enable = WriterEnable;
		cfg6->m_matrix.m_lockcfg = WriterEnable;
		cfg6->m_matrix.m_endian = WriterLittleEndian;
		cfg6->m_matrix.m_licAddr = 0x08004567;
		cfg6->m_matrix.m_userKeySize = 12;
		powerwriter_rand(cfg6->m_matrix.m_userKey, sizeof(cfg6->m_matrix.m_userKey));
		powerwriter_rand(cfg6->m_matrix.m_insData, sizeof(cfg6->m_matrix.m_insData));

		cfg6->m_icwkey.m_enable = WriterEnable;
		cfg6->m_icwkey.m_lockcfg = WriterEnable;
		cfg6->m_icwkey.m_licAddr = 0x08104567;
		strcpy((char *)cfg6->m_icwkey.m_project, "PW_LIC_KEY");
		powerwriter_rand(cfg6->m_icwkey.m_key, sizeof(cfg6->m_icwkey.m_key));
		powerwriter_rand(cfg6->m_icwkey.m_iv, sizeof(cfg6->m_icwkey.m_iv));

		cfg6->m_online.m_enable = WriterEnable;
		cfg6->m_online.m_lockcfg = WriterEnable;
		cfg6->m_online.m_authType = AuthorizedServer;
		strcpy((char *)cfg6->m_online.m_authUrl, "https://www.license.icworksop.com");
		powerwriter_rand_hexstring(cfg6->m_online.m_authKey, sizeof(cfg6->m_online.m_authKey) - 1);
		WriterSetCfgLicenseType(cfg, cfg6);
		
		WriterPrintConfig(cfg);
		
		U_WriterConfig configbak = *cfg;
		/* Set writer config */
		if (!WriterCmdSetConfig(&m_PowerWriterCmdApp)) {
			LogPrint(LOG_ERROR, "Writer set config failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return ;
		}
		LogPrint(LOG_DEBUG, "Writer set config ok ..\r\n");
		
		/* Get writer config */
		if (!WriterCmdGetConfig(&m_PowerWriterCmdApp)) {
			LogPrint(LOG_ERROR, "Writer get config failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}
		LogPrint(LOG_DEBUG, "Writer get config ok ..\r\n");

		/* verify */
		if (memcmp(&configbak, WriterGetConfig(&m_PowerWriterCmdApp),sizeof(configbak)) ) {
			LogPrint(LOG_ERROR, "Writer config verify failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}
		LogPrint(LOG_DEBUG, "Writer config verify ok ..\r\n");

		/* offline load */
		if (!WriterCmdOfflineChEnable(&m_PowerWriterCmdApp, WriterDisable)) {
			LogPrint(LOG_ERROR, "Writer offline disbale failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}
		LogPrint(LOG_DEBUG, "Writer offline disbale ok ..\r\n");

		powerwriter_rand(pDataT, sDataT);

		S_ProjectInfo				info;
		info.m_password		= 0x12345678;
		info.m_totalsize	= sDataT;
		info.m_crc32			= crc32(pDataT, info.m_totalsize);

		uint32_t						percentage_t,percentage = 0;
		uint32_t						pkgsize = 0;
		uint32_t						sended	= 0;
		uint32_t						remain	= info.m_totalsize;
		uint32_t						loops		= info.m_totalsize / CONST_MAX_PACKAGE_SIZE;
		if (info.m_totalsize % CONST_MAX_PACKAGE_SIZE) {
			loops += 1;
		}
		if (WriterCmdOfflineChWriteStart(&m_PowerWriterCmdApp, info)) {
			for (uint32_t loop = 0; loop < loops; loop ++) {
				pkgsize = remain >= CONST_MAX_PACKAGE_SIZE ? CONST_MAX_PACKAGE_SIZE : remain;
				if (WriterCmdOfflineChWriteSend(&m_PowerWriterCmdApp, pDataT + sended, pkgsize)) {
					remain -= pkgsize;
					sended += pkgsize;
					percentage_t = (uint32_t)( sended * 100.0f / info.m_totalsize);
					if (percentage_t != percentage) {
						percentage = percentage_t;
						LogPrint(LOG_ERROR, "Writer offline load %d%% ..\r\n", percentage);
					}
				}
				else {
					LogPrint(LOG_ERROR, "Writer offline load failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
					break;
				}
			}
		}
		else {
			LogPrint(LOG_ERROR, "Writer offline load failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}
		LogPrint(LOG_DEBUG, "Writer offline load ok ..\r\n");

		if (!WriterCmdOfflineChEnable(&m_PowerWriterCmdApp, WriterEnable)) {
			LogPrint(LOG_ERROR, "Writer offline enable failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}
		LogPrint(LOG_DEBUG, "Writer offline enable ok ..\r\n");

		/* offline read */
		const S_FilePackage * m_fpkg;
		if (WriterCmdOfflineChRead(&m_PowerWriterCmdApp, 0xABCDEF67, PackageStart, &m_fpkg)) 
		{
			uint32_t	total,recived;
			do 
			{
				total = m_fpkg->m_total;
				recived = m_fpkg->m_sended;
				LogPrint(LOG_DEBUG, "progress : %.02f\t pack: %d\t crc32: 0x%08X ..\r\n", recived * 100.0 / total,m_fpkg->m_size, 
					crc32(m_fpkg->m_data, m_fpkg->m_size));
			} while (WriterCmdOfflineChRead(&m_PowerWriterCmdApp, 0xABCDEF67, PackageContinue, &m_fpkg));
			if (total == recived) {
				LogPrint(LOG_DEBUG, "Writer offline read passed ...\r\n");
			}
			else {
				LogPrint(LOG_ERROR, "Writer offline read failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
				return;
			}
		}
		else {
			LogPrint(LOG_ERROR, "Writer offline read failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}

		/* disk DIR test */
		S_FileAttribute m_attr;
		if (WriterCmdFileFindFirst(&m_PowerWriterCmdApp, "/", &m_attr)) {
			do
			{
				LogPrint(LOG_DEBUG, "name: %s \t type: %s \t size: %llu \t..\r\n", 
					(const char *)m_attr.m_name, 
					FILE_ATTR_CHK(m_attr.m_attr, F_ATTR_FILE) ? "file":"directory",
					m_attr.m_size);
			} while (WriterCmdFileFindNext(&m_PowerWriterCmdApp, &m_attr));
			/* find close */
			WriterCmdFileFindClose(&m_PowerWriterCmdApp);
		}
		else {
			LogPrint(LOG_ERROR, "Writer find file failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}

		/* hash file */
		uint32_t	hash;
		if (WriterCmdFileHash(&m_PowerWriterCmdApp, "/ Blue 4K HD.mp4", &hash, [](int percent) {
			LogPrint(LOG_DEBUG, "Writer hash file percent %d%% ..\r\n", percent);
		})) {
			LogPrint(LOG_DEBUG, "Writer hash file OK 0x%08X  ..\r\n", hash);
		}
		else {
			LogPrint(LOG_ERROR, "Writer hash file failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}

		/* delete file or directory */
		if (!WriterCmdFileDelete(&m_PowerWriterCmdApp, "/ Blue 4K HD.mp4")) {
			LogPrint(LOG_ERROR, "Delete file failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}
		LogPrint(LOG_DEBUG, "Delete file OK ...\r\n");
		
		/* create directory */
		uint32_t	attr = F_ATTR_DIR | F_ATTR_WR;
		if (!WriterCmdFileCreate(&m_PowerWriterCmdApp, "/application/launch", attr,NULL)) {
			LogPrint(LOG_ERROR, "Create directory failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}
		LogPrint(LOG_DEBUG, "Create directory OK ...\r\n");

		/* create file for write */
		attr = F_ATTR_FILE | F_ATTR_WR;
		PWHANDLE	handle;
		if (WriterCmdFileCreate(&m_PowerWriterCmdApp, "/application/launch/launch.json", attr, &handle)) {
			LogPrint(LOG_DEBUG, "Create file OK ...\r\n");

			powerwriter_rand(pDataT, sDataT);
		
			percentage_t = 0, percentage = 0;
			pkgsize = 0;
			sended = 0;
			remain = sDataT;
			loops = sDataT / CONST_MAX_PACKAGE_SIZE;
			if (sDataT % CONST_MAX_PACKAGE_SIZE) {
				loops += 1;
			}
			for (uint32_t loop = 0; loop < loops; loop++) {
				pkgsize = remain >= CONST_MAX_PACKAGE_SIZE ? CONST_MAX_PACKAGE_SIZE : remain;
				if (WriterCmdFileWrite(&m_PowerWriterCmdApp, handle, pDataT + sended, pkgsize)) {
					remain -= pkgsize;
					sended += pkgsize;
					percentage_t = (uint32_t)(sended * 100.0f / info.m_totalsize);
					if (percentage_t != percentage) {
						percentage = percentage_t;
						LogPrint(LOG_ERROR, "Writer write file %d%% ..\r\n", percentage);
					}
				}
				else {
					LogPrint(LOG_ERROR, "Writer write file failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
					break;
				}
			}
			/* close file for read or write */
			if (WriterCmdFileClose(&m_PowerWriterCmdApp, handle)) {
				LogPrint(LOG_DEBUG, "Write file done ...\r\n");
			}
			else {
				LogPrint(LOG_ERROR, "Writer write file failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
				return;
			}
		} 
		else{
			LogPrint(LOG_ERROR, "Create file failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}
		
		/* file read */
		attr = F_ATTR_FILE | F_ATTR_RD;
		if (WriterCmdFileCreate(&m_PowerWriterCmdApp, "/application/launch/launch.json", attr, &handle)) 
		{
			LogPrint(LOG_DEBUG, "Open file OK ...\r\n");
			uint32_t	total, recived;

			 while (WriterCmdFileRead(&m_PowerWriterCmdApp, handle, &m_fpkg)) {
				total = m_fpkg->m_total;
				recived = m_fpkg->m_sended;
				LogPrint(LOG_DEBUG, "read file progress : %.02f\t pack: %d\t..\r\n", recived * 100.0 / total, m_fpkg->m_size);

			}

			 /* close file for read or write */
			 if (WriterCmdFileClose(&m_PowerWriterCmdApp, handle)) {
				 LogPrint(LOG_DEBUG, "read file close done ...\r\n");
			 }
			 else {
				 LogPrint(LOG_ERROR, "read file close failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
				 return;
			 }

			if (total == recived) {
				LogPrint(LOG_DEBUG, "read file passed ...\r\n");
			}
			else {
				LogPrint(LOG_ERROR, "read file failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
				return;
			}
		}
		else {
			LogPrint(LOG_ERROR, "read file failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}

		/* device upgrade */

		S_UpdateTag				m_tag;

		S_UpgradeStart		m_fwStart;
		S_UpgradeSend			m_fwSend;
		S_UpgradeEnd			m_fwEnd;

		S_FWUStatus				m_fwStatus;

		static const auto m_showUpdateTypeCb = [&](S_UpdateTag * tag) {
			if (tag)
			{
				LogPrint(LOG_ERROR, "Device upgrade type:");
				switch (tag->m_device)
				{
				case Writer4CoreArm:
					LogPrint(LOG_NORMAL, "Core device\t");
					break;
				case Writer4ChannelArm:
					LogPrint(LOG_NORMAL, "Channel device\t");
					break;
				case DeviceUSBWL:
					LogPrint(LOG_NORMAL, "USB wireless device\t");
					break;
				case DeviceICWKey:
					LogPrint(LOG_NORMAL, "ICWKey device\t");
					break;
				default:
					break;
				}
				LogPrint(LOG_NORMAL, "Firmware type:");
				switch (tag->m_fwType)
				{
				case Boot:
					LogPrint(LOG_NORMAL, "boot\t");
					break;
				case Bootloader:
					LogPrint(LOG_NORMAL, "bootloader\t");
					break;
				case Application:
					LogPrint(LOG_NORMAL, "application\t");
					break;
				default:
					break;
				}
				LogPrint(LOG_NORMAL, "\r\n");
			}
		};
		static const auto m_procUpdateRsp = [&](S_FWUStatus * rsp) -> bool {
			if (rsp) {
				if (rsp->m_reboot) {
					LogPrint(LOG_DEBUG, "PowerWriter diconnected ...\r\n");
					LogPrint(LOG_DEBUG, "PowerWriter rebooting ...\r\n");
				}
				if (rsp->m_waitdelay) {

					LogPrint(LOG_DEBUG, "PowerWriter upgrade delay %d ms...\r\n",rsp->m_waitdelay);
					Sleep(rsp->m_waitdelay);
				}
				if (rsp->m_reboot) {
					LogPrint(LOG_DEBUG, "PowerWriter connected ...\r\n");
				}
				return true;
			}
			return false;
		};

		/* init */
		m_tag.m_device = DeviceICWKey;
		m_tag.m_fwType = Application;
		
		m_fwStart.m_address = 0x08000000;
		m_fwStart.m_newVersion.m_majorVersion = 0x01;
		m_fwStart.m_newVersion.m_childVersion = 0x03;
		m_fwStart.m_newVersion.m_patchVersion = 0x04;
		m_fwStart.m_tag = m_tag;
		m_fwStart.m_totalSize = sDataT;
		m_fwStart.m_crc32 = crc32(pDataT, m_fwStart.m_totalSize);
		
		m_showUpdateTypeCb((S_UpdateTag *)&m_fwStart);
		if (WriterCmdUpgradeStart(&m_PowerWriterCmdApp, &m_fwStart, &m_fwStatus)) {
			if (!m_procUpdateRsp(&m_fwStatus)) {
				return;
			}
			percentage_t = 0, percentage = 0;
			pkgsize = 0;
			sended = 0;
			remain = m_fwStart.m_totalSize;
			loops = m_fwStart.m_totalSize / CONST_MAX_PACKAGE_SIZE;
			if (m_fwStart.m_totalSize % CONST_MAX_PACKAGE_SIZE) {
				loops += 1;
			}

			for (uint32_t loop = 0; loop < loops; loop++) {
				pkgsize = remain >= CONST_MAX_PACKAGE_SIZE ? CONST_MAX_PACKAGE_SIZE : remain;

				m_fwSend.m_tag = m_tag;
				m_fwSend.m_size = pkgsize;
				memcpy(m_fwSend.m_data, pDataT + sended, pkgsize);

				if (WriterCmdUpgradeSend(&m_PowerWriterCmdApp, &m_fwSend, &m_fwStatus)) {
					if (!m_procUpdateRsp(&m_fwStatus)) {
						return;
					}
					remain -= pkgsize;
					sended += pkgsize;
					percentage_t = (uint32_t)(sended * 100.0f / info.m_totalsize);
					if (percentage_t != percentage) {
						percentage = percentage_t;
						LogPrint(LOG_ERROR, "Writer update %d%% ..\r\n", percentage);
					}
				}
				else {
					LogPrint(LOG_ERROR, "Writer update failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
					break;
				}
			}
			/* close file for read or write */
			if (WriterCmdUpgradeEnd(&m_PowerWriterCmdApp, &m_fwEnd, &m_fwStatus)) {
				m_procUpdateRsp(&m_fwStatus);
				LogPrint(LOG_DEBUG, "Writer update done ...\r\n");
			}
			else {
				LogPrint(LOG_ERROR, "Writer update failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
				return;
			}
		}
		else {
			LogPrint(LOG_ERROR, "Writer update failed, %s ..\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
			return;
		}

		/**
		 * Factory 
		 */
		S_TinyDateTime			datetime = GetTinyDateTime();
		S_PowerWriterSNStr	SN;
		S_PowerWriterSNData	SNRAW;
		powerwriter_sn_generator((uint32_t)Writer4CoreArm, "ICW", datetime, &SN);
		powerwriter_sn_parser(SN.m_sn_string, &SNRAW);

		S_cmdFactoryConfig config;

		config.m_cfgType = WriterCfg;
		config._cfg.m_cfgWriter.m_hardwareVer.m_majorVersion = 1;
		config._cfg.m_cfgWriter.m_hardwareVer.m_childVersion = 3;
		config._cfg.m_cfgWriter.m_hardwareVer.m_patchVersion = 7;
		
		memcpy(config._cfg.m_cfgWriter.m_sn,SN.m_sn_string,sizeof(SN.m_sn_string));
		config._cfg.m_cfgWriter.m_writerType = Writer4CoreArm;


		if (WriterCmdFactoryConfig(&m_PowerWriterCmdApp, &config)) {
			LogPrint(LOG_DEBUG, "Device factory config passed ...\r\n");
		}
		else {
			LogPrint(LOG_ERROR, "Device factory config failed, %s ...\r\n", WriterGetLastErrorString(&m_PowerWriterCmdApp));
		}
		if (WriterCmdFactoryTest(&m_PowerWriterCmdApp, 5000)) {
			LogPrint(LOG_DEBUG, "Device factory test passed ...\r\n");
		}
		else {
			LogPrint(LOG_ERROR, "Device factory test failed, %s ...\r\n",WriterGetLastErrorString(&m_PowerWriterCmdApp));
		}
		/* firmware packer */
		LogPrint(LOG_DEBUG, "firmware pack c++ test start...\r\n", );
		CFirmwarePackage m_pack;
		m_pack.SetDeviceType(Writer4ChannelArm);
		if (m_pack.SetBootFirmware("./../boot.hex") &&
			m_pack.SetBootloaderFirmware("./../bootloader.hex") &&
			m_pack.SetApplicationFirmware("./../sgim_url_usr.bin", 0x08001345))
		{
			if (m_pack.Packfirmweare("../PowerWriter_core_v1.0.0.ufw")) {
				LogPrint(LOG_DEBUG, "firmware pack c++ test passed...\r\n", );
				if (m_pack.Unpackfirmware("../PowerWriter_core_v1.0.0.ufw")) {
					LogPrint(LOG_DEBUG, "firmware unpack c++ test passed...\r\n" );
				}
			}
			else {
				LogPrint(LOG_ERROR, "firmware pack c++ test failed!...\r\n" );
			}
		}
		else {
			LogPrint(LOG_ERROR, "firmware pack c++ test failed!...\r\n" );
		}

		/* firmware reader C-Mode */
		LogPrint(LOG_DEBUG, "firmware reader c mode test start...\r\n" );
		FILE * ufw = fopen("../PowerWriter_core_v1.0.0.ufw", "rb");
		if (ufw) {
			/* read header */
			S_FirmwareHeader m_fw_header;
			if (sizeof(m_fw_header) == fread(&m_fw_header, 1, sizeof(m_fw_header), ufw)) {
				LogPrint(LOG_DEBUG, "firmware reader c mode header readed...\r\n", );
				powerwriter_decrypt(&m_fw_header, sizeof(m_fw_header),CONST_ENCRYPT_FILE_KEY);
				if (0 == strcmp(m_fw_header.m_filetype, FILE_TYPE_UFW)) {

					LogPrint(LOG_DEBUG, "firmware reader c mode file is firmware package ...\r\n", );
					LogPrint(LOG_DEBUG, "firmware reader c mode device type: %s ...\r\n", m_fw_header.m_deviceType == Writer4ChannelArm ? "Channel firmware":"Others");
					LogPrint(LOG_DEBUG, "firmware reader c mode(boot       ):ver:%d.%d.%d\tsize:%d\taddr:0x%08x\tcrc:0x%08x ...\r\n",
						m_fw_header.m_boot.m_ver.m_majorVersion, m_fw_header.m_boot.m_ver.m_childVersion, m_fw_header.m_boot.m_ver.m_patchVersion,
						m_fw_header.m_boot.m_size, m_fw_header.m_boot.m_address, m_fw_header.m_boot.m_crc);
					LogPrint(LOG_DEBUG, "firmware reader c mode(bootloader ):ver:%d.%d.%d\tsize:%d\taddr:0x%08x\tcrc:0x%08x ...\r\n",
						m_fw_header.m_bootloader.m_ver.m_majorVersion, m_fw_header.m_bootloader.m_ver.m_childVersion, m_fw_header.m_bootloader.m_ver.m_patchVersion,
						m_fw_header.m_bootloader.m_size, m_fw_header.m_bootloader.m_address, m_fw_header.m_bootloader.m_crc);
					LogPrint(LOG_DEBUG, "firmware reader c mode(application):ver:%d.%d.%d\tsize:%d\taddr:0x%08x\tcrc:0x%08x ...\r\n",
						m_fw_header.m_application.m_ver.m_majorVersion, m_fw_header.m_application.m_ver.m_childVersion, m_fw_header.m_application.m_ver.m_patchVersion,
						m_fw_header.m_application.m_size, m_fw_header.m_application.m_address, m_fw_header.m_application.m_crc);

					uint8_t		m_buffer[CONST_MAX_PACKAGE_SIZE];
					uint32_t	m_crc_verify, m_total_size, m_key , frame;
					/* read boot / boot loader /application */
					for(int i = 0;i < 3;i++){

						S_FirmwareItemInfo * pinfo = (&m_fw_header.m_boot) + i;

						m_key = CONST_ENCRYPT_FILE_KEY;
						m_total_size = pinfo->m_size;
						m_crc_verify = 0;
						while (m_total_size > 0) {
							frame = MIN(m_total_size, CONST_MAX_PACKAGE_SIZE);
							if (frame == fread(m_buffer, 1, frame, ufw)) {
								m_key = powerwriter_decrypt(m_buffer, frame, m_key);
								if (m_crc_verify == 0) {
									m_crc_verify = crc32(m_buffer, frame);
								}
								else {
									m_crc_verify = crc32_continue(m_crc_verify, m_buffer, frame);
								}
							}
							m_total_size -= frame;
						}
						if (m_crc_verify == pinfo->m_crc) {
							switch (i)
							{
							case 0:LogPrint(LOG_DEBUG, "firmware reader c mode boot verify ok ...\r\n", );	break;
							case 1:LogPrint(LOG_DEBUG, "firmware reader c mode boot loader verify ok ...\r\n", );	break;
							case 2:LogPrint(LOG_DEBUG, "firmware reader c mode application verify ok ...\r\n", );	break;
							default:
								break;
							}
							
						}
					}
				}
			}
			fclose(ufw);
		}

		/* matrix IL */
		size_t	uid_size  = 32;
		std::string m_code_string = "//The following code may have a warning, please ignore\n\
static void ChipUIDAlgo(uint8_t userid[], uint8_t chipid[], uint8_t unilic[])\n\
{\n\
\tunilic[0] = chipid[28] ^ chipid[27] | userid[10] * chipid[26] + chipid[15] & userid[5] - userid[3] ^ chipid[18]  ;\n\
\tunilic[1] = chipid[8] & chipid[25] + userid[11] | userid[1] - userid[18] * userid[26] | userid[27] - userid[20]  ;\n\
\tunilic[2] = chipid[5] & userid[2] * userid[14] ^ chipid[21] + userid[31] * userid[17] - userid[28] + userid[8]  ;\n\
\tunilic[3] = userid[9] ^ userid[30] & chipid[12] | chipid[13] & chipid[2] * chipid[16] + userid[12] | userid[22]  ;\n\
\tunilic[4] = userid[7] ^ chipid[14] - userid[19] | chipid[10] & chipid[24] * chipid[20] - chipid[23] ^ chipid[17]  ;\n\
\tunilic[5] = chipid[9] + userid[29] - chipid[31] ^ chipid[7] * userid[23] + chipid[29] | chipid[0] & userid[13]  ;\n\
\tunilic[6] = userid[21] & userid[6] + chipid[11] * chipid[1] ^ userid[16] - chipid[30] | userid[0] | userid[24]  ;\n\
\tunilic[7] = chipid[19] * chipid[4] ^ chipid[6] - userid[15] + chipid[22] & chipid[3] ^ userid[25] - userid[4]  ;\n\
\tunilic[8] = userid[5] + userid[0] * chipid[4] | chipid[12] & userid[20] & userid[26] * chipid[27] - userid[31]  ;\n\
\tunilic[9] = chipid[29] ^ userid[1] | chipid[3] + userid[16] & chipid[6] ^ userid[15] - chipid[1] + chipid[7]  ;\n\
\tunilic[10] = userid[8] | userid[13] * chipid[24] ^ chipid[26] | userid[23] & chipid[8] + chipid[28] * userid[7]  ;\n\
\tunilic[11] = userid[18] - chipid[19] | chipid[18] + chipid[30] * chipid[16] & chipid[5] ^ chipid[9] - userid[30]  ;\n\
\tunilic[12] = userid[6] | userid[12] + chipid[10] & userid[4] * chipid[11] ^ userid[9] - chipid[25] ^ userid[24]  ;\n\
\tunilic[13] = userid[11] - chipid[31] + userid[2] * userid[29] & userid[3] | chipid[23] ^ chipid[2] | userid[10]  ;\n\
\tunilic[14] = userid[28] + chipid[15] * chipid[21] & chipid[22] - chipid[17] ^ chipid[14] * chipid[13] + userid[19]  ;\n\
\tunilic[15] = userid[22] | chipid[20] & userid[21] - userid[17] + userid[14] ^ userid[25] * userid[27] - chipid[0]  ;\n\
\tunilic[16] = userid[2] & userid[9] | userid[11] | chipid[18] ^ chipid[23] + chipid[19] * chipid[31] & userid[21]  ;\n\
\tunilic[17] = chipid[8] - chipid[25] * userid[31] & userid[22] ^ userid[4] + chipid[30] | chipid[3] - chipid[5]  ;\n\
\tunilic[18] = userid[24] * chipid[24] + chipid[9] ^ userid[26] | chipid[11] & userid[6] - chipid[16] & userid[30]  ;\n\
\tunilic[19] = userid[28] | userid[25] - userid[1] * userid[12] + chipid[21] ^ chipid[2] * userid[20] ^ userid[7]  ;\n\
\tunilic[20] = chipid[1] & userid[29] + chipid[17] | userid[19] - userid[5] | userid[18] * chipid[13] & chipid[22]  ;\n\
\tunilic[21] = chipid[27] ^ chipid[7] + chipid[20] - chipid[10] - userid[16] + chipid[26] & chipid[14] ^ userid[15]  ;\n\
\tunilic[22] = chipid[28] * userid[14] | chipid[0] ^ chipid[4] | chipid[12] * chipid[6] & userid[27] + userid[13]  ;\n\
\tunilic[23] = userid[0] - userid[3] * userid[10] & chipid[29] + userid[8] | chipid[15] ^ userid[23] - userid[17]  ;\n\
\tunilic[24] = chipid[20] * chipid[25] - chipid[15] | chipid[6] ^ chipid[19] & chipid[9] + chipid[24] ^ chipid[1]  ;\n\
\tunilic[25] = chipid[14] + chipid[16] - userid[13] & userid[11] | chipid[10] * userid[21] ^ chipid[29] & chipid[12]  ;\n\
\tunilic[26] = userid[26] + userid[0] | chipid[8] * userid[12] - userid[24] | chipid[17] - chipid[0] & chipid[4]  ;\n\
\tunilic[27] = userid[23] ^ chipid[23] + chipid[18] * userid[25] * chipid[3] + userid[2] & userid[17] ^ chipid[28]  ;\n\
\tunilic[28] = chipid[13] | userid[10] - chipid[5] - userid[7] ^ userid[9] | chipid[21] * userid[16] & userid[15]  ;\n\
\tunilic[29] = chipid[11] + userid[8] | chipid[2] & userid[14] - userid[22] + userid[30] * userid[19] ^ userid[3]  ;\n\
\tunilic[30] = chipid[7] + userid[20] & userid[1] - userid[27] | userid[6] * chipid[27] ^ chipid[22] ^ userid[18]  ;\n\
\tunilic[31] = userid[5] * userid[28] + chipid[26] & userid[29] | chipid[31] - userid[4] * userid[31] - chipid[30]  ;\n\
}\n"; //PowerWriterUIDMatrix::GetRandCode(uid_size);
		LogPrint(LOG_DEBUG, "%s",m_code_string.c_str());
		/* matrix IL complier */
		std::vector<uint8_t>	m_code_il;


		if(PowerWriterUIDMatrix::Compile(m_code_string, m_code_il)){
			LogPrint(LOG_DEBUG, "Compling ok...\r\n");
			powerwriter_object_print(m_code_il.data(), m_code_il.size(), "m_code_il");
		}
		std::string m_code_string_decomplie;
		if (PowerWriterUIDMatrix::Decompile(m_code_il, m_code_string_decomplie)) {
			LogPrint(LOG_DEBUG, "%s", m_code_string_decomplie.c_str());
		}
		if (m_code_string_decomplie == m_code_string) {
			LogPrint(LOG_DEBUG, "UID Matrix verify done ... \r\n");
		}
		else {
			LogPrint(LOG_DEBUG, "UID Matrix verify failed ... \r\n");
		}

		uint8_t chipID[32] = {
			0xBD, 0xFA, 0xD4, 0x81, 0xF7, 0x8E, 0x93, 0x1A,
			0xF0, 0xA0, 0xAB, 0x28, 0x02, 0xEC, 0x79, 0xE4,
			0x9C, 0xFD, 0xEF, 0xCC, 0x4D, 0xF0, 0x41, 0x8D,
			0x1E, 0x7C, 0xE1, 0x26, 0x25, 0x2F, 0xAE, 0x4B,
		}, userID[32] = {
			0x57, 0xFA, 0x69, 0x07, 0x9E, 0xF0, 0x68, 0xA6,
			0x2C, 0x4B, 0x8E, 0xD2, 0x0E, 0xB0, 0x7A, 0xFC,
			0x04, 0xB4, 0xFF, 0xFE, 0x90, 0x9E, 0xD4, 0xFE,
			0x4D, 0x6E, 0x8D, 0x95, 0x82, 0x1F, 0xCA, 0x30,
		}, licID[32];
		//powerwriter_rand(chipID, sizeof(chipID));
		//powerwriter_rand(userID, sizeof(userID));
		if (UIDMatrixCalc(chipID, userID, m_code_il.data(), licID)) {
			LogPrint(LOG_DEBUG, "UID Matrix calc done ... \r\n");
		}

		powerwriter_object_print(chipID, sizeof(chipID), "chipID");
		powerwriter_object_print(userID, sizeof(userID), "userID");
		powerwriter_object_print(licID, sizeof(licID), "licID");


}

	/* send data */
	bool OnSend(void * data, size_t size) {
		if (m_SerialPort.isOpened()) {
			return m_SerialPort.writeData((char *)data, size) == size;
		}
		return false;
	}

	/* Config commander */
	void ConfigCommander(
		E_DeviceType writerType,
		E_WriterLocaleType locale,
		uint32_t	 commandKey,
		WriterCmdDataOutCallback pfOut,
		WriterCmdEventCallback pfEvent
	)
	{
		WriterSetCmdConfig(&m_PowerWriterCmdApp, writerType, locale,  commandKey, pfOut, pfEvent);
	}

	/* Connect Device */
	bool ConnectSerialPort(
		std::string Device,
		int BaudRate = CONST_PORT_DEFAULT_RATE,
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
				WriterCmdFillDataInterrupt(&m_PowerWriterCmdApp, (uint8_t *)m_curRead.data(), iRet);
			}
		}
		catch (const std::exception & ex)
		{
			std::cout << std::string("Writer exception: ") + ex.what();
		}
	}


private:

	S_WriterCmdApp					m_PowerWriterCmdApp;			
	CSerialPort							m_SerialPort;
};