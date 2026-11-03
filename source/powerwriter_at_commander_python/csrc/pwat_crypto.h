/**
 * @file    pwat_crypto.h
 * @brief   Runtime AES128-CBC key/IV selection for the Python bridge.
 *
 * The C core keeps a compile-time default key and IV in
 * powerwriter_at_config.h. The Python bridge replaces the core's encryption
 * wrapper so the key and IV can be supplied at runtime, while still using the
 * AES implementation from the C core.
 */

#ifndef PWAT_CRYPTO_H
#define PWAT_CRYPTO_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

/**
 * Set the AES128-CBC key and IV used by powerwriter_at_encrypt().
 * Passing NULL for both resets the compile-time defaults.
 */
void pwat_crypto_set_key_iv(const uint8_t *key, const uint8_t *iv);

#endif /* PWAT_CRYPTO_H */
