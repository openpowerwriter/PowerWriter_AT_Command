using System;
using powerwriter_at_type;
using powerwriter_at_app;
using powerwriter_at_config;
using powerwriter_at_log;
using powerwriter_at_error;
using System.Text;
using System.Threading;

namespace powerwriter_at_sample
{
    using UInt8 = System.Byte;
    internal class Program
    {
        public static void printBuffer(UInt8[] buff, UInt32 buffLen)
        {
            UInt32 totail = (UInt32)Math.Min(buffLen, buff.Length);
            UInt32 lineCount = totail / 16;
            if (lineCount * 16 < totail)
                lineCount++;

            for (int nLine = 0; nLine < lineCount; nLine++)
            {
                string tmp = "";
                for (int i = 0; i < 16; i++)
                {
                    if (nLine * 16 + i < totail)
                    {
                        tmp += string.Format("{0:X2} ", buff[nLine * 16 + i]);
                    }
                }
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, tmp);
            }
        }

        static void Main(string[] args)
        {
            PW_At_App.PwAtIntroduction();
            //PW_At_App.PwAtBenchmark(false);

            string portName = "com40";
            if (!PW_At_App.PwAtInit(portName, PW_At_Constants.PW_AT_DEFAULT_BAUDRATE, false))
            {
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGE, "Power Writer init fail! {0}", portName);
                return;
            }

