/**
 * @file    pwat_bridge.c
 * @brief   PowerWriter AT C 核心 -> Python 桥接层实现
 */

#define PWAT_BRIDGE_EXPORTS
#include "pwat_bridge.h"
#include "pwat_crypto.h"

#include "powerwriter_at_api.h"

#include <stddef.h>
#include <stdlib.h>
#include <string.h>

#define PWAT_VERSION 0x00010000u

/* 结构体布局一致性检查（编译期失败即说明与 C 核心定义不一致） */
typedef char pwat_check_writer_info[
    (sizeof(PWAT_WRITER_INFO) == sizeof(S_ATCmdRspWriterInfo)) ? 1 : -1];
typedef char pwat_check_writer_cfg[
    (sizeof(PWAT_WRITER_CFG) == sizeof(S_ATCmdRspWriterCfg)) ? 1 : -1];
typedef char pwat_check_chip_id[
    (sizeof(PWAT_CHIP_ID) == sizeof(S_ATCmdRspTargetChipID)) ? 1 : -1];
typedef char pwat_check_mem_block[
    (sizeof(PWAT_MEM_BLOCK) == sizeof(S_ATCmdRspTargetMemory)) ? 1 : -1];
typedef char pwat_check_option_byte[
    (sizeof(PWAT_OPTION_BYTE) == sizeof(S_ATCmdRspTargetOptionByte)) ? 1 : -1];
typedef char pwat_check_project_info[
    (sizeof(PWAT_PROJECT_INFO) == sizeof(S_ATCmdRspProjectInfo)) ? 1 : -1];
typedef char pwat_check_broadcast[
    (sizeof(PWAT_BROADCAST) == sizeof(S_ATCmdBroadcast)) ? 1 : -1];

/* 每个通道额外保存 Python 回调信息。ch 必须是第一个成员，
 * 这样可以从回调参数中的 S_ATChannel* 直接还原 PWAT_CTX*。 */
typedef struct PWAT_CTX
{
    S_ATChannel ch;
    PWAT_WRITE_CB write_cb;
    PWAT_EVENT_CB event_cb;
    void *user;
} PWAT_CTX;

#define CTX(h) ((PWAT_CTX *)(h))

/* 工程加载进度回调没有 user 参数，使用线程局部变量传递上下文。
 * Python 客户端串行调用，且该回调与 powerwriter_at_project_load 在同一线程执行。 */
#if defined(_MSC_VER)
#  define PWAT_TLS __declspec(thread)
#else
#  define PWAT_TLS __thread
#endif

static PWAT_TLS PWAT_PROGRESS_CB g_progress_cb = NULL;
static PWAT_TLS void *g_progress_user = NULL;

/* ------------------------------------------------------------------ */
/* 回调转换                                                             */
/* ------------------------------------------------------------------ */
static bool _write_trampoline(S_ATCmdFrame *frame, int timeout)
{
    /* frame == &ch->m_cmdOutput，据此还原 PWAT_CTX */
    PWAT_CTX *ctx = (PWAT_CTX *)((uint8_t *)frame - offsetof(S_ATChannel, m_cmdOutput));
    if (!ctx || !ctx->write_cb)
    {
        return false;
    }
    return ctx->write_cb(ctx->user, (const uint8_t *)frame, frame->m_frameLength, timeout) != 0;
}

static void _event_trampoline(void *obj, S_ATCmdEvent event)
{
    PWAT_CTX *ctx = (PWAT_CTX *)obj;
    if (ctx && ctx->event_cb)
    {
        ctx->event_cb(ctx->user, (int)event);
    }
}

static void _progress_trampoline(S_ATCmdStatusProgress *progress)
{
    if (g_progress_cb && progress)
    {
        g_progress_cb(g_progress_user, progress->m_total, progress->m_processed);
    }
}

/* ------------------------------------------------------------------ */
/* 生命周期                                                             */
/* ------------------------------------------------------------------ */
PWAT_API uint32_t pwat_version(void)
{
    return PWAT_VERSION;
}

