using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using Windows.Storage.Streams;
using System.Xml.Linq;
using powerwriter_at_config;
using powerwriter_at_sample;
using powerwriter_at_error;

namespace powerwriter_at_type
{
    using UInt8 = System.Byte;

    // ATCmdStatusProgress
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct S_ATCmdStatusProgress
    {
        public UInt32 m_total;     // Total size
        public UInt32 m_processed; // Processed size
    };

    public enum E_ATStatus
    {
        ATStatusUnknown = 0,
        ATStatusOk = 0,
        ATStatusProgress,
        ATStatusError,
        _ATStatusMax = PW_At_Constants.PW_ENUM_MAX
    }

    // AT Cmd Status
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct S_ATCmdStatus
    {
        public E_ATStatus m_statusType;
        public S_ATCmdStatusProgress m_progress;
    };

    // ATCmdRspWriterInfo
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct S_ATCmdRspWriterInfo
    {
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = PW_At_Constants.PW_OEM_LENGTH)]
        public UInt8[] m_oem; // PowerWriter oem, such as PW200,PW300 etc...

        [MarshalAs(UnmanagedType.ByValArray, SizeConst = PW_At_Constants.PW_SN_LENGTH)]
        public UInt8[] m_sn;   // PowerWriter sn, formatted as "XXX..."

        [MarshalAs(UnmanagedType.ByValArray, SizeConst = PW_At_Constants.PW_VERSION_LENGTH)]
        public UInt8[] m_hardwareVersion;   // PowerWriter hardware version, formatted as "x.xx.xx"

        [MarshalAs(UnmanagedType.ByValArray, SizeConst = PW_At_Constants.PW_VERSION_LENGTH)]
        public UInt8[] m_bootloaderVersion; // PowerWriter bootloader(hal driver) version, formatted as "x.xx.xx"

        [MarshalAs(UnmanagedType.ByValArray, SizeConst = PW_At_Constants.PW_VERSION_LENGTH)]
        public UInt8[] m_interfaceVersion;  // PowerWriter interface(application) version, formatted as "x.xx.xx"

        //public S_ATCmdRspWriterInfo()
        //{
        //    m_oem = new byte[PW_At_Constants.PW_OEM_LENGTH];
        //    m_sn = new byte[PW_At_Constants.PW_SN_LENGTH];
        //    m_hardwareVersion = new byte[PW_At_Constants.PW_VERSION_LENGTH];
        //    m_bootloaderVersion = new byte[PW_At_Constants.PW_VERSION_LENGTH];
        //    m_interfaceVersion = new byte[PW_At_Constants.PW_VERSION_LENGTH];
        //}
    };

    // ATCmdRspWriterCfg,
    // Target names
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct S_TargetName
    {
        [MarshalAs(UnmanagedType.ByValArray, SizeConst = PW_At_Constants.PW_TARGET_NAME_MAX)]
        public UInt8[] m_targetVendor; // target chip vendor,such as 'nations' (notice: You can only view, but cannot change !!!)

        [MarshalAs(UnmanagedType.ByValArray, SizeConst = PW_At_Constants.PW_TARGET_NAME_MAX)]
        public UInt8[] m_targetSeries; // target chip series,such as 'N32G020' (notice: You can only view, but cannot change !!!)

        [MarshalAs(UnmanagedType.ByValArray, SizeConst = PW_At_Constants.PW_TARGET_NAME_MAX)]
        public UInt8[] m_targetModel;  // target chip model,such as 'N32G020G5' (notice: You can only view, but cannot change !!!)

        //public S_TargetName()
        //{
        //    m_targetVendor = new UInt8[PW_At_Constants.PW_TARGET_NAME_MAX];
        //    m_targetSeries = new UInt8[PW_At_Constants.PW_TARGET_NAME_MAX];
        //    m_targetModel = new UInt8[PW_At_Constants.PW_TARGET_NAME_MAX];
        //}
    };

    // Base setting
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct S_BaseWriterCfg
    {
        public UInt8 m_eraseType;      // Erase type: 0(no erase),1(chip erase),2(sector erase)
        public UInt8 m_outputVEXTType; // Output VDD: 0(1.8V),1(3.3V),2(5.0V),3(refer to external power supply)
        public UInt8 m_clockType;      // Clock: 0(20Mhz fast mode),1(10Mhz default),2(5Mhz),3(2Mhz),4(1Mhz), etc ...
        public UInt8 m_buzzerEnable;   // 0: disable 1: enable
        public UInt8 m_obUpdateType;   // 0: No operation before programming, no operation after programming
                                       // 1: No operation is performed before programming, and user - defined OptionUInt8 is written after flash programming
                                       // 2: Restore default values is performed before programming, no operation after programming.
                                       // 3: Restore default values is performed before programming, and user - defined OptionUInt8 is written after flash programming
        //public S_BaseWriterCfg()
        //{
        //    m_eraseType = 0;
        //    m_outputVEXTType = 0;
        //    m_clockType = 0;
        //    m_buzzerEnable = 0;
        //    m_obUpdateType = 0;
        //}
    };

    // Offline configure
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct S_OfflineWriterCfg
    {
        public UInt8 m_limitOfNumberEnable;    // 0 : disable 1: enable    (notice: You can only view, but cannot change !!!)
        public UInt32 m_limitOfNumber;         // Current remaining quantity (notice: You can only view, but cannot change !!!)
        public UInt8 m_targetAutoEnable;       // 0: disable 1:enable
        public UInt16 m_targetAutoInDebounce;  // Target connected debounce time
        public UInt16 m_targetAutoOutDebounce; // Target disconnected debounce time

        //public S_OfflineWriterCfg()
        //{
        //    m_limitOfNumberEnable = 0;
        //    m_limitOfNumber = 0;
        //    m_targetAutoEnable = 0;
        //    m_targetAutoInDebounce = 0;
        //    m_targetAutoOutDebounce = 0;
        //}
    };

    // Output Ctrl configure
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct S_OutputCtrlWriterCfg
    {
        public UInt8 m_disablePowerAP;    // 0 : disable 1:enable (Power off when programming is complete)
        public UInt8 m_runAP;             // 0 : disable 1:enable (Run when programming is complete)
        public UInt16 m_powerOnDebounce;  // Debounce the output power supply (ms)
        public UInt16 m_powerOffDebounce; // Debounce the output power off (ms)
        public UInt8 m_resetType;         // 0 : Keep low
                                          // 1 : Off, high resistance
                                          // 2 : Reset output then to off
        //public S_OutputCtrlWriterCfg()
        //{
        //    m_disablePowerAP = 0;
        //    m_runAP = 0;
        //    m_powerOnDebounce = 0;
        //    m_powerOffDebounce = 0;
        //    m_resetType = 0;
        //}
    }

    // Writer configure for current project
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct S_ATCmdWriterCfg
    {
        public S_TargetName m_targetName;             // Target names 
        public S_BaseWriterCfg m_baseCfg;             // Base config
        public S_OfflineWriterCfg m_offlineCfg;       // Offline configure
        public S_OutputCtrlWriterCfg m_outputCtrlCfg; // Output control configure

        //public S_ATCmdWriterCfg()
        //{
        //    m_targetName = new S_TargetName();
        //    m_baseCfg = new S_BaseWriterCfg();
        //    m_offlineCfg = new S_OfflineWriterCfg();
        //    m_outputCtrlCfg = new S_OutputCtrlWriterCfg();
        //}
    }

    // Target chip id response
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct S_ATCmdRspTargetChipID
    {
        public UInt8 m_CIDSize;                   // Target chip ID size

        [MarshalAs(UnmanagedType.ByValArray, SizeConst = PW_At_Constants.PW_TARGET_ID_MAX)]
        public UInt8[] m_CIDData; // Target chip ID data

        //public S_ATCmdRspTargetChipID()
        //{
        //    m_CIDSize = 0;
        //    m_CIDData = new UInt8[PW_At_Constants.PW_TARGET_ID_MAX];
        //}
    };

    // Response target chip memory
    // Write target chip memory
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct S_ATCmdTargetMemory
    {
        public UInt32 m_address;                // Current data address
        public UInt32 m_size;                   // Current data size

        [MarshalAs(UnmanagedType.ByValArray, SizeConst = PW_At_Constants.PW_PACKAGE_SIZE)]
        public UInt8[] m_buffer; // Current data buffer (fixed length)

        //public S_ATCmdTargetMemory()
        //{
        //    m_address = 0;
        //    m_size = 0;
        //    m_buffer = new UInt8[PW_At_Constants.PW_PACKAGE_SIZE];
        //}
    }; 

    // Response target chip option byte
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct S_ATCmdRspTargetOptionByte
    {
        public UInt32 m_OBsize;           // Option byte size

        [MarshalAs(UnmanagedType.ByValArray, SizeConst = PW_At_Constants.PW_OB_MAX)]
        public UInt8[] m_OBData; // Option byte data buffer

        //public S_ATCmdRspTargetOptionByte()
        //{
        //    m_OBsize = 0;
        //    m_OBData = new UInt8[PW_At_Constants.PW_OB_MAX];
        //}
    };

    // Reset Target type
    public enum E_resetType
    {
        HWKeepLow,              //Hardware Keeplow
        HWNoneReset,            //Hardware high resistance state
        HWReset,                //Hardware reset
        HWCoreReset,            //Hardware & core reset
        CoreReset,              //Soft Core Reset
        VectorReset,            //Soft Vector Reset
        POROnly,                //Power On Reset
        PORAndRelease,          //Power On Reset and release port

        _TARGET_RESET_ = PW_At_Constants.PW_ENUM_MAX
    };

    // Mode when switching projects
	public enum S_SwitchPrjReloadType
	{
		SWITCH_PROJECT_TYPE_RESUME = 0, /* Resume previous project progress */
		SWITCH_PROJECT_TYPE_RELOAD,		/* Reload project */

		SWITCH_PROJECT_TYPE_MAX = PW_At_Constants.PW_ENUM_MAX
	};

    // Response offline project information
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct S_ATCmdRspProjectInfo
    {
        public UInt8 m_activate;      // 0 : Inactivate 1: Activate
        public UInt32 m_projectSize;  // Offline project size
        public UInt32 m_projectCrc32; // Offline project crc32

        //public S_ATCmdRspProjectInfo()
        //{
        //    m_activate = 0;
        //    m_projectSize = 0;
        //    m_projectCrc32 = 0;
        //}
    }; 

    // Broadcast
    public enum S_ATCmdBroadcastDir
    {
        DIR_CDC2UART, // Forwarding from USB to UART
        DIR_UART2CDC, // Forwarding from UART to USB

        _DIR_MAX_ = PW_At_Constants.PW_ENUM_MAX
    }; // S_ATCmdBroadcastDir;

    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct S_ATCmdBroadcast
    {
        public UInt8 m_keepATFrame;           // 0 : Forwarding valid data, 1: forwarding Full AT frame data
        S_ATCmdBroadcastDir m_dirType;   // Direction
        public UInt32 m_size;                 // Activate size

        [MarshalAs(UnmanagedType.ByValArray, SizeConst = PW_At_Constants.PW_PACKAGE_SIZE)]
        public UInt8[] m_data; // data

        //public S_ATCmdBroadcast()
        //{
        //    m_keepATFrame = 0;
        //    m_dirType = new S_ATCmdBroadcastDir();
        //    m_size = 0;
        //    m_data = new UInt8[PW_At_Constants.PW_PACKAGE_SIZE];
        //}
    };

    //typedef void (* ATProgress) (S_ATCmdStatusProgress* pp);
    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    public delegate void ATProgress(ref S_ATCmdStatusProgress pp);
};

