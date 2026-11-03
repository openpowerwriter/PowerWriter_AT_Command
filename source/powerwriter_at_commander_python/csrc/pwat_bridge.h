/**
 * @file    pwat_bridge.h
 * @brief   PowerWriter AT C 核心与 Python 之间的桥接层
 *
 * 该动态库直接编译 powerwriter_at_core 源码，对外暴露一个扁平的 C ABI：
 * - 用不透明句柄隐藏 S_ATChannel 的内部布局；
 * - 将帧发送回调转换为 (字节流, 超时) 回调；
 * - 将各 API 的结构体输出复制成固定布局的扁平结构，便于 ctypes 映射。
 *
 * 协议解析、CRC32、AES128-CBC、超时与重试逻辑均复用 C 核心，
 * Python 侧不再维护第二份协议实现。
 */

#ifndef PWAT_BRIDGE_H
#define PWAT_BRIDGE_H

#include <stdint.h>
#include <stddef.h>

#ifdef _WIN32
#  ifdef PWAT_BRIDGE_EXPORTS
#    define PWAT_API __declspec(dllexport)
#  else
#    define PWAT_API __declspec(dllimport)
#  endif
#else
#  define PWAT_API __attribute__((visibility("default")))
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* 状态类型，数值与 C 核心 E_ATStatus 一致 */
#define PWAT_STATUS_UNKNOWN   (-1)
#define PWAT_STATUS_OK        0
#define PWAT_STATUS_PROGRESS  1
#define PWAT_STATUS_ERROR     2

/* 事件类型，数值与 C 核心 S_ATCmdEvent 一致 */
#define PWAT_EVENT_NONE       0
#define PWAT_EVENT_CMD        1
#define PWAT_EVENT_ERROR      2

/* 发送回调：返回值非 0 表示发送成功 */
typedef int  (*PWAT_WRITE_CB)(void *user, const uint8_t *frame, uint32_t size, int timeout_ms);
/* 事件回调：在接收线程中触发，仅用于通知/日志 */
typedef void (*PWAT_EVENT_CB)(void *user, int event);
/* 工程加载进度回调 */
typedef void (*PWAT_PROGRESS_CB)(void *user, uint32_t total, uint32_t processed);

/* 以下结构体布局必须与 powerwriter_at_type.h 中对应结构一致 (均按 1 字节对齐) */
#pragma pack(push, 1)

typedef struct PWAT_WRITER_INFO {
    uint8_t oem[8];                /* S_ATCmdRspWriterInfo.m_oem */
    uint8_t sn[32];                /* m_sn */
    uint8_t hardware_version[8];   /* m_hardwareVersion */
    uint8_t bootloader_version[8]; /* m_bootloaderVersion */
    uint8_t interface_version[8];  /* m_interfaceVersion */
} PWAT_WRITER_INFO;                /* 64 bytes */

typedef struct PWAT_WRITER_CFG {
    uint8_t target_vendor[16];
    uint8_t target_series[16];
    uint8_t target_model[16];
    uint8_t erase_type;
    uint8_t output_vext_type;
    uint8_t clock_type;
    uint8_t buzzer_enable;
    uint8_t ob_update_type;
    uint8_t limit_number_enable;
    uint32_t limit_number;
    uint8_t target_auto_enable;
    uint16_t target_auto_in_debounce;
    uint16_t target_auto_out_debounce;
    uint8_t disable_power_ap;
    uint8_t run_ap;
    uint16_t power_on_debounce;
    uint16_t power_off_debounce;
    uint8_t reset_type;
} PWAT_WRITER_CFG;                 /* 70 bytes */

typedef struct PWAT_CHIP_ID {
    uint8_t size;
    uint8_t data[16];
} PWAT_CHIP_ID;                    /* 17 bytes */

typedef struct PWAT_MEM_BLOCK {
    uint32_t address;
    uint32_t size;
    uint8_t data[256];
} PWAT_MEM_BLOCK;                  /* 264 bytes */

typedef struct PWAT_OPTION_BYTE {
    uint32_t size;
    uint8_t data[1024];
} PWAT_OPTION_BYTE;                /* 1028 bytes */

typedef struct PWAT_PROJECT_INFO {
    uint8_t activate;
    uint32_t size;
    uint32_t crc32;
} PWAT_PROJECT_INFO;               /* 9 bytes */