PWAT_API void *pwat_create(int encrypt, PWAT_WRITE_CB write_cb,
                           PWAT_EVENT_CB event_cb, void *user)
{
    PWAT_CTX *ctx;

    if (!write_cb)
    {
        return NULL;
    }
    ctx = (PWAT_CTX *)calloc(1, sizeof(PWAT_CTX));
    if (!ctx)
    {
        return NULL;
    }
    ctx->write_cb = write_cb;
    ctx->event_cb = event_cb;
    ctx->user = user;

    if (!powerwriter_at_init(&ctx->ch, encrypt != 0,
                             _write_trampoline, _event_trampoline))
    {
        free(ctx);
        return NULL;
    }
    return ctx;
}

PWAT_API int pwat_set_encrypt_key_iv(void *handle, const uint8_t *key,
                                     const uint8_t *iv)
{
    if (!handle)
    {
        return 0;
    }
    pwat_crypto_set_key_iv(key, iv);
    return 1;
}

PWAT_API void pwat_destroy(void *handle)
{
    if (handle)
    {
        free(handle);
    }
}

PWAT_API int pwat_feed(void *handle, const uint8_t *data, uint32_t size)
{
    if (!handle || (!data && size))
    {
        return 0;
    }
    return powerwriter_at_datain(&CTX(handle)->ch, (void *)data, size) ? 1 : 0;
}

PWAT_API uint32_t pwat_last_error(void *handle)
{
    if (!handle)
    {
        return (uint32_t)ATErrorNullValue;
    }
    return (uint32_t)powerwriter_at_last_error(&CTX(handle)->ch);
}

/* ------------------------------------------------------------------ */
/* 系统信息与配置                                                       */
/* ------------------------------------------------------------------ */
PWAT_API int pwat_get_writer_info(void *handle, PWAT_WRITER_INFO *info)
{
    S_ATCmdRspWriterInfo value;
    if (!handle || !info)
    {
        return 0;
    }
    if (!powerwriter_at_get_writerinfo(&CTX(handle)->ch, &value))
    {
        return 0;
    }
    memcpy(info, &value, sizeof(value));
    return 1;
}

PWAT_API int pwat_get_writer_config(void *handle, PWAT_WRITER_CFG *cfg)
{
    S_ATCmdRspWriterCfg value;
    if (!handle || !cfg)
    {
        return 0;
    }
    if (!powerwriter_at_get_writerconfig(&CTX(handle)->ch, &value))
    {
        return 0;
    }
    memcpy(cfg, &value, sizeof(value));
    return 1;
}

PWAT_API int pwat_set_writer_config(void *handle, const PWAT_WRITER_CFG *cfg)
{
    S_ATCmdRspWriterCfg value;
    if (!handle || !cfg)
    {
        return 0;
    }
    memcpy(&value, cfg, sizeof(value));
    return powerwriter_at_set_writerconfig(&CTX(handle)->ch, &value) ? 1 : 0;
}

PWAT_API int pwat_set_baudrate(void *handle, uint32_t baudrate)
{
    if (!handle)
    {
        return 0;
    }
    return powerwriter_at_set_baudrate(&CTX(handle)->ch, (int)baudrate) ? 1 : 0;
}

/* ------------------------------------------------------------------ */
/* 在线操作                                                             */
/* ------------------------------------------------------------------ */
PWAT_API int pwat_target_connect(void *handle)
{
    if (!handle)
    {
        return 0;
    }
    return powerwriter_at_target_connect(&CTX(handle)->ch) ? 1 : 0;
}

PWAT_API int pwat_target_status(void *handle)
{
    if (!handle)
    {
        return 0;
    }
    return powerwriter_at_target_status(&CTX(handle)->ch) ? 1 : 0;
}

PWAT_API int pwat_target_get_id(void *handle, PWAT_CHIP_ID *cid)
{
    S_ATCmdRspTargetChipID value;
    if (!handle || !cid)
    {
        return 0;
    }
    if (!powerwriter_at_target_id(&CTX(handle)->ch, &value))
    {
        return 0;
    }
    memcpy(cid, &value, sizeof(value));
    return 1;
}

