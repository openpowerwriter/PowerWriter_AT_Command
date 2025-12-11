cmake_minimum_required(VERSION 3.21)
set (PROJECT_NAME powerwriter_at_core)
project(${PROJECT_NAME})

option(BUILD_PW_AT_API "Build Power Writer AT api" OFF)
option(BUILD_PW_AT_APP "Build Power Writer AT app (contains serial port)" OFF)
option(BUILD_SHARED_LIBS "Build shared libraries (default static library)" OFF)

set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Configurations" FORCE)

set (PW_AT_CORE_PATH ../../powerwriter_at_core/)

file(MAKE_DIRECTORY 
    ./3rd/aes 
    ./3rd/crc
)

file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_error.h DESTINATION ../)
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_api.c DESTINATION ../)
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_cert.h DESTINATION ../)
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_cert.c DESTINATION ../)
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_utils.h DESTINATION ../)
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_utils.c DESTINATION ../)
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_porting.h DESTINATION ../)
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_porting.c DESTINATION ../)
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_config.h DESTINATION ../)
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_log.h DESTINATION ../)
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_samples.c DESTINATION ../)
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_type.h DESTINATION ../)
file(COPY ${PW_AT_CORE_PATH}/3rd/aes/aes.c DESTINATION ../3rd/aes)
file(COPY ${PW_AT_CORE_PATH}/3rd/aes/aes.h DESTINATION ../3rd/aes)
file(COPY ${PW_AT_CORE_PATH}/3rd/crc/crc32.c DESTINATION ../3rd/crc/)
file(COPY ${PW_AT_CORE_PATH}/3rd/crc/crc.h DESTINATION ../3rd/crc/)

set(SOURCES
		./powerwriter_at_global.h
		./powerwriter_at_api.h
		./powerwriter_at_error.h
		./powerwriter_at_api.c
		./powerwriter_at_cert.h
		./powerwriter_at_cert.c
		./powerwriter_at_utils.h
		./powerwriter_at_utils.c
		./powerwriter_at_porting.h
		./powerwriter_at_porting.c
		./powerwriter_at_config.h
		./powerwriter_at_log.h
		./powerwriter_at_samples.c
		./powerwriter_at_type.h
		./3rd/aes/aes.c
		./3rd/aes/aes.h	
		./3rd/crc/crc32.c
		./3rd/crc/crc.h
		)
		
set(CSPSRC
		./3rd/CSerialPort/osplatformutil.h
		./3rd/CSerialPort/SerialPort.h
		./3rd/CSerialPort/SerialPort.cpp
		./3rd/CSerialPort/SerialPort_global.h
		./3rd/CSerialPort/SerialPortBase.h
		./3rd/CSerialPort/SerialPortBase.cpp
		./3rd/CSerialPort/SerialPortInfo.h
		./3rd/CSerialPort/SerialPortInfo.cpp
		./3rd/CSerialPort/SerialPortInfoBase.h
		./3rd/CSerialPort/SerialPortInfoBase.cpp
		./3rd/CSerialPort/SerialPortInfoWinBase.h
		./3rd/CSerialPort/SerialPortInfoWinBase.cpp
		./3rd/CSerialPort/SerialPortWinBase.h
		./3rd/CSerialPort/SerialPortWinBase.cpp
		./3rd/CSerialPort/sigslot.h
		)

set (APPSRC
		./powerwriter_at_app.h
		./powerwriter_at_app.cpp
		./powerwriter_at_opt.h
		./powerwriter_at_opt.cpp
		./NLock.h
		)

if(BUILD_PW_AT_API)
	add_compile_definitions(LIBRARY_EXPORT)
	add_compile_definitions(POWERWRITER_AT_API)
elseif (BUILD_PW_AT_APP)
	list(APPEND SOURCES ${APPSRC} ${CSPSRC})
	
	add_compile_definitions(LIBRARY_EXPORT)
	add_compile_definitions(POWERWRITER_AT_APP)
endif()

if(BUILD_SHARED_LIBS)
	add_library(${PROJECT_NAME} SHARED ${SOURCES})
else()
	add_library(${PROJECT_NAME} STATIC ${SOURCES})
endif()