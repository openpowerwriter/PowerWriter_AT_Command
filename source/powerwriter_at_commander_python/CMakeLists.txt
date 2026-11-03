# PowerWriter AT Python 绑定库
#
# 将 powerwriter_at_core 编译为跨平台动态库：
#   Windows: lib/powerwriter_at.dll
#   Linux  : lib/libpowerwriter_at.so
#   macOS  : lib/libpowerwriter_at.dylib
#
# 用法：
#   cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
#   cmake --build build --config Release
#
# Windows 使用 Visual Studio 生成器时：
#   cmake -S . -B build -A x64
#   cmake --build build --config Release

cmake_minimum_required(VERSION 3.15)

if(POLICY CMP0091)
    # 使用 MSVC_RUNTIME_LIBRARY 控制运行库，静态链接 CRT，便于分发
    cmake_policy(SET CMP0091 NEW)
endif()

project(powerwriter_at_python_bridge C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CORE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../powerwriter_at_core")

# 按平台/架构输出，便于同一目录下同时存放多个平台编译产物，
# Python 加载器会自动选择 lib/<平台>/<架构>/ 下对应的库。
if(WIN32)
    set(PWAT_PLATFORM "windows")
elseif(APPLE)
    set(PWAT_PLATFORM "macos")
else()
    set(PWAT_PLATFORM "linux")
endif()
string(TOLOWER "${CMAKE_SYSTEM_PROCESSOR}" _pwat_proc)
if(_pwat_proc MATCHES "^(amd64|x86_64|x64)$")
    set(PWAT_ARCH "x64")
elseif(_pwat_proc MATCHES "^(arm64|aarch64)$")
    set(PWAT_ARCH "arm64")
elseif(_pwat_proc MATCHES "^(x86|i[3-6]86)$")
    set(PWAT_ARCH "x86")
else()
    set(PWAT_ARCH "${_pwat_proc}")
endif()
if(NOT PWAT_ARCH)
    set(PWAT_ARCH "unknown")
endif()
set(PWAT_LIB_DIR "${CMAKE_CURRENT_SOURCE_DIR}/lib/${PWAT_PLATFORM}/${PWAT_ARCH}")

if(NOT EXISTS "${CORE_DIR}/powerwriter_at_api.c")
    message(FATAL_ERROR "找不到 powerwriter_at_core: ${CORE_DIR}")
endif()

add_library(powerwriter_at SHARED
    csrc/pwat_bridge.c
    csrc/pwat_bridge.h
    csrc/pwat_port.c
    csrc/pwat_crypto.c
    csrc/pwat_crypto.h
    ${CORE_DIR}/powerwriter_at_api.c
    ${CORE_DIR}/powerwriter_at_utils.c
    ${CORE_DIR}/3rd/crc/crc32.c
    ${CORE_DIR}/3rd/crc/crc.h
    ${CORE_DIR}/3rd/aes/aes.c
    ${CORE_DIR}/3rd/aes/aes.h
)

target_include_directories(powerwriter_at PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/csrc"
    "${CORE_DIR}"
    "${CORE_DIR}/3rd"
)

# 启用 AES128-CBC 加密支持。是否实际加密由 pwat_create(encrypt) 决定，
# 未加密通信不受影响。pwat_crypto.c replaces the core's fixed key/IV wrapper
# with a runtime-configurable one, so powerwriter_at_cert.c is not linked here.
target_compile_definitions(powerwriter_at PRIVATE
    POWERWRITER_AT_ENCRYPT_ENABLE
)

if(MSVC)
    target_compile_options(powerwriter_at PRIVATE /W3 /utf-8)
    # Statically link the MSVC runtime so the DLL has no VC redist dependency.
    # The target property must be set on the target; setting the global
    # CMAKE_MSVC_RUNTIME_LIBRARY after add_library() has no effect.
    set_target_properties(powerwriter_at PROPERTIES
        MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>"
    )
else()
    target_compile_options(powerwriter_at PRIVATE -Wall -Wextra)
    # 仅导出 PWAT_API 标记的符号
    set_target_properties(powerwriter_at PROPERTIES
        C_VISIBILITY_PRESET hidden
    )
endif()

set_target_properties(powerwriter_at PROPERTIES
    OUTPUT_NAME "powerwriter_at"
    LIBRARY_OUTPUT_DIRECTORY "${PWAT_LIB_DIR}"
    RUNTIME_OUTPUT_DIRECTORY "${PWAT_LIB_DIR}"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
)

# 多配置生成器（Visual Studio）会追加配置子目录，这里统一输出到 lib/。
# 注意：CMake 的按配置属性名必须使用大写配置名。
foreach(_cfg DEBUG RELEASE RELWITHDEBINFO MINSIZEREL)
    set_target_properties(powerwriter_at PROPERTIES
        LIBRARY_OUTPUT_DIRECTORY_${_cfg} "${PWAT_LIB_DIR}"
        RUNTIME_OUTPUT_DIRECTORY_${_cfg} "${PWAT_LIB_DIR}"
        ARCHIVE_OUTPUT_DIRECTORY_${_cfg} "${CMAKE_BINARY_DIR}/lib"
    )
endforeach()

message(STATUS "PowerWriter AT library: ${PWAT_LIB_DIR}/ (平台 ${PWAT_PLATFORM}, 架构 ${PWAT_ARCH})")