            S_ATCmdRspWriterInfo info = new S_ATCmdRspWriterInfo();
            if (!PW_At_App.PwAtGetWriterinfo(ref info))
            {
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGE, "Get Power Writer info fail! {0}", PW_At_App.PwAtLastError());
                goto END_FLAG;
            }
            else
            {
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Power Writer Info");
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Oem: {0}", Encoding.ASCII.GetString(info.m_oem));
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Sn: {0}", Encoding.ASCII.GetString(info.m_sn));
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Hardware Version: {0}", Encoding.ASCII.GetString(info.m_hardwareVersion));
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Bootloader Version: {0}", Encoding.ASCII.GetString(info.m_bootloaderVersion));
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Interface Version: {0}", Encoding.ASCII.GetString(info.m_interfaceVersion));
            }

            // Power Writer config read / write
            S_ATCmdWriterCfg cfg = new S_ATCmdWriterCfg();
            if (!PW_At_App.PwAtGetWriterconfig(ref cfg))
            {
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGE, "Get Power Writer config fail! {0}", PW_At_App.PwAtLastError());
                goto END_FLAG;
            }
            else
            {
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Target Config");
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Vendor: {0}", Encoding.ASCII.GetString(cfg.m_targetName.m_targetVendor));
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Series: {0}", Encoding.ASCII.GetString(cfg.m_targetName.m_targetSeries));
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Model: {0}", Encoding.ASCII.GetString(cfg.m_targetName.m_targetModel));
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "");
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Erase Type: {0}", cfg.m_baseCfg.m_eraseType);
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Output VDD : {0}", cfg.m_baseCfg.m_outputVEXTType);
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Clock: {0}", cfg.m_baseCfg.m_clockType);
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Buzzer Enable: {0}", cfg.m_baseCfg.m_buzzerEnable);
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Operation Before Programming Type: {0}", cfg.m_baseCfg.m_obUpdateType);
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "");
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Limit Of Number Enable: {0}", cfg.m_offlineCfg.m_limitOfNumberEnable);
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Limit Of Number : {0}", cfg.m_offlineCfg.m_limitOfNumber);
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Auto Enable: {0}", cfg.m_offlineCfg.m_targetAutoEnable);
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Auto In Debounce: {0}", cfg.m_offlineCfg.m_targetAutoInDebounce);
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "");
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Disable Power AP: {0}", cfg.m_outputCtrlCfg.m_disablePowerAP);
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Run AP : {0}", cfg.m_outputCtrlCfg.m_runAP);
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Power On Debounce: {0}", cfg.m_outputCtrlCfg.m_powerOnDebounce);
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Power Off Debounce: {0}", cfg.m_outputCtrlCfg.m_powerOffDebounce);
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Reset Type: {0}", cfg.m_outputCtrlCfg.m_resetType);
            }
            //if (!PW_At_App.PwAtSetWriterconfig(ref cfg))
            //{
            //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGE, "Get Power Writer config fail!");
            //    goto END_FLAG;
            //}

            // Connect target chip / read status / read chip id
            if (!PW_At_App.PwAtTargetConnect())
            {
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGE, "Connect target fail! {0}", PW_At_App.PwAtLastError());
                goto END_FLAG;
            }
            Thread.Sleep(1000);
            if (!PW_At_App.PwAtTargetStatus())
            {
                PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGE, "Get target status fail! {0}", PW_At_App.PwAtLastError());
                goto END_FLAG;
            }
            else
            {
                S_ATCmdRspTargetChipID rsp = new S_ATCmdRspTargetChipID();
                if (PW_At_App.PwAtTargetId(ref rsp))
                {
                    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Chip id:");
                    printBuffer(rsp.m_CIDData, rsp.m_CIDSize);
                }
                else
                {
                    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGE, "Read chip id fail! {0}", PW_At_App.PwAtLastError());
                    goto END_FLAG;
                }
            }

        // Memory read/write
        //UInt32 addr = 0x08000000;
        //S_ATCmdTargetMemory memory = new S_ATCmdTargetMemory();
        //if (!PW_At_App.PwAtTargetRead(addr, 256, ref memory))
        //{
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGE, "Read memory fail! {0}", PW_At_App.PwAtLastError());
        //    goto END_FLAG;
        //}
        //else
        //{
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Read memory: 0x{0:X8}", memory.m_address);
        //    printBuffer(memory.m_buffer, memory.m_size);
        //}

        //UInt8[] buff = new UInt8[] { 0x10, 0x20, 0x30, 0x40, 0x50, 0x60, 0x70, 0x80, 0x90, 0x11 };
        //if (!PW_At_App.PwAtTargetEraseSector(addr, (UInt32)buff.Length, PW_At_Constants.PW_AT_TIMEOUT_BASE))
        //{
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGE, "Erase memory fail! {0}", PW_At_App.PwAtLastError());
        //    goto END_FLAG;
        //}

        //if (!PW_At_App.PwAtTargetWritePrepare((UInt32)buff.Length) || !PW_At_App.PwAtTargetWrite(addr, buff, (UInt32)buff.Length))
        //{
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGE, "Write prepare fail! {0}", PW_At_App.PwAtLastError());
        //    goto END_FLAG;
        //}
        //else
        //{
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Write memory: 0x{0:X8}", addr);
        //    printBuffer(buff, (UInt32)buff.Length);
        //}

        // Offline project operations
        //S_ATCmdRspTargetOptionByte pob = new S_ATCmdRspTargetOptionByte();
        //if (!PW_At_App.PwAtTargetReadOb(ref pob))
        //{
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGE, "Read optionByte fail! {0}", PW_At_App.PwAtLastError());
        //    goto END_FLAG;
        //}
        //else
        //{
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Read optionByte: ");
        //    printBuffer(pob.m_OBData, pob.m_OBsize);
        //}

        //S_ATCmdRspProjectInfo pproject = new S_ATCmdRspProjectInfo();
        //if (!PW_At_App.PwAtProjectInfo(ref pproject))
        //{
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGE, "Read offline project info fail! {0}", PW_At_App.PwAtLastError());
        //    goto END_FLAG;
        //}
        //else
        //{
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Offline project info: ");
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Activate: {0:X}", pproject.m_activate);
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Size: {0}", pproject.m_projectSize);
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Crc32: 0x{0:X}", pproject.m_projectCrc32);
        //}

        //S_ATCmdStatus ps = new S_ATCmdStatus();
        //if (!PW_At_App.PwAtOffLineStatus(ref ps))
        //{
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGE, "Read offline status fail! {0}", PW_At_App.PwAtLastError());
        //    goto END_FLAG;
        //}
        //else
        //{
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Offline status: ");
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Type: {0}", ps.m_statusType);
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGD, "Progress: {0} / {1}", ps.m_progress.m_total, ps.m_progress.m_processed);
        //}

        // Switch offline project
        //PwAtProjectSwitch(powerwriter_at_type.S_SwitchPrjReloadType.SWITCH_PROJECT_TYPE_RELOAD, "pkg/2025-01/N32F031_FactoryTest.pkg", "");

        // Broadcast
        //string broadText = "Hello powerwriter AT\r\n";
        //byte[] broadData = System.Text.Encoding.UTF8.GetBytes(broadText);
        //if (!PW_At_App.PwAtEasyBroadcastNoRsp(broadData, (UInt32)broadData.Length, S_ATCmdBroadcastDir.DIR_CDC2UART))
        //{
        //    PW_At_Log.powerwriter_at_log(PW_At_Log.E_AT_LOG_TYPE.LOGE, "Broadcast fail! {0}", PW_At_App.PwAtLastError());
        //    goto END_FLAG;
        //}

        END_FLAG:
            PW_At_App.PwAtUnInit();


            while (true) { }
            return;
        }
    }
}