PWAT_API int pwat_target_read(void *handle, uint32_t addr, uint32_t size,
                              PWAT_MEM_BLOCK *block)
{
    S_ATCmdRspTargetMemory *memory = NULL;
    if (!handle || !block || !size)
    {
        return 0;
    }
    if (!powerwriter_at_target_read(&CTX(handle)->ch, addr, size, &memory) || !memory)
    {
        return 0;
    }
    block->address = memory->m_address;
    block->size = memory->m_size;
    memcpy(block->data, memory->m_buffer, sizeof(block->data));
    return 1;
}

PWAT_API int pwat_target_erase(void *handle, int timeout_ms)
{
    if (!handle)
    {
        return 0;
    }
    return powerwriter_at_target_erase(&CTX(handle)->ch, timeout_ms) ? 1 : 0;
}

PWAT_API int pwat_target_erase_sector(void *handle, uint32_t addr,
                                      uint32_t size, int timeout_ms)
{
    if (!handle)
    {
        return 0;
    }
    return powerwriter_at_target_erase_sector(&CTX(handle)->ch, addr, size, timeout_ms) ? 1 : 0;
}

PWAT_API int pwat_target_write_prepare(void *handle, uint32_t total)
{
    if (!handle)
    {
        return 0;
    }
    return powerwriter_at_target_write_prepare(&CTX(handle)->ch, total) ? 1 : 0;
}

PWAT_API int pwat_target_write(void *handle, uint32_t addr,
                               const uint8_t *data, uint32_t size)
{
    if (!handle || !data || !size)
    {
        return 0;
    }
    return powerwriter_at_target_write(&CTX(handle)->ch, addr, (void *)data, size) ? 1 : 0;
}

PWAT_API int pwat_target_read_ob(void *handle, PWAT_OPTION_BYTE *ob)
{
    S_ATCmdRspTargetOptionByte *value = NULL;
    if (!handle || !ob)
    {
        return 0;
    }
    if (!powerwriter_at_target_read_ob(&CTX(handle)->ch, &value) || !value)
    {
        return 0;
    }
    ob->size = value->m_OBsize;
    memcpy(ob->data, value->m_OBData, sizeof(ob->data));
    return 1;
}

PWAT_API int pwat_target_write_vendor_ob(void *handle, int timeout_ms)
{
    if (!handle)
    {
        return 0;
    }
    return powerwriter_at_target_write_vendor_ob(&CTX(handle)->ch, timeout_ms) ? 1 : 0;
}

PWAT_API int pwat_target_write_user_ob(void *handle, int timeout_ms)
{
    if (!handle)
    {
        return 0;
    }
    return powerwriter_at_target_write_user_ob(&CTX(handle)->ch, timeout_ms) ? 1 : 0;
}

PWAT_API int pwat_target_reset(void *handle, uint32_t reset_type)
{
    if (!handle)
    {
        return 0;
    }
    return powerwriter_at_target_reset(&CTX(handle)->ch, (E_resetType)reset_type) ? 1 : 0;
}

/* ------------------------------------------------------------------ */
/* 离线工程                                                             */
/* ------------------------------------------------------------------ */
PWAT_API int pwat_project_info(void *handle, PWAT_PROJECT_INFO *info)
{
    S_ATCmdRspProjectInfo *value = NULL;
    if (!handle || !info)
    {
        return 0;
    }
    if (!powerwriter_at_project_info(&CTX(handle)->ch, &value) || !value)
    {
        return 0;
    }
    memcpy(info, value, sizeof(*info));
    return 1;
}

PWAT_API int pwat_project_disable(void *handle)
{
    if (!handle)
    {
        return 0;
    }
    return powerwriter_at_project_disable(&CTX(handle)->ch) ? 1 : 0;
}

