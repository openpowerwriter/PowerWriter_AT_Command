using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using powerwriter_at_type;
using powerwriter_at_error;

namespace powerwriter_at_app
{
    using UInt8 = System.Byte;
    public class PW_At_App
    {
        public const string libraryName = "./powerwriter_at_core.dll";

        // export api for powerwriter AT commander
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        public unsafe static extern void PwAtIntroduction();

        // Run PowerWriter AT command self benchmark
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtBenchmark(bool encrypt);

        // Initial PowerWriter AT commander
        [DllImport(libraryName, CharSet = CharSet.Unicode, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtInit([MarshalAs(UnmanagedType.LPStr)] string portName, int baudrate, bool encrypt);

        // Fill data to PowerWriter AT commander
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtUnInit();

        // Get last error code
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        public unsafe static extern E_ATCmdError PwAtLastError();

        // Get PowerWriter Information 
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtGetWriterinfo(ref S_ATCmdRspWriterInfo info);

        // Get PowerWriter configuration 
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtGetWriterconfig(ref S_ATCmdWriterCfg cfg);

        // Set PowerWriter configuration 
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtSetWriterconfig(ref S_ATCmdWriterCfg cfg);

        // Set PowerWriter AT baudrate 
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtSetBaudrate(int baudrate);

        // Init target connnect
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtTargetConnect();

        //  Get target status
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtTargetStatus();

        // Get target id
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtTargetId(ref S_ATCmdRspTargetChipID rsp);

        // Read target memory
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtTargetRead(UInt32 addr, UInt32 size, ref S_ATCmdTargetMemory memory);

        // Erase target chip
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtTargetErase(int timout_ms);

        // Erase target flash memory
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtTargetEraseSector(UInt32 addr, UInt32 size, int timout_ms);

        // Write target flash memory
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)] 
        public unsafe static extern bool PwAtTargetWritePrepare(UInt32 total);

        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtTargetWrite(UInt32 addr, UInt8[] buffer, UInt32 buffersize);

        // Read target option byte
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtTargetReadOb(ref S_ATCmdRspTargetOptionByte pob);

        // Read target option byte 
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtTargetWriteVendorOb(int timout_ms);

        // Write target user's option byte
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtTargetWriteUserOb(int timout_ms);

        // Reset target chip
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtTargetReset(E_resetType type);

        // Get offline project information
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtProjectInfo(ref S_ATCmdRspProjectInfo pproject);

        // Disable offline project
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtProjectDisable();

        // Load offline project
        [DllImport(libraryName, CharSet = CharSet.Unicode, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtProjectLoad([MarshalAs(UnmanagedType.LPStr)] string prj_name, [MarshalAs(UnmanagedType.LPStr)] string password, UInt8[] prj_data, UInt32 prj_size, ATProgress p_cb);

        // start offline program
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtOffLineStart();

        // query offline status
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtOffLineStatus(ref S_ATCmdStatus ps);

        // switch offline project
        [DllImport(libraryName, CharSet = CharSet.Unicode, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtProjectSwitch(S_SwitchPrjReloadType reload_type, [MarshalAs(UnmanagedType.LPStr)] string prj_name, [MarshalAs(UnmanagedType.LPStr)] string password);

        // easy broadcast no rsp
        [DllImport(libraryName, CharSet = CharSet.Unicode, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtEasyBroadcastNoRsp(UInt8[] bcdata, UInt32 bcsize, S_ATCmdBroadcastDir bcdir);

        // broadcast
        [DllImport(libraryName, CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I1)]
        public unsafe static extern bool PwAtBroadcast(UInt8[] bcdata, UInt32 bcsize, S_ATCmdBroadcastDir bcdir, bool keepframe,
            bool waitrsp, ref S_ATCmdBroadcast prsp, int waitrsptimeout);
    }
}
