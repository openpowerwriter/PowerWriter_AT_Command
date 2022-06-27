cmake_minimum_required(VERSION 3.21)
project(powerwriter_at_commander)

#set(CMAKE_C_FLAGS "-m32")
#set(CMAKE_CXX_FLAGS "-m32")
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_EXE_LINKER_FLAGS "-static")

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../powerwriter_at_core powerwriter_at_core)

add_executable(powerwriter_at_commander
               powerwriter_at_main.cpp

            ./CSerialPort/osplatformutil.h
            ./CSerialPort/SerialPort.cpp
            ./CSerialPort/SerialPort.h
            ./CSerialPort/SerialPort_global.h
            ./CSerialPort/SerialPortBase.cpp
            ./CSerialPort/SerialPortBase.h
            ./CSerialPort/SerialPortInfo.cpp
            ./CSerialPort/SerialPortInfo.h
            ./CSerialPort/SerialPortInfoBase.cpp
            ./CSerialPort/SerialPortInfoBase.h
            ./CSerialPort/SerialPortInfoWinBase.cpp
            ./CSerialPort/SerialPortInfoWinBase.h
            ./CSerialPort/SerialPortWinBase.cpp
            ./CSerialPort/SerialPortWinBase.h
            ./CSerialPort/sigslot.h
        )

target_link_libraries(powerwriter_at_commander powerwriter_at_core)

