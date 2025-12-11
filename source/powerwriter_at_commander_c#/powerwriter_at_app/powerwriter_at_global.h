#ifndef POWERWRITER_AT_GLOBAL_H
#define POWERWRITER_AT_GLOBAL_H

#if defined(_MSC_VER) || defined(__NT__) || \
        defined(WIN64) || defined(_WIN64) || defined(__WIN64__) || \
        defined(WIN32) || defined(_WIN32) || defined(__WIN32__)
    #ifdef __cplusplus
        #  define PW_AT_LIB_DECL_EXPORT extern "C" __declspec(dllexport)
        #  define PW_AT_LIB_DECL_IMPORT extern "C" __declspec(dllimport)
    #else
        #  define PW_AT_LIB_DECL_EXPORT extern  __declspec(dllexport)
        #  define PW_AT_LIB_DECL_IMPORT extern  __declspec(dllimport)
    #endif
#else
    #ifdef __cplusplus
        #  define PW_AT_LIB_DECL_EXPORT extern "C" __attribute__((visibility("default")))
        #  define PW_AT_LIB_DECL_IMPORT extern "C" __attribute__((visibility("default")))
    #else
        #  define PW_AT_LIB_DECL_EXPORT extern __attribute__((visibility("default")))
        #  define PW_AT_LIB_DECL_IMPORT extern __attribute__((visibility("default")))
    #endif
#endif

#if defined (POWERWRITER_AT_APP)
    #if defined(LIBRARY_EXPORT)
        #  define PW_AT_APP_EXPORT PW_AT_LIB_DECL_EXPORT
    #else
        #  define PW_AT_APP_EXPORT PW_AT_LIB_DECL_IMPORT
    #endif

    #ifdef __cplusplus
        #  define PW_AT_API_EXPORT extern "C"
    #else
        #  define PW_AT_API_EXPORT extern
    #endif
#elif defined (POWERWRITER_AT_API)
    #if defined(LIBRARY_EXPORT)
        #  define PW_AT_APP_EXPORT extern "C"
    #else
        #  define PW_AT_APP_EXPORT extern
    #endif

    #ifdef __cplusplus
        #  define PW_AT_API_EXPORT PW_AT_LIB_DECL_EXPORT
    #else
        #  define PW_AT_API_EXPORT PW_AT_LIB_DECL_IMPORT
    #endif
#else
    #ifdef __cplusplus
        #  define PW_AT_API_EXPORT extern "C"
        #  define PW_AT_APP_EXPORT extern "C"
    #else
        #  define PW_AT_API_EXPORT extern
        #  define PW_AT_APP_EXPORT extern
    #endif
#endif

#endif // POWERWRITER_AT_GLOBAL_H