/**
 * @file    pwat_port.c
 * @brief   PowerWriter AT 核心的平台移植层（跨平台）
 *
 * 替代 powerwriter_at_core/powerwriter_at_porting.c：
 * - GetSystemTick 使用单调时钟（Windows: GetTickCount64；
 *   POSIX: clock_gettime(CLOCK_MONOTONIC)），保证超时逻辑在 Linux/macOS
 *   上同样按真实时间工作（原实现使用 clock()，在 POSIX 上是 CPU 时间）。
 * - ATSleep 使用平台休眠函数，避免忙等占用 CPU。
 * - GetCrc32 复用 C 核心自带的 CRC32 实现。
 */

#include <stdint.h>
#include <stddef.h>

#include "3rd/crc/crc.h"

#if defined(_WIN32)

#  ifndef _WIN32_WINNT
#    define _WIN32_WINNT 0x0600 /* GetTickCount64 */
#  endif
#  define WIN32_LEAN_AND_MEAN
#  include <windows.h>

uint32_t GetSystemTick(void)
{
    return (uint32_t)GetTickCount64();
}

void ATSleep(uint32_t ms)
{
    Sleep(ms);
}

#else

#  include <time.h>
#  include <errno.h>

uint32_t GetSystemTick(void)
{
    struct timespec ts;
#if defined(CLOCK_MONOTONIC)
    if (clock_gettime(CLOCK_MONOTONIC, &ts) != 0)
#else
    if (clock_gettime(CLOCK_REALTIME, &ts) != 0)
#endif
    {
        return 0;
    }
    return (uint32_t)((uint64_t)ts.tv_sec * 1000ULL +
                      (uint64_t)ts.tv_nsec / 1000000ULL);
}

void ATSleep(uint32_t ms)
{
    struct timespec ts;
    ts.tv_sec = (time_t)(ms / 1000U);
    ts.tv_nsec = (long)(ms % 1000U) * 1000000L;
    while (nanosleep(&ts, &ts) != 0 && errno == EINTR)
    {
        /* 被信号打断时继续剩余时间 */
    }
}

#endif

uint32_t GetCrc32(const void *data, size_t size)
{
    return crc32(data, (int)size);
}