typedef struct PWAT_OFFLINE_STATUS {
    int32_t status;      /* PWAT_STATUS_* */
    uint32_t total;      /* 进度总数，仅 PROGRESS 有效 */
    uint32_t processed;  /* 已处理数，仅 PROGRESS 有效 */
    uint32_t error;      /* 设备错误码，仅 ERROR 有效 */
} PWAT_OFFLINE_STATUS;

typedef struct PWAT_BROADCAST {
    uint8_t keep_frame;
    int32_t direction;
    uint32_t size;
    uint8_t data[256];
} PWAT_BROADCAST;                  /* 265 bytes */

#pragma pack(pop)

/* ------------------------------------------------------------------ */
/* 生命周期与数据输入                                                   */
/* ------------------------------------------------------------------ */
PWAT_API uint32_t pwat_version(void);
PWAT_API void    *pwat_create(int encrypt, PWAT_WRITE_CB write_cb,
                              PWAT_EVENT_CB event_cb, void *user);
/* Configure the global AES128-CBC key and IV (16 bytes each). Pass NULL for
 * both to restore the C core defaults. Call before starting commands. */
PWAT_API int      pwat_set_encrypt_key_iv(void *handle,
                                          const uint8_t *key,
                                          const uint8_t *iv);
PWAT_API void     pwat_destroy(void *handle);
PWAT_API int      pwat_feed(void *handle, const uint8_t *data, uint32_t size);
PWAT_API uint32_t pwat_last_error(void *handle);

/* ------------------------------------------------------------------ */
/* 系统信息与配置                                                       */
/* ------------------------------------------------------------------ */
PWAT_API int pwat_get_writer_info(void *handle, PWAT_WRITER_INFO *info);
PWAT_API int pwat_get_writer_config(void *handle, PWAT_WRITER_CFG *cfg);
PWAT_API int pwat_set_writer_config(void *handle, const PWAT_WRITER_CFG *cfg);
PWAT_API int pwat_set_baudrate(void *handle, uint32_t baudrate);

/* ------------------------------------------------------------------ */
/* 在线操作                                                             */
/* ------------------------------------------------------------------ */
PWAT_API int pwat_target_connect(void *handle);
PWAT_API int pwat_target_status(void *handle);  /* 1: 已连接, 0: 未连接或失败 */
PWAT_API int pwat_target_get_id(void *handle, PWAT_CHIP_ID *cid);
PWAT_API int pwat_target_read(void *handle, uint32_t addr, uint32_t size, PWAT_MEM_BLOCK *block);
PWAT_API int pwat_target_erase(void *handle, int timeout_ms);
PWAT_API int pwat_target_erase_sector(void *handle, uint32_t addr, uint32_t size, int timeout_ms);
PWAT_API int pwat_target_write_prepare(void *handle, uint32_t total);
PWAT_API int pwat_target_write(void *handle, uint32_t addr, const uint8_t *data, uint32_t size);
PWAT_API int pwat_target_read_ob(void *handle, PWAT_OPTION_BYTE *ob);
PWAT_API int pwat_target_write_vendor_ob(void *handle, int timeout_ms);
PWAT_API int pwat_target_write_user_ob(void *handle, int timeout_ms);
PWAT_API int pwat_target_reset(void *handle, uint32_t reset_type);

/* ------------------------------------------------------------------ */
/* 离线工程                                                             */
/* ------------------------------------------------------------------ */
PWAT_API int pwat_project_info(void *handle, PWAT_PROJECT_INFO *info);
PWAT_API int pwat_project_disable(void *handle);
PWAT_API int pwat_project_load(void *handle, const char *name, const char *password,
                               const uint8_t *data, uint32_t size,
                               PWAT_PROGRESS_CB progress_cb, void *user);
PWAT_API int pwat_offline_start(void *handle);
PWAT_API int pwat_offline_status(void *handle, PWAT_OFFLINE_STATUS *status);
PWAT_API int pwat_project_switch(void *handle, int reload_type,
                                 const char *name, const char *password);

/* ------------------------------------------------------------------ */
/* 广播与工厂测试                                                       */
/* ------------------------------------------------------------------ */
PWAT_API int pwat_broadcast(void *handle, const uint8_t *data, uint32_t size,
                            int direction, int keep_frame, int wait_rsp,
                            int timeout_ms, PWAT_BROADCAST *response);
PWAT_API int pwat_factory_run_sram_fw(void *handle, int timeout_ms);
PWAT_API int pwat_factory_run_flash_fw(void *handle, int timeout_ms);

#ifdef __cplusplus
}
#endif

#endif /* PWAT_BRIDGE_H */
