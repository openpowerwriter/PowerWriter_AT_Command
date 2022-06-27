﻿
#include "SerialPortInfoWinBase.h"

#include "Windows.h"

/********************* EnumDetailsSerialPorts ****************************************/
#undef PHYSICAL_ADDRESS
#define PHYSICAL_ADDRESS LARGE_INTEGER

#include <Setupapi.h> //SetupDiGetClassDevs Setup*
#include <initguid.h> //GUID
#include <tchar.h>    //_T
#include <algorithm>

//#include <ntddser.h>  //GUID_DEVINTERFACE_COMPORT
#ifndef GUID_DEVINTERFACE_COMPORT
DEFINE_GUID(GUID_DEVINTERFACE_COMPORT, 0x86E0D1E0L, 0x8089, 0x11D0, 0x9C, 0xE4, 0x08, 0x00, 0x3E, 0x30, 0x1F, 0x73);
#endif

std::string wstringToString(const std::wstring &wstr)
{
    // https://stackoverflow.com/questions/4804298/how-to-convert-wstring-into-string
    if (wstr.empty())
    {
        return std::string();
    }

    int size = WideCharToMultiByte(CP_ACP, 0, &wstr[0], (int)wstr.size(), NULL, 0, NULL, NULL);
    std::string ret = std::string(size, 0);
    WideCharToMultiByte(CP_ACP, 0, &wstr[0], (int)wstr.size(), &ret[0], size, NULL, NULL); // CP_UTF8

    return ret;
}

/**
 * @brief enumDetailsSerialPorts 通过setapi.lib枚举串口详细信息
 * @param portInfoList [out] port info list 串口信息列表
 * @return
 * @retval true true if excite success 执行成功返回true
 * @retval false false if execute failed 执行失败返回false
 */
bool enumDetailsSerialPorts(vector<SerialPortInfo> &portInfoList)
{
    // https://docs.microsoft.com/en-us/windows/win32/api/setupapi/

    bool bRet = false;
    SerialPortInfo m_serialPortInfo;

    std::string strFriendlyName;
    std::string strPortName;

    HDEVINFO hDevInfo = INVALID_HANDLE_VALUE;
    SP_DEVICE_INTERFACE_DETAIL_DATA *pDetData = NULL;

    // Return only devices that are currently present in a system
    // The GUID_DEVINTERFACE_COMPORT device interface class is defined for COM ports. GUID
    // {86E0D1E0-8089-11D0-9CE4-08003E301F73}
    hDevInfo = SetupDiGetClassDevs(&GUID_DEVINTERFACE_COMPORT, NULL, NULL, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);

    if (INVALID_HANDLE_VALUE != hDevInfo)
    {
        BOOL bOk = TRUE;

        DWORD dwDetDataSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA) + 256;
        pDetData = (SP_DEVICE_INTERFACE_DETAIL_DATA *)new char[dwDetDataSize];

        if (pDetData != NULL)
        {
            pDetData->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

            SP_DEVICE_INTERFACE_DATA did = {0};
            did.cbSize = sizeof(did);

            for (DWORD idev = 0; bOk; idev++)
            {
                // enumerates the device interfaces that are contained in a device information set
                bOk = SetupDiEnumDeviceInterfaces(hDevInfo, NULL, &GUID_DEVINTERFACE_COMPORT, idev, &did);
                if (bOk)
                {
                    // DWORD cbRequired = 0;

                    SP_DEVINFO_DATA devdata = {sizeof(SP_DEVINFO_DATA)};
                    // get detailed information about an interface
                    // bOk = SetupDiGetDeviceInterfaceDetail(hDevInfo, &did, NULL, NULL,&cbRequired, &devdata);

                    bOk = SetupDiGetDeviceInterfaceDetail(hDevInfo, &did, pDetData, dwDetDataSize, NULL, &devdata);

                    if (bOk)
                    {
                        TCHAR fname[256];
                        // retrieves a specified Plug and Play device property (include friendlyname etc.)
                        BOOL bSuccess = SetupDiGetDeviceRegistryProperty(hDevInfo, &devdata, SPDRP_FRIENDLYNAME, NULL,
                                                                         (PBYTE)fname, sizeof(fname), NULL);

                        TCHAR portName[256];
                        // get port name
                        HKEY hDevKey =
                            SetupDiOpenDevRegKey(hDevInfo, &devdata, DICS_FLAG_GLOBAL, 0, DIREG_DEV, KEY_READ);
                        if (INVALID_HANDLE_VALUE != hDevKey)
                        {
                            DWORD dwCount = 255; // DEV_NAME_MAX_LEN
                            RegQueryValueEx(hDevKey, _T("PortName"), NULL, NULL, (BYTE *)portName, &dwCount);
                            RegCloseKey(hDevKey);

                            bSuccess &= TRUE;
                        }
                        else
                        {
                            bSuccess &= FALSE;
                        }

                        if (bSuccess)
                        {
#ifdef UNICODE
                            strPortName = wstringToString(portName);
                            strFriendlyName = wstringToString(fname);
#else
                            strPortName = std::string(portName);
                            strFriendlyName = std::string(fname);
#endif
                            // remove (COMxx)
                            strFriendlyName = strFriendlyName.substr(0, strFriendlyName.find(("(COM")));

							transform(strPortName.begin(), strPortName.end(), strPortName.begin(), ::toupper);	//转换为大写.方便上层处理

                            m_serialPortInfo.portName = strPortName;
                            m_serialPortInfo.description = strFriendlyName;
                            portInfoList.push_back(m_serialPortInfo);

                            bRet = true;
                        }
                    }
                    else
                    {
                        bRet = false;
                    }
                }
                else if (ERROR_NO_MORE_ITEMS == GetLastError())
                {
                    bRet = false; // Enumeration failed
                    break;
                }
                else
                {
                }
            }

            delete[](char *) pDetData;
            pDetData = NULL;
        }
        else
        {
            bRet = false;
        }
        SetupDiDestroyDeviceInfoList(hDevInfo);
    }

    return bRet;
}
/********************* EnumDetailsSerialPorts ****************************************/

CSerialPortInfoWinBase::CSerialPortInfoWinBase() {}

CSerialPortInfoWinBase::~CSerialPortInfoWinBase() {}

vector<SerialPortInfo> CSerialPortInfoWinBase::availablePortInfos()
{
    vector<SerialPortInfo> portInfoList;
    enumDetailsSerialPorts(portInfoList);

    return portInfoList;
}