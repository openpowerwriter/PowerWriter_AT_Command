cmake_minimum_required(VERSION 3.21)

option(BUILD_PW_AT_API "Build Power Writer AT api" OFF)
option(BUILD_PW_AT_APP "Build Power Writer AT app (contains serial port)" ON)
option(BUILD_SHARED_LIBS "Build shared libraries (default static library)" ON)

if(NOT CMAKE_GENERATOR_PLATFORM)
	set(CMAKE_GENERATOR_PLATFORM "Win32" CACHE STRING "Platform" FORCE)
endif()

set (PROJECT_NAME powerwriter_at_core)
project(${PROJECT_NAME} C CXX)

set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/build)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Configurations" FORCE)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

set (PW_AT_CORE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../../powerwriter_at_core/")
if(NOT EXISTS ${PW_AT_CORE_PATH})
    message(FATAL_ERROR "PowerWriter AT Core path not found: ${PW_AT_CORE_PATH}")
endif()

file(MAKE_DIRECTORY 
    ./3rd/aes 
    ./3rd/crc
)

file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_error.h DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_api.c DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_cert.h DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_cert.c DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_utils.h DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_utils.c DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_porting.h DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_porting.c DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_config.h DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_log.h DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_samples.c DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})
file(COPY ${PW_AT_CORE_PATH}/powerwriter_at_type.h DESTINATION ${CMAKE_CURRENT_SOURCE_DIR})
file(COPY ${PW_AT_CORE_PATH}/3rd/aes/aes.c DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/3rd/aes)
file(COPY ${PW_AT_CORE_PATH}/3rd/aes/aes.h DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/3rd/aes)
file(COPY ${PW_AT_CORE_PATH}/3rd/crc/crc32.c DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/3rd/crc/)
file(COPY ${PW_AT_CORE_PATH}/3rd/crc/crc.h DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/3rd/crc/)

set(SOURCES
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_global.h
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_api.h
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_error.h
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_api.c
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_cert.h
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_cert.c
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_utils.h
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_utils.c
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_porting.h
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_porting.c
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_config.h
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_log.h
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_samples.c
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_type.h
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/aes/aes.c
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/aes/aes.h	
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/crc/crc32.c
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/crc/crc.h
		)
		
set(CSPSRC
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/osplatformutil.h
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/SerialPort.h
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/SerialPort.cpp
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/SerialPort_global.h
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/SerialPortBase.h
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/SerialPortBase.cpp
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/SerialPortInfo.h
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/SerialPortInfo.cpp
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/SerialPortInfoBase.h
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/SerialPortInfoBase.cpp
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/SerialPortInfoWinBase.h
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/SerialPortInfoWinBase.cpp
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/SerialPortWinBase.h
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/SerialPortWinBase.cpp
		${CMAKE_CURRENT_SOURCE_DIR}/3rd/CSerialPort/sigslot.h
		)

set (APPSRC
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_app.h
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_app.cpp
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_opt.h
		${CMAKE_CURRENT_SOURCE_DIR}/powerwriter_at_opt.cpp
		${CMAKE_CURRENT_SOURCE_DIR}/NLock.h
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