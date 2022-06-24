cmake_minimum_required(VERSION 3.21)
project(powerwriter_at_console C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_EXE_LINKER_FLAGS "-static")

add_executable(powerwriter_at_console
        ./../../source/powerwriter_at_api.h
        ./../../source/powerwriter_at_config.h
        ./../../source/powerwriter_at_cert.c
        ./../../source/powerwriter_at_cert.h
        ./../../source/powerwriter_at_log.h
        ./../../source/powerwriter_at_samples.c
        ./../../source/3rd/crc/crc32.c
        ./../../source/3rd/aes/aes.c
        main.c
        )
