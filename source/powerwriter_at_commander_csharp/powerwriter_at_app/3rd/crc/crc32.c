/**
 * @file    crc32.c
 * @brief   Implementation of crc.h
 */

#include "crc.h"

#define FALSE	0
#define TRUE	!FALSE

typedef unsigned long  crc;

#define CRC_NAME			"CRC-32"
#define POLYNOMIAL			0x04C11DB7
#define INITIAL_REMAINDER	0xFFFFFFFF
#define FINAL_XOR_VALUE		0xFFFFFFFF
#define REFLECT_DATA		TRUE
#define REFLECT_REMAINDER	TRUE

/*
 * Derive parameters from the standard-specific parameters in crc.h.
 */
#define WIDTH_CRC32    (8 * sizeof(crc))
#define TOPBIT   (1U << (WIDTH_CRC32 - 1))

#if (REFLECT_DATA == TRUE)
#undef  REFLECT_DATA
#define REFLECT_DATA(X)			((unsigned char) reflect((X), 8))
#else
#undef  REFLECT_DATA
#define REFLECT_DATA(X)			(X)
#endif

#if (REFLECT_REMAINDER == TRUE)
#undef  REFLECT_REMAINDER
#define REFLECT_REMAINDER(X)	((crc) reflect((X), WIDTH_CRC32))
#else
#undef  REFLECT_REMAINDER
#define REFLECT_REMAINDER(X)	(X)
#endif

/*********************************************************************
 * Function:    reflect()
 * Description: Reorder the bits of a binary sequence, by reflecting
 *				them about the middle position.
 * Notes:		No checking is done that nBits <= 32.
 * Returns:		The reflection of the original data.
 *********************************************************************/
static unsigned long
reflect(unsigned long data, unsigned char nBits)
{
    unsigned long  reflection = 0x00000000;
    unsigned char  bit;
    for (bit = 0; bit < nBits; ++bit) {
        if (data & 0x01) {
            reflection |= (1 << ((nBits - 1) - bit));
        }
        data = (data >> 1);
    }
    return (reflection);
}	


/*********************************************************************
 * Function:    crc32()
 * Description: Compute the CRC of a given message.
 * Notes:
 * Returns:		The CRC of the message.
 *********************************************************************/
uint32_t
crc32(const void *data, int nBytes)
{
    crc            remainder = INITIAL_REMAINDER;
    int            byte;
    unsigned char  bit;
    unsigned char const *message = data;
    for (byte = 0; byte < nBytes; ++byte) {
        remainder ^= (REFLECT_DATA(message[byte]) << (WIDTH_CRC32 - 8));
        for (bit = 8; bit > 0; --bit) {
            if (remainder & TOPBIT) {
                remainder = (remainder << 1) ^ POLYNOMIAL;
            } else {
                remainder = (remainder << 1);
            }
        }
    }
    return (REFLECT_REMAINDER(remainder) ^ FINAL_XOR_VALUE);
} 