PWAT_API int pwat_project_load(void *handle, const char *name, const char *password,
                               const uint8_t *data, uint32_t size,
                               PWAT_PROGRESS_CB progress_cb, void *user)
{
    PWAT_PROGRESS_CB old_cb;
    void *old_user;
    int result;

    if (!handle || !name || !password || !data || !size)
    {
        return 0;
    }

    old_cb = g_progress_cb;
    old_user = g_progress_user;
    g_progress_cb = progress_cb;
    g_progress_user = user;

    result = powerwriter_at_project_load(&CTX(handle)->ch, name, password,
                                         data, size,
                                         progress_cb ? _progress_trampoline : NULL)
                 ? 1 : 0;

    g_progress_cb = old_cb;
    g_progress_user = old_user;
    return result;
}

PWAT_API int pwat_offline_start(void *handle)
{
    if (!handle)
    {
        return 0;
    }
    return powerwriter_at_offline_start(&CTX(handle)->ch) ? 1 : 0;
}

PWAT_API int pwat_offline_status(void *handle, PWAT_OFFLINE_STATUS *status)
{
    S_ATCmdStatus value;
    const S_ATCmdFrame *frame;
    E_ATCmdError err;

    if (!handle || !status)
    {
        return 0;
    }
    memset(status, 0, sizeof(*status));
    memset(&value, 0, sizeof(value));

    if (powerwriter_at_offline_status(&CTX(handle)->ch, &value))
    {
        status->status = (int32_t)value.m_statusType;
        if (value.m_statusType == ATStatusProgress)
        {
            status->total = value.param.m_progress.m_total;
            status->processed = value.param.m_progress.m_processed;
        }
        return 1;
    }

    err = powerwriter_at_last_error(&CTX(handle)->ch);
    status->error = (uint32_t)err;
    frame = powerwriter_at_received_frame(&CTX(handle)->ch);

    /* 设备明确返回 ATCmdStatusError 时，按"烧录失败"上报；
     * 超时/端口错误等通信故障则返回 0。 */
    if (err != ATErrorTimeout && err != ATErrorPort &&
        frame && frame->m_payload.m_cmdType == ATCmdStatusError)
    {
        status->status = PWAT_STATUS_ERROR;
        return 1;
    }
    status->status = PWAT_STATUS_UNKNOWN;
    return 0;
}

PWAT_API int pwat_project_switch(void *handle, int reload_type,
                                 const char *name, const char *password)
{
    if (!handle || !name || !password)
    {
        return 0;
    }
    return powerwriter_at_project_switch(&CTX(handle)->ch,
                                         (S_SwitchPrjReloadType)reload_type,
                                         name, password)
               ? 1 : 0;
}

/* ------------------------------------------------------------------ */
/* 广播与工厂测试                                                       */
/* ------------------------------------------------------------------ */
PWAT_API int pwat_broadcast(void *handle, const uint8_t *data, uint32_t size,
                            int direction, int keep_frame, int wait_rsp,
                            int timeout_ms, PWAT_BROADCAST *response)
{
    S_ATCmdBroadcast value;

    if (!handle || !data || !size)
    {
        return 0;
    }
    memset(&value, 0, sizeof(value));

    if (!powerwriter_at_broadcast(&CTX(handle)->ch, data, size,
                                  (S_ATCmdBroadcastDir)direction,
                                  keep_frame != 0, wait_rsp != 0,
                                  &value, timeout_ms))
    {
        return 0;
    }
    if (wait_rsp && response)
    {
        response->keep_frame = value.m_keepATFrame;
        response->direction = (int32_t)value.m_dirType;
        response->size = value.m_size;
        memcpy(response->data, value.m_data, sizeof(response->data));
    }
    return 1;
}

PWAT_API int pwat_factory_run_sram_fw(void *handle, int timeout_ms)
{
    if (!handle)
    {
        return 0;
    }
    return powerwriter_at_run_factory_sram_fw(&CTX(handle)->ch, timeout_ms) ? 1 : 0;
}

PWAT_API int pwat_factory_run_flash_fw(void *handle, int timeout_ms)
{
    if (!handle)
    {
        return 0;
    }
    return powerwriter_at_run_factory_flash_fw(&CTX(handle)->ch, timeout_ms) ? 1 : 0;
}
