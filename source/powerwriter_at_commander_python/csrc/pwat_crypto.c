/**
 * @file    pwat_crypto.c
 * @brief   Runtime-configurable AES128-CBC wrapper for the Python bridge.
 *
 * This file provides the powerwriter_at_encrypt() symbol used by the core.
 * It is used instead of powerwriter_at_cert.c for the Python shared library so
 * the GUI/CLI can select the device's key and IV at runtime without changing
 * the C core sources. AES and CBC remain implemented by the C core's
 * 3rd/aes/aes.c.
 */

#include "pwat_crypto.h"
#include "powerwriter_at_cert.h"
#include "3rd/aes/aes.h"

#include <string.h>

#ifdef POWERWRITER_AT_ENCRYPT_ENABLE

static uint8_t g_key[AES_KEYLEN];
static uint8_t g_iv[AES_BLOCKLEN];
static bool g_ready = false;

static void pwat_crypto_ensure_defaults(void)
{
    if (!g_ready)
    {
        memcpy(g_key, m_at_encrypt_key, AES_KEYLEN);
        memcpy(g_iv, m_at_encrypt_iv_, AES_BLOCKLEN);
        g_ready = true;
    }
}

void pwat_crypto_set_key_iv(const uint8_t *key, const uint8_t *iv)
{
    if (!key && !iv)
    {
        g_ready = false;
        return;
    }
    if (!key || !iv)
    {
        return;
    }
    memcpy(g_key, key, AES_KEYLEN);
    memcpy(g_iv, iv, AES_BLOCKLEN);
    g_ready = true;
}

bool powerwriter_at_encrypt(void *data, size_t size, bool encrypt)
{
    struct AES_ctx ctx;

    pwat_crypto_ensure_defaults();
    AES_init_ctx_iv(&ctx, g_key, g_iv);
    if (encrypt)
    {
        AES_CBC_encrypt_buffer(&ctx, (uint8_t *)data, (uint32_t)size);
    }
    else
    {
        AES_CBC_decrypt_buffer(&ctx, (uint8_t *)data, (uint32_t)size);
    }
    return true;
}

#else

void pwat_crypto_set_key_iv(const uint8_t *key, const uint8_t *iv)
{
    (void)key;
    (void)iv;
}

bool powerwriter_at_encrypt(void *data, size_t size, bool encrypt)
{
    (void)data;
    (void)size;
    (void)encrypt;
    return true;
}

#endif /* POWERWRITER_AT_ENCRYPT_ENABLE */
