cmake_minimum_required(VERSION 3.21)
project(powerwriter_at_core)

add_library(powerwriter_at_core
		./powerwriter_at_error.h
		./powerwriter_at_api.c
        		./powerwriter_at_api.h
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
