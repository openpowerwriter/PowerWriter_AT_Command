
========================================================================

** ELF Header Information

    File Name: stm32f103rfc6\stm32f103rfc6.axf

    Machine class: ELFCLASS32 (32-bit)
    Data encoding: ELFDATA2LSB (Little endian)
    Header version: EV_CURRENT (Current version)
    Operating System ABI: none
    ABI Version: 0
    File Type: ET_EXEC (Executable) (2)
    Machine: EM_ARM (ARM)

    Image Entry point: 0x08000131
    Flags: EF_ARM_HASENTRY + EF_ARM_ABI_FLOAT_SOFT (0x05000202)

    ARM ELF revision: 5 (ABI version 2)

    Conforms to Soft float procedure-call standard

    Built with
    Component: ARM Compiler 5.06 update 6 (build 750) Tool: armasm [4d35ec]
    Component: ARM Compiler 5.06 update 6 (build 750) Tool: armlink [4d35ed]

    Header size: 52 bytes (0x34)
    Program header entry size: 32 bytes (0x20)
    Section header entry size: 40 bytes (0x28)

    Program header entries: 2
    Section header entries: 17

    Program header offset: 940028 (0x000e57fc)
    Section header offset: 940092 (0x000e583c)

    Section header string table index: 16

========================================================================

** Program header #0 (PT_LOAD) [PF_X + PF_W + PF_R + PF_ARM_ENTRY]
    Size : 43044 bytes (33396 bytes in file)
    Virtual address: 0x08000000 (Alignment 8)


====================================

** Program header #1 (PT_LOAD) [PF_X + PF_R]
    Size : 2876 bytes
    Virtual address: 0x20017000 (Alignment 4)


========================================================================

** Section #1 'ER_IROM1' (SHT_PROGBITS) [SHF_ALLOC + SHF_EXECINSTR]
    Size   : 33284 bytes (alignment 4)
    Address: 0x08000000

    $d.realdata
    RESET
    __Vectors
        0x08000000:    20002620     &.     DCD    536880672
        0x08000004:    080001d5    ....    DCD    134218197
        0x08000008:    0800102d    -...    DCD    134221869
        0x0800000c:    08001029    )...    DCD    134221865
        0x08000010:    0800102b    +...    DCD    134221867
        0x08000014:    080007e1    ....    DCD    134219745
        0x08000018:    08001039    9...    DCD    134221881
        0x0800001c:    00000000    ....    DCD    0
        0x08000020:    00000000    ....    DCD    0
        0x08000024:    00000000    ....    DCD    0
        0x08000028:    00000000    ....    DCD    0
        0x0800002c:    08001031    1...    DCD    134221873
        0x08000030:    080007e3    ....    DCD    134219747
        0x08000034:    00000000    ....    DCD    0
        0x08000038:    0800102f    /...    DCD    134221871
        0x0800003c:    08001033    3...    DCD    134221875
        0x08000040:    080001ef    ....    DCD    134218223
        0x08000044:    080001ef    ....    DCD    134218223
        0x08000048:    080001ef    ....    DCD    134218223
        0x0800004c:    080001ef    ....    DCD    134218223
        0x08000050:    080001ef    ....    DCD    134218223
        0x08000054:    080001ef    ....    DCD    134218223
        0x08000058:    080001ef    ....    DCD    134218223
        0x0800005c:    080001ef    ....    DCD    134218223
        0x08000060:    080001ef    ....    DCD    134218223
        0x08000064:    080001ef    ....    DCD    134218223
        0x08000068:    080001ef    ....    DCD    134218223
        0x0800006c:    080001ef    ....    DCD    134218223
        0x08000070:    080001ef    ....    DCD    134218223
        0x08000074:    080001ef    ....    DCD    134218223
        0x08000078:    080001ef    ....    DCD    134218223
        0x0800007c:    080001ef    ....    DCD    134218223
        0x08000080:    080001ef    ....    DCD    134218223
        0x08000084:    080001ef    ....    DCD    134218223
        0x08000088:    080001ef    ....    DCD    134218223
        0x0800008c:    080001ef    ....    DCD    134218223
        0x08000090:    080001ef    ....    DCD    134218223
        0x08000094:    080001ef    ....    DCD    134218223
        0x08000098:    080001ef    ....    DCD    134218223
        0x0800009c:    080001ef    ....    DCD    134218223
        0x080000a0:    080001ef    ....    DCD    134218223
        0x080000a4:    080001ef    ....    DCD    134218223
        0x080000a8:    080001ef    ....    DCD    134218223
        0x080000ac:    080001ef    ....    DCD    134218223
        0x080000b0:    080001ef    ....    DCD    134218223
        0x080000b4:    080001ef    ....    DCD    134218223
        0x080000b8:    080001ef    ....    DCD    134218223
        0x080000bc:    080001ef    ....    DCD    134218223
        0x080000c0:    080001ef    ....    DCD    134218223
        0x080000c4:    080001ef    ....    DCD    134218223
        0x080000c8:    080001ef    ....    DCD    134218223
        0x080000cc:    080001ef    ....    DCD    134218223
        0x080000d0:    080001ef    ....    DCD    134218223
        0x080000d4:    080001ef    ....    DCD    134218223
        0x080000d8:    080001ef    ....    DCD    134218223
        0x080000dc:    080001ef    ....    DCD    134218223
        0x080000e0:    080001ef    ....    DCD    134218223
        0x080000e4:    080001ef    ....    DCD    134218223
        0x080000e8:    080001ef    ....    DCD    134218223
        0x080000ec:    080001ef    ....    DCD    134218223
        0x080000f0:    080001ef    ....    DCD    134218223
        0x080000f4:    080001ef    ....    DCD    134218223
        0x080000f8:    080001ef    ....    DCD    134218223
        0x080000fc:    080001ef    ....    DCD    134218223
        0x08000100:    080001ef    ....    DCD    134218223
        0x08000104:    080001ef    ....    DCD    134218223
        0x08000108:    080001ef    ....    DCD    134218223
        0x0800010c:    080001ef    ....    DCD    134218223
        0x08000110:    080001ef    ....    DCD    134218223
        0x08000114:    080001ef    ....    DCD    134218223
        0x08000118:    080001ef    ....    DCD    134218223
        0x0800011c:    080001ef    ....    DCD    134218223
        0x08000120:    080001ef    ....    DCD    134218223
        0x08000124:    080001ef    ....    DCD    134218223
        0x08000128:    080001ef    ....    DCD    134218223
        0x0800012c:    080001ef    ....    DCD    134218223
    $t
    !!!main
    __Vectors_End
    __main
        0x08000130:    f000f802    ....    BL       __scatterload ; 0x8000138
        0x08000134:    f000f83e    ..>.    BL       __rt_entry ; 0x80001b4
    !!!scatter
    __scatterload
    __scatterload_rt2
    __scatterload_rt2_thumb_only
        0x08000138:    a00a        ..      ADR      r0,{pc}+0x2c ; 0x8000164
        0x0800013a:    e8900c00    ....    LDM      r0,{r10,r11}
        0x0800013e:    4482        .D      ADD      r10,r10,r0
        0x08000140:    4483        .D      ADD      r11,r11,r0
        0x08000142:    f1aa0701    ....    SUB      r7,r10,#1
    __scatterload_null
        0x08000146:    45da        .E      CMP      r10,r11
        0x08000148:    d101        ..      BNE      0x800014e ; __scatterload_null + 8
        0x0800014a:    f000f833    ..3.    BL       __rt_entry ; 0x80001b4
        0x0800014e:    f2af0e09    ....    ADR      lr,{pc}-7 ; 0x8000147
        0x08000152:    e8ba000f    ....    LDM      r10!,{r0-r3}
        0x08000156:    f0130f01    ....    TST      r3,#1
        0x0800015a:    bf18        ..      IT       NE
        0x0800015c:    1afb        ..      SUBNE    r3,r7,r3
        0x0800015e:    f0430301    C...    ORR      r3,r3,#1
        0x08000162:    4718        .G      BX       r3
    $d
        0x08000164:    00008080    ....    DCD    32896
        0x08000168:    000080a0    ....    DCD    32928
    $t
    !!handler_copy
    __scatterload_copy
        0x0800016c:    3a10        .:      SUBS     r2,r2,#0x10
        0x0800016e:    bf24        $.      ITT      CS
        0x08000170:    c878        x.      LDMCS    r0!,{r3-r6}
        0x08000172:    c178        x.      STMCS    r1!,{r3-r6}
        0x08000174:    d8fa        ..      BHI      __scatterload_copy ; 0x800016c
        0x08000176:    0752        R.      LSLS     r2,r2,#29
        0x08000178:    bf24        $.      ITT      CS
        0x0800017a:    c830        0.      LDMCS    r0!,{r4,r5}
        0x0800017c:    c130        0.      STMCS    r1!,{r4,r5}
        0x0800017e:    bf44        D.      ITT      MI
        0x08000180:    6804        .h      LDRMI    r4,[r0,#0]
        0x08000182:    600c        .`      STRMI    r4,[r1,#0]
        0x08000184:    4770        pG      BX       lr
        0x08000186:    0000        ..      MOVS     r0,r0
    !!handler_zi
    __scatterload_zeroinit
        0x08000188:    2300        .#      MOVS     r3,#0
        0x0800018a:    2400        .$      MOVS     r4,#0
        0x0800018c:    2500        .%      MOVS     r5,#0
        0x0800018e:    2600        .&      MOVS     r6,#0
        0x08000190:    3a10        .:      SUBS     r2,r2,#0x10
        0x08000192:    bf28        (.      IT       CS
        0x08000194:    c178        x.      STMCS    r1!,{r3-r6}
        0x08000196:    d8fb        ..      BHI      0x8000190 ; __scatterload_zeroinit + 8
        0x08000198:    0752        R.      LSLS     r2,r2,#29
        0x0800019a:    bf28        (.      IT       CS
        0x0800019c:    c130        0.      STMCS    r1!,{r4,r5}
        0x0800019e:    bf48        H.      IT       MI
        0x080001a0:    600b        .`      STRMI    r3,[r1,#0]
        0x080001a2:    4770        pG      BX       lr
    .ARM.Collect$$libinit$$00000000
    __rt_lib_init
        0x080001a4:    b51f        ..      PUSH     {r0-r4,lr}
    .ARM.Collect$$libinit$$00000002
    .ARM.Collect$$libinit$$00000004
    .ARM.Collect$$libinit$$00000005
    __rt_lib_init_fp_1
    __rt_lib_init_heap_2
    __rt_lib_init_preinit_1
        0x080001a6:    e89d0003    ....    LDM      sp,{r0,r1}
        0x080001aa:    f000fa1d    ....    BL       _init_alloc ; 0x80005e8
    .ARM.Collect$$libinit$$0000000A
    .ARM.Collect$$libinit$$0000000C
    .ARM.Collect$$libinit$$0000000E
    .ARM.Collect$$libinit$$00000011
    .ARM.Collect$$libinit$$00000013
    .ARM.Collect$$libinit$$00000015
    .ARM.Collect$$libinit$$00000017
    .ARM.Collect$$libinit$$00000019
    .ARM.Collect$$libinit$$0000001B
    .ARM.Collect$$libinit$$0000001D
    .ARM.Collect$$libinit$$0000001F
    .ARM.Collect$$libinit$$00000021
    .ARM.Collect$$libinit$$00000023
    .ARM.Collect$$libinit$$00000025
    .ARM.Collect$$libinit$$0000002C
    .ARM.Collect$$libinit$$0000002E
    .ARM.Collect$$libinit$$00000030
    .ARM.Collect$$libinit$$00000032
    .ARM.Collect$$libinit$$00000033
    __rt_lib_init_alloca_1
    __rt_lib_init_argv_1
    __rt_lib_init_atexit_1
    __rt_lib_init_clock_1
    __rt_lib_init_cpp_1
    __rt_lib_init_exceptions_1
    __rt_lib_init_fp_trap_1
    __rt_lib_init_getenv_1
    __rt_lib_init_heap_1
    __rt_lib_init_lc_collate_1
    __rt_lib_init_lc_ctype_1
    __rt_lib_init_lc_monetary_1
    __rt_lib_init_lc_numeric_1
    __rt_lib_init_lc_time_1
    __rt_lib_init_rand_1
    __rt_lib_init_return
    __rt_lib_init_signal_1
    __rt_lib_init_stdio_1
    __rt_lib_init_user_alloc_1
        0x080001ae:    bd1f        ..      POP      {r0-r4,pc}
    .ARM.Collect$$libshutdown$$00000000
    __rt_lib_shutdown
        0x080001b0:    b510        ..      PUSH     {r4,lr}
    .ARM.Collect$$libshutdown$$00000002
    .ARM.Collect$$libshutdown$$00000004
    .ARM.Collect$$libshutdown$$00000007
    .ARM.Collect$$libshutdown$$0000000A
    .ARM.Collect$$libshutdown$$0000000C
    .ARM.Collect$$libshutdown$$0000000F
    .ARM.Collect$$libshutdown$$00000010
    __rt_lib_shutdown_cpp_1
    __rt_lib_shutdown_fp_trap_1
    __rt_lib_shutdown_heap_1
    __rt_lib_shutdown_return
    __rt_lib_shutdown_signal_1
    __rt_lib_shutdown_stdio_1
    __rt_lib_shutdown_user_alloc_1
        0x080001b2:    bd10        ..      POP      {r4,pc}
    .ARM.Collect$$rtentry$$00000000
    .ARM.Collect$$rtentry$$00000002
    .ARM.Collect$$rtentry$$00000004
    __rt_entry
    __rt_entry_presh_1
    __rt_entry_sh
        0x080001b4:    f000fa74    ..t.    BL       __semihosting_library_function ; 0x80006a0
        0x080001b8:    4611        .F      MOV      r1,r2
    .ARM.Collect$$rtentry$$00000009
    .ARM.Collect$$rtentry$$0000000A
    __rt_entry_li
    __rt_entry_postsh_1
        0x080001ba:    f7fffff3    ....    BL       __rt_lib_init ; 0x80001a4
    .ARM.Collect$$rtentry$$0000000C
    .ARM.Collect$$rtentry$$0000000D
    __rt_entry_main
    __rt_entry_postli_1
        0x080001be:    f004fbb1    ....    BL       main ; 0x8004924
        0x080001c2:    f000fa92    ....    BL       exit ; 0x80006ea
    .ARM.Collect$$rtexit$$00000000
    __rt_exit
        0x080001c6:    b403        ..      PUSH     {r0,r1}
    .ARM.Collect$$rtexit$$00000002
    .ARM.Collect$$rtexit$$00000003
    __rt_exit_ls
    __rt_exit_prels_1
        0x080001c8:    f7fffff2    ....    BL       __rt_lib_shutdown ; 0x80001b0
    .ARM.Collect$$rtexit$$00000004
    __rt_exit_exit
        0x080001cc:    bc03        ..      POP      {r0,r1}
        0x080001ce:    f000fac3    ....    BL       _sys_exit ; 0x8000758
        0x080001d2:    0000        ..      MOVS     r0,r0
    .text
    .emb_text
    Reset_Handler
    _maybe_terminate_alloc
        0x080001d4:    4809        .H      LDR      r0,[pc,#36] ; [0x80001fc] = 0x8001037
        0x080001d6:    4780        .G      BLX      r0
        0x080001d8:    4809        .H      LDR      r0,[pc,#36] ; [0x8000200] = 0x8000131
        0x080001da:    4700        .G      BX       r0
        0x080001dc:    e7fe        ..      B        0x80001dc ; Reset_Handler + 8
        0x080001de:    e7fe        ..      B        0x80001de ; Reset_Handler + 10
        0x080001e0:    e7fe        ..      B        0x80001e0 ; Reset_Handler + 12
        0x080001e2:    e7fe        ..      B        0x80001e2 ; Reset_Handler + 14
        0x080001e4:    e7fe        ..      B        0x80001e4 ; Reset_Handler + 16
        0x080001e6:    e7fe        ..      B        0x80001e6 ; Reset_Handler + 18
        0x080001e8:    e7fe        ..      B        0x80001e8 ; Reset_Handler + 20
        0x080001ea:    e7fe        ..      B        0x80001ea ; Reset_Handler + 22
        0x080001ec:    e7fe        ..      B        0x80001ec ; Reset_Handler + 24
    ADC1_2_IRQHandler
    ADC3_IRQHandler
    CAN1_RX1_IRQHandler
    CAN1_SCE_IRQHandler
    DMA1_Channel1_IRQHandler
    DMA1_Channel2_IRQHandler
    DMA1_Channel3_IRQHandler
    DMA1_Channel4_IRQHandler
    DMA1_Channel5_IRQHandler
    DMA1_Channel6_IRQHandler
    DMA1_Channel7_IRQHandler
    DMA2_Channel1_IRQHandler
    DMA2_Channel2_IRQHandler
    DMA2_Channel3_IRQHandler
    DMA2_Channel4_5_IRQHandler
    EXTI0_IRQHandler
    EXTI15_10_IRQHandler
    EXTI1_IRQHandler
    EXTI2_IRQHandler
    EXTI3_IRQHandler
    EXTI4_IRQHandler
    EXTI9_5_IRQHandler
    FLASH_IRQHandler
    FSMC_IRQHandler
    I2C1_ER_IRQHandler
    I2C1_EV_IRQHandler
    I2C2_ER_IRQHandler
    I2C2_EV_IRQHandler
    PVD_IRQHandler
    RCC_IRQHandler
    RTC_Alarm_IRQHandler
    RTC_IRQHandler
    SDIO_IRQHandler
    SPI1_IRQHandler
    SPI2_IRQHandler
    SPI3_IRQHandler
    TAMPER_IRQHandler
    TIM1_BRK_TIM9_IRQHandler
    TIM1_CC_IRQHandler
    TIM1_TRG_COM_TIM11_IRQHandler
    TIM1_UP_TIM10_IRQHandler
    TIM2_IRQHandler
    TIM3_IRQHandler
    TIM4_IRQHandler
    TIM5_IRQHandler
    TIM6_IRQHandler
    TIM7_IRQHandler
    TIM8_BRK_TIM12_IRQHandler
    TIM8_CC_IRQHandler
    TIM8_TRG_COM_TIM14_IRQHandler
    TIM8_UP_TIM13_IRQHandler
    UART4_IRQHandler
    UART5_IRQHandler
    USART1_IRQHandler
    USART2_IRQHandler
    USART3_IRQHandler
    USBWakeUp_IRQHandler
    USB_HP_CAN1_TX_IRQHandler
    USB_LP_CAN1_RX0_IRQHandler
    WWDG_IRQHandler
        0x080001ee:    e7fe        ..      B        ADC1_2_IRQHandler ; 0x80001ee
    __user_initial_stackheap
        0x080001f0:    4804        .H      LDR      r0,[pc,#16] ; [0x8000204] = 0x20000220
        0x080001f2:    4905        .I      LDR      r1,[pc,#20] ; [0x8000208] = 0x20002620
        0x080001f4:    4a05        .J      LDR      r2,[pc,#20] ; [0x800020c] = 0x20002220
        0x080001f6:    4b06        .K      LDR      r3,[pc,#24] ; [0x8000210] = 0x20002220
        0x080001f8:    4770        pG      BX       lr
    $d
        0x080001fa:    0000        ..      DCW    0
        0x080001fc:    08001037    7...    DCD    134221879
        0x08000200:    08000131    1...    DCD    134218033
        0x08000204:    20000220     ..     DCD    536871456
        0x08000208:    20002620     &.     DCD    536880672
        0x0800020c:    20002220     ".     DCD    536879648
        0x08000210:    20002220     ".     DCD    536879648
    $t
    .text
    calloc
        0x08000214:    b570        p.      PUSH     {r4-r6,lr}
        0x08000216:    fba04001    ...@    UMULL    r4,r0,r0,r1
        0x0800021a:    f1b45180    ...Q    SUBS     r1,r4,#0x10000000
        0x0800021e:    f1700000    p...    SBCS     r0,r0,#0
        0x08000222:    bf24        $.      ITT      CS
        0x08000224:    2000        .       MOVCS    r0,#0
        0x08000226:    bd70        p.      POPCS    {r4-r6,pc}
        0x08000228:    4620         F      MOV      r0,r4
        0x0800022a:    f000f807    ....    BL       malloc ; 0x800023c
        0x0800022e:    0005        ..      MOVS     r5,r0
        0x08000230:    bf1c        ..      ITT      NE
        0x08000232:    4621        !F      MOVNE    r1,r4
        0x08000234:    f000f970    ..p.    BLNE     __aeabi_memclr ; 0x8000518
        0x08000238:    4628        (F      MOV      r0,r5
        0x0800023a:    bd70        p.      POP      {r4-r6,pc}
    .text
    malloc
        0x0800023c:    b570        p.      PUSH     {r4-r6,lr}
        0x0800023e:    4606        .F      MOV      r6,r0
        0x08000240:    f000f9b6    ....    BL       __rt_heap_descriptor ; 0x80005b0
        0x08000244:    6805        .h      LDR      r5,[r0,#0]
        0x08000246:    f106000b    ....    ADD      r0,r6,#0xb
        0x0800024a:    f0200407     ...    BIC      r4,r0,#7
        0x0800024e:    42b4        .B      CMP      r4,r6
        0x08000250:    bf9c        ..      ITT      LS
        0x08000252:    2000        .       MOVLS    r0,#0
        0x08000254:    bd70        p.      POPLS    {r4-r6,pc}
        0x08000256:    462b        +F      MOV      r3,r5
        0x08000258:    686a        jh      LDR      r2,[r5,#4]
        0x0800025a:    b1ba        ..      CBZ      r2,0x800028c ; malloc + 80
        0x0800025c:    6810        .h      LDR      r0,[r2,#0]
        0x0800025e:    42a0        .B      CMP      r0,r4
        0x08000260:    d310        ..      BCC      0x8000284 ; malloc + 72
        0x08000262:    f1040108    ....    ADD      r1,r4,#8
        0x08000266:    4288        .B      CMP      r0,r1
        0x08000268:    bf3c        <.      ITT      CC
        0x0800026a:    6850        Ph      LDRCC    r0,[r2,#4]
        0x0800026c:    6058        X`      STRCC    r0,[r3,#4]
        0x0800026e:    d307        ..      BCC      0x8000280 ; malloc + 68
        0x08000270:    6851        Qh      LDR      r1,[r2,#4]
        0x08000272:    1910        ..      ADDS     r0,r2,r4
        0x08000274:    6041        A`      STR      r1,[r0,#4]
        0x08000276:    6811        .h      LDR      r1,[r2,#0]
        0x08000278:    1b09        ..      SUBS     r1,r1,r4
        0x0800027a:    6001        .`      STR      r1,[r0,#0]
        0x0800027c:    6058        X`      STR      r0,[r3,#4]
        0x0800027e:    6014        .`      STR      r4,[r2,#0]
        0x08000280:    1d10        ..      ADDS     r0,r2,#4
        0x08000282:    bd70        p.      POP      {r4-r6,pc}
        0x08000284:    4613        .F      MOV      r3,r2
        0x08000286:    6852        Rh      LDR      r2,[r2,#4]
        0x08000288:    2a00        .*      CMP      r2,#0
        0x0800028a:    d1e7        ..      BNE      0x800025c ; malloc + 32
        0x0800028c:    4621        !F      MOV      r1,r4
        0x0800028e:    4628        (F      MOV      r0,r5
        0x08000290:    f000f996    ....    BL       __Heap_Full ; 0x80005c0
        0x08000294:    2800        .(      CMP      r0,#0
        0x08000296:    d1de        ..      BNE      0x8000256 ; malloc + 26
        0x08000298:    bd70        p.      POP      {r4-r6,pc}
    .text
    free
        0x0800029a:    b570        p.      PUSH     {r4-r6,lr}
        0x0800029c:    4604        .F      MOV      r4,r0
        0x0800029e:    1f05        ..      SUBS     r5,r0,#4
        0x080002a0:    f000f986    ....    BL       __rt_heap_descriptor ; 0x80005b0
        0x080002a4:    6800        .h      LDR      r0,[r0,#0]
        0x080002a6:    2c00        .,      CMP      r4,#0
        0x080002a8:    bf14        ..      ITE      NE
        0x080002aa:    6844        Dh      LDRNE    r4,[r0,#4]
        0x080002ac:    bd70        p.      POPEQ    {r4-r6,pc}
        0x080002ae:    2c00        .,      CMP      r4,#0
        0x080002b0:    bf18        ..      IT       NE
        0x080002b2:    42ac        .B      CMPNE    r4,r5
        0x080002b4:    bf3c        <.      ITT      CC
        0x080002b6:    4620         F      MOVCC    r0,r4
        0x080002b8:    6864        dh      LDRCC    r4,[r4,#4]
        0x080002ba:    d3f8        ..      BCC      0x80002ae ; free + 20
        0x080002bc:    6801        .h      LDR      r1,[r0,#0]
        0x080002be:    180a        ..      ADDS     r2,r1,r0
        0x080002c0:    42aa        .B      CMP      r2,r5
        0x080002c2:    bf18        ..      IT       NE
        0x080002c4:    6045        E`      STRNE    r5,[r0,#4]
        0x080002c6:    d103        ..      BNE      0x80002d0 ; free + 54
        0x080002c8:    682a        *h      LDR      r2,[r5,#0]
        0x080002ca:    4605        .F      MOV      r5,r0
        0x080002cc:    4411        .D      ADD      r1,r1,r2
        0x080002ce:    6001        .`      STR      r1,[r0,#0]
        0x080002d0:    6828        (h      LDR      r0,[r5,#0]
        0x080002d2:    1941        A.      ADDS     r1,r0,r5
        0x080002d4:    42a1        .B      CMP      r1,r4
        0x080002d6:    bf1c        ..      ITT      NE
        0x080002d8:    606c        l`      STRNE    r4,[r5,#4]
        0x080002da:    bd70        p.      POPNE    {r4-r6,pc}
        0x080002dc:    6861        ah      LDR      r1,[r4,#4]
        0x080002de:    6069        i`      STR      r1,[r5,#4]
        0x080002e0:    6821        !h      LDR      r1,[r4,#0]
        0x080002e2:    4408        .D      ADD      r0,r0,r1
        0x080002e4:    6028        (`      STR      r0,[r5,#0]
        0x080002e6:    bd70        p.      POP      {r4-r6,pc}
    .text
    __aeabi_uldivmod
    _ll_udiv
        0x080002e8:    ea530c02    S...    ORRS     r12,r3,r2
        0x080002ec:    f0008069    ..i.    BEQ.W    0x80003c2 ; __aeabi_uldivmod + 218
        0x080002f0:    e92d4bf0    -..K    PUSH     {r4-r9,r11,lr}
        0x080002f4:    f04f0600    O...    MOV      r6,#0
        0x080002f8:    2b00        .+      CMP      r3,#0
        0x080002fa:    bf1f        ..      ITTTT    NE
        0x080002fc:    fab3f583    ....    CLZNE    r5,r3
        0x08000300:    fa03f405    ....    LSLNE    r4,r3,r5
        0x08000304:    fa24f605    $...    LSRNE    r6,r4,r5
        0x08000308:    405e        ^@      EORNE    r6,r6,r3
        0x0800030a:    bf12        ..      ITEE     NE
        0x0800030c:    4316        .C      ORRNE    r6,r6,r2
        0x0800030e:    fab2f582    ....    CLZEQ    r5,r2
        0x08000312:    fa02f405    ....    LSLEQ    r4,r2,r5
        0x08000316:    f1c50520    .. .    RSB      r5,r5,#0x20
        0x0800031a:    bf1e        ..      ITTT     NE
        0x0800031c:    fa22fc05    "...    LSRNE    r12,r2,r5
        0x08000320:    ea44040c    D...    ORRNE    r4,r4,r12
        0x08000324:    3520         5      ADDNE    r5,r5,#0x20
        0x08000326:    ea564c04    V..L    ORRS     r12,r6,r4,LSL #16
        0x0800032a:    ea4f4414    O..D    LSR      r4,r4,#16
        0x0800032e:    bf18        ..      IT       NE
        0x08000330:    1c64        d.      ADDNE    r4,r4,#1
        0x08000332:    f04f0800    O...    MOV      r8,#0
        0x08000336:    f04f0900    O...    MOV      r9,#0
        0x0800033a:    4290        .B      CMP      r0,r2
        0x0800033c:    eb710c03    q...    SBCS     r12,r1,r3
        0x08000340:    d339        9.      BCC      0x80003b6 ; __aeabi_uldivmod + 206
        0x08000342:    2900        .)      CMP      r1,#0
        0x08000344:    bf19        ..      ITTEE    NE
        0x08000346:    fab1f781    ....    CLZNE    r7,r1
        0x0800034a:    fa01f607    ....    LSLNE    r6,r1,r7
        0x0800034e:    fab0f780    ....    CLZEQ    r7,r0
        0x08000352:    fa00f607    ....    LSLEQ    r6,r0,r7
        0x08000356:    f1c70720    .. .    RSB      r7,r7,#0x20
        0x0800035a:    bf1e        ..      ITTT     NE
        0x0800035c:    fa20fc07     ...    LSRNE    r12,r0,r7
        0x08000360:    ea46060c    F...    ORRNE    r6,r6,r12
        0x08000364:    3720         7      ADDNE    r7,r7,#0x20
        0x08000366:    fbb6fcf4    ....    UDIV     r12,r6,r4
        0x0800036a:    eba70705    ....    SUB      r7,r7,r5
        0x0800036e:    3f10        .?      SUBS     r7,r7,#0x10
        0x08000370:    f0070b1f    ....    AND      r11,r7,#0x1f
        0x08000374:    f1cb0620    .. .    RSB      r6,r11,#0x20
        0x08000378:    fa0cfb0b    ....    LSL      r11,r12,r11
        0x0800037c:    fa2cf606    ,...    LSR      r6,r12,r6
        0x08000380:    bf44        D.      ITT      MI
        0x08000382:    46b3        .F      MOVMI    r11,r6
        0x08000384:    2600        .&      MOVMI    r6,#0
        0x08000386:    2f20         /      CMP      r7,#0x20
        0x08000388:    bfa4        ..      ITT      GE
        0x0800038a:    465e        ^F      MOVGE    r6,r11
        0x0800038c:    f04f0b00    O...    MOVGE    r11,#0
        0x08000390:    ea5b0c06    [...    ORRS     r12,r11,r6
        0x08000394:    bf08        ..      IT       EQ
        0x08000396:    f04f0b01    O...    MOVEQ    r11,#1
        0x0800039a:    eb19090b    ....    ADDS     r9,r9,r11
        0x0800039e:    fbab7c02    ...|    UMULL    r7,r12,r11,r2
        0x080003a2:    eb480806    H...    ADC      r8,r8,r6
        0x080003a6:    1bc0        ..      SUBS     r0,r0,r7
        0x080003a8:    fb06cc02    ....    MLA      r12,r6,r2,r12
        0x080003ac:    fb0bcc03    ....    MLA      r12,r11,r3,r12
        0x080003b0:    eb71010c    q...    SBCS     r1,r1,r12
        0x080003b4:    e7c1        ..      B        0x800033a ; __aeabi_uldivmod + 82
        0x080003b6:    460b        .F      MOV      r3,r1
        0x080003b8:    4602        .F      MOV      r2,r0
        0x080003ba:    4641        AF      MOV      r1,r8
        0x080003bc:    4648        HF      MOV      r0,r9
        0x080003be:    e8bd8bf0    ....    POP      {r4-r9,r11,pc}
        0x080003c2:    b513        ..      PUSH     {r0,r1,r4,lr}
        0x080003c4:    f04f0000    O...    MOV      r0,#0
        0x080003c8:    f04f0100    O...    MOV      r1,#0
        0x080003cc:    f3af8000    ....    NOP.W    
        0x080003d0:    e8bd401c    ...@    POP      {r2-r4,lr}
        0x080003d4:    4770        pG      BX       lr
    .text
    strlen
        0x080003d6:    b510        ..      PUSH     {r4,lr}
        0x080003d8:    1c43        C.      ADDS     r3,r0,#1
        0x080003da:    e002        ..      B        0x80003e2 ; strlen + 12
        0x080003dc:    f8101b01    ....    LDRB     r1,[r0],#1
        0x080003e0:    b171        q.      CBZ      r1,0x8000400 ; strlen + 42
        0x080003e2:    0781        ..      LSLS     r1,r0,#30
        0x080003e4:    d1fa        ..      BNE      0x80003dc ; strlen + 6
        0x080003e6:    f04f3201    O..2    MOV      r2,#0x1010101
        0x080003ea:    c802        ..      LDM      r0!,{r1}
        0x080003ec:    1a8c        ..      SUBS     r4,r1,r2
        0x080003ee:    438c        .C      BICS     r4,r4,r1
        0x080003f0:    ea1411c2    ....    ANDS     r1,r4,r2,LSL #7
        0x080003f4:    d0f9        ..      BEQ      0x80003ea ; strlen + 20
        0x080003f6:    1ac0        ..      SUBS     r0,r0,r3
        0x080003f8:    060a        ..      LSLS     r2,r1,#24
        0x080003fa:    d003        ..      BEQ      0x8000404 ; strlen + 46
        0x080003fc:    1ec0        ..      SUBS     r0,r0,#3
        0x080003fe:    bd10        ..      POP      {r4,pc}
        0x08000400:    1ac0        ..      SUBS     r0,r0,r3
        0x08000402:    bd10        ..      POP      {r4,pc}
        0x08000404:    040a        ..      LSLS     r2,r1,#16
        0x08000406:    d001        ..      BEQ      0x800040c ; strlen + 54
        0x08000408:    1e80        ..      SUBS     r0,r0,#2
        0x0800040a:    bd10        ..      POP      {r4,pc}
        0x0800040c:    0209        ..      LSLS     r1,r1,#8
        0x0800040e:    d0fc        ..      BEQ      0x800040a ; strlen + 52
        0x08000410:    1e40        @.      SUBS     r0,r0,#1
        0x08000412:    bd10        ..      POP      {r4,pc}
    .text
    __aeabi_memcpy
    __rt_memcpy
        0x08000414:    2a03        .*      CMP      r2,#3
        0x08000416:    f2408030    @.0.    BLS.W    _memcpy_lastbytes ; 0x800047a
        0x0800041a:    f0100c03    ....    ANDS     r12,r0,#3
        0x0800041e:    f0008015    ....    BEQ.W    0x800044c ; __aeabi_memcpy + 56
        0x08000422:    f8113b01    ...;    LDRB     r3,[r1],#1
        0x08000426:    f1bc0f02    ....    CMP      r12,#2
        0x0800042a:    4462        bD      ADD      r2,r2,r12
        0x0800042c:    bf98        ..      IT       LS
        0x0800042e:    f811cb01    ....    LDRBLS   r12,[r1],#1
        0x08000432:    f8003b01    ...;    STRB     r3,[r0],#1
        0x08000436:    bf38        8.      IT       CC
        0x08000438:    f8113b01    ...;    LDRBCC   r3,[r1],#1
        0x0800043c:    f1a20204    ....    SUB      r2,r2,#4
        0x08000440:    bf98        ..      IT       LS
        0x08000442:    f800cb01    ....    STRBLS   r12,[r0],#1
        0x08000446:    bf38        8.      IT       CC
        0x08000448:    f8003b01    ...;    STRBCC   r3,[r0],#1
        0x0800044c:    f0110303    ....    ANDS     r3,r1,#3
        0x08000450:    f0008025    ..%.    BEQ.W    __aeabi_memcpy4 ; 0x800049e
        0x08000454:    3a08        .:      SUBS     r2,r2,#8
        0x08000456:    f0c08008    ....    BCC.W    0x800046a ; __aeabi_memcpy + 86
        0x0800045a:    f8513b04    Q..;    LDR      r3,[r1],#4
        0x0800045e:    3a08        .:      SUBS     r2,r2,#8
        0x08000460:    f851cb04    Q...    LDR      r12,[r1],#4
        0x08000464:    e8a01008    ....    STM      r0!,{r3,r12}
        0x08000468:    e7f5        ..      B        0x8000456 ; __aeabi_memcpy + 66
        0x0800046a:    1d12        ..      ADDS     r2,r2,#4
        0x0800046c:    bf5c        \.      ITT      PL
        0x0800046e:    f8513b04    Q..;    LDRPL    r3,[r1],#4
        0x08000472:    f8403b04    @..;    STRPL    r3,[r0],#4
        0x08000476:    f3af8000    ....    NOP.W    
    _memcpy_lastbytes
        0x0800047a:    07d2        ..      LSLS     r2,r2,#31
        0x0800047c:    bf24        $.      ITT      CS
        0x0800047e:    f8113b01    ...;    LDRBCS   r3,[r1],#1
        0x08000482:    f811cb01    ....    LDRBCS   r12,[r1],#1
        0x08000486:    bf48        H.      IT       MI
        0x08000488:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x0800048c:    bf24        $.      ITT      CS
        0x0800048e:    f8003b01    ...;    STRBCS   r3,[r0],#1
        0x08000492:    f800cb01    ....    STRBCS   r12,[r0],#1
        0x08000496:    bf48        H.      IT       MI
        0x08000498:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x0800049c:    4770        pG      BX       lr
    .text
    __aeabi_memcpy4
    __aeabi_memcpy8
    __rt_memcpy_w
        0x0800049e:    b510        ..      PUSH     {r4,lr}
        0x080004a0:    3a20         :      SUBS     r2,r2,#0x20
        0x080004a2:    f0c0800b    ....    BCC.W    0x80004bc ; __aeabi_memcpy4 + 30
        0x080004a6:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x080004aa:    3a20         :      SUBS     r2,r2,#0x20
        0x080004ac:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x080004b0:    e8b15018    ...P    LDM      r1!,{r3,r4,r12,lr}
        0x080004b4:    e8a05018    ...P    STM      r0!,{r3,r4,r12,lr}
        0x080004b8:    f4bfaff5    ....    BCS.W    0x80004a6 ; __aeabi_memcpy4 + 8
        0x080004bc:    ea5f7c02    _..|    LSLS     r12,r2,#28
        0x080004c0:    bf24        $.      ITT      CS
        0x080004c2:    e8b15018    ...P    LDMCS    r1!,{r3,r4,r12,lr}
        0x080004c6:    e8a05018    ...P    STMCS    r0!,{r3,r4,r12,lr}
        0x080004ca:    bf44        D.      ITT      MI
        0x080004cc:    c918        ..      LDMMI    r1!,{r3,r4}
        0x080004ce:    c018        ..      STMMI    r0!,{r3,r4}
        0x080004d0:    e8bd4010    ...@    POP      {r4,lr}
        0x080004d4:    ea5f7c82    _..|    LSLS     r12,r2,#30
        0x080004d8:    bf24        $.      ITT      CS
        0x080004da:    f8513b04    Q..;    LDRCS    r3,[r1],#4
        0x080004de:    f8403b04    @..;    STRCS    r3,[r0],#4
        0x080004e2:    bf08        ..      IT       EQ
        0x080004e4:    4770        pG      BXEQ     lr
    _memcpy_lastbytes_aligned
        0x080004e6:    07d2        ..      LSLS     r2,r2,#31
        0x080004e8:    bf28        (.      IT       CS
        0x080004ea:    f8313b02    1..;    LDRHCS   r3,[r1],#2
        0x080004ee:    bf48        H.      IT       MI
        0x080004f0:    f8112b01    ...+    LDRBMI   r2,[r1],#1
        0x080004f4:    bf28        (.      IT       CS
        0x080004f6:    f8203b02     ..;    STRHCS   r3,[r0],#2
        0x080004fa:    bf48        H.      IT       MI
        0x080004fc:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x08000500:    4770        pG      BX       lr
    .text
    memset
        0x08000502:    f00103ff    ....    AND      r3,r1,#0xff
        0x08000506:    4611        .F      MOV      r1,r2
        0x08000508:    b501        ..      PUSH     {r0,lr}
        0x0800050a:    ea432203    C.."    ORR      r2,r3,r3,LSL #8
        0x0800050e:    ea424202    B..B    ORR      r2,r2,r2,LSL #16
        0x08000512:    f000f803    ....    BL       _memset ; 0x800051c
        0x08000516:    bd01        ..      POP      {r0,pc}
    .text
    __aeabi_memclr
    __rt_memclr
        0x08000518:    f04f0200    O...    MOV      r2,#0
    _memset
        0x0800051c:    2904        .)      CMP      r1,#4
        0x0800051e:    f0c08012    ....    BCC.W    0x8000546 ; _memset + 42
        0x08000522:    f0100c03    ....    ANDS     r12,r0,#3
        0x08000526:    f000801b    ....    BEQ.W    _memset_w ; 0x8000560
        0x0800052a:    f1cc0c04    ....    RSB      r12,r12,#4
        0x0800052e:    f1bc0f02    ....    CMP      r12,#2
        0x08000532:    bf18        ..      IT       NE
        0x08000534:    f8002b01    ...+    STRBNE   r2,[r0],#1
        0x08000538:    bfa8        ..      IT       GE
        0x0800053a:    f8202b02     ..+    STRHGE   r2,[r0],#2
        0x0800053e:    eba1010c    ....    SUB      r1,r1,r12
        0x08000542:    f000b80d    ....    B.W      _memset_w ; 0x8000560
        0x08000546:    ea5f7cc1    _..|    LSLS     r12,r1,#31
        0x0800054a:    bf24        $.      ITT      CS
        0x0800054c:    f8002b01    ...+    STRBCS   r2,[r0],#1
        0x08000550:    f8002b01    ...+    STRBCS   r2,[r0],#1
        0x08000554:    bf48        H.      IT       MI
        0x08000556:    f8002b01    ...+    STRBMI   r2,[r0],#1
        0x0800055a:    4770        pG      BX       lr
    .text
    __aeabi_memclr4
    __aeabi_memclr8
    __rt_memclr_w
        0x0800055c:    f04f0200    O...    MOV      r2,#0
    _memset_w
        0x08000560:    b500        ..      PUSH     {lr}
        0x08000562:    4613        .F      MOV      r3,r2
        0x08000564:    4694        .F      MOV      r12,r2
        0x08000566:    4696        .F      MOV      lr,r2
        0x08000568:    3920         9      SUBS     r1,r1,#0x20
        0x0800056a:    bf22        ".      ITTT     CS
        0x0800056c:    e8a0500c    ...P    STMCS    r0!,{r2,r3,r12,lr}
        0x08000570:    e8a0500c    ...P    STMCS    r0!,{r2,r3,r12,lr}
        0x08000574:    f1b10120    .. .    SUBSCS   r1,r1,#0x20
        0x08000578:    f4bfaff7    ....    BCS.W    0x800056a ; _memset_w + 10
        0x0800057c:    0709        ..      LSLS     r1,r1,#28
        0x0800057e:    bf28        (.      IT       CS
        0x08000580:    e8a0500c    ...P    STMCS    r0!,{r2,r3,r12,lr}
        0x08000584:    bf48        H.      IT       MI
        0x08000586:    c00c        ..      STMMI    r0!,{r2,r3}
        0x08000588:    f85deb04    ]...    POP      {lr}
        0x0800058c:    0089        ..      LSLS     r1,r1,#2
        0x0800058e:    bf28        (.      IT       CS
        0x08000590:    f8402b04    @..+    STRCS    r2,[r0],#4
        0x08000594:    bf08        ..      IT       EQ
        0x08000596:    4770        pG      BXEQ     lr
        0x08000598:    bf48        H.      IT       MI
        0x0800059a:    f8202b02     ..+    STRHMI   r2,[r0],#2
        0x0800059e:    f0114f80    ...O    TST      r1,#0x40000000
        0x080005a2:    bf18        ..      IT       NE
        0x080005a4:    f8002b01    ...+    STRBNE   r2,[r0],#1
        0x080005a8:    4770        pG      BX       lr
    .text
    __use_two_region_memory
        0x080005aa:    4770        pG      BX       lr
    __rt_heap_escrow
        0x080005ac:    4770        pG      BX       lr
    __rt_heap_expand
        0x080005ae:    4770        pG      BX       lr
    .text
    __rt_heap_descriptor
        0x080005b0:    4800        .H      LDR      r0,[pc,#0] ; [0x80005b4] = 0x200001c4
        0x080005b2:    4770        pG      BX       lr
    $d
        0x080005b4:    200001c4    ...     DCD    536871364
    $t
    .text
    __use_no_heap
        0x080005b8:    4770        pG      BX       lr
    __heap$guard
        0x080005ba:    4770        pG      BX       lr
    .text
    _terminate_user_alloc
        0x080005bc:    4770        pG      BX       lr
    _init_user_alloc
        0x080005be:    4770        pG      BX       lr
    __Heap_Full
        0x080005c0:    b538        8.      PUSH     {r3-r5,lr}
        0x080005c2:    4604        .F      MOV      r4,r0
        0x080005c4:    460a        .F      MOV      r2,r1
        0x080005c6:    2000        .       MOVS     r0,#0
        0x080005c8:    4669        iF      MOV      r1,sp
        0x080005ca:    f3af8000    ....    NOP.W    
        0x080005ce:    2800        .(      CMP      r0,#0
        0x080005d0:    bf08        ..      IT       EQ
        0x080005d2:    bd38        8.      POPEQ    {r3-r5,pc}
        0x080005d4:    4602        .F      MOV      r2,r0
        0x080005d6:    9900        ..      LDR      r1,[sp,#0]
        0x080005d8:    4620         F      MOV      r0,r4
        0x080005da:    f000f83f    ..?.    BL       __Heap_ProvideMemory ; 0x800065c
        0x080005de:    2001        .       MOVS     r0,#1
        0x080005e0:    bd38        8.      POP      {r3-r5,pc}
    __Heap_Broken
        0x080005e2:    2001        .       MOVS     r0,#1
        0x080005e4:    f000b854    ..T.    B.W      __rt_SIGRTMEM ; 0x8000690
    _init_alloc
        0x080005e8:    b5f8        ..      PUSH     {r3-r7,lr}
        0x080005ea:    f3af8000    ....    NOP.W    
        0x080005ee:    4605        .F      MOV      r5,r0
        0x080005f0:    2000        .       MOVS     r0,#0
        0x080005f2:    460c        .F      MOV      r4,r1
        0x080005f4:    2010        .       MOVS     r0,#0x10
        0x080005f6:    bf00        ..      NOP      
        0x080005f8:    4606        .F      MOV      r6,r0
        0x080005fa:    19a8        ..      ADDS     r0,r5,r6
        0x080005fc:    42a0        .B      CMP      r0,r4
        0x080005fe:    d90d        ..      BLS      0x800061c ; _init_alloc + 52
        0x08000600:    4632        2F      MOV      r2,r6
        0x08000602:    4669        iF      MOV      r1,sp
        0x08000604:    2000        .       MOVS     r0,#0
        0x08000606:    f3af8000    ....    NOP.W    
        0x0800060a:    0007        ..      MOVS     r7,r0
        0x0800060c:    bf08        ..      IT       EQ
        0x0800060e:    f000f83f    ..?.    BLEQ     __rt_SIGRTMEM ; 0x8000690
        0x08000612:    9800        ..      LDR      r0,[sp,#0]
        0x08000614:    42a0        .B      CMP      r0,r4
        0x08000616:    bf18        ..      IT       NE
        0x08000618:    4605        .F      MOVNE    r5,r0
        0x0800061a:    19c4        ..      ADDS     r4,r0,r7
        0x0800061c:    f7ffffc8    ....    BL       __rt_heap_descriptor ; 0x80005b0
        0x08000620:    6005        .`      STR      r5,[r0,#0]
        0x08000622:    4607        .F      MOV      r7,r0
        0x08000624:    1df0        ..      ADDS     r0,r6,#7
        0x08000626:    f0200007     ...    BIC      r0,r0,#7
        0x0800062a:    1946        F.      ADDS     r6,r0,r5
        0x0800062c:    4628        (F      MOV      r0,r5
        0x0800062e:    f000f80a    ....    BL       __Heap_Initialize ; 0x8000646
        0x08000632:    42b4        .B      CMP      r4,r6
        0x08000634:    bf08        ..      IT       EQ
        0x08000636:    bdf8        ..      POPEQ    {r3-r7,pc}
        0x08000638:    1ba2        ..      SUBS     r2,r4,r6
        0x0800063a:    4631        1F      MOV      r1,r6
        0x0800063c:    6838        8h      LDR      r0,[r7,#0]
        0x0800063e:    e8bd40f8    ...@    POP      {r3-r7,lr}
        0x08000642:    f000b80b    ....    B.W      __Heap_ProvideMemory ; 0x800065c
    .text
    __Heap_Initialize
        0x08000646:    2100        .!      MOVS     r1,#0
        0x08000648:    6001        .`      STR      r1,[r0,#0]
        0x0800064a:    e9c01001    ....    STRD     r1,r0,[r0,#4]
        0x0800064e:    4770        pG      BX       lr
    __Heap_DescSize
        0x08000650:    2010        .       MOVS     r0,#0x10
        0x08000652:    4770        pG      BX       lr
    .text
    __user_libspace
    __user_perproc_libspace
    __user_perthread_libspace
        0x08000654:    4800        .H      LDR      r0,[pc,#0] ; [0x8000658] = 0x200001bc
        0x08000656:    4770        pG      BX       lr
    $d
        0x08000658:    200001bc    ...     DCD    536871356
    $t
    .text
    __Heap_ProvideMemory
        0x0800065c:    4603        .F      MOV      r3,r0
        0x0800065e:    6840        @h      LDR      r0,[r0,#4]
        0x08000660:    468c        .F      MOV      r12,r1
        0x08000662:    2800        .(      CMP      r0,#0
        0x08000664:    bf18        ..      IT       NE
        0x08000666:    4288        .B      CMPNE    r0,r1
        0x08000668:    bf3c        <.      ITT      CC
        0x0800066a:    4603        .F      MOVCC    r3,r0
        0x0800066c:    6840        @h      LDRCC    r0,[r0,#4]
        0x0800066e:    d3f8        ..      BCC      0x8000662 ; __Heap_ProvideMemory + 6
        0x08000670:    6818        .h      LDR      r0,[r3,#0]
        0x08000672:    4418        .D      ADD      r0,r0,r3
        0x08000674:    4288        .B      CMP      r0,r1
        0x08000676:    d007        ..      BEQ      0x8000688 ; __Heap_ProvideMemory + 44
        0x08000678:    f10c0003    ....    ADD      r0,r12,#3
        0x0800067c:    f0200007     ...    BIC      r0,r0,#7
        0x08000680:    1d00        ..      ADDS     r0,r0,#4
        0x08000682:    1a41        A.      SUBS     r1,r0,r1
        0x08000684:    1a52        R.      SUBS     r2,r2,r1
        0x08000686:    4601        .F      MOV      r1,r0
        0x08000688:    1d08        ..      ADDS     r0,r1,#4
        0x0800068a:    600a        .`      STR      r2,[r1,#0]
        0x0800068c:    f7ffbe05    ....    B.W      free ; 0x800029a
    .text
    __rt_SIGRTMEM
        0x08000690:    b510        ..      PUSH     {r4,lr}
        0x08000692:    f000f839    ..9.    BL       __rt_SIGRTMEM_inner ; 0x8000708
        0x08000696:    e8bd4010    ...@    POP      {r4,lr}
        0x0800069a:    f000b82f    ../.    B.W      __sig_exit ; 0x80006fc
    .text
    __I$use$semihosting
    __use_no_semihosting_swi
        0x0800069e:    4770        pG      BX       lr
    .text
    .text
    __semihosting_library_function
    __user_setup_stackheap
        0x080006a0:    4675        uF      MOV      r5,lr
        0x080006a2:    f7ffffd7    ....    BL       __user_libspace ; 0x8000654
        0x080006a6:    46ae        .F      MOV      lr,r5
        0x080006a8:    0005        ..      MOVS     r5,r0
        0x080006aa:    4669        iF      MOV      r1,sp
        0x080006ac:    4653        SF      MOV      r3,r10
        0x080006ae:    f0200007     ...    BIC      r0,r0,#7
        0x080006b2:    4685        .F      MOV      sp,r0
        0x080006b4:    b018        ..      ADD      sp,sp,#0x60
        0x080006b6:    b520         .      PUSH     {r5,lr}
        0x080006b8:    f7fffd9a    ....    BL       __user_initial_stackheap ; 0x80001f0
        0x080006bc:    e8bd4020    .. @    POP      {r5,lr}
        0x080006c0:    f04f0600    O...    MOV      r6,#0
        0x080006c4:    f04f0700    O...    MOV      r7,#0
        0x080006c8:    f04f0800    O...    MOV      r8,#0
        0x080006cc:    f04f0b00    O...    MOV      r11,#0
        0x080006d0:    f0210107    !...    BIC      r1,r1,#7
        0x080006d4:    46ac        .F      MOV      r12,r5
        0x080006d6:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x080006da:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x080006de:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x080006e2:    e8ac09c0    ....    STM      r12!,{r6-r8,r11}
        0x080006e6:    468d        .F      MOV      sp,r1
        0x080006e8:    4770        pG      BX       lr
    .text
    exit
        0x080006ea:    b510        ..      PUSH     {r4,lr}
        0x080006ec:    4604        .F      MOV      r4,r0
        0x080006ee:    f3af8000    ....    NOP.W    
        0x080006f2:    4620         F      MOV      r0,r4
        0x080006f4:    e8bd4010    ...@    POP      {r4,lr}
        0x080006f8:    f7ffbd65    ..e.    B.W      __rt_exit ; 0x80001c6
    .text
    __sig_exit
        0x080006fc:    2800        .(      CMP      r0,#0
        0x080006fe:    d001        ..      BEQ      0x8000704 ; __sig_exit + 8
        0x08000700:    f000b82a    ..*.    B.W      _sys_exit ; 0x8000758
        0x08000704:    4770        pG      BX       lr
        0x08000706:    0000        ..      MOVS     r0,r0
    .text
    __rt_SIGRTMEM_inner
        0x08000708:    b510        ..      PUSH     {r4,lr}
        0x0800070a:    2801        .(      CMP      r0,#1
        0x0800070c:    d005        ..      BEQ      0x800071a ; __rt_SIGRTMEM_inner + 18
        0x0800070e:    2100        .!      MOVS     r1,#0
        0x08000710:    a003        ..      ADR      r0,{pc}+0x10 ; 0x8000720
        0x08000712:    f000f827    ..'.    BL       __default_signal_display ; 0x8000764
        0x08000716:    2001        .       MOVS     r0,#1
        0x08000718:    bd10        ..      POP      {r4,pc}
        0x0800071a:    a109        ..      ADR      r1,{pc}+0x26 ; 0x8000740
        0x0800071c:    e7f8        ..      B        0x8000710 ; __rt_SIGRTMEM_inner + 8
    $d
        0x0800071e:    0000        ..      DCW    0
        0x08000720:    52474953    SIGR    DCD    1380403539
        0x08000724:    4d454d54    TMEM    DCD    1296387412
        0x08000728:    754f203a    : Ou    DCD    1968119866
        0x0800072c:    666f2074    t of    DCD    1718558836
        0x08000730:    61656820     hea    DCD    1634035744
        0x08000734:    656d2070    p me    DCD    1701650544
        0x08000738:    79726f6d    mory    DCD    2037542765
        0x0800073c:    00000000    ....    DCD    0
        0x08000740:    6548203a    : He    DCD    1699225658
        0x08000744:    6d207061    ap m    DCD    1830842465
        0x08000748:    726f6d65    emor    DCD    1919905125
        0x0800074c:    6f632079    y co    DCD    1868767353
        0x08000750:    70757272    rrup    DCD    1886745202
        0x08000754:    00646574    ted.    DCD    6579572
    $t
    .text
    _sys_exit
        0x08000758:    4901        .I      LDR      r1,[pc,#4] ; [0x8000760] = 0x20026
        0x0800075a:    2018        .       MOVS     r0,#0x18
        0x0800075c:    beab        ..      BKPT     #0xab
        0x0800075e:    e7fe        ..      B        0x800075e ; _sys_exit + 6
    $d
        0x08000760:    00020026    &...    DCD    131110
    $t
    .text
    __default_signal_display
        0x08000764:    b570        p.      PUSH     {r4-r6,lr}
        0x08000766:    4605        .F      MOV      r5,r0
        0x08000768:    460c        .F      MOV      r4,r1
        0x0800076a:    200a        .       MOVS     r0,#0xa
        0x0800076c:    e000        ..      B        0x8000770 ; __default_signal_display + 12
        0x0800076e:    1c6d        m.      ADDS     r5,r5,#1
        0x08000770:    f000f811    ....    BL       _ttywrch ; 0x8000796
        0x08000774:    b135        5.      CBZ      r5,0x8000784 ; __default_signal_display + 32
        0x08000776:    7828        (x      LDRB     r0,[r5,#0]
        0x08000778:    2800        .(      CMP      r0,#0
        0x0800077a:    d1f8        ..      BNE      0x800076e ; __default_signal_display + 10
        0x0800077c:    e002        ..      B        0x8000784 ; __default_signal_display + 32
        0x0800077e:    1c64        d.      ADDS     r4,r4,#1
        0x08000780:    f000f809    ....    BL       _ttywrch ; 0x8000796
        0x08000784:    b114        ..      CBZ      r4,0x800078c ; __default_signal_display + 40
        0x08000786:    7820         x      LDRB     r0,[r4,#0]
        0x08000788:    2800        .(      CMP      r0,#0
        0x0800078a:    d1f8        ..      BNE      0x800077e ; __default_signal_display + 26
        0x0800078c:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x08000790:    200a        .       MOVS     r0,#0xa
        0x08000792:    f3af8000    ....    NOP.W    
    .text
    _ttywrch
        0x08000796:    b508        ..      PUSH     {r3,lr}
        0x08000798:    4669        iF      MOV      r1,sp
        0x0800079a:    f88d0000    ....    STRB     r0,[sp,#0]
        0x0800079e:    2003        .       MOVS     r0,#3
        0x080007a0:    beab        ..      BKPT     #0xab
        0x080007a2:    bd08        ..      POP      {r3,pc}
    $Ven$TT$L$$advance_software_protect_crc32
        0x080007a4:    f2475c01    G..\    MOV      r12,#0x7501
        0x080007a8:    f2c20c01    ....    MOVT     r12,#0x2001
        0x080007ac:    4760        `G      BX       r12
    $Ven$TT$L$$advance_software_protect_encrypt_process
        0x080007ae:    f2473c01    G..<    MOV      r12,#0x7301
        0x080007b2:    f2c20c01    ....    MOVT     r12,#0x2001
        0x080007b6:    4760        `G      BX       r12
    $Ven$TT$L$$advance_software_protect_system_reset
        0x080007b8:    f2477c01    G..|    MOV      r12,#0x7701
        0x080007bc:    f2c20c01    ....    MOVT     r12,#0x2001
        0x080007c0:    4760        `G      BX       r12
    $Ven$TT$L$$advance_software_protect_verify_authorization
        0x080007c2:    f6473c01    G..<    MOV      r12,#0x7b01
        0x080007c6:    f2c20c01    ....    MOVT     r12,#0x2001
        0x080007ca:    4760        `G      BX       r12
    $Ven$TT$L$$advance_software_protect_flash_verify
        0x080007cc:    f2470c01    G...    MOV      r12,#0x7001
        0x080007d0:    f2c20c01    ....    MOVT     r12,#0x2001
        0x080007d4:    4760        `G      BX       r12
    $Ven$TT$L$$advance_software_protect_anti_debugger
        0x080007d6:    f2472c01    G..,    MOV      r12,#0x7201
        0x080007da:    f2c20c01    ....    MOVT     r12,#0x2001
        0x080007de:    4760        `G      BX       r12
    i.BusFault_Handler
    BusFault_Handler
        0x080007e0:    e7fe        ..      B        BusFault_Handler ; 0x80007e0
    i.DebugMon_Handler
    DebugMon_Handler
        0x080007e2:    4770        pG      BX       lr
    i.FLASH_OB_DisableWRP
    FLASH_OB_DisableWRP
        0x080007e4:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x080007e8:    f8df809c    ....    LDR      r8,[pc,#156] ; [0x8000888] = 0x40022000
        0x080007ec:    f8d81020    .. .    LDR      r1,[r8,#0x20]
        0x080007f0:    f24c3950    L.P9    MOV      r9,#0xc350
        0x080007f4:    4301        .C      ORRS     r1,r1,r0
        0x080007f6:    b2cf        ..      UXTB     r7,r1
        0x080007f8:    f3c12607    ...&    UBFX     r6,r1,#8,#8
        0x080007fc:    f3c14507    ...E    UBFX     r5,r1,#16,#8
        0x08000800:    0e0c        ..      LSRS     r4,r1,#24
        0x08000802:    4648        HF      MOV      r0,r9
        0x08000804:    f000f91a    ....    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x08000808:    2800        .(      CMP      r0,#0
        0x0800080a:    d13b        ;.      BNE      0x8000884 ; FLASH_OB_DisableWRP + 160
        0x0800080c:    491f        .I      LDR      r1,[pc,#124] ; [0x800088c] = 0x200000b8
        0x0800080e:    61c8        .a      STR      r0,[r1,#0x1c]
        0x08000810:    f000f98e    ....    BL       HAL_FLASHEx_OBErase ; 0x8000b30
        0x08000814:    2800        .(      CMP      r0,#0
        0x08000816:    d135        5.      BNE      0x8000884 ; FLASH_OB_DisableWRP + 160
        0x08000818:    f8d82010    ...     LDR      r2,[r8,#0x10]
        0x0800081c:    f0420210    B...    ORR      r2,r2,#0x10
        0x08000820:    f8c82010    ...     STR      r2,[r8,#0x10]
        0x08000824:    2fff        ./      CMP      r7,#0xff
        0x08000826:    d007        ..      BEQ      0x8000838 ; FLASH_OB_DisableWRP + 84
        0x08000828:    4819        .H      LDR      r0,[pc,#100] ; [0x8000890] = 0x1ffff808
        0x0800082a:    8801        ..      LDRH     r1,[r0,#0]
        0x0800082c:    4339        9C      ORRS     r1,r1,r7
        0x0800082e:    8001        ..      STRH     r1,[r0,#0]
        0x08000830:    4648        HF      MOV      r0,r9
        0x08000832:    f000f903    ....    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x08000836:    b9f8        ..      CBNZ     r0,0x8000878 ; FLASH_OB_DisableWRP + 148
        0x08000838:    2eff        ..      CMP      r6,#0xff
        0x0800083a:    d008        ..      BEQ      0x800084e ; FLASH_OB_DisableWRP + 106
        0x0800083c:    4814        .H      LDR      r0,[pc,#80] ; [0x8000890] = 0x1ffff808
        0x0800083e:    1c80        ..      ADDS     r0,r0,#2
        0x08000840:    8801        ..      LDRH     r1,[r0,#0]
        0x08000842:    4331        1C      ORRS     r1,r1,r6
        0x08000844:    8001        ..      STRH     r1,[r0,#0]
        0x08000846:    4648        HF      MOV      r0,r9
        0x08000848:    f000f8f8    ....    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x0800084c:    b9a0        ..      CBNZ     r0,0x8000878 ; FLASH_OB_DisableWRP + 148
        0x0800084e:    2dff        .-      CMP      r5,#0xff
        0x08000850:    d008        ..      BEQ      0x8000864 ; FLASH_OB_DisableWRP + 128
        0x08000852:    480f        .H      LDR      r0,[pc,#60] ; [0x8000890] = 0x1ffff808
        0x08000854:    1d00        ..      ADDS     r0,r0,#4
        0x08000856:    8801        ..      LDRH     r1,[r0,#0]
        0x08000858:    4329        )C      ORRS     r1,r1,r5
        0x0800085a:    8001        ..      STRH     r1,[r0,#0]
        0x0800085c:    4648        HF      MOV      r0,r9
        0x0800085e:    f000f8ed    ....    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x08000862:    b948        H.      CBNZ     r0,0x8000878 ; FLASH_OB_DisableWRP + 148
        0x08000864:    2cff        .,      CMP      r4,#0xff
        0x08000866:    d007        ..      BEQ      0x8000878 ; FLASH_OB_DisableWRP + 148
        0x08000868:    4809        .H      LDR      r0,[pc,#36] ; [0x8000890] = 0x1ffff808
        0x0800086a:    1d80        ..      ADDS     r0,r0,#6
        0x0800086c:    8801        ..      LDRH     r1,[r0,#0]
        0x0800086e:    4321        !C      ORRS     r1,r1,r4
        0x08000870:    8001        ..      STRH     r1,[r0,#0]
        0x08000872:    4648        HF      MOV      r0,r9
        0x08000874:    f000f8e2    ....    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x08000878:    f8d82010    ...     LDR      r2,[r8,#0x10]
        0x0800087c:    f0220210    "...    BIC      r2,r2,#0x10
        0x08000880:    f8c82010    ...     STR      r2,[r8,#0x10]
        0x08000884:    e8bd87f0    ....    POP      {r4-r10,pc}
    $d
        0x08000888:    40022000    . .@    DCD    1073881088
        0x0800088c:    200000b8    ...     DCD    536871096
        0x08000890:    1ffff808    ....    DCD    536868872
    $t
    i.FLASH_OB_EnableWRP
    FLASH_OB_EnableWRP
        0x08000894:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x08000898:    f8df809c    ....    LDR      r8,[pc,#156] ; [0x8000938] = 0x40022000
        0x0800089c:    f8d81020    .. .    LDR      r1,[r8,#0x20]
        0x080008a0:    f24c3950    L.P9    MOV      r9,#0xc350
        0x080008a4:    4381        .C      BICS     r1,r1,r0
        0x080008a6:    b2cf        ..      UXTB     r7,r1
        0x080008a8:    f3c12607    ...&    UBFX     r6,r1,#8,#8
        0x080008ac:    f3c14507    ...E    UBFX     r5,r1,#16,#8
        0x080008b0:    0e0c        ..      LSRS     r4,r1,#24
        0x080008b2:    4648        HF      MOV      r0,r9
        0x080008b4:    f000f8c2    ....    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x080008b8:    2800        .(      CMP      r0,#0
        0x080008ba:    d13b        ;.      BNE      0x8000934 ; FLASH_OB_EnableWRP + 160
        0x080008bc:    491f        .I      LDR      r1,[pc,#124] ; [0x800093c] = 0x200000b8
        0x080008be:    61c8        .a      STR      r0,[r1,#0x1c]
        0x080008c0:    f000f936    ..6.    BL       HAL_FLASHEx_OBErase ; 0x8000b30
        0x080008c4:    2800        .(      CMP      r0,#0
        0x080008c6:    d135        5.      BNE      0x8000934 ; FLASH_OB_EnableWRP + 160
        0x080008c8:    f8d82010    ...     LDR      r2,[r8,#0x10]
        0x080008cc:    f0420210    B...    ORR      r2,r2,#0x10
        0x080008d0:    f8c82010    ...     STR      r2,[r8,#0x10]
        0x080008d4:    2fff        ./      CMP      r7,#0xff
        0x080008d6:    d007        ..      BEQ      0x80008e8 ; FLASH_OB_EnableWRP + 84
        0x080008d8:    4819        .H      LDR      r0,[pc,#100] ; [0x8000940] = 0x1ffff808
        0x080008da:    8801        ..      LDRH     r1,[r0,#0]
        0x080008dc:    4039        9@      ANDS     r1,r1,r7
        0x080008de:    8001        ..      STRH     r1,[r0,#0]
        0x080008e0:    4648        HF      MOV      r0,r9
        0x080008e2:    f000f8ab    ....    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x080008e6:    b9f8        ..      CBNZ     r0,0x8000928 ; FLASH_OB_EnableWRP + 148
        0x080008e8:    2eff        ..      CMP      r6,#0xff
        0x080008ea:    d008        ..      BEQ      0x80008fe ; FLASH_OB_EnableWRP + 106
        0x080008ec:    4814        .H      LDR      r0,[pc,#80] ; [0x8000940] = 0x1ffff808
        0x080008ee:    1c80        ..      ADDS     r0,r0,#2
        0x080008f0:    8801        ..      LDRH     r1,[r0,#0]
        0x080008f2:    4031        1@      ANDS     r1,r1,r6
        0x080008f4:    8001        ..      STRH     r1,[r0,#0]
        0x080008f6:    4648        HF      MOV      r0,r9
        0x080008f8:    f000f8a0    ....    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x080008fc:    b9a0        ..      CBNZ     r0,0x8000928 ; FLASH_OB_EnableWRP + 148
        0x080008fe:    2dff        .-      CMP      r5,#0xff
        0x08000900:    d008        ..      BEQ      0x8000914 ; FLASH_OB_EnableWRP + 128
        0x08000902:    480f        .H      LDR      r0,[pc,#60] ; [0x8000940] = 0x1ffff808
        0x08000904:    1d00        ..      ADDS     r0,r0,#4
        0x08000906:    8801        ..      LDRH     r1,[r0,#0]
        0x08000908:    4029        )@      ANDS     r1,r1,r5
        0x0800090a:    8001        ..      STRH     r1,[r0,#0]
        0x0800090c:    4648        HF      MOV      r0,r9
        0x0800090e:    f000f895    ....    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x08000912:    b948        H.      CBNZ     r0,0x8000928 ; FLASH_OB_EnableWRP + 148
        0x08000914:    2cff        .,      CMP      r4,#0xff
        0x08000916:    d007        ..      BEQ      0x8000928 ; FLASH_OB_EnableWRP + 148
        0x08000918:    4809        .H      LDR      r0,[pc,#36] ; [0x8000940] = 0x1ffff808
        0x0800091a:    1d80        ..      ADDS     r0,r0,#6
        0x0800091c:    8801        ..      LDRH     r1,[r0,#0]
        0x0800091e:    4021        !@      ANDS     r1,r1,r4
        0x08000920:    8001        ..      STRH     r1,[r0,#0]
        0x08000922:    4648        HF      MOV      r0,r9
        0x08000924:    f000f88a    ....    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x08000928:    f8d82010    ...     LDR      r2,[r8,#0x10]
        0x0800092c:    f0220210    "...    BIC      r2,r2,#0x10
        0x08000930:    f8c82010    ...     STR      r2,[r8,#0x10]
        0x08000934:    e8bd87f0    ....    POP      {r4-r10,pc}
    $d
        0x08000938:    40022000    . .@    DCD    1073881088
        0x0800093c:    200000b8    ...     DCD    536871096
        0x08000940:    1ffff808    ....    DCD    536868872
    $t
    i.FLASH_OB_GetRDP
    FLASH_OB_GetRDP
        0x08000944:    4904        .I      LDR      r1,[pc,#16] ; [0x8000958] = 0x40022000
        0x08000946:    20a5        .       MOVS     r0,#0xa5
        0x08000948:    69c9        .i      LDR      r1,[r1,#0x1c]
        0x0800094a:    f0010102    ....    AND      r1,r1,#2
        0x0800094e:    2902        .)      CMP      r1,#2
        0x08000950:    d100        ..      BNE      0x8000954 ; FLASH_OB_GetRDP + 16
        0x08000952:    2000        .       MOVS     r0,#0
        0x08000954:    4770        pG      BX       lr
    $d
        0x08000956:    0000        ..      DCW    0
        0x08000958:    40022000    . .@    DCD    1073881088
    $t
    i.FLASH_OB_RDP_LevelConfig
    FLASH_OB_RDP_LevelConfig
        0x0800095c:    b570        p.      PUSH     {r4-r6,lr}
        0x0800095e:    4606        .F      MOV      r6,r0
        0x08000960:    f24c3550    L.P5    MOV      r5,#0xc350
        0x08000964:    4628        (F      MOV      r0,r5
        0x08000966:    f000f869    ..i.    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x0800096a:    2800        .(      CMP      r0,#0
        0x0800096c:    d120         .      BNE      0x80009b0 ; FLASH_OB_RDP_LevelConfig + 84
        0x0800096e:    4911        .I      LDR      r1,[pc,#68] ; [0x80009b4] = 0x200000b8
        0x08000970:    61c8        .a      STR      r0,[r1,#0x1c]
        0x08000972:    4c11        .L      LDR      r4,[pc,#68] ; [0x80009b8] = 0x40022000
        0x08000974:    6920         i      LDR      r0,[r4,#0x10]
        0x08000976:    f0400020    @. .    ORR      r0,r0,#0x20
        0x0800097a:    6120         a      STR      r0,[r4,#0x10]
        0x0800097c:    6920         i      LDR      r0,[r4,#0x10]
        0x0800097e:    f0400040    @.@.    ORR      r0,r0,#0x40
        0x08000982:    6120         a      STR      r0,[r4,#0x10]
        0x08000984:    4628        (F      MOV      r0,r5
        0x08000986:    f000f859    ..Y.    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x0800098a:    6921        !i      LDR      r1,[r4,#0x10]
        0x0800098c:    f0210120    !. .    BIC      r1,r1,#0x20
        0x08000990:    6121        !a      STR      r1,[r4,#0x10]
        0x08000992:    2800        .(      CMP      r0,#0
        0x08000994:    d10c        ..      BNE      0x80009b0 ; FLASH_OB_RDP_LevelConfig + 84
        0x08000996:    6920         i      LDR      r0,[r4,#0x10]
        0x08000998:    f0400010    @...    ORR      r0,r0,#0x10
        0x0800099c:    6120         a      STR      r0,[r4,#0x10]
        0x0800099e:    4807        .H      LDR      r0,[pc,#28] ; [0x80009bc] = 0x1ffff800
        0x080009a0:    8006        ..      STRH     r6,[r0,#0]
        0x080009a2:    4628        (F      MOV      r0,r5
        0x080009a4:    f000f84a    ..J.    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x080009a8:    6921        !i      LDR      r1,[r4,#0x10]
        0x080009aa:    f0210110    !...    BIC      r1,r1,#0x10
        0x080009ae:    6121        !a      STR      r1,[r4,#0x10]
        0x080009b0:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x080009b2:    0000        ..      DCW    0
        0x080009b4:    200000b8    ...     DCD    536871096
        0x080009b8:    40022000    . .@    DCD    1073881088
        0x080009bc:    1ffff800    ....    DCD    536868864
    $t
    i.FLASH_SetErrorCode
    FLASH_SetErrorCode
        0x080009c0:    481c        .H      LDR      r0,[pc,#112] ; [0x8000a34] = 0x40022000
        0x080009c2:    2100        .!      MOVS     r1,#0
        0x080009c4:    68c2        .h      LDR      r2,[r0,#0xc]
        0x080009c6:    06d3        ..      LSLS     r3,r2,#27
        0x080009c8:    4a1b        .J      LDR      r2,[pc,#108] ; [0x8000a38] = 0x200000b8
        0x080009ca:    d402        ..      BMI      0x80009d2 ; FLASH_SetErrorCode + 18
        0x080009cc:    6cc3        .l      LDR      r3,[r0,#0x4c]
        0x080009ce:    06db        ..      LSLS     r3,r3,#27
        0x080009d0:    d505        ..      BPL      0x80009de ; FLASH_SetErrorCode + 30
        0x080009d2:    69d1        .i      LDR      r1,[r2,#0x1c]
        0x080009d4:    f0410102    A...    ORR      r1,r1,#2
        0x080009d8:    61d1        .a      STR      r1,[r2,#0x1c]
        0x080009da:    f04f1110    O...    MOV      r1,#0x100010
        0x080009de:    68c3        .h      LDR      r3,[r0,#0xc]
        0x080009e0:    075b        [.      LSLS     r3,r3,#29
        0x080009e2:    d402        ..      BMI      0x80009ea ; FLASH_SetErrorCode + 42
        0x080009e4:    6cc3        .l      LDR      r3,[r0,#0x4c]
        0x080009e6:    075b        [.      LSLS     r3,r3,#29
        0x080009e8:    d505        ..      BPL      0x80009f6 ; FLASH_SetErrorCode + 54
        0x080009ea:    69d3        .i      LDR      r3,[r2,#0x1c]
        0x080009ec:    f0430301    C...    ORR      r3,r3,#1
        0x080009f0:    61d3        .a      STR      r3,[r2,#0x1c]
        0x080009f2:    f0411104    A...    ORR      r1,r1,#0x40004
        0x080009f6:    69c3        .i      LDR      r3,[r0,#0x1c]
        0x080009f8:    07db        ..      LSLS     r3,r3,#31
        0x080009fa:    d007        ..      BEQ      0x8000a0c ; FLASH_SetErrorCode + 76
        0x080009fc:    69d3        .i      LDR      r3,[r2,#0x1c]
        0x080009fe:    f0430304    C...    ORR      r3,r3,#4
        0x08000a02:    61d3        .a      STR      r3,[r2,#0x1c]
        0x08000a04:    69c2        .i      LDR      r2,[r0,#0x1c]
        0x08000a06:    f0220201    "...    BIC      r2,r2,#1
        0x08000a0a:    61c2        .a      STR      r2,[r0,#0x1c]
        0x08000a0c:    f5a17280    ...r    SUB      r2,r1,#0x100
        0x08000a10:    3a01        .:      SUBS     r2,#1
        0x08000a12:    d00a        ..      BEQ      0x8000a2a ; FLASH_SetErrorCode + 106
        0x08000a14:    f0110f35    ..5.    TST      r1,#0x35
        0x08000a18:    d002        ..      BEQ      0x8000a20 ; FLASH_SetErrorCode + 96
        0x08000a1a:    f0010235    ..5.    AND      r2,r1,#0x35
        0x08000a1e:    60c2        .`      STR      r2,[r0,#0xc]
        0x08000a20:    0c0a        ..      LSRS     r2,r1,#16
        0x08000a22:    d001        ..      BEQ      0x8000a28 ; FLASH_SetErrorCode + 104
        0x08000a24:    0c09        ..      LSRS     r1,r1,#16
        0x08000a26:    64c1        .d      STR      r1,[r0,#0x4c]
        0x08000a28:    4770        pG      BX       lr
        0x08000a2a:    69c1        .i      LDR      r1,[r0,#0x1c]
        0x08000a2c:    f0210101    !...    BIC      r1,r1,#1
        0x08000a30:    61c1        .a      STR      r1,[r0,#0x1c]
        0x08000a32:    4770        pG      BX       lr
    $d
        0x08000a34:    40022000    . .@    DCD    1073881088
        0x08000a38:    200000b8    ...     DCD    536871096
    $t
    i.FLASH_WaitForLastOperation
    FLASH_WaitForLastOperation
        0x08000a3c:    b570        p.      PUSH     {r4-r6,lr}
        0x08000a3e:    4605        .F      MOV      r5,r0
        0x08000a40:    f000fa60    ..`.    BL       HAL_GetTick ; 0x8000f04
        0x08000a44:    4606        .F      MOV      r6,r0
        0x08000a46:    4c11        .L      LDR      r4,[pc,#68] ; [0x8000a8c] = 0x40022000
        0x08000a48:    e009        ..      B        0x8000a5e ; FLASH_WaitForLastOperation + 34
        0x08000a4a:    1c68        h.      ADDS     r0,r5,#1
        0x08000a4c:    d007        ..      BEQ      0x8000a5e ; FLASH_WaitForLastOperation + 34
        0x08000a4e:    b125        %.      CBZ      r5,0x8000a5a ; FLASH_WaitForLastOperation + 30
        0x08000a50:    f000fa58    ..X.    BL       HAL_GetTick ; 0x8000f04
        0x08000a54:    1b80        ..      SUBS     r0,r0,r6
        0x08000a56:    42a8        .B      CMP      r0,r5
        0x08000a58:    d901        ..      BLS      0x8000a5e ; FLASH_WaitForLastOperation + 34
        0x08000a5a:    2003        .       MOVS     r0,#3
        0x08000a5c:    bd70        p.      POP      {r4-r6,pc}
        0x08000a5e:    68e0        .h      LDR      r0,[r4,#0xc]
        0x08000a60:    07c0        ..      LSLS     r0,r0,#31
        0x08000a62:    d1f2        ..      BNE      0x8000a4a ; FLASH_WaitForLastOperation + 14
        0x08000a64:    68e0        .h      LDR      r0,[r4,#0xc]
        0x08000a66:    0680        ..      LSLS     r0,r0,#26
        0x08000a68:    d501        ..      BPL      0x8000a6e ; FLASH_WaitForLastOperation + 50
        0x08000a6a:    2020                MOVS     r0,#0x20
        0x08000a6c:    60e0        .`      STR      r0,[r4,#0xc]
        0x08000a6e:    68e0        .h      LDR      r0,[r4,#0xc]
        0x08000a70:    06c0        ..      LSLS     r0,r0,#27
        0x08000a72:    d405        ..      BMI      0x8000a80 ; FLASH_WaitForLastOperation + 68
        0x08000a74:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x08000a76:    07c0        ..      LSLS     r0,r0,#31
        0x08000a78:    d102        ..      BNE      0x8000a80 ; FLASH_WaitForLastOperation + 68
        0x08000a7a:    68e0        .h      LDR      r0,[r4,#0xc]
        0x08000a7c:    0740        @.      LSLS     r0,r0,#29
        0x08000a7e:    d503        ..      BPL      0x8000a88 ; FLASH_WaitForLastOperation + 76
        0x08000a80:    f7ffff9e    ....    BL       FLASH_SetErrorCode ; 0x80009c0
        0x08000a84:    2001        .       MOVS     r0,#1
        0x08000a86:    bd70        p.      POP      {r4-r6,pc}
        0x08000a88:    2000        .       MOVS     r0,#0
        0x08000a8a:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x08000a8c:    40022000    . .@    DCD    1073881088
    $t
    i.HAL_CRC_Accumulate
    HAL_CRC_Accumulate
        0x08000a90:    b530        0.      PUSH     {r4,r5,lr}
        0x08000a92:    2302        .#      MOVS     r3,#2
        0x08000a94:    7143        Cq      STRB     r3,[r0,#5]
        0x08000a96:    2300        .#      MOVS     r3,#0
        0x08000a98:    e005        ..      B        0x8000aa6 ; HAL_CRC_Accumulate + 22
        0x08000a9a:    bf00        ..      NOP      
        0x08000a9c:    6805        .h      LDR      r5,[r0,#0]
        0x08000a9e:    f8514023    Q.#@    LDR      r4,[r1,r3,LSL #2]
        0x08000aa2:    602c        ,`      STR      r4,[r5,#0]
        0x08000aa4:    1c5b        [.      ADDS     r3,r3,#1
        0x08000aa6:    4293        .B      CMP      r3,r2
        0x08000aa8:    d3f8        ..      BCC      0x8000a9c ; HAL_CRC_Accumulate + 12
        0x08000aaa:    6801        .h      LDR      r1,[r0,#0]
        0x08000aac:    6809        .h      LDR      r1,[r1,#0]
        0x08000aae:    2201        ."      MOVS     r2,#1
        0x08000ab0:    7142        Bq      STRB     r2,[r0,#5]
        0x08000ab2:    4608        .F      MOV      r0,r1
        0x08000ab4:    bd30        0.      POP      {r4,r5,pc}
    i.HAL_CRC_Calculate
    HAL_CRC_Calculate
        0x08000ab6:    b530        0.      PUSH     {r4,r5,lr}
        0x08000ab8:    2302        .#      MOVS     r3,#2
        0x08000aba:    7143        Cq      STRB     r3,[r0,#5]
        0x08000abc:    6803        .h      LDR      r3,[r0,#0]
        0x08000abe:    689c        .h      LDR      r4,[r3,#8]
        0x08000ac0:    f0440401    D...    ORR      r4,r4,#1
        0x08000ac4:    609c        .`      STR      r4,[r3,#8]
        0x08000ac6:    2300        .#      MOVS     r3,#0
        0x08000ac8:    e004        ..      B        0x8000ad4 ; HAL_CRC_Calculate + 30
        0x08000aca:    6805        .h      LDR      r5,[r0,#0]
        0x08000acc:    f8514023    Q.#@    LDR      r4,[r1,r3,LSL #2]
        0x08000ad0:    602c        ,`      STR      r4,[r5,#0]
        0x08000ad2:    1c5b        [.      ADDS     r3,r3,#1
        0x08000ad4:    4293        .B      CMP      r3,r2
        0x08000ad6:    d3f8        ..      BCC      0x8000aca ; HAL_CRC_Calculate + 20
        0x08000ad8:    6801        .h      LDR      r1,[r0,#0]
        0x08000ada:    6809        .h      LDR      r1,[r1,#0]
        0x08000adc:    2201        ."      MOVS     r2,#1
        0x08000ade:    7142        Bq      STRB     r2,[r0,#5]
        0x08000ae0:    4608        .F      MOV      r0,r1
        0x08000ae2:    bd30        0.      POP      {r4,r5,pc}
    i.HAL_CRC_Init
    HAL_CRC_Init
        0x08000ae4:    b510        ..      PUSH     {r4,lr}
        0x08000ae6:    0004        ..      MOVS     r4,r0
        0x08000ae8:    d002        ..      BEQ      0x8000af0 ; HAL_CRC_Init + 12
        0x08000aea:    7960        `y      LDRB     r0,[r4,#5]
        0x08000aec:    b110        ..      CBZ      r0,0x8000af4 ; HAL_CRC_Init + 16
        0x08000aee:    e006        ..      B        0x8000afe ; HAL_CRC_Init + 26
        0x08000af0:    2001        .       MOVS     r0,#1
        0x08000af2:    bd10        ..      POP      {r4,pc}
        0x08000af4:    2000        .       MOVS     r0,#0
        0x08000af6:    7120         q      STRB     r0,[r4,#4]
        0x08000af8:    4620         F      MOV      r0,r4
        0x08000afa:    f000f805    ....    BL       HAL_CRC_MspInit ; 0x8000b08
        0x08000afe:    2001        .       MOVS     r0,#1
        0x08000b00:    7160        `q      STRB     r0,[r4,#5]
        0x08000b02:    2000        .       MOVS     r0,#0
        0x08000b04:    bd10        ..      POP      {r4,pc}
        0x08000b06:    0000        ..      MOVS     r0,r0
    i.HAL_CRC_MspInit
    HAL_CRC_MspInit
        0x08000b08:    b508        ..      PUSH     {r3,lr}
        0x08000b0a:    6800        .h      LDR      r0,[r0,#0]
        0x08000b0c:    4906        .I      LDR      r1,[pc,#24] ; [0x8000b28] = 0x40023000
        0x08000b0e:    4288        .B      CMP      r0,r1
        0x08000b10:    d108        ..      BNE      0x8000b24 ; HAL_CRC_MspInit + 28
        0x08000b12:    4806        .H      LDR      r0,[pc,#24] ; [0x8000b2c] = 0x40021000
        0x08000b14:    6941        Ai      LDR      r1,[r0,#0x14]
        0x08000b16:    f0410140    A.@.    ORR      r1,r1,#0x40
        0x08000b1a:    6141        Aa      STR      r1,[r0,#0x14]
        0x08000b1c:    6940        @i      LDR      r0,[r0,#0x14]
        0x08000b1e:    f0000040    ..@.    AND      r0,r0,#0x40
        0x08000b22:    9000        ..      STR      r0,[sp,#0]
        0x08000b24:    bd08        ..      POP      {r3,pc}
    $d
        0x08000b26:    0000        ..      DCW    0
        0x08000b28:    40023000    .0.@    DCD    1073885184
        0x08000b2c:    40021000    ...@    DCD    1073876992
    $t
    i.HAL_FLASHEx_OBErase
    HAL_FLASHEx_OBErase
        0x08000b30:    b570        p.      PUSH     {r4-r6,lr}
        0x08000b32:    f7ffff07    ....    BL       FLASH_OB_GetRDP ; 0x8000944
        0x08000b36:    b2c5        ..      UXTB     r5,r0
        0x08000b38:    f24c3650    L.P6    MOV      r6,#0xc350
        0x08000b3c:    4630        0F      MOV      r0,r6
        0x08000b3e:    f7ffff7d    ..}.    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x08000b42:    2800        .(      CMP      r0,#0
        0x08000b44:    d118        ..      BNE      0x8000b78 ; HAL_FLASHEx_OBErase + 72
        0x08000b46:    490d        .I      LDR      r1,[pc,#52] ; [0x8000b7c] = 0x200000b8
        0x08000b48:    61c8        .a      STR      r0,[r1,#0x1c]
        0x08000b4a:    4c0d        .L      LDR      r4,[pc,#52] ; [0x8000b80] = 0x40022000
        0x08000b4c:    6920         i      LDR      r0,[r4,#0x10]
        0x08000b4e:    f0400020    @. .    ORR      r0,r0,#0x20
        0x08000b52:    6120         a      STR      r0,[r4,#0x10]
        0x08000b54:    6920         i      LDR      r0,[r4,#0x10]
        0x08000b56:    f0400040    @.@.    ORR      r0,r0,#0x40
        0x08000b5a:    6120         a      STR      r0,[r4,#0x10]
        0x08000b5c:    4630        0F      MOV      r0,r6
        0x08000b5e:    f7ffff6d    ..m.    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x08000b62:    6921        !i      LDR      r1,[r4,#0x10]
        0x08000b64:    f0210120    !. .    BIC      r1,r1,#0x20
        0x08000b68:    6121        !a      STR      r1,[r4,#0x10]
        0x08000b6a:    2800        .(      CMP      r0,#0
        0x08000b6c:    d104        ..      BNE      0x8000b78 ; HAL_FLASHEx_OBErase + 72
        0x08000b6e:    4628        (F      MOV      r0,r5
        0x08000b70:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x08000b74:    f7ffbef2    ....    B.W      FLASH_OB_RDP_LevelConfig ; 0x800095c
        0x08000b78:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x08000b7a:    0000        ..      DCW    0
        0x08000b7c:    200000b8    ...     DCD    536871096
        0x08000b80:    40022000    . .@    DCD    1073881088
    $t
    i.HAL_FLASHEx_OBGetConfig
    HAL_FLASHEx_OBGetConfig
        0x08000b84:    b570        p.      PUSH     {r4-r6,lr}
        0x08000b86:    4604        .F      MOV      r4,r0
        0x08000b88:    4d06        .M      LDR      r5,[pc,#24] ; [0x8000ba4] = 0x40022000
        0x08000b8a:    2007        .       MOVS     r0,#7
        0x08000b8c:    6020         `      STR      r0,[r4,#0]
        0x08000b8e:    6a28        (j      LDR      r0,[r5,#0x20]
        0x08000b90:    60a0        .`      STR      r0,[r4,#8]
        0x08000b92:    f7fffed7    ....    BL       FLASH_OB_GetRDP ; 0x8000944
        0x08000b96:    7420         t      STRB     r0,[r4,#0x10]
        0x08000b98:    69e8        .i      LDR      r0,[r5,#0x1c]
        0x08000b9a:    f3c00083    ....    UBFX     r0,r0,#2,#4
        0x08000b9e:    7460        `t      STRB     r0,[r4,#0x11]
        0x08000ba0:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x08000ba2:    0000        ..      DCW    0
        0x08000ba4:    40022000    . .@    DCD    1073881088
    $t
    i.HAL_FLASHEx_OBProgram
    HAL_FLASHEx_OBProgram
        0x08000ba8:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x08000bac:    4d2d        -M      LDR      r5,[pc,#180] ; [0x8000c64] = 0x200000b8
        0x08000bae:    4604        .F      MOV      r4,r0
        0x08000bb0:    2001        .       MOVS     r0,#1
        0x08000bb2:    7e29        )~      LDRB     r1,[r5,#0x18]
        0x08000bb4:    2901        .)      CMP      r1,#1
        0x08000bb6:    d00e        ..      BEQ      0x8000bd6 ; HAL_FLASHEx_OBProgram + 46
        0x08000bb8:    2101        .!      MOVS     r1,#1
        0x08000bba:    7629        )v      STRB     r1,[r5,#0x18]
        0x08000bbc:    7821        !x      LDRB     r1,[r4,#0]
        0x08000bbe:    f04f0700    O...    MOV      r7,#0
        0x08000bc2:    07c9        ..      LSLS     r1,r1,#31
        0x08000bc4:    d00d        ..      BEQ      0x8000be2 ; HAL_FLASHEx_OBProgram + 58
        0x08000bc6:    6860        `h      LDR      r0,[r4,#4]
        0x08000bc8:    2801        .(      CMP      r0,#1
        0x08000bca:    68a0        .h      LDR      r0,[r4,#8]
        0x08000bcc:    d006        ..      BEQ      0x8000bdc ; HAL_FLASHEx_OBProgram + 52
        0x08000bce:    f7fffe09    ....    BL       FLASH_OB_DisableWRP ; 0x80007e4
        0x08000bd2:    bbe8        ..      CBNZ     r0,0x8000c50 ; HAL_FLASHEx_OBProgram + 168
        0x08000bd4:    e005        ..      B        0x8000be2 ; HAL_FLASHEx_OBProgram + 58
        0x08000bd6:    2002        .       MOVS     r0,#2
        0x08000bd8:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x08000bdc:    f7fffe5a    ..Z.    BL       FLASH_OB_EnableWRP ; 0x8000894
        0x08000be0:    e7f7        ..      B        0x8000bd2 ; HAL_FLASHEx_OBProgram + 42
        0x08000be2:    7821        !x      LDRB     r1,[r4,#0]
        0x08000be4:    0789        ..      LSLS     r1,r1,#30
        0x08000be6:    d503        ..      BPL      0x8000bf0 ; HAL_FLASHEx_OBProgram + 72
        0x08000be8:    7c20         |      LDRB     r0,[r4,#0x10]
        0x08000bea:    f7fffeb7    ....    BL       FLASH_OB_RDP_LevelConfig ; 0x800095c
        0x08000bee:    bb78        x.      CBNZ     r0,0x8000c50 ; HAL_FLASHEx_OBProgram + 168
        0x08000bf0:    7821        !x      LDRB     r1,[r4,#0]
        0x08000bf2:    4e1d        .N      LDR      r6,[pc,#116] ; [0x8000c68] = 0x40022000
        0x08000bf4:    0749        I.      LSLS     r1,r1,#29
        0x08000bf6:    f24c3950    L.P9    MOV      r9,#0xc350
        0x08000bfa:    d516        ..      BPL      0x8000c2a ; HAL_FLASHEx_OBProgram + 130
        0x08000bfc:    f8948011    ....    LDRB     r8,[r4,#0x11]
        0x08000c00:    4648        HF      MOV      r0,r9
        0x08000c02:    f7ffff1b    ....    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x08000c06:    b978        x.      CBNZ     r0,0x8000c28 ; HAL_FLASHEx_OBProgram + 128
        0x08000c08:    61ef        .a      STR      r7,[r5,#0x1c]
        0x08000c0a:    6930        0i      LDR      r0,[r6,#0x10]
        0x08000c0c:    f0400010    @...    ORR      r0,r0,#0x10
        0x08000c10:    6130        0a      STR      r0,[r6,#0x10]
        0x08000c12:    4916        .I      LDR      r1,[pc,#88] ; [0x8000c6c] = 0x1ffff802
        0x08000c14:    f04800f0    H...    ORR      r0,r8,#0xf0
        0x08000c18:    8008        ..      STRH     r0,[r1,#0]
        0x08000c1a:    4648        HF      MOV      r0,r9
        0x08000c1c:    f7ffff0e    ....    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x08000c20:    6931        1i      LDR      r1,[r6,#0x10]
        0x08000c22:    f0210110    !...    BIC      r1,r1,#0x10
        0x08000c26:    6131        1a      STR      r1,[r6,#0x10]
        0x08000c28:    b990        ..      CBNZ     r0,0x8000c50 ; HAL_FLASHEx_OBProgram + 168
        0x08000c2a:    7821        !x      LDRB     r1,[r4,#0]
        0x08000c2c:    0709        ..      LSLS     r1,r1,#28
        0x08000c2e:    d516        ..      BPL      0x8000c5e ; HAL_FLASHEx_OBProgram + 182
        0x08000c30:    f8d48014    ....    LDR      r8,[r4,#0x14]
        0x08000c34:    7e24        $~      LDRB     r4,[r4,#0x18]
        0x08000c36:    4648        HF      MOV      r0,r9
        0x08000c38:    f7ffff00    ....    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x08000c3c:    b940        @.      CBNZ     r0,0x8000c50 ; HAL_FLASHEx_OBProgram + 168
        0x08000c3e:    61ef        .a      STR      r7,[r5,#0x1c]
        0x08000c40:    6930        0i      LDR      r0,[r6,#0x10]
        0x08000c42:    f0400010    @...    ORR      r0,r0,#0x10
        0x08000c46:    6130        0a      STR      r0,[r6,#0x10]
        0x08000c48:    f8a84000    ...@    STRH     r4,[r8,#0]
        0x08000c4c:    4648        HF      MOV      r0,r9
        0x08000c4e:    e000        ..      B        0x8000c52 ; HAL_FLASHEx_OBProgram + 170
        0x08000c50:    e005        ..      B        0x8000c5e ; HAL_FLASHEx_OBProgram + 182
        0x08000c52:    f7fffef3    ....    BL       FLASH_WaitForLastOperation ; 0x8000a3c
        0x08000c56:    6931        1i      LDR      r1,[r6,#0x10]
        0x08000c58:    f0210110    !...    BIC      r1,r1,#0x10
        0x08000c5c:    6131        1a      STR      r1,[r6,#0x10]
        0x08000c5e:    762f        /v      STRB     r7,[r5,#0x18]
        0x08000c60:    e7ba        ..      B        0x8000bd8 ; HAL_FLASHEx_OBProgram + 48
    $d
        0x08000c62:    0000        ..      DCW    0
        0x08000c64:    200000b8    ...     DCD    536871096
        0x08000c68:    40022000    . .@    DCD    1073881088
        0x08000c6c:    1ffff802    ....    DCD    536868866
    $t
    i.HAL_FLASH_Lock
    HAL_FLASH_Lock
        0x08000c70:    4805        .H      LDR      r0,[pc,#20] ; [0x8000c88] = 0x40022000
        0x08000c72:    6901        .i      LDR      r1,[r0,#0x10]
        0x08000c74:    f0410180    A...    ORR      r1,r1,#0x80
        0x08000c78:    6101        .a      STR      r1,[r0,#0x10]
        0x08000c7a:    6d01        .m      LDR      r1,[r0,#0x50]
        0x08000c7c:    f0410180    A...    ORR      r1,r1,#0x80
        0x08000c80:    6501        .e      STR      r1,[r0,#0x50]
        0x08000c82:    2000        .       MOVS     r0,#0
        0x08000c84:    4770        pG      BX       lr
    $d
        0x08000c86:    0000        ..      DCW    0
        0x08000c88:    40022000    . .@    DCD    1073881088
    $t
    i.HAL_FLASH_OB_Lock
    HAL_FLASH_OB_Lock
        0x08000c8c:    4803        .H      LDR      r0,[pc,#12] ; [0x8000c9c] = 0x40022000
        0x08000c8e:    6901        .i      LDR      r1,[r0,#0x10]
        0x08000c90:    f4217100    !..q    BIC      r1,r1,#0x200
        0x08000c94:    6101        .a      STR      r1,[r0,#0x10]
        0x08000c96:    2000        .       MOVS     r0,#0
        0x08000c98:    4770        pG      BX       lr
    $d
        0x08000c9a:    0000        ..      DCW    0
        0x08000c9c:    40022000    . .@    DCD    1073881088
    $t
    i.HAL_FLASH_OB_Unlock
    HAL_FLASH_OB_Unlock
        0x08000ca0:    4805        .H      LDR      r0,[pc,#20] ; [0x8000cb8] = 0x40022000
        0x08000ca2:    6901        .i      LDR      r1,[r0,#0x10]
        0x08000ca4:    0589        ..      LSLS     r1,r1,#22
        0x08000ca6:    d405        ..      BMI      0x8000cb4 ; HAL_FLASH_OB_Unlock + 20
        0x08000ca8:    4904        .I      LDR      r1,[pc,#16] ; [0x8000cbc] = 0x45670123
        0x08000caa:    6081        .`      STR      r1,[r0,#8]
        0x08000cac:    4904        .I      LDR      r1,[pc,#16] ; [0x8000cc0] = 0xcdef89ab
        0x08000cae:    6081        .`      STR      r1,[r0,#8]
        0x08000cb0:    2000        .       MOVS     r0,#0
        0x08000cb2:    4770        pG      BX       lr
        0x08000cb4:    2001        .       MOVS     r0,#1
        0x08000cb6:    4770        pG      BX       lr
    $d
        0x08000cb8:    40022000    . .@    DCD    1073881088
        0x08000cbc:    45670123    #.gE    DCD    1164378403
        0x08000cc0:    cdef89ab    ....    DCD    3455027627
    $t
    i.HAL_FLASH_Unlock
    HAL_FLASH_Unlock
        0x08000cc4:    490b        .I      LDR      r1,[pc,#44] ; [0x8000cf4] = 0x40022000
        0x08000cc6:    b510        ..      PUSH     {r4,lr}
        0x08000cc8:    690a        .i      LDR      r2,[r1,#0x10]
        0x08000cca:    2000        .       MOVS     r0,#0
        0x08000ccc:    0614        ..      LSLS     r4,r2,#24
        0x08000cce:    4b0a        .K      LDR      r3,[pc,#40] ; [0x8000cf8] = 0x45670123
        0x08000cd0:    4a0a        .J      LDR      r2,[pc,#40] ; [0x8000cfc] = 0xcdef89ab
        0x08000cd2:    d505        ..      BPL      0x8000ce0 ; HAL_FLASH_Unlock + 28
        0x08000cd4:    604b        K`      STR      r3,[r1,#4]
        0x08000cd6:    604a        J`      STR      r2,[r1,#4]
        0x08000cd8:    690c        .i      LDR      r4,[r1,#0x10]
        0x08000cda:    0624        $.      LSLS     r4,r4,#24
        0x08000cdc:    d500        ..      BPL      0x8000ce0 ; HAL_FLASH_Unlock + 28
        0x08000cde:    2001        .       MOVS     r0,#1
        0x08000ce0:    6d0c        .m      LDR      r4,[r1,#0x50]
        0x08000ce2:    0624        $.      LSLS     r4,r4,#24
        0x08000ce4:    d505        ..      BPL      0x8000cf2 ; HAL_FLASH_Unlock + 46
        0x08000ce6:    644b        Kd      STR      r3,[r1,#0x44]
        0x08000ce8:    644a        Jd      STR      r2,[r1,#0x44]
        0x08000cea:    6d09        .m      LDR      r1,[r1,#0x50]
        0x08000cec:    0609        ..      LSLS     r1,r1,#24
        0x08000cee:    d500        ..      BPL      0x8000cf2 ; HAL_FLASH_Unlock + 46
        0x08000cf0:    2001        .       MOVS     r0,#1
        0x08000cf2:    bd10        ..      POP      {r4,pc}
    $d
        0x08000cf4:    40022000    . .@    DCD    1073881088
        0x08000cf8:    45670123    #.gE    DCD    1164378403
        0x08000cfc:    cdef89ab    ....    DCD    3455027627
    $t
    i.HAL_GPIO_Init
    HAL_GPIO_Init
        0x08000d00:    e92d4ff8    -..O    PUSH     {r3-r11,lr}
        0x08000d04:    f8df91c8    ....    LDR      r9,[pc,#456] ; [0x8000ed0] = 0x40010400
        0x08000d08:    2400        .$      MOVS     r4,#0
        0x08000d0a:    f1090a04    ....    ADD      r10,r9,#4
        0x08000d0e:    f10a0b04    ....    ADD      r11,r10,#4
        0x08000d12:    4623        #F      MOV      r3,r4
        0x08000d14:    270f        .'      MOVS     r7,#0xf
        0x08000d16:    f10b0e04    ....    ADD      lr,r11,#4
        0x08000d1a:    e0d1        ..      B        0x8000ec0 ; HAL_GPIO_Init + 448
        0x08000d1c:    2501        .%      MOVS     r5,#1
        0x08000d1e:    40a5        .@      LSLS     r5,r5,r4
        0x08000d20:    ea060205    ....    AND      r2,r6,r5
        0x08000d24:    42aa        .B      CMP      r2,r5
        0x08000d26:    d176        v.      BNE      0x8000e16 ; HAL_GPIO_Init + 278
        0x08000d28:    f8dfc1a8    ....    LDR      r12,[pc,#424] ; [0x8000ed4] = 0x10110000
        0x08000d2c:    684e        Nh      LDR      r6,[r1,#4]
        0x08000d2e:    eba6080c    ....    SUB      r8,r6,r12
        0x08000d32:    4566        fE      CMP      r6,r12
        0x08000d34:    d02b        +.      BEQ      0x8000d8e ; HAL_GPIO_Init + 142
        0x08000d36:    dc0d        ..      BGT      0x8000d54 ; HAL_GPIO_Init + 84
        0x08000d38:    2e03        ..      CMP      r6,#3
        0x08000d3a:    d034        4.      BEQ      0x8000da6 ; HAL_GPIO_Init + 166
        0x08000d3c:    dc05        ..      BGT      0x8000d4a ; HAL_GPIO_Init + 74
        0x08000d3e:    b336        6.      CBZ      r6,0x8000d8e ; HAL_GPIO_Init + 142
        0x08000d40:    2e01        ..      CMP      r6,#1
        0x08000d42:    d019        ..      BEQ      0x8000d78 ; HAL_GPIO_Init + 120
        0x08000d44:    2e02        ..      CMP      r6,#2
        0x08000d46:    d12f        /.      BNE      0x8000da8 ; HAL_GPIO_Init + 168
        0x08000d48:    e01b        ..      B        0x8000d82 ; HAL_GPIO_Init + 130
        0x08000d4a:    2e11        ..      CMP      r6,#0x11
        0x08000d4c:    d016        ..      BEQ      0x8000d7c ; HAL_GPIO_Init + 124
        0x08000d4e:    2e12        ..      CMP      r6,#0x12
        0x08000d50:    d12a        *.      BNE      0x8000da8 ; HAL_GPIO_Init + 168
        0x08000d52:    e019        ..      B        0x8000d88 ; HAL_GPIO_Init + 136
        0x08000d54:    f5b81f88    ....    CMP      r8,#0x110000
        0x08000d58:    d019        ..      BEQ      0x8000d8e ; HAL_GPIO_Init + 142
        0x08000d5a:    dc06        ..      BGT      0x8000d6a ; HAL_GPIO_Init + 106
        0x08000d5c:    f5b83f80    ...?    CMP      r8,#0x10000
        0x08000d60:    d015        ..      BEQ      0x8000d8e ; HAL_GPIO_Init + 142
        0x08000d62:    f5b81f80    ....    CMP      r8,#0x100000
        0x08000d66:    d11f        ..      BNE      0x8000da8 ; HAL_GPIO_Init + 168
        0x08000d68:    e011        ..      B        0x8000d8e ; HAL_GPIO_Init + 142
        0x08000d6a:    f5b81f00    ....    CMP      r8,#0x200000
        0x08000d6e:    d00e        ..      BEQ      0x8000d8e ; HAL_GPIO_Init + 142
        0x08000d70:    f5b81f04    ....    CMP      r8,#0x210000
        0x08000d74:    d118        ..      BNE      0x8000da8 ; HAL_GPIO_Init + 168
        0x08000d76:    e00a        ..      B        0x8000d8e ; HAL_GPIO_Init + 142
        0x08000d78:    68cb        .h      LDR      r3,[r1,#0xc]
        0x08000d7a:    e015        ..      B        0x8000da8 ; HAL_GPIO_Init + 168
        0x08000d7c:    68cb        .h      LDR      r3,[r1,#0xc]
        0x08000d7e:    1d1b        ..      ADDS     r3,r3,#4
        0x08000d80:    e012        ..      B        0x8000da8 ; HAL_GPIO_Init + 168
        0x08000d82:    68cb        .h      LDR      r3,[r1,#0xc]
        0x08000d84:    3308        .3      ADDS     r3,r3,#8
        0x08000d86:    e00f        ..      B        0x8000da8 ; HAL_GPIO_Init + 168
        0x08000d88:    68cb        .h      LDR      r3,[r1,#0xc]
        0x08000d8a:    330c        .3      ADDS     r3,r3,#0xc
        0x08000d8c:    e00c        ..      B        0x8000da8 ; HAL_GPIO_Init + 168
        0x08000d8e:    688b        .h      LDR      r3,[r1,#8]
        0x08000d90:    b12b        +.      CBZ      r3,0x8000d9e ; HAL_GPIO_Init + 158
        0x08000d92:    2b01        .+      CMP      r3,#1
        0x08000d94:    f04f0308    O...    MOV      r3,#8
        0x08000d98:    d003        ..      BEQ      0x8000da2 ; HAL_GPIO_Init + 162
        0x08000d9a:    6145        Ea      STR      r5,[r0,#0x14]
        0x08000d9c:    e004        ..      B        0x8000da8 ; HAL_GPIO_Init + 168
        0x08000d9e:    2304        .#      MOVS     r3,#4
        0x08000da0:    e002        ..      B        0x8000da8 ; HAL_GPIO_Init + 168
        0x08000da2:    6105        .a      STR      r5,[r0,#0x10]
        0x08000da4:    e000        ..      B        0x8000da8 ; HAL_GPIO_Init + 168
        0x08000da6:    2300        .#      MOVS     r3,#0
        0x08000da8:    2aff        .*      CMP      r2,#0xff
        0x08000daa:    d801        ..      BHI      0x8000db0 ; HAL_GPIO_Init + 176
        0x08000dac:    4606        .F      MOV      r6,r0
        0x08000dae:    e001        ..      B        0x8000db4 ; HAL_GPIO_Init + 180
        0x08000db0:    f1000604    ....    ADD      r6,r0,#4
        0x08000db4:    ea4f0584    O...    LSL      r5,r4,#2
        0x08000db8:    d901        ..      BLS      0x8000dbe ; HAL_GPIO_Init + 190
        0x08000dba:    f1a50520    .. .    SUB      r5,r5,#0x20
        0x08000dbe:    f8d68000    ....    LDR      r8,[r6,#0]
        0x08000dc2:    fa07fc05    ....    LSL      r12,r7,r5
        0x08000dc6:    ea28080c    (...    BIC      r8,r8,r12
        0x08000dca:    fa03f505    ....    LSL      r5,r3,r5
        0x08000dce:    ea480805    H...    ORR      r8,r8,r5
        0x08000dd2:    f8c68000    ....    STR      r8,[r6,#0]
        0x08000dd6:    684d        Mh      LDR      r5,[r1,#4]
        0x08000dd8:    00ed        ..      LSLS     r5,r5,#3
        0x08000dda:    d570        p.      BPL      0x8000ebe ; HAL_GPIO_Init + 446
        0x08000ddc:    4d3e        >M      LDR      r5,[pc,#248] ; [0x8000ed8] = 0x40021000
        0x08000dde:    69ae        .i      LDR      r6,[r5,#0x18]
        0x08000de0:    f0460601    F...    ORR      r6,r6,#1
        0x08000de4:    61ae        .a      STR      r6,[r5,#0x18]
        0x08000de6:    69ad        .i      LDR      r5,[r5,#0x18]
        0x08000de8:    f0240603    $...    BIC      r6,r4,#3
        0x08000dec:    f0050501    ....    AND      r5,r5,#1
        0x08000df0:    9500        ..      STR      r5,[sp,#0]
        0x08000df2:    4d3a        :M      LDR      r5,[pc,#232] ; [0x8000edc] = 0x40010000
        0x08000df4:    eb060c05    ....    ADD      r12,r6,r5
        0x08000df8:    f8dc5008    ...P    LDR      r5,[r12,#8]
        0x08000dfc:    07a6        ..      LSLS     r6,r4,#30
        0x08000dfe:    0f36        6.      LSRS     r6,r6,#28
        0x08000e00:    fa07f806    ....    LSL      r8,r7,r6
        0x08000e04:    ea250508    %...    BIC      r5,r5,r8
        0x08000e08:    f8df80d4    ....    LDR      r8,[pc,#212] ; [0x8000ee0] = 0x40010800
        0x08000e0c:    4540        @E      CMP      r0,r8
        0x08000e0e:    d103        ..      BNE      0x8000e18 ; HAL_GPIO_Init + 280
        0x08000e10:    f04f0800    O...    MOV      r8,#0
        0x08000e14:    e025        %.      B        0x8000e62 ; HAL_GPIO_Init + 354
        0x08000e16:    e052        R.      B        0x8000ebe ; HAL_GPIO_Init + 446
        0x08000e18:    f8df80c8    ....    LDR      r8,[pc,#200] ; [0x8000ee4] = 0x40010c00
        0x08000e1c:    4540        @E      CMP      r0,r8
        0x08000e1e:    d102        ..      BNE      0x8000e26 ; HAL_GPIO_Init + 294
        0x08000e20:    f04f0801    O...    MOV      r8,#1
        0x08000e24:    e01d        ..      B        0x8000e62 ; HAL_GPIO_Init + 354
        0x08000e26:    f8df80c0    ....    LDR      r8,[pc,#192] ; [0x8000ee8] = 0x40011000
        0x08000e2a:    4540        @E      CMP      r0,r8
        0x08000e2c:    d102        ..      BNE      0x8000e34 ; HAL_GPIO_Init + 308
        0x08000e2e:    f04f0802    O...    MOV      r8,#2
        0x08000e32:    e016        ..      B        0x8000e62 ; HAL_GPIO_Init + 354
        0x08000e34:    f8df80b4    ....    LDR      r8,[pc,#180] ; [0x8000eec] = 0x40011400
        0x08000e38:    4540        @E      CMP      r0,r8
        0x08000e3a:    d102        ..      BNE      0x8000e42 ; HAL_GPIO_Init + 322
        0x08000e3c:    f04f0803    O...    MOV      r8,#3
        0x08000e40:    e00f        ..      B        0x8000e62 ; HAL_GPIO_Init + 354
        0x08000e42:    f8df80ac    ....    LDR      r8,[pc,#172] ; [0x8000ef0] = 0x40011800
        0x08000e46:    4540        @E      CMP      r0,r8
        0x08000e48:    d102        ..      BNE      0x8000e50 ; HAL_GPIO_Init + 336
        0x08000e4a:    f04f0804    O...    MOV      r8,#4
        0x08000e4e:    e008        ..      B        0x8000e62 ; HAL_GPIO_Init + 354
        0x08000e50:    f8df80a0    ....    LDR      r8,[pc,#160] ; [0x8000ef4] = 0x40011c00
        0x08000e54:    4540        @E      CMP      r0,r8
        0x08000e56:    d102        ..      BNE      0x8000e5e ; HAL_GPIO_Init + 350
        0x08000e58:    f04f0805    O...    MOV      r8,#5
        0x08000e5c:    e001        ..      B        0x8000e62 ; HAL_GPIO_Init + 354
        0x08000e5e:    f04f0806    O...    MOV      r8,#6
        0x08000e62:    fa08f806    ....    LSL      r8,r8,r6
        0x08000e66:    ea480805    H...    ORR      r8,r8,r5
        0x08000e6a:    f8cc8008    ....    STR      r8,[r12,#8]
        0x08000e6e:    684d        Mh      LDR      r5,[r1,#4]
        0x08000e70:    f8d96000    ...`    LDR      r6,[r9,#0]
        0x08000e74:    03ed        ..      LSLS     r5,r5,#15
        0x08000e76:    464d        MF      MOV      r5,r9
        0x08000e78:    d501        ..      BPL      0x8000e7e ; HAL_GPIO_Init + 382
        0x08000e7a:    4316        .C      ORRS     r6,r6,r2
        0x08000e7c:    e000        ..      B        0x8000e80 ; HAL_GPIO_Init + 384
        0x08000e7e:    4396        .C      BICS     r6,r6,r2
        0x08000e80:    602e        .`      STR      r6,[r5,#0]
        0x08000e82:    684d        Mh      LDR      r5,[r1,#4]
        0x08000e84:    f8da6000    ...`    LDR      r6,[r10,#0]
        0x08000e88:    03ad        ..      LSLS     r5,r5,#14
        0x08000e8a:    4655        UF      MOV      r5,r10
        0x08000e8c:    d501        ..      BPL      0x8000e92 ; HAL_GPIO_Init + 402
        0x08000e8e:    4316        .C      ORRS     r6,r6,r2
        0x08000e90:    e000        ..      B        0x8000e94 ; HAL_GPIO_Init + 404
        0x08000e92:    4396        .C      BICS     r6,r6,r2
        0x08000e94:    602e        .`      STR      r6,[r5,#0]
        0x08000e96:    684d        Mh      LDR      r5,[r1,#4]
        0x08000e98:    f8db6000    ...`    LDR      r6,[r11,#0]
        0x08000e9c:    02ed        ..      LSLS     r5,r5,#11
        0x08000e9e:    465d        ]F      MOV      r5,r11
        0x08000ea0:    d501        ..      BPL      0x8000ea6 ; HAL_GPIO_Init + 422
        0x08000ea2:    4316        .C      ORRS     r6,r6,r2
        0x08000ea4:    e000        ..      B        0x8000ea8 ; HAL_GPIO_Init + 424
        0x08000ea6:    4396        .C      BICS     r6,r6,r2
        0x08000ea8:    602e        .`      STR      r6,[r5,#0]
        0x08000eaa:    684d        Mh      LDR      r5,[r1,#4]
        0x08000eac:    f8de6000    ...`    LDR      r6,[lr,#0]
        0x08000eb0:    02ad        ..      LSLS     r5,r5,#10
        0x08000eb2:    4675        uF      MOV      r5,lr
        0x08000eb4:    d501        ..      BPL      0x8000eba ; HAL_GPIO_Init + 442
        0x08000eb6:    4316        .C      ORRS     r6,r6,r2
        0x08000eb8:    e000        ..      B        0x8000ebc ; HAL_GPIO_Init + 444
        0x08000eba:    4396        .C      BICS     r6,r6,r2
        0x08000ebc:    602e        .`      STR      r6,[r5,#0]
        0x08000ebe:    1c64        d.      ADDS     r4,r4,#1
        0x08000ec0:    680a        .h      LDR      r2,[r1,#0]
        0x08000ec2:    4616        .F      MOV      r6,r2
        0x08000ec4:    40e2        .@      LSRS     r2,r2,r4
        0x08000ec6:    f47faf29    ..).    BNE      0x8000d1c ; HAL_GPIO_Init + 28
        0x08000eca:    e8bd8ff8    ....    POP      {r3-r11,pc}
    $d
        0x08000ece:    0000        ..      DCW    0
        0x08000ed0:    40010400    ...@    DCD    1073808384
        0x08000ed4:    10110000    ....    DCD    269549568
        0x08000ed8:    40021000    ...@    DCD    1073876992
        0x08000edc:    40010000    ...@    DCD    1073807360
        0x08000ee0:    40010800    ...@    DCD    1073809408
        0x08000ee4:    40010c00    ...@    DCD    1073810432
        0x08000ee8:    40011000    ...@    DCD    1073811456
        0x08000eec:    40011400    ...@    DCD    1073812480
        0x08000ef0:    40011800    ...@    DCD    1073813504
        0x08000ef4:    40011c00    ...@    DCD    1073814528
    $t
    i.HAL_GPIO_WritePin
    HAL_GPIO_WritePin
        0x08000ef8:    b10a        ..      CBZ      r2,0x8000efe ; HAL_GPIO_WritePin + 6
        0x08000efa:    6101        .a      STR      r1,[r0,#0x10]
        0x08000efc:    4770        pG      BX       lr
        0x08000efe:    0409        ..      LSLS     r1,r1,#16
        0x08000f00:    e7fb        ..      B        0x8000efa ; HAL_GPIO_WritePin + 2
        0x08000f02:    0000        ..      MOVS     r0,r0
    i.HAL_GetTick
    HAL_GetTick
        0x08000f04:    4801        .H      LDR      r0,[pc,#4] ; [0x8000f0c] = 0x2000000c
        0x08000f06:    6880        .h      LDR      r0,[r0,#8]
        0x08000f08:    4770        pG      BX       lr
    $d
        0x08000f0a:    0000        ..      DCW    0
        0x08000f0c:    2000000c    ...     DCD    536870924
    $t
    i.HAL_IncTick
    HAL_IncTick
        0x08000f10:    4802        .H      LDR      r0,[pc,#8] ; [0x8000f1c] = 0x2000000c
        0x08000f12:    6881        .h      LDR      r1,[r0,#8]
        0x08000f14:    7802        .x      LDRB     r2,[r0,#0]
        0x08000f16:    4411        .D      ADD      r1,r1,r2
        0x08000f18:    6081        .`      STR      r1,[r0,#8]
        0x08000f1a:    4770        pG      BX       lr
    $d
        0x08000f1c:    2000000c    ...     DCD    536870924
    $t
    i.HAL_Init
    HAL_Init
        0x08000f20:    4807        .H      LDR      r0,[pc,#28] ; [0x8000f40] = 0x40022000
        0x08000f22:    b510        ..      PUSH     {r4,lr}
        0x08000f24:    6801        .h      LDR      r1,[r0,#0]
        0x08000f26:    f0410110    A...    ORR      r1,r1,#0x10
        0x08000f2a:    6001        .`      STR      r1,[r0,#0]
        0x08000f2c:    2003        .       MOVS     r0,#3
        0x08000f2e:    f000f869    ..i.    BL       HAL_NVIC_SetPriorityGrouping ; 0x8001004
        0x08000f32:    200f        .       MOVS     r0,#0xf
        0x08000f34:    f000f806    ....    BL       HAL_InitTick ; 0x8000f44
        0x08000f38:    f000f824    ..$.    BL       HAL_MspInit ; 0x8000f84
        0x08000f3c:    2000        .       MOVS     r0,#0
        0x08000f3e:    bd10        ..      POP      {r4,pc}
    $d
        0x08000f40:    40022000    . .@    DCD    1073881088
    $t
    i.HAL_InitTick
    HAL_InitTick
        0x08000f44:    b570        p.      PUSH     {r4-r6,lr}
        0x08000f46:    4d0d        .M      LDR      r5,[pc,#52] ; [0x8000f7c] = 0x2000000c
        0x08000f48:    4604        .F      MOV      r4,r0
        0x08000f4a:    f44f717a    O.zq    MOV      r1,#0x3e8
        0x08000f4e:    7828        (x      LDRB     r0,[r5,#0]
        0x08000f50:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x08000f54:    490a        .I      LDR      r1,[pc,#40] ; [0x8000f80] = 0x20000018
        0x08000f56:    6809        .h      LDR      r1,[r1,#0]
        0x08000f58:    fbb1f0f0    ....    UDIV     r0,r1,r0
        0x08000f5c:    f000faec    ....    BL       HAL_SYSTICK_Config ; 0x8001538
        0x08000f60:    b948        H.      CBNZ     r0,0x8000f76 ; HAL_InitTick + 50
        0x08000f62:    2c10        .,      CMP      r4,#0x10
        0x08000f64:    d207        ..      BCS      0x8000f76 ; HAL_InitTick + 50
        0x08000f66:    2200        ."      MOVS     r2,#0
        0x08000f68:    4621        !F      MOV      r1,r4
        0x08000f6a:    1e50        P.      SUBS     r0,r2,#1
        0x08000f6c:    f000f828    ..(.    BL       HAL_NVIC_SetPriority ; 0x8000fc0
        0x08000f70:    2000        .       MOVS     r0,#0
        0x08000f72:    606c        l`      STR      r4,[r5,#4]
        0x08000f74:    bd70        p.      POP      {r4-r6,pc}
        0x08000f76:    2001        .       MOVS     r0,#1
        0x08000f78:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x08000f7a:    0000        ..      DCW    0
        0x08000f7c:    2000000c    ...     DCD    536870924
        0x08000f80:    20000018    ...     DCD    536870936
    $t
    i.HAL_MspInit
    HAL_MspInit
        0x08000f84:    480c        .H      LDR      r0,[pc,#48] ; [0x8000fb8] = 0x40021000
        0x08000f86:    b508        ..      PUSH     {r3,lr}
        0x08000f88:    6981        .i      LDR      r1,[r0,#0x18]
        0x08000f8a:    f0410101    A...    ORR      r1,r1,#1
        0x08000f8e:    6181        .a      STR      r1,[r0,#0x18]
        0x08000f90:    6981        .i      LDR      r1,[r0,#0x18]
        0x08000f92:    f0010101    ....    AND      r1,r1,#1
        0x08000f96:    9100        ..      STR      r1,[sp,#0]
        0x08000f98:    69c1        .i      LDR      r1,[r0,#0x1c]
        0x08000f9a:    f0415180    A..Q    ORR      r1,r1,#0x10000000
        0x08000f9e:    61c1        .a      STR      r1,[r0,#0x1c]
        0x08000fa0:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x08000fa2:    f0005080    ...P    AND      r0,r0,#0x10000000
        0x08000fa6:    9000        ..      STR      r0,[sp,#0]
        0x08000fa8:    4804        .H      LDR      r0,[pc,#16] ; [0x8000fbc] = 0x40010000
        0x08000faa:    6841        Ah      LDR      r1,[r0,#4]
        0x08000fac:    f02161e0    !..a    BIC      r1,r1,#0x7000000
        0x08000fb0:    f0417100    A..q    ORR      r1,r1,#0x2000000
        0x08000fb4:    6041        A`      STR      r1,[r0,#4]
        0x08000fb6:    bd08        ..      POP      {r3,pc}
    $d
        0x08000fb8:    40021000    ...@    DCD    1073876992
        0x08000fbc:    40010000    ...@    DCD    1073807360
    $t
    i.HAL_NVIC_SetPriority
    HAL_NVIC_SetPriority
        0x08000fc0:    b4f0        ..      PUSH     {r4-r7}
        0x08000fc2:    4b0e        .K      LDR      r3,[pc,#56] ; [0x8000ffc] = 0xe000ed0c
        0x08000fc4:    681b        .h      LDR      r3,[r3,#0]
        0x08000fc6:    460c        .F      MOV      r4,r1
        0x08000fc8:    f3c32302    ...#    UBFX     r3,r3,#8,#3
        0x08000fcc:    f1c30507    ....    RSB      r5,r3,#7
        0x08000fd0:    2d04        .-      CMP      r5,#4
        0x08000fd2:    d900        ..      BLS      0x8000fd6 ; HAL_NVIC_SetPriority + 22
        0x08000fd4:    2504        .%      MOVS     r5,#4
        0x08000fd6:    1d19        ..      ADDS     r1,r3,#4
        0x08000fd8:    2907        .)      CMP      r1,#7
        0x08000fda:    d201        ..      BCS      0x8000fe0 ; HAL_NVIC_SetPriority + 32
        0x08000fdc:    2300        .#      MOVS     r3,#0
        0x08000fde:    e000        ..      B        0x8000fe2 ; HAL_NVIC_SetPriority + 34
        0x08000fe0:    1edb        ..      SUBS     r3,r3,#3
        0x08000fe2:    2601        .&      MOVS     r6,#1
        0x08000fe4:    fa06f105    ....    LSL      r1,r6,r5
        0x08000fe8:    1e49        I.      SUBS     r1,r1,#1
        0x08000fea:    4021        !@      ANDS     r1,r1,r4
        0x08000fec:    4099        .@      LSLS     r1,r1,r3
        0x08000fee:    409e        .@      LSLS     r6,r6,r3
        0x08000ff0:    1e76        v.      SUBS     r6,r6,#1
        0x08000ff2:    4016        .@      ANDS     r6,r6,r2
        0x08000ff4:    4331        1C      ORRS     r1,r1,r6
        0x08000ff6:    bcf0        ..      POP      {r4-r7}
        0x08000ff8:    f000bba6    ....    B.W      __NVIC_SetPriority ; 0x8001748
    $d
        0x08000ffc:    e000ed0c    ....    DCD    3758157068
    $d.realdata
    .ARM.__at_0x08001000
    m_serialnumber
        0x08001000:    00000000    ....    DCD    0
    $t
    i.HAL_NVIC_SetPriorityGrouping
    HAL_NVIC_SetPriorityGrouping
        0x08001004:    4906        .I      LDR      r1,[pc,#24] ; [0x8001020] = 0xe000ed0c
        0x08001006:    f0000207    ....    AND      r2,r0,#7
        0x0800100a:    6808        .h      LDR      r0,[r1,#0]
        0x0800100c:    f64f03ff    O...    MOV      r3,#0xf8ff
        0x08001010:    4018        .@      ANDS     r0,r0,r3
        0x08001012:    ea402002    @..     ORR      r0,r0,r2,LSL #8
        0x08001016:    4a03        .J      LDR      r2,[pc,#12] ; [0x8001024] = 0x5fa0000
        0x08001018:    4310        .C      ORRS     r0,r0,r2
        0x0800101a:    6008        .`      STR      r0,[r1,#0]
        0x0800101c:    4770        pG      BX       lr
    $d
        0x0800101e:    0000        ..      DCW    0
        0x08001020:    e000ed0c    ....    DCD    3758157068
        0x08001024:    05fa0000    ....    DCD    100270080
    $t
    i.HardFault_Handler
    HardFault_Handler
        0x08001028:    e7fe        ..      B        HardFault_Handler ; 0x8001028
    i.MemManage_Handler
    MemManage_Handler
        0x0800102a:    e7fe        ..      B        MemManage_Handler ; 0x800102a
    i.NMI_Handler
    NMI_Handler
        0x0800102c:    e7fe        ..      B        NMI_Handler ; 0x800102c
    i.PendSV_Handler
    PendSV_Handler
        0x0800102e:    4770        pG      BX       lr
    i.SVC_Handler
    SVC_Handler
        0x08001030:    4770        pG      BX       lr
    i.SysTick_Handler
    SysTick_Handler
        0x08001032:    f7ffbf6d    ..m.    B.W      HAL_IncTick ; 0x8000f10
    i.SystemInit
    SystemInit
        0x08001036:    4770        pG      BX       lr
    i.UsageFault_Handler
    UsageFault_Handler
        0x08001038:    e7fe        ..      B        UsageFault_Handler ; 0x8001038
    i.advance_software_protect_anti_debugger_sample
    advance_software_protect_anti_debugger_sample
        0x0800103a:    4770        pG      BX       lr
    i.advance_software_protect_dynamic_muti_object_watcher_callback
    advance_software_protect_dynamic_muti_object_watcher_callback
        0x0800103c:    4770        pG      BX       lr
        0x0800103e:    0000        ..      MOVS     r0,r0
    i.HAL_RCC_ClockConfig
    HAL_RCC_ClockConfig
        0x08001040:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x08001044:    460f        .F      MOV      r7,r1
        0x08001046:    0005        ..      MOVS     r5,r0
        0x08001048:    d061        a.      BEQ      0x800110e ; HAL_RCC_ClockConfig + 206
        0x0800104a:    4e43        CN      LDR      r6,[pc,#268] ; [0x8001158] = 0x40022000
        0x0800104c:    6830        0h      LDR      r0,[r6,#0]
        0x0800104e:    f0000007    ....    AND      r0,r0,#7
        0x08001052:    42b8        .B      CMP      r0,r7
        0x08001054:    d209        ..      BCS      0x800106a ; HAL_RCC_ClockConfig + 42
        0x08001056:    6830        0h      LDR      r0,[r6,#0]
        0x08001058:    f0200007     ...    BIC      r0,r0,#7
        0x0800105c:    4338        8C      ORRS     r0,r0,r7
        0x0800105e:    6030        0`      STR      r0,[r6,#0]
        0x08001060:    6830        0h      LDR      r0,[r6,#0]
        0x08001062:    f0000007    ....    AND      r0,r0,#7
        0x08001066:    42b8        .B      CMP      r0,r7
        0x08001068:    d151        Q.      BNE      0x800110e ; HAL_RCC_ClockConfig + 206
        0x0800106a:    6828        (h      LDR      r0,[r5,#0]
        0x0800106c:    4c3b        ;L      LDR      r4,[pc,#236] ; [0x800115c] = 0x40021000
        0x0800106e:    0781        ..      LSLS     r1,r0,#30
        0x08001070:    d512        ..      BPL      0x8001098 ; HAL_RCC_ClockConfig + 88
        0x08001072:    0740        @.      LSLS     r0,r0,#29
        0x08001074:    d503        ..      BPL      0x800107e ; HAL_RCC_ClockConfig + 62
        0x08001076:    6860        `h      LDR      r0,[r4,#4]
        0x08001078:    f44060e0    @..`    ORR      r0,r0,#0x700
        0x0800107c:    6060        ``      STR      r0,[r4,#4]
        0x0800107e:    7828        (x      LDRB     r0,[r5,#0]
        0x08001080:    0700        ..      LSLS     r0,r0,#28
        0x08001082:    d503        ..      BPL      0x800108c ; HAL_RCC_ClockConfig + 76
        0x08001084:    6860        `h      LDR      r0,[r4,#4]
        0x08001086:    f4405060    @.`P    ORR      r0,r0,#0x3800
        0x0800108a:    6060        ``      STR      r0,[r4,#4]
        0x0800108c:    6860        `h      LDR      r0,[r4,#4]
        0x0800108e:    68a9        .h      LDR      r1,[r5,#8]
        0x08001090:    f02000f0     ...    BIC      r0,r0,#0xf0
        0x08001094:    4308        .C      ORRS     r0,r0,r1
        0x08001096:    6060        ``      STR      r0,[r4,#4]
        0x08001098:    7828        (x      LDRB     r0,[r5,#0]
        0x0800109a:    07c0        ..      LSLS     r0,r0,#31
        0x0800109c:    d028        (.      BEQ      0x80010f0 ; HAL_RCC_ClockConfig + 176
        0x0800109e:    6868        hh      LDR      r0,[r5,#4]
        0x080010a0:    2801        .(      CMP      r0,#1
        0x080010a2:    d010        ..      BEQ      0x80010c6 ; HAL_RCC_ClockConfig + 134
        0x080010a4:    6821        !h      LDR      r1,[r4,#0]
        0x080010a6:    2802        .(      CMP      r0,#2
        0x080010a8:    d010        ..      BEQ      0x80010cc ; HAL_RCC_ClockConfig + 140
        0x080010aa:    0789        ..      LSLS     r1,r1,#30
        0x080010ac:    2900        .)      CMP      r1,#0
        0x080010ae:    da2e        ..      BGE      0x800110e ; HAL_RCC_ClockConfig + 206
        0x080010b0:    6861        ah      LDR      r1,[r4,#4]
        0x080010b2:    f0210103    !...    BIC      r1,r1,#3
        0x080010b6:    4301        .C      ORRS     r1,r1,r0
        0x080010b8:    6061        a`      STR      r1,[r4,#4]
        0x080010ba:    f7ffff23    ..#.    BL       HAL_GetTick ; 0x8000f04
        0x080010be:    4680        .F      MOV      r8,r0
        0x080010c0:    f2413988    A..9    MOV      r9,#0x1388
        0x080010c4:    e00d        ..      B        0x80010e2 ; HAL_RCC_ClockConfig + 162
        0x080010c6:    6821        !h      LDR      r1,[r4,#0]
        0x080010c8:    0389        ..      LSLS     r1,r1,#14
        0x080010ca:    e7ef        ..      B        0x80010ac ; HAL_RCC_ClockConfig + 108
        0x080010cc:    0189        ..      LSLS     r1,r1,#6
        0x080010ce:    e7ed        ..      B        0x80010ac ; HAL_RCC_ClockConfig + 108
        0x080010d0:    f7ffff18    ....    BL       HAL_GetTick ; 0x8000f04
        0x080010d4:    eba00108    ....    SUB      r1,r0,r8
        0x080010d8:    4549        IE      CMP      r1,r9
        0x080010da:    d902        ..      BLS      0x80010e2 ; HAL_RCC_ClockConfig + 162
        0x080010dc:    2003        .       MOVS     r0,#3
        0x080010de:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x080010e2:    6860        `h      LDR      r0,[r4,#4]
        0x080010e4:    6869        ih      LDR      r1,[r5,#4]
        0x080010e6:    f000000c    ....    AND      r0,r0,#0xc
        0x080010ea:    ebb00f81    ....    CMP      r0,r1,LSL #2
        0x080010ee:    d1ef        ..      BNE      0x80010d0 ; HAL_RCC_ClockConfig + 144
        0x080010f0:    6830        0h      LDR      r0,[r6,#0]
        0x080010f2:    f0000007    ....    AND      r0,r0,#7
        0x080010f6:    42b8        .B      CMP      r0,r7
        0x080010f8:    d90b        ..      BLS      0x8001112 ; HAL_RCC_ClockConfig + 210
        0x080010fa:    6830        0h      LDR      r0,[r6,#0]
        0x080010fc:    f0200007     ...    BIC      r0,r0,#7
        0x08001100:    4338        8C      ORRS     r0,r0,r7
        0x08001102:    6030        0`      STR      r0,[r6,#0]
        0x08001104:    6830        0h      LDR      r0,[r6,#0]
        0x08001106:    f0000007    ....    AND      r0,r0,#7
        0x0800110a:    42b8        .B      CMP      r0,r7
        0x0800110c:    d001        ..      BEQ      0x8001112 ; HAL_RCC_ClockConfig + 210
        0x0800110e:    2001        .       MOVS     r0,#1
        0x08001110:    e7e5        ..      B        0x80010de ; HAL_RCC_ClockConfig + 158
        0x08001112:    7828        (x      LDRB     r0,[r5,#0]
        0x08001114:    0740        @.      LSLS     r0,r0,#29
        0x08001116:    d505        ..      BPL      0x8001124 ; HAL_RCC_ClockConfig + 228
        0x08001118:    6860        `h      LDR      r0,[r4,#4]
        0x0800111a:    68e9        .h      LDR      r1,[r5,#0xc]
        0x0800111c:    f42060e0     ..`    BIC      r0,r0,#0x700
        0x08001120:    4308        .C      ORRS     r0,r0,r1
        0x08001122:    6060        ``      STR      r0,[r4,#4]
        0x08001124:    7828        (x      LDRB     r0,[r5,#0]
        0x08001126:    0700        ..      LSLS     r0,r0,#28
        0x08001128:    d506        ..      BPL      0x8001138 ; HAL_RCC_ClockConfig + 248
        0x0800112a:    6860        `h      LDR      r0,[r4,#4]
        0x0800112c:    6929        )i      LDR      r1,[r5,#0x10]
        0x0800112e:    f4205060     .`P    BIC      r0,r0,#0x3800
        0x08001132:    ea4000c1    @...    ORR      r0,r0,r1,LSL #3
        0x08001136:    6060        ``      STR      r0,[r4,#4]
        0x08001138:    f000f838    ..8.    BL       HAL_RCC_GetSysClockFreq ; 0x80011ac
        0x0800113c:    6861        ah      LDR      r1,[r4,#4]
        0x0800113e:    4a08        .J      LDR      r2,[pc,#32] ; [0x8001160] = 0x8007564
        0x08001140:    f3c11103    ....    UBFX     r1,r1,#4,#4
        0x08001144:    5c51        Q\      LDRB     r1,[r2,r1]
        0x08001146:    40c8        .@      LSRS     r0,r0,r1
        0x08001148:    4906        .I      LDR      r1,[pc,#24] ; [0x8001164] = 0x20000018
        0x0800114a:    6008        .`      STR      r0,[r1,#0]
        0x0800114c:    4806        .H      LDR      r0,[pc,#24] ; [0x8001168] = 0x20000010
        0x0800114e:    6800        .h      LDR      r0,[r0,#0]
        0x08001150:    f7fffef8    ....    BL       HAL_InitTick ; 0x8000f44
        0x08001154:    2000        .       MOVS     r0,#0
        0x08001156:    e7c2        ..      B        0x80010de ; HAL_RCC_ClockConfig + 158
    $d
        0x08001158:    40022000    . .@    DCD    1073881088
        0x0800115c:    40021000    ...@    DCD    1073876992
        0x08001160:    08007564    du..    DCD    134247780
        0x08001164:    20000018    ...     DCD    536870936
        0x08001168:    20000010    ...     DCD    536870928
    $t
    i.HAL_RCC_GetPCLK1Freq
    HAL_RCC_GetPCLK1Freq
        0x0800116c:    4804        .H      LDR      r0,[pc,#16] ; [0x8001180] = 0x20000018
        0x0800116e:    4905        .I      LDR      r1,[pc,#20] ; [0x8001184] = 0x40021000
        0x08001170:    6800        .h      LDR      r0,[r0,#0]
        0x08001172:    6849        Ih      LDR      r1,[r1,#4]
        0x08001174:    4a04        .J      LDR      r2,[pc,#16] ; [0x8001188] = 0x8007574
        0x08001176:    f3c12102    ...!    UBFX     r1,r1,#8,#3
        0x0800117a:    5c51        Q\      LDRB     r1,[r2,r1]
        0x0800117c:    40c8        .@      LSRS     r0,r0,r1
        0x0800117e:    4770        pG      BX       lr
    $d
        0x08001180:    20000018    ...     DCD    536870936
        0x08001184:    40021000    ...@    DCD    1073876992
        0x08001188:    08007574    tu..    DCD    134247796
    $t
    i.HAL_RCC_GetPCLK2Freq
    HAL_RCC_GetPCLK2Freq
        0x0800118c:    4804        .H      LDR      r0,[pc,#16] ; [0x80011a0] = 0x20000018
        0x0800118e:    4905        .I      LDR      r1,[pc,#20] ; [0x80011a4] = 0x40021000
        0x08001190:    6800        .h      LDR      r0,[r0,#0]
        0x08001192:    6849        Ih      LDR      r1,[r1,#4]
        0x08001194:    4a04        .J      LDR      r2,[pc,#16] ; [0x80011a8] = 0x8007574
        0x08001196:    f3c121c2    ...!    UBFX     r1,r1,#11,#3
        0x0800119a:    5c51        Q\      LDRB     r1,[r2,r1]
        0x0800119c:    40c8        .@      LSRS     r0,r0,r1
        0x0800119e:    4770        pG      BX       lr
    $d
        0x080011a0:    20000018    ...     DCD    536870936
        0x080011a4:    40021000    ...@    DCD    1073876992
        0x080011a8:    08007574    tu..    DCD    134247796
    $t
    i.HAL_RCC_GetSysClockFreq
    HAL_RCC_GetSysClockFreq
        0x080011ac:    a112        ..      ADR      r1,{pc}+0x4c ; 0x80011f8
        0x080011ae:    b085        ..      SUB      sp,sp,#0x14
        0x080011b0:    c90f        ..      LDM      r1,{r0-r3}
        0x080011b2:    e88d000f    ....    STM      sp,{r0-r3}
        0x080011b6:    a014        ..      ADR      r0,{pc}+0x52 ; 0x8001208
        0x080011b8:    4a14        .J      LDR      r2,[pc,#80] ; [0x800120c] = 0x40021000
        0x080011ba:    6800        .h      LDR      r0,[r0,#0]
        0x080011bc:    9004        ..      STR      r0,[sp,#0x10]
        0x080011be:    6851        Qh      LDR      r1,[r2,#4]
        0x080011c0:    4813        .H      LDR      r0,[pc,#76] ; [0x8001210] = 0x7a1200
        0x080011c2:    f001030c    ....    AND      r3,r1,#0xc
        0x080011c6:    2b04        .+      CMP      r3,#4
        0x080011c8:    d010        ..      BEQ      0x80011ec ; HAL_RCC_GetSysClockFreq + 64
        0x080011ca:    2b08        .+      CMP      r3,#8
        0x080011cc:    d10e        ..      BNE      0x80011ec ; HAL_RCC_GetSysClockFreq + 64
        0x080011ce:    f3c14383    ...C    UBFX     r3,r1,#18,#4
        0x080011d2:    03c9        ..      LSLS     r1,r1,#15
        0x080011d4:    f81d0003    ....    LDRB     r0,[sp,r3]
        0x080011d8:    d50a        ..      BPL      0x80011f0 ; HAL_RCC_GetSysClockFreq + 68
        0x080011da:    6851        Qh      LDR      r1,[r2,#4]
        0x080011dc:    aa04        ..      ADD      r2,sp,#0x10
        0x080011de:    f3c14140    ..@A    UBFX     r1,r1,#17,#1
        0x080011e2:    5c51        Q\      LDRB     r1,[r2,r1]
        0x080011e4:    4a0a        .J      LDR      r2,[pc,#40] ; [0x8001210] = 0x7a1200
        0x080011e6:    4350        PC      MULS     r0,r2,r0
        0x080011e8:    fbb0f0f1    ....    UDIV     r0,r0,r1
        0x080011ec:    b005        ..      ADD      sp,sp,#0x14
        0x080011ee:    4770        pG      BX       lr
        0x080011f0:    4908        .I      LDR      r1,[pc,#32] ; [0x8001214] = 0x3d0900
        0x080011f2:    4348        HC      MULS     r0,r1,r0
        0x080011f4:    e7fa        ..      B        0x80011ec ; HAL_RCC_GetSysClockFreq + 64
    $d
        0x080011f6:    0000        ..      DCW    0
        0x080011f8:    05040302    ....    DCD    84148994
        0x080011fc:    09080706    ....    DCD    151521030
        0x08001200:    0d0c0b0a    ....    DCD    218893066
        0x08001204:    10100f0e    ....    DCD    269487886
        0x08001208:    00000201    ....    DCD    513
        0x0800120c:    40021000    ...@    DCD    1073876992
        0x08001210:    007a1200    ..z.    DCD    8000000
        0x08001214:    003d0900    ..=.    DCD    4000000
    $t
    i.HAL_RCC_OscConfig
    HAL_RCC_OscConfig
        0x08001218:    e92d4ff8    -..O    PUSH     {r3-r11,lr}
        0x0800121c:    0004        ..      MOVS     r4,r0
        0x0800121e:    d070        p.      BEQ      0x8001302 ; HAL_RCC_OscConfig + 234
        0x08001220:    7820         x      LDRB     r0,[r4,#0]
        0x08001222:    4dc0        .M      LDR      r5,[pc,#768] ; [0x8001524] = 0x40021000
        0x08001224:    07c0        ..      LSLS     r0,r0,#31
        0x08001226:    d049        I.      BEQ      0x80012bc ; HAL_RCC_OscConfig + 164
        0x08001228:    6868        hh      LDR      r0,[r5,#4]
        0x0800122a:    f3c00081    ....    UBFX     r0,r0,#2,#2
        0x0800122e:    2801        .(      CMP      r0,#1
        0x08001230:    d007        ..      BEQ      0x8001242 ; HAL_RCC_OscConfig + 42
        0x08001232:    6868        hh      LDR      r0,[r5,#4]
        0x08001234:    f3c00081    ....    UBFX     r0,r0,#2,#2
        0x08001238:    2802        .(      CMP      r0,#2
        0x0800123a:    d109        ..      BNE      0x8001250 ; HAL_RCC_OscConfig + 56
        0x0800123c:    6868        hh      LDR      r0,[r5,#4]
        0x0800123e:    03c0        ..      LSLS     r0,r0,#15
        0x08001240:    d506        ..      BPL      0x8001250 ; HAL_RCC_OscConfig + 56
        0x08001242:    6828        (h      LDR      r0,[r5,#0]
        0x08001244:    0380        ..      LSLS     r0,r0,#14
        0x08001246:    d539        9.      BPL      0x80012bc ; HAL_RCC_OscConfig + 164
        0x08001248:    6860        `h      LDR      r0,[r4,#4]
        0x0800124a:    2800        .(      CMP      r0,#0
        0x0800124c:    d0e7        ..      BEQ      0x800121e ; HAL_RCC_OscConfig + 6
        0x0800124e:    e035        5.      B        0x80012bc ; HAL_RCC_OscConfig + 164
        0x08001250:    6860        `h      LDR      r0,[r4,#4]
        0x08001252:    f5b03f80    ...?    CMP      r0,#0x10000
        0x08001256:    d00b        ..      BEQ      0x8001270 ; HAL_RCC_OscConfig + 88
        0x08001258:    b110        ..      CBZ      r0,0x8001260 ; HAL_RCC_OscConfig + 72
        0x0800125a:    f5b02fa0    .../    CMP      r0,#0x50000
        0x0800125e:    d011        ..      BEQ      0x8001284 ; HAL_RCC_OscConfig + 108
        0x08001260:    6828        (h      LDR      r0,[r5,#0]
        0x08001262:    f4203080     ..0    BIC      r0,r0,#0x10000
        0x08001266:    6028        (`      STR      r0,[r5,#0]
        0x08001268:    6828        (h      LDR      r0,[r5,#0]
        0x0800126a:    f4202080     ..     BIC      r0,r0,#0x40000
        0x0800126e:    e002        ..      B        0x8001276 ; HAL_RCC_OscConfig + 94
        0x08001270:    6828        (h      LDR      r0,[r5,#0]
        0x08001272:    f4403080    @..0    ORR      r0,r0,#0x10000
        0x08001276:    6028        (`      STR      r0,[r5,#0]
        0x08001278:    6860        `h      LDR      r0,[r4,#4]
        0x0800127a:    b190        ..      CBZ      r0,0x80012a2 ; HAL_RCC_OscConfig + 138
        0x0800127c:    f7fffe42    ..B.    BL       HAL_GetTick ; 0x8000f04
        0x08001280:    4606        .F      MOV      r6,r0
        0x08001282:    e00a        ..      B        0x800129a ; HAL_RCC_OscConfig + 130
        0x08001284:    6828        (h      LDR      r0,[r5,#0]
        0x08001286:    f4402080    @..     ORR      r0,r0,#0x40000
        0x0800128a:    6028        (`      STR      r0,[r5,#0]
        0x0800128c:    e7f0        ..      B        0x8001270 ; HAL_RCC_OscConfig + 88
        0x0800128e:    bf00        ..      NOP      
        0x08001290:    f7fffe38    ..8.    BL       HAL_GetTick ; 0x8000f04
        0x08001294:    1b80        ..      SUBS     r0,r0,r6
        0x08001296:    2864        d(      CMP      r0,#0x64
        0x08001298:    d873        s.      BHI      0x8001382 ; HAL_RCC_OscConfig + 362
        0x0800129a:    6828        (h      LDR      r0,[r5,#0]
        0x0800129c:    0380        ..      LSLS     r0,r0,#14
        0x0800129e:    d5f7        ..      BPL      0x8001290 ; HAL_RCC_OscConfig + 120
        0x080012a0:    e00c        ..      B        0x80012bc ; HAL_RCC_OscConfig + 164
        0x080012a2:    f7fffe2f    ../.    BL       HAL_GetTick ; 0x8000f04
        0x080012a6:    4606        .F      MOV      r6,r0
        0x080012a8:    e005        ..      B        0x80012b6 ; HAL_RCC_OscConfig + 158
        0x080012aa:    bf00        ..      NOP      
        0x080012ac:    f7fffe2a    ..*.    BL       HAL_GetTick ; 0x8000f04
        0x080012b0:    1b80        ..      SUBS     r0,r0,r6
        0x080012b2:    2864        d(      CMP      r0,#0x64
        0x080012b4:    d8f0        ..      BHI      0x8001298 ; HAL_RCC_OscConfig + 128
        0x080012b6:    6828        (h      LDR      r0,[r5,#0]
        0x080012b8:    0380        ..      LSLS     r0,r0,#14
        0x080012ba:    d4f7        ..      BMI      0x80012ac ; HAL_RCC_OscConfig + 148
        0x080012bc:    7820         x      LDRB     r0,[r4,#0]
        0x080012be:    4e9a        .N      LDR      r6,[pc,#616] ; [0x8001528] = 0x42420000
        0x080012c0:    0780        ..      LSLS     r0,r0,#30
        0x080012c2:    f04f0901    O...    MOV      r9,#1
        0x080012c6:    f04f0800    O...    MOV      r8,#0
        0x080012ca:    d539        9.      BPL      0x8001340 ; HAL_RCC_OscConfig + 296
        0x080012cc:    6868        hh      LDR      r0,[r5,#4]
        0x080012ce:    f0100f0c    ....    TST      r0,#0xc
        0x080012d2:    d007        ..      BEQ      0x80012e4 ; HAL_RCC_OscConfig + 204
        0x080012d4:    6868        hh      LDR      r0,[r5,#4]
        0x080012d6:    f3c00081    ....    UBFX     r0,r0,#2,#2
        0x080012da:    2802        .(      CMP      r0,#2
        0x080012dc:    d109        ..      BNE      0x80012f2 ; HAL_RCC_OscConfig + 218
        0x080012de:    6868        hh      LDR      r0,[r5,#4]
        0x080012e0:    03c0        ..      LSLS     r0,r0,#15
        0x080012e2:    d406        ..      BMI      0x80012f2 ; HAL_RCC_OscConfig + 218
        0x080012e4:    6828        (h      LDR      r0,[r5,#0]
        0x080012e6:    0780        ..      LSLS     r0,r0,#30
        0x080012e8:    d514        ..      BPL      0x8001314 ; HAL_RCC_OscConfig + 252
        0x080012ea:    6920         i      LDR      r0,[r4,#0x10]
        0x080012ec:    2801        .(      CMP      r0,#1
        0x080012ee:    d108        ..      BNE      0x8001302 ; HAL_RCC_OscConfig + 234
        0x080012f0:    e010        ..      B        0x8001314 ; HAL_RCC_OscConfig + 252
        0x080012f2:    6920         i      LDR      r0,[r4,#0x10]
        0x080012f4:    b1b0        ..      CBZ      r0,0x8001324 ; HAL_RCC_OscConfig + 268
        0x080012f6:    f8c69000    ....    STR      r9,[r6,#0]
        0x080012fa:    f7fffe03    ....    BL       HAL_GetTick ; 0x8000f04
        0x080012fe:    4607        .F      MOV      r7,r0
        0x08001300:    e005        ..      B        0x800130e ; HAL_RCC_OscConfig + 246
        0x08001302:    e10a        ..      B        0x800151a ; HAL_RCC_OscConfig + 770
        0x08001304:    f7fffdfe    ....    BL       HAL_GetTick ; 0x8000f04
        0x08001308:    1bc0        ..      SUBS     r0,r0,r7
        0x0800130a:    2802        .(      CMP      r0,#2
        0x0800130c:    d8c4        ..      BHI      0x8001298 ; HAL_RCC_OscConfig + 128
        0x0800130e:    6828        (h      LDR      r0,[r5,#0]
        0x08001310:    0780        ..      LSLS     r0,r0,#30
        0x08001312:    d5f7        ..      BPL      0x8001304 ; HAL_RCC_OscConfig + 236
        0x08001314:    6828        (h      LDR      r0,[r5,#0]
        0x08001316:    6961        ai      LDR      r1,[r4,#0x14]
        0x08001318:    f02000f8     ...    BIC      r0,r0,#0xf8
        0x0800131c:    ea4000c1    @...    ORR      r0,r0,r1,LSL #3
        0x08001320:    6028        (`      STR      r0,[r5,#0]
        0x08001322:    e00d        ..      B        0x8001340 ; HAL_RCC_OscConfig + 296
        0x08001324:    f8c68000    ....    STR      r8,[r6,#0]
        0x08001328:    f7fffdec    ....    BL       HAL_GetTick ; 0x8000f04
        0x0800132c:    4607        .F      MOV      r7,r0
        0x0800132e:    e004        ..      B        0x800133a ; HAL_RCC_OscConfig + 290
        0x08001330:    f7fffde8    ....    BL       HAL_GetTick ; 0x8000f04
        0x08001334:    1bc0        ..      SUBS     r0,r0,r7
        0x08001336:    2802        .(      CMP      r0,#2
        0x08001338:    d823        #.      BHI      0x8001382 ; HAL_RCC_OscConfig + 362
        0x0800133a:    6828        (h      LDR      r0,[r5,#0]
        0x0800133c:    0780        ..      LSLS     r0,r0,#30
        0x0800133e:    d4f7        ..      BMI      0x8001330 ; HAL_RCC_OscConfig + 280
        0x08001340:    7820         x      LDRB     r0,[r4,#0]
        0x08001342:    0700        ..      LSLS     r0,r0,#28
        0x08001344:    d52c        ,.      BPL      0x80013a0 ; HAL_RCC_OscConfig + 392
        0x08001346:    4879        yH      LDR      r0,[pc,#484] ; [0x800152c] = 0x42420480
        0x08001348:    69a1        .i      LDR      r1,[r4,#0x18]
        0x0800134a:    b1d9        ..      CBZ      r1,0x8001384 ; HAL_RCC_OscConfig + 364
        0x0800134c:    f8c09000    ....    STR      r9,[r0,#0]
        0x08001350:    f7fffdd8    ....    BL       HAL_GetTick ; 0x8000f04
        0x08001354:    4607        .F      MOV      r7,r0
        0x08001356:    e004        ..      B        0x8001362 ; HAL_RCC_OscConfig + 330
        0x08001358:    f7fffdd4    ....    BL       HAL_GetTick ; 0x8000f04
        0x0800135c:    1bc0        ..      SUBS     r0,r0,r7
        0x0800135e:    2802        .(      CMP      r0,#2
        0x08001360:    d80f        ..      BHI      0x8001382 ; HAL_RCC_OscConfig + 362
        0x08001362:    6a68        hj      LDR      r0,[r5,#0x24]
        0x08001364:    0780        ..      LSLS     r0,r0,#30
        0x08001366:    d5f7        ..      BPL      0x8001358 ; HAL_RCC_OscConfig + 320
        0x08001368:    4871        qH      LDR      r0,[pc,#452] ; [0x8001530] = 0x20000018
        0x0800136a:    f44f51fa    O..Q    MOV      r1,#0x1f40
        0x0800136e:    6800        .h      LDR      r0,[r0,#0]
        0x08001370:    fbb0f0f1    ....    UDIV     r0,r0,r1
        0x08001374:    9000        ..      STR      r0,[sp,#0]
        0x08001376:    bf00        ..      NOP      
        0x08001378:    9800        ..      LDR      r0,[sp,#0]
        0x0800137a:    1e41        A.      SUBS     r1,r0,#1
        0x0800137c:    9100        ..      STR      r1,[sp,#0]
        0x0800137e:    d2fa        ..      BCS      0x8001376 ; HAL_RCC_OscConfig + 350
        0x08001380:    e00e        ..      B        0x80013a0 ; HAL_RCC_OscConfig + 392
        0x08001382:    e080        ..      B        0x8001486 ; HAL_RCC_OscConfig + 622
        0x08001384:    f8c08000    ....    STR      r8,[r0,#0]
        0x08001388:    f7fffdbc    ....    BL       HAL_GetTick ; 0x8000f04
        0x0800138c:    4607        .F      MOV      r7,r0
        0x0800138e:    e004        ..      B        0x800139a ; HAL_RCC_OscConfig + 386
        0x08001390:    f7fffdb8    ....    BL       HAL_GetTick ; 0x8000f04
        0x08001394:    1bc0        ..      SUBS     r0,r0,r7
        0x08001396:    2802        .(      CMP      r0,#2
        0x08001398:    d875        u.      BHI      0x8001486 ; HAL_RCC_OscConfig + 622
        0x0800139a:    6a68        hj      LDR      r0,[r5,#0x24]
        0x0800139c:    0780        ..      LSLS     r0,r0,#30
        0x0800139e:    d4f7        ..      BMI      0x8001390 ; HAL_RCC_OscConfig + 376
        0x080013a0:    7820         x      LDRB     r0,[r4,#0]
        0x080013a2:    0740        @.      LSLS     r0,r0,#29
        0x080013a4:    d560        `.      BPL      0x8001468 ; HAL_RCC_OscConfig + 592
        0x080013a6:    69e8        .i      LDR      r0,[r5,#0x1c]
        0x080013a8:    2700        .'      MOVS     r7,#0
        0x080013aa:    00c0        ..      LSLS     r0,r0,#3
        0x080013ac:    d408        ..      BMI      0x80013c0 ; HAL_RCC_OscConfig + 424
        0x080013ae:    69e8        .i      LDR      r0,[r5,#0x1c]
        0x080013b0:    f0405080    @..P    ORR      r0,r0,#0x10000000
        0x080013b4:    61e8        .a      STR      r0,[r5,#0x1c]
        0x080013b6:    69e8        .i      LDR      r0,[r5,#0x1c]
        0x080013b8:    2701        .'      MOVS     r7,#1
        0x080013ba:    f0005080    ...P    AND      r0,r0,#0x10000000
        0x080013be:    9000        ..      STR      r0,[sp,#0]
        0x080013c0:    485c        \H      LDR      r0,[pc,#368] ; [0x8001534] = 0x40007000
        0x080013c2:    6801        .h      LDR      r1,[r0,#0]
        0x080013c4:    05c9        ..      LSLS     r1,r1,#23
        0x080013c6:    d413        ..      BMI      0x80013f0 ; HAL_RCC_OscConfig + 472
        0x080013c8:    6801        .h      LDR      r1,[r0,#0]
        0x080013ca:    4683        .F      MOV      r11,r0
        0x080013cc:    f4417180    A..q    ORR      r1,r1,#0x100
        0x080013d0:    6001        .`      STR      r1,[r0,#0]
        0x080013d2:    f7fffd97    ....    BL       HAL_GetTick ; 0x8000f04
        0x080013d6:    4682        .F      MOV      r10,r0
        0x080013d8:    e006        ..      B        0x80013e8 ; HAL_RCC_OscConfig + 464
        0x080013da:    bf00        ..      NOP      
        0x080013dc:    f7fffd92    ....    BL       HAL_GetTick ; 0x8000f04
        0x080013e0:    eba0000a    ....    SUB      r0,r0,r10
        0x080013e4:    2864        d(      CMP      r0,#0x64
        0x080013e6:    d84e        N.      BHI      0x8001486 ; HAL_RCC_OscConfig + 622
        0x080013e8:    f8db0000    ....    LDR      r0,[r11,#0]
        0x080013ec:    05c0        ..      LSLS     r0,r0,#23
        0x080013ee:    d5f5        ..      BPL      0x80013dc ; HAL_RCC_OscConfig + 452
        0x080013f0:    68e0        .h      LDR      r0,[r4,#0xc]
        0x080013f2:    2801        .(      CMP      r0,#1
        0x080013f4:    d00a        ..      BEQ      0x800140c ; HAL_RCC_OscConfig + 500
        0x080013f6:    b108        ..      CBZ      r0,0x80013fc ; HAL_RCC_OscConfig + 484
        0x080013f8:    2805        .(      CMP      r0,#5
        0x080013fa:    d013        ..      BEQ      0x8001424 ; HAL_RCC_OscConfig + 524
        0x080013fc:    6a28        (j      LDR      r0,[r5,#0x20]
        0x080013fe:    f0200001     ...    BIC      r0,r0,#1
        0x08001402:    6228        (b      STR      r0,[r5,#0x20]
        0x08001404:    6a28        (j      LDR      r0,[r5,#0x20]
        0x08001406:    f0200004     ...    BIC      r0,r0,#4
        0x0800140a:    e002        ..      B        0x8001412 ; HAL_RCC_OscConfig + 506
        0x0800140c:    6a28        (j      LDR      r0,[r5,#0x20]
        0x0800140e:    f0400001    @...    ORR      r0,r0,#1
        0x08001412:    6228        (b      STR      r0,[r5,#0x20]
        0x08001414:    68e0        .h      LDR      r0,[r4,#0xc]
        0x08001416:    f2413b88    A..;    MOV      r11,#0x1388
        0x0800141a:    b198        ..      CBZ      r0,0x8001444 ; HAL_RCC_OscConfig + 556
        0x0800141c:    f7fffd72    ..r.    BL       HAL_GetTick ; 0x8000f04
        0x08001420:    4682        .F      MOV      r10,r0
        0x08001422:    e00b        ..      B        0x800143c ; HAL_RCC_OscConfig + 548
        0x08001424:    6a28        (j      LDR      r0,[r5,#0x20]
        0x08001426:    f0400004    @...    ORR      r0,r0,#4
        0x0800142a:    6228        (b      STR      r0,[r5,#0x20]
        0x0800142c:    e7ee        ..      B        0x800140c ; HAL_RCC_OscConfig + 500
        0x0800142e:    bf00        ..      NOP      
        0x08001430:    f7fffd68    ..h.    BL       HAL_GetTick ; 0x8000f04
        0x08001434:    eba0010a    ....    SUB      r1,r0,r10
        0x08001438:    4559        YE      CMP      r1,r11
        0x0800143a:    d85a        Z.      BHI      0x80014f2 ; HAL_RCC_OscConfig + 730
        0x0800143c:    6a28        (j      LDR      r0,[r5,#0x20]
        0x0800143e:    0780        ..      LSLS     r0,r0,#30
        0x08001440:    d5f6        ..      BPL      0x8001430 ; HAL_RCC_OscConfig + 536
        0x08001442:    e00c        ..      B        0x800145e ; HAL_RCC_OscConfig + 582
        0x08001444:    f7fffd5e    ..^.    BL       HAL_GetTick ; 0x8000f04
        0x08001448:    4682        .F      MOV      r10,r0
        0x0800144a:    e005        ..      B        0x8001458 ; HAL_RCC_OscConfig + 576
        0x0800144c:    f7fffd5a    ..Z.    BL       HAL_GetTick ; 0x8000f04
        0x08001450:    eba0010a    ....    SUB      r1,r0,r10
        0x08001454:    4559        YE      CMP      r1,r11
        0x08001456:    d84c        L.      BHI      0x80014f2 ; HAL_RCC_OscConfig + 730
        0x08001458:    6a28        (j      LDR      r0,[r5,#0x20]
        0x0800145a:    0780        ..      LSLS     r0,r0,#30
        0x0800145c:    d4f6        ..      BMI      0x800144c ; HAL_RCC_OscConfig + 564
        0x0800145e:    b11f        ..      CBZ      r7,0x8001468 ; HAL_RCC_OscConfig + 592
        0x08001460:    69e8        .i      LDR      r0,[r5,#0x1c]
        0x08001462:    f0205080     ..P    BIC      r0,r0,#0x10000000
        0x08001466:    61e8        .a      STR      r0,[r5,#0x1c]
        0x08001468:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x0800146a:    b388        ..      CBZ      r0,0x80014d0 ; HAL_RCC_OscConfig + 696
        0x0800146c:    6869        ih      LDR      r1,[r5,#4]
        0x0800146e:    f3c10181    ....    UBFX     r1,r1,#2,#2
        0x08001472:    2902        .)      CMP      r1,#2
        0x08001474:    d044        D.      BEQ      0x8001500 ; HAL_RCC_OscConfig + 744
        0x08001476:    2802        .(      CMP      r0,#2
        0x08001478:    f8c68060    ..`.    STR      r8,[r6,#0x60]
        0x0800147c:    d004        ..      BEQ      0x8001488 ; HAL_RCC_OscConfig + 624
        0x0800147e:    f7fffd41    ..A.    BL       HAL_GetTick ; 0x8000f04
        0x08001482:    4604        .F      MOV      r4,r0
        0x08001484:    e038        8.      B        0x80014f8 ; HAL_RCC_OscConfig + 736
        0x08001486:    e034        4.      B        0x80014f2 ; HAL_RCC_OscConfig + 730
        0x08001488:    f7fffd3c    ..<.    BL       HAL_GetTick ; 0x8000f04
        0x0800148c:    4607        .F      MOV      r7,r0
        0x0800148e:    e004        ..      B        0x800149a ; HAL_RCC_OscConfig + 642
        0x08001490:    f7fffd38    ..8.    BL       HAL_GetTick ; 0x8000f04
        0x08001494:    1bc0        ..      SUBS     r0,r0,r7
        0x08001496:    2802        .(      CMP      r0,#2
        0x08001498:    d82b        +.      BHI      0x80014f2 ; HAL_RCC_OscConfig + 730
        0x0800149a:    6828        (h      LDR      r0,[r5,#0]
        0x0800149c:    0180        ..      LSLS     r0,r0,#6
        0x0800149e:    d4f7        ..      BMI      0x8001490 ; HAL_RCC_OscConfig + 632
        0x080014a0:    6a20         j      LDR      r0,[r4,#0x20]
        0x080014a2:    f5b03f80    ...?    CMP      r0,#0x10000
        0x080014a6:    d105        ..      BNE      0x80014b4 ; HAL_RCC_OscConfig + 668
        0x080014a8:    6868        hh      LDR      r0,[r5,#4]
        0x080014aa:    68a1        .h      LDR      r1,[r4,#8]
        0x080014ac:    f4203000     ..0    BIC      r0,r0,#0x20000
        0x080014b0:    4308        .C      ORRS     r0,r0,r1
        0x080014b2:    6068        h`      STR      r0,[r5,#4]
        0x080014b4:    e9d40108    ....    LDRD     r0,r1,[r4,#0x20]
        0x080014b8:    4308        .C      ORRS     r0,r0,r1
        0x080014ba:    6869        ih      LDR      r1,[r5,#4]
        0x080014bc:    f4211174    !.t.    BIC      r1,r1,#0x3d0000
        0x080014c0:    4308        .C      ORRS     r0,r0,r1
        0x080014c2:    6068        h`      STR      r0,[r5,#4]
        0x080014c4:    f8c69060    ..`.    STR      r9,[r6,#0x60]
        0x080014c8:    f7fffd1c    ....    BL       HAL_GetTick ; 0x8000f04
        0x080014cc:    4604        .F      MOV      r4,r0
        0x080014ce:    e006        ..      B        0x80014de ; HAL_RCC_OscConfig + 710
        0x080014d0:    e025        %.      B        0x800151e ; HAL_RCC_OscConfig + 774
        0x080014d2:    bf00        ..      NOP      
        0x080014d4:    f7fffd16    ....    BL       HAL_GetTick ; 0x8000f04
        0x080014d8:    1b00        ..      SUBS     r0,r0,r4
        0x080014da:    2802        .(      CMP      r0,#2
        0x080014dc:    d809        ..      BHI      0x80014f2 ; HAL_RCC_OscConfig + 730
        0x080014de:    6828        (h      LDR      r0,[r5,#0]
        0x080014e0:    0180        ..      LSLS     r0,r0,#6
        0x080014e2:    d5f7        ..      BPL      0x80014d4 ; HAL_RCC_OscConfig + 700
        0x080014e4:    e01b        ..      B        0x800151e ; HAL_RCC_OscConfig + 774
        0x080014e6:    bf00        ..      NOP      
        0x080014e8:    f7fffd0c    ....    BL       HAL_GetTick ; 0x8000f04
        0x080014ec:    1b00        ..      SUBS     r0,r0,r4
        0x080014ee:    2802        .(      CMP      r0,#2
        0x080014f0:    d902        ..      BLS      0x80014f8 ; HAL_RCC_OscConfig + 736
        0x080014f2:    2003        .       MOVS     r0,#3
        0x080014f4:    e8bd8ff8    ....    POP      {r3-r11,pc}
        0x080014f8:    6828        (h      LDR      r0,[r5,#0]
        0x080014fa:    0180        ..      LSLS     r0,r0,#6
        0x080014fc:    d4f4        ..      BMI      0x80014e8 ; HAL_RCC_OscConfig + 720
        0x080014fe:    e00e        ..      B        0x800151e ; HAL_RCC_OscConfig + 774
        0x08001500:    2801        .(      CMP      r0,#1
        0x08001502:    d0f7        ..      BEQ      0x80014f4 ; HAL_RCC_OscConfig + 732
        0x08001504:    6868        hh      LDR      r0,[r5,#4]
        0x08001506:    6a22        "j      LDR      r2,[r4,#0x20]
        0x08001508:    f4003180    ...1    AND      r1,r0,#0x10000
        0x0800150c:    4291        .B      CMP      r1,r2
        0x0800150e:    d104        ..      BNE      0x800151a ; HAL_RCC_OscConfig + 770
        0x08001510:    6a61        aj      LDR      r1,[r4,#0x24]
        0x08001512:    f4001070    ..p.    AND      r0,r0,#0x3c0000
        0x08001516:    4288        .B      CMP      r0,r1
        0x08001518:    d001        ..      BEQ      0x800151e ; HAL_RCC_OscConfig + 774
        0x0800151a:    2001        .       MOVS     r0,#1
        0x0800151c:    e7ea        ..      B        0x80014f4 ; HAL_RCC_OscConfig + 732
        0x0800151e:    2000        .       MOVS     r0,#0
        0x08001520:    e7e8        ..      B        0x80014f4 ; HAL_RCC_OscConfig + 732
    $d
        0x08001522:    0000        ..      DCW    0
        0x08001524:    40021000    ...@    DCD    1073876992
        0x08001528:    42420000    ..BB    DCD    1111621632
        0x0800152c:    42420480    ..BB    DCD    1111622784
        0x08001530:    20000018    ...     DCD    536870936
        0x08001534:    40007000    .p.@    DCD    1073770496
    $t
    i.HAL_SYSTICK_Config
    HAL_SYSTICK_Config
        0x08001538:    b510        ..      PUSH     {r4,lr}
        0x0800153a:    1e40        @.      SUBS     r0,r0,#1
        0x0800153c:    f1b07f80    ....    CMP      r0,#0x1000000
        0x08001540:    d301        ..      BCC      0x8001546 ; HAL_SYSTICK_Config + 14
        0x08001542:    2001        .       MOVS     r0,#1
        0x08001544:    bd10        ..      POP      {r4,pc}
        0x08001546:    f04f24e0    O..$    MOV      r4,#0xe000e000
        0x0800154a:    6160        `a      STR      r0,[r4,#0x14]
        0x0800154c:    210f        .!      MOVS     r1,#0xf
        0x0800154e:    1760        `.      ASRS     r0,r4,#29
        0x08001550:    f000f8fa    ....    BL       __NVIC_SetPriority ; 0x8001748
        0x08001554:    2000        .       MOVS     r0,#0
        0x08001556:    61a0        .a      STR      r0,[r4,#0x18]
        0x08001558:    2007        .       MOVS     r0,#7
        0x0800155a:    6120         a      STR      r0,[r4,#0x10]
        0x0800155c:    2000        .       MOVS     r0,#0
        0x0800155e:    bd10        ..      POP      {r4,pc}
    i.HAL_UART_Init
    HAL_UART_Init
        0x08001560:    b570        p.      PUSH     {r4-r6,lr}
        0x08001562:    0004        ..      MOVS     r4,r0
        0x08001564:    d004        ..      BEQ      0x8001570 ; HAL_UART_Init + 16
        0x08001566:    f894003d    ..=.    LDRB     r0,[r4,#0x3d]
        0x0800156a:    2500        .%      MOVS     r5,#0
        0x0800156c:    b110        ..      CBZ      r0,0x8001574 ; HAL_UART_Init + 20
        0x0800156e:    e006        ..      B        0x800157e ; HAL_UART_Init + 30
        0x08001570:    2001        .       MOVS     r0,#1
        0x08001572:    bd70        p.      POP      {r4-r6,pc}
        0x08001574:    f884503c    ..<P    STRB     r5,[r4,#0x3c]
        0x08001578:    4620         F      MOV      r0,r4
        0x0800157a:    f000f823    ..#.    BL       HAL_UART_MspInit ; 0x80015c4
        0x0800157e:    2024        $       MOVS     r0,#0x24
        0x08001580:    f884003d    ..=.    STRB     r0,[r4,#0x3d]
        0x08001584:    6820         h      LDR      r0,[r4,#0]
        0x08001586:    68c1        .h      LDR      r1,[r0,#0xc]
        0x08001588:    f4215100    !..Q    BIC      r1,r1,#0x2000
        0x0800158c:    60c1        .`      STR      r1,[r0,#0xc]
        0x0800158e:    4620         F      MOV      r0,r4
        0x08001590:    f000f87e    ..~.    BL       UART_SetConfig ; 0x8001690
        0x08001594:    6820         h      LDR      r0,[r4,#0]
        0x08001596:    6901        .i      LDR      r1,[r0,#0x10]
        0x08001598:    f4214190    !..A    BIC      r1,r1,#0x4800
        0x0800159c:    6101        .a      STR      r1,[r0,#0x10]
        0x0800159e:    6820         h      LDR      r0,[r4,#0]
        0x080015a0:    6941        Ai      LDR      r1,[r0,#0x14]
        0x080015a2:    f021012a    !.*.    BIC      r1,r1,#0x2a
        0x080015a6:    6141        Aa      STR      r1,[r0,#0x14]
        0x080015a8:    6820         h      LDR      r0,[r4,#0]
        0x080015aa:    68c1        .h      LDR      r1,[r0,#0xc]
        0x080015ac:    f4415100    A..Q    ORR      r1,r1,#0x2000
        0x080015b0:    60c1        .`      STR      r1,[r0,#0xc]
        0x080015b2:    6425        %d      STR      r5,[r4,#0x40]
        0x080015b4:    2020                MOVS     r0,#0x20
        0x080015b6:    f884003d    ..=.    STRB     r0,[r4,#0x3d]
        0x080015ba:    f884003e    ..>.    STRB     r0,[r4,#0x3e]
        0x080015be:    2000        .       MOVS     r0,#0
        0x080015c0:    bd70        p.      POP      {r4-r6,pc}
        0x080015c2:    0000        ..      MOVS     r0,r0
    i.HAL_UART_MspInit
    HAL_UART_MspInit
        0x080015c4:    b530        0.      PUSH     {r4,r5,lr}
        0x080015c6:    b085        ..      SUB      sp,sp,#0x14
        0x080015c8:    2400        .$      MOVS     r4,#0
        0x080015ca:    9400        ..      STR      r4,[sp,#0]
        0x080015cc:    9401        ..      STR      r4,[sp,#4]
        0x080015ce:    9402        ..      STR      r4,[sp,#8]
        0x080015d0:    9403        ..      STR      r4,[sp,#0xc]
        0x080015d2:    6800        .h      LDR      r0,[r0,#0]
        0x080015d4:    4914        .I      LDR      r1,[pc,#80] ; [0x8001628] = 0x40013800
        0x080015d6:    4288        .B      CMP      r0,r1
        0x080015d8:    d124        $.      BNE      0x8001624 ; HAL_UART_MspInit + 96
        0x080015da:    4814        .H      LDR      r0,[pc,#80] ; [0x800162c] = 0x40021000
        0x080015dc:    6981        .i      LDR      r1,[r0,#0x18]
        0x080015de:    f4414180    A..A    ORR      r1,r1,#0x4000
        0x080015e2:    6181        .a      STR      r1,[r0,#0x18]
        0x080015e4:    6981        .i      LDR      r1,[r0,#0x18]
        0x080015e6:    f4014180    ...A    AND      r1,r1,#0x4000
        0x080015ea:    9104        ..      STR      r1,[sp,#0x10]
        0x080015ec:    6981        .i      LDR      r1,[r0,#0x18]
        0x080015ee:    f0410104    A...    ORR      r1,r1,#4
        0x080015f2:    6181        .a      STR      r1,[r0,#0x18]
        0x080015f4:    6980        .i      LDR      r0,[r0,#0x18]
        0x080015f6:    4d0e        .M      LDR      r5,[pc,#56] ; [0x8001630] = 0x40010800
        0x080015f8:    f0000004    ....    AND      r0,r0,#4
        0x080015fc:    9004        ..      STR      r0,[sp,#0x10]
        0x080015fe:    f44f7000    O..p    MOV      r0,#0x200
        0x08001602:    9000        ..      STR      r0,[sp,#0]
        0x08001604:    2002        .       MOVS     r0,#2
        0x08001606:    9001        ..      STR      r0,[sp,#4]
        0x08001608:    2003        .       MOVS     r0,#3
        0x0800160a:    9003        ..      STR      r0,[sp,#0xc]
        0x0800160c:    4669        iF      MOV      r1,sp
        0x0800160e:    4628        (F      MOV      r0,r5
        0x08001610:    f7fffb76    ..v.    BL       HAL_GPIO_Init ; 0x8000d00
        0x08001614:    1528        (.      ASRS     r0,r5,#20
        0x08001616:    e9cd0400    ....    STRD     r0,r4,[sp,#0]
        0x0800161a:    4669        iF      MOV      r1,sp
        0x0800161c:    4628        (F      MOV      r0,r5
        0x0800161e:    9402        ..      STR      r4,[sp,#8]
        0x08001620:    f7fffb6e    ..n.    BL       HAL_GPIO_Init ; 0x8000d00
        0x08001624:    b005        ..      ADD      sp,sp,#0x14
        0x08001626:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x08001628:    40013800    .8.@    DCD    1073821696
        0x0800162c:    40021000    ...@    DCD    1073876992
        0x08001630:    40010800    ...@    DCD    1073809408
    $t
    i.SystemClock_Config
    SystemClock_Config
        0x08001634:    b530        0.      PUSH     {r4,r5,lr}
        0x08001636:    b08f        ..      SUB      sp,sp,#0x3c
        0x08001638:    2128        (!      MOVS     r1,#0x28
        0x0800163a:    4668        hF      MOV      r0,sp
        0x0800163c:    f7feff8e    ....    BL       __aeabi_memclr4 ; 0x800055c
        0x08001640:    2114        .!      MOVS     r1,#0x14
        0x08001642:    a80a        ..      ADD      r0,sp,#0x28
        0x08001644:    f7feff8a    ....    BL       __aeabi_memclr4 ; 0x800055c
        0x08001648:    2502        .%      MOVS     r5,#2
        0x0800164a:    2001        .       MOVS     r0,#1
        0x0800164c:    9004        ..      STR      r0,[sp,#0x10]
        0x0800164e:    9500        ..      STR      r5,[sp,#0]
        0x08001650:    2010        .       MOVS     r0,#0x10
        0x08001652:    9005        ..      STR      r0,[sp,#0x14]
        0x08001654:    2400        .$      MOVS     r4,#0
        0x08001656:    f44f1060    O.`.    MOV      r0,#0x380000
        0x0800165a:    e9cd4008    ...@    STRD     r4,r0,[sp,#0x20]
        0x0800165e:    9507        ..      STR      r5,[sp,#0x1c]
        0x08001660:    4668        hF      MOV      r0,sp
        0x08001662:    f7fffdd9    ....    BL       HAL_RCC_OscConfig ; 0x8001218
        0x08001666:    b108        ..      CBZ      r0,0x800166c ; SystemClock_Config + 56
        0x08001668:    b672        r.      CPSID    i
        0x0800166a:    e7fe        ..      B        0x800166a ; SystemClock_Config + 54
        0x0800166c:    200f        .       MOVS     r0,#0xf
        0x0800166e:    e9cd050a    ....    STRD     r0,r5,[sp,#0x28]
        0x08001672:    f44f6080    O..`    MOV      r0,#0x400
        0x08001676:    e9cd400c    ...@    STRD     r4,r0,[sp,#0x30]
        0x0800167a:    2102        .!      MOVS     r1,#2
        0x0800167c:    a80a        ..      ADD      r0,sp,#0x28
        0x0800167e:    940e        ..      STR      r4,[sp,#0x38]
        0x08001680:    f7fffcde    ....    BL       HAL_RCC_ClockConfig ; 0x8001040
        0x08001684:    2800        .(      CMP      r0,#0
        0x08001686:    d001        ..      BEQ      0x800168c ; SystemClock_Config + 88
        0x08001688:    b672        r.      CPSID    i
        0x0800168a:    e7fe        ..      B        0x800168a ; SystemClock_Config + 86
        0x0800168c:    b00f        ..      ADD      sp,sp,#0x3c
        0x0800168e:    bd30        0.      POP      {r4,r5,pc}
    i.UART_SetConfig
    UART_SetConfig
        0x08001690:    b570        p.      PUSH     {r4-r6,lr}
        0x08001692:    4604        .F      MOV      r4,r0
        0x08001694:    6800        .h      LDR      r0,[r0,#0]
        0x08001696:    6901        .i      LDR      r1,[r0,#0x10]
        0x08001698:    68e2        .h      LDR      r2,[r4,#0xc]
        0x0800169a:    f4215140    !.@Q    BIC      r1,r1,#0x3000
        0x0800169e:    4311        .C      ORRS     r1,r1,r2
        0x080016a0:    6101        .a      STR      r1,[r0,#0x10]
        0x080016a2:    6921        !i      LDR      r1,[r4,#0x10]
        0x080016a4:    68a0        .h      LDR      r0,[r4,#8]
        0x080016a6:    4308        .C      ORRS     r0,r0,r1
        0x080016a8:    6961        ai      LDR      r1,[r4,#0x14]
        0x080016aa:    4308        .C      ORRS     r0,r0,r1
        0x080016ac:    6821        !h      LDR      r1,[r4,#0]
        0x080016ae:    68ca        .h      LDR      r2,[r1,#0xc]
        0x080016b0:    f241630c    A..c    MOV      r3,#0x160c
        0x080016b4:    439a        .C      BICS     r2,r2,r3
        0x080016b6:    4302        .C      ORRS     r2,r2,r0
        0x080016b8:    60ca        .`      STR      r2,[r1,#0xc]
        0x080016ba:    6820         h      LDR      r0,[r4,#0]
        0x080016bc:    6941        Ai      LDR      r1,[r0,#0x14]
        0x080016be:    69a2        .i      LDR      r2,[r4,#0x18]
        0x080016c0:    f4217140    !.@q    BIC      r1,r1,#0x300
        0x080016c4:    4311        .C      ORRS     r1,r1,r2
        0x080016c6:    6141        Aa      STR      r1,[r0,#0x14]
        0x080016c8:    491e        .I      LDR      r1,[pc,#120] ; [0x8001744] = 0x40013800
        0x080016ca:    6820         h      LDR      r0,[r4,#0]
        0x080016cc:    4288        .B      CMP      r0,r1
        0x080016ce:    d102        ..      BNE      0x80016d6 ; UART_SetConfig + 70
        0x080016d0:    f7fffd5c    ..\.    BL       HAL_RCC_GetPCLK2Freq ; 0x800118c
        0x080016d4:    e001        ..      B        0x80016da ; UART_SetConfig + 74
        0x080016d6:    f7fffd49    ..I.    BL       HAL_RCC_GetPCLK1Freq ; 0x800116c
        0x080016da:    eb0001c0    ....    ADD      r1,r0,r0,LSL #3
        0x080016de:    eb011200    ....    ADD      r2,r1,r0,LSL #4
        0x080016e2:    6860        `h      LDR      r0,[r4,#4]
        0x080016e4:    2164        d!      MOVS     r1,#0x64
        0x080016e6:    0080        ..      LSLS     r0,r0,#2
        0x080016e8:    fbb2f3f0    ....    UDIV     r3,r2,r0
        0x080016ec:    fbb3f3f1    ....    UDIV     r3,r3,r1
        0x080016f0:    f06f0618    o...    MVN      r6,#0x18
        0x080016f4:    4373        sC      MULS     r3,r6,r3
        0x080016f6:    fbb2f5f0    ....    UDIV     r5,r2,r0
        0x080016fa:    fbb2f6f0    ....    UDIV     r6,r2,r0
        0x080016fe:    eb050583    ....    ADD      r5,r5,r3,LSL #2
        0x08001702:    2332        2#      MOVS     r3,#0x32
        0x08001704:    eb031505    ....    ADD      r5,r3,r5,LSL #4
        0x08001708:    fbb5f5f1    ....    UDIV     r5,r5,r1
        0x0800170c:    fbb6f6f1    ....    UDIV     r6,r6,r1
        0x08001710:    f00505f0    ....    AND      r5,r5,#0xf0
        0x08001714:    eb051506    ....    ADD      r5,r5,r6,LSL #4
        0x08001718:    fbb2f6f0    ....    UDIV     r6,r2,r0
        0x0800171c:    fbb2f0f0    ....    UDIV     r0,r2,r0
        0x08001720:    fbb0f0f1    ....    UDIV     r0,r0,r1
        0x08001724:    f06f0218    o...    MVN      r2,#0x18
        0x08001728:    4350        PC      MULS     r0,r2,r0
        0x0800172a:    eb060080    ....    ADD      r0,r6,r0,LSL #2
        0x0800172e:    eb031000    ....    ADD      r0,r3,r0,LSL #4
        0x08001732:    fbb0f0f1    ....    UDIV     r0,r0,r1
        0x08001736:    6821        !h      LDR      r1,[r4,#0]
        0x08001738:    f000000f    ....    AND      r0,r0,#0xf
        0x0800173c:    4428        (D      ADD      r0,r0,r5
        0x0800173e:    6088        .`      STR      r0,[r1,#8]
        0x08001740:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x08001742:    0000        ..      DCW    0
        0x08001744:    40013800    .8.@    DCD    1073821696
    $t
    i.__NVIC_SetPriority
    __NVIC_SetPriority
        0x08001748:    0709        ..      LSLS     r1,r1,#28
        0x0800174a:    0e09        ..      LSRS     r1,r1,#24
        0x0800174c:    2800        .(      CMP      r0,#0
        0x0800174e:    db04        ..      BLT      0x800175a ; __NVIC_SetPriority + 18
        0x08001750:    f10020e0    ...     ADD      r0,r0,#0xe000e000
        0x08001754:    f8801400    ....    STRB     r1,[r0,#0x400]
        0x08001758:    4770        pG      BX       lr
        0x0800175a:    f000000f    ....    AND      r0,r0,#0xf
        0x0800175e:    f10020e0    ...     ADD      r0,r0,#0xe000e000
        0x08001762:    f8801d14    ....    STRB     r1,[r0,#0xd14]
        0x08001766:    4770        pG      BX       lr
    i.__advance_software_protect_objectwatch_check
    __advance_software_protect_objectwatch_check
        0x08001768:    b510        ..      PUSH     {r4,lr}
        0x0800176a:    b140        @.      CBZ      r0,0x800177e ; __advance_software_protect_objectwatch_check + 22
        0x0800176c:    b139        9.      CBZ      r1,0x800177e ; __advance_software_protect_objectwatch_check + 22
        0x0800176e:    1844        D.      ADDS     r4,r0,r1
        0x08001770:    7862        bx      LDRB     r2,[r4,#1]
        0x08001772:    b132        2.      CBZ      r2,0x8001782 ; __advance_software_protect_objectwatch_check + 26
        0x08001774:    f7fff816    ....    BL       $Ven$TT$L$$advance_software_protect_crc32 ; 0x80007a4
        0x08001778:    6861        ah      LDR      r1,[r4,#4]
        0x0800177a:    4281        .B      CMP      r1,r0
        0x0800177c:    d003        ..      BEQ      0x8001786 ; __advance_software_protect_objectwatch_check + 30
        0x0800177e:    2000        .       MOVS     r0,#0
        0x08001780:    bd10        ..      POP      {r4,pc}
        0x08001782:    f000f802    ....    BL       __advance_software_protect_objectwatch_update ; 0x800178a
        0x08001786:    2001        .       MOVS     r0,#1
        0x08001788:    bd10        ..      POP      {r4,pc}
    i.__advance_software_protect_objectwatch_update
    __advance_software_protect_objectwatch_update
        0x0800178a:    b510        ..      PUSH     {r4,lr}
        0x0800178c:    2800        .(      CMP      r0,#0
        0x0800178e:    d007        ..      BEQ      0x80017a0 ; __advance_software_protect_objectwatch_update + 22
        0x08001790:    2900        .)      CMP      r1,#0
        0x08001792:    d005        ..      BEQ      0x80017a0 ; __advance_software_protect_objectwatch_update + 22
        0x08001794:    1844        D.      ADDS     r4,r0,r1
        0x08001796:    f7fff805    ....    BL       $Ven$TT$L$$advance_software_protect_crc32 ; 0x80007a4
        0x0800179a:    6060        ``      STR      r0,[r4,#4]
        0x0800179c:    2001        .       MOVS     r0,#1
        0x0800179e:    7060        `p      STRB     r0,[r4,#1]
        0x080017a0:    bd10        ..      POP      {r4,pc}
    i._advance_software_protect_ramcode_data_process
    _advance_software_protect_ramcode_data_process
        0x080017a2:    b57f        ..      PUSH     {r0-r6,lr}
        0x080017a4:    2200        ."      MOVS     r2,#0
        0x080017a6:    ab02        ..      ADD      r3,sp,#8
        0x080017a8:    e006        ..      B        0x80017b8 ; _advance_software_protect_ramcode_data_process + 22
        0x080017aa:    f0020507    ....    AND      r5,r2,#7
        0x080017ae:    5c84        .\      LDRB     r4,[r0,r2]
        0x080017b0:    5d5d        ]]      LDRB     r5,[r3,r5]
        0x080017b2:    406c        l@      EORS     r4,r4,r5
        0x080017b4:    5484        .T      STRB     r4,[r0,r2]
        0x080017b6:    1c52        R.      ADDS     r2,r2,#1
        0x080017b8:    428a        .B      CMP      r2,r1
        0x080017ba:    d3f6        ..      BCC      0x80017aa ; _advance_software_protect_ramcode_data_process + 8
        0x080017bc:    bd7f        ..      POP      {r0-r6,pc}
    i.add32
    add32
        0x080017be:    6803        .h      LDR      r3,[r0,#0]
        0x080017c0:    440b        .D      ADD      r3,r3,r1
        0x080017c2:    6003        .`      STR      r3,[r0,#0]
        0x080017c4:    f9920000    ....    LDRSB    r0,[r2,#0]
        0x080017c8:    428b        .B      CMP      r3,r1
        0x080017ca:    d201        ..      BCS      0x80017d0 ; add32 + 18
        0x080017cc:    2101        .!      MOVS     r1,#1
        0x080017ce:    e000        ..      B        0x80017d2 ; add32 + 20
        0x080017d0:    2100        .!      MOVS     r1,#0
        0x080017d2:    4408        .D      ADD      r0,r0,r1
        0x080017d4:    7010        .p      STRB     r0,[r2,#0]
        0x080017d6:    4770        pG      BX       lr
    i.add64
    add64
        0x080017d8:    b570        p.      PUSH     {r4-r6,lr}
        0x080017da:    2300        .#      MOVS     r3,#0
        0x080017dc:    461c        .F      MOV      r4,r3
        0x080017de:    6805        .h      LDR      r5,[r0,#0]
        0x080017e0:    441d        .D      ADD      r5,r5,r3
        0x080017e2:    6005        .`      STR      r5,[r0,#0]
        0x080017e4:    429d        .B      CMP      r5,r3
        0x080017e6:    d201        ..      BCS      0x80017ec ; add64 + 20
        0x080017e8:    2301        .#      MOVS     r3,#1
        0x080017ea:    e000        ..      B        0x80017ee ; add64 + 22
        0x080017ec:    2300        .#      MOVS     r3,#0
        0x080017ee:    680e        .h      LDR      r6,[r1,#0]
        0x080017f0:    4435        5D      ADD      r5,r5,r6
        0x080017f2:    6005        .`      STR      r5,[r0,#0]
        0x080017f4:    680e        .h      LDR      r6,[r1,#0]
        0x080017f6:    42b5        .B      CMP      r5,r6
        0x080017f8:    d201        ..      BCS      0x80017fe ; add64 + 38
        0x080017fa:    2501        .%      MOVS     r5,#1
        0x080017fc:    e000        ..      B        0x8001800 ; add64 + 40
        0x080017fe:    2500        .%      MOVS     r5,#0
        0x08001800:    1c64        d.      ADDS     r4,r4,#1
        0x08001802:    b2e4        ..      UXTB     r4,r4
        0x08001804:    1d00        ..      ADDS     r0,r0,#4
        0x08001806:    1d09        ..      ADDS     r1,r1,#4
        0x08001808:    442b        +D      ADD      r3,r3,r5
        0x0800180a:    2c02        .,      CMP      r4,#2
        0x0800180c:    d3e7        ..      BCC      0x80017de ; add64 + 6
        0x0800180e:    6810        .h      LDR      r0,[r2,#0]
        0x08001810:    4418        .D      ADD      r0,r0,r3
        0x08001812:    6010        .`      STR      r0,[r2,#0]
        0x08001814:    bd70        p.      POP      {r4-r6,pc}
        0x08001816:    0000        ..      MOVS     r0,r0
    i.advance_software_protect_dynamic_muti_object_watcher
    advance_software_protect_dynamic_muti_object_watcher
        0x08001818:    b510        ..      PUSH     {r4,lr}
        0x0800181a:    4829        )H      LDR      r0,[pc,#164] ; [0x80018c0] = 0x800103d
        0x0800181c:    f000f978    ..x.    BL       advance_software_protect_objectwatch_list_set_callback ; 0x8001b10
        0x08001820:    2200        ."      MOVS     r2,#0
        0x08001822:    2110        .!      MOVS     r1,#0x10
        0x08001824:    4827        'H      LDR      r0,[pc,#156] ; [0x80018c4] = 0x20000158
        0x08001826:    f000f8b7    ....    BL       advance_software_protect_objectwatch_list_add ; 0x8001998
        0x0800182a:    4826        &H      LDR      r0,[pc,#152] ; [0x80018c4] = 0x20000158
        0x0800182c:    2200        ."      MOVS     r2,#0
        0x0800182e:    2114        .!      MOVS     r1,#0x14
        0x08001830:    3010        .0      ADDS     r0,r0,#0x10
        0x08001832:    f000f8b1    ....    BL       advance_software_protect_objectwatch_list_add ; 0x8001998
        0x08001836:    4823        #H      LDR      r0,[pc,#140] ; [0x80018c4] = 0x20000158
        0x08001838:    2200        ."      MOVS     r2,#0
        0x0800183a:    2114        .!      MOVS     r1,#0x14
        0x0800183c:    3024        $0      ADDS     r0,r0,#0x24
        0x0800183e:    f000f8ab    ....    BL       advance_software_protect_objectwatch_list_add ; 0x8001998
        0x08001842:    4820         H      LDR      r0,[pc,#128] ; [0x80018c4] = 0x20000158
        0x08001844:    2200        ."      MOVS     r2,#0
        0x08001846:    2120         !      MOVS     r1,#0x20
        0x08001848:    3038        80      ADDS     r0,r0,#0x38
        0x0800184a:    f000f8a5    ....    BL       advance_software_protect_objectwatch_list_add ; 0x8001998
        0x0800184e:    481d        .H      LDR      r0,[pc,#116] ; [0x80018c4] = 0x20000158
        0x08001850:    2200        ."      MOVS     r2,#0
        0x08001852:    2120         !      MOVS     r1,#0x20
        0x08001854:    3038        80      ADDS     r0,r0,#0x38
        0x08001856:    f000f89f    ....    BL       advance_software_protect_objectwatch_list_add ; 0x8001998
        0x0800185a:    2200        ."      MOVS     r2,#0
        0x0800185c:    2120         !      MOVS     r1,#0x20
        0x0800185e:    4610        .F      MOV      r0,r2
        0x08001860:    f000f89a    ....    BL       advance_software_protect_objectwatch_list_add ; 0x8001998
        0x08001864:    2400        .$      MOVS     r4,#0
        0x08001866:    2020                MOVS     r0,#0x20
        0x08001868:    f7fefce8    ....    BL       malloc ; 0x800023c
        0x0800186c:    b130        0.      CBZ      r0,0x800187c ; advance_software_protect_dynamic_muti_object_watcher + 100
        0x0800186e:    2201        ."      MOVS     r2,#1
        0x08001870:    2120         !      MOVS     r1,#0x20
        0x08001872:    f000f891    ....    BL       advance_software_protect_objectwatch_list_add ; 0x8001998
        0x08001876:    1c64        d.      ADDS     r4,r4,#1
        0x08001878:    2c64        d,      CMP      r4,#0x64
        0x0800187a:    d3f4        ..      BCC      0x8001866 ; advance_software_protect_dynamic_muti_object_watcher + 78
        0x0800187c:    4811        .H      LDR      r0,[pc,#68] ; [0x80018c4] = 0x20000158
        0x0800187e:    3010        .0      ADDS     r0,r0,#0x10
        0x08001880:    f000f8f6    ....    BL       advance_software_protect_objectwatch_list_find ; 0x8001a70
        0x08001884:    480f        .H      LDR      r0,[pc,#60] ; [0x80018c4] = 0x20000158
        0x08001886:    3038        80      ADDS     r0,r0,#0x38
        0x08001888:    f000f8c0    ....    BL       advance_software_protect_objectwatch_list_check ; 0x8001a0c
        0x0800188c:    480d        .H      LDR      r0,[pc,#52] ; [0x80018c4] = 0x20000158
        0x0800188e:    3038        80      ADDS     r0,r0,#0x38
        0x08001890:    68c1        .h      LDR      r1,[r0,#0xc]
        0x08001892:    f08101ab    ....    EOR      r1,r1,#0xab
        0x08001896:    60c1        .`      STR      r1,[r0,#0xc]
        0x08001898:    f000f8d0    ....    BL       advance_software_protect_objectwatch_list_check_all ; 0x8001a3c
        0x0800189c:    f000f946    ..F.    BL       advance_software_protect_objectwatch_list_size ; 0x8001b2c
        0x080018a0:    4808        .H      LDR      r0,[pc,#32] ; [0x80018c4] = 0x20000158
        0x080018a2:    3038        80      ADDS     r0,r0,#0x38
        0x080018a4:    f000f94e    ..N.    BL       advance_software_protect_objectwatch_list_update ; 0x8001b44
        0x080018a8:    f000f8c8    ....    BL       advance_software_protect_objectwatch_list_check_all ; 0x8001a3c
        0x080018ac:    4805        .H      LDR      r0,[pc,#20] ; [0x80018c4] = 0x20000158
        0x080018ae:    3024        $0      ADDS     r0,r0,#0x24
        0x080018b0:    f000f8f4    ....    BL       advance_software_protect_objectwatch_list_remove ; 0x8001a9c
        0x080018b4:    f000f960    ..`.    BL       advance_software_protect_objectwatch_list_update_all ; 0x8001b78
        0x080018b8:    e8bd4010    ...@    POP      {r4,lr}
        0x080018bc:    f000b912    ....    B.W      advance_software_protect_objectwatch_list_reset ; 0x8001ae4
    $d
        0x080018c0:    0800103d    =...    DCD    134221885
        0x080018c4:    20000158    X..     DCD    536871256
    $t
    i.advance_software_protect_flash_verify_check
    advance_software_protect_flash_verify_check
        0x080018c8:    4a0e        .J      LDR      r2,[pc,#56] ; [0x8001904] = 0x200000f8
        0x080018ca:    b510        ..      PUSH     {r4,lr}
        0x080018cc:    6813        .h      LDR      r3,[r2,#0]
        0x080018ce:    6854        Th      LDR      r4,[r2,#4]
        0x080018d0:    480d        .H      LDR      r0,[pc,#52] ; [0x8001908] = 0x69b5e963
        0x080018d2:    490e        .I      LDR      r1,[pc,#56] ; [0x800190c] = 0x3126d23c
        0x080018d4:    4058        X@      EORS     r0,r0,r3
        0x080018d6:    4061        a@      EORS     r1,r1,r4
        0x080018d8:    4c0d        .L      LDR      r4,[pc,#52] ; [0x8001910] = 0xf268c8eb
        0x080018da:    4b0e        .K      LDR      r3,[pc,#56] ; [0x8001914] = 0x9dfe4427
        0x080018dc:    4060        `@      EORS     r0,r0,r4
        0x080018de:    4059        Y@      EORS     r1,r1,r3
        0x080018e0:    4308        .C      ORRS     r0,r0,r1
        0x080018e2:    d10b        ..      BNE      0x80018fc ; advance_software_protect_flash_verify_check + 52
        0x080018e4:    69d3        .i      LDR      r3,[r2,#0x1c]
        0x080018e6:    6a12        .j      LDR      r2,[r2,#0x20]
        0x080018e8:    490c        .I      LDR      r1,[pc,#48] ; [0x800191c] = 0xa4534d40
        0x080018ea:    480b        .H      LDR      r0,[pc,#44] ; [0x8001918] = 0xc32cb469
        0x080018ec:    4051        Q@      EORS     r1,r1,r2
        0x080018ee:    4058        X@      EORS     r0,r0,r3
        0x080018f0:    4a08        .J      LDR      r2,[pc,#32] ; [0x8001914] = 0x9dfe4427
        0x080018f2:    4623        #F      MOV      r3,r4
        0x080018f4:    4058        X@      EORS     r0,r0,r3
        0x080018f6:    4051        Q@      EORS     r1,r1,r2
        0x080018f8:    4308        .C      ORRS     r0,r0,r1
        0x080018fa:    d001        ..      BEQ      0x8001900 ; advance_software_protect_flash_verify_check + 56
        0x080018fc:    2000        .       MOVS     r0,#0
        0x080018fe:    bd10        ..      POP      {r4,pc}
        0x08001900:    2001        .       MOVS     r0,#1
        0x08001902:    bd10        ..      POP      {r4,pc}
    $d
        0x08001904:    200000f8    ...     DCD    536871160
        0x08001908:    69b5e963    c..i    DCD    1773529443
        0x0800190c:    3126d23c    <.&1    DCD    824627772
        0x08001910:    f268c8eb    ..h.    DCD    4066953451
        0x08001914:    9dfe4427    'D..    DCD    2650686503
        0x08001918:    c32cb469    i.,.    DCD    3274486889
        0x0800191c:    a4534d40    @MS.    DCD    2756922688
    $t
    i.advance_software_protect_flash_verify_init
    advance_software_protect_flash_verify_init
        0x08001920:    b5f8        ..      PUSH     {r3-r7,lr}
        0x08001922:    4c19        .L      LDR      r4,[pc,#100] ; [0x8001988] = 0x200000f8
        0x08001924:    68e0        .h      LDR      r0,[r4,#0xc]
        0x08001926:    bb60        `.      CBNZ     r0,0x8001982 ; advance_software_protect_flash_verify_init + 98
        0x08001928:    4818        .H      LDR      r0,[pc,#96] ; [0x800198c] = 0x8007fdc
        0x0800192a:    6801        .h      LDR      r1,[r0,#0]
        0x0800192c:    6842        Bh      LDR      r2,[r0,#4]
        0x0800192e:    6021        !`      STR      r1,[r4,#0]
        0x08001930:    6062        b`      STR      r2,[r4,#4]
        0x08001932:    6881        .h      LDR      r1,[r0,#8]
        0x08001934:    60a1        .`      STR      r1,[r4,#8]
        0x08001936:    68c1        .h      LDR      r1,[r0,#0xc]
        0x08001938:    60e1        .`      STR      r1,[r4,#0xc]
        0x0800193a:    6901        .i      LDR      r1,[r0,#0x10]
        0x0800193c:    6121        !a      STR      r1,[r4,#0x10]
        0x0800193e:    6941        Ai      LDR      r1,[r0,#0x14]
        0x08001940:    6161        aa      STR      r1,[r4,#0x14]
        0x08001942:    6981        .i      LDR      r1,[r0,#0x18]
        0x08001944:    61a1        .a      STR      r1,[r4,#0x18]
        0x08001946:    69c1        .i      LDR      r1,[r0,#0x1c]
        0x08001948:    6a00        .j      LDR      r0,[r0,#0x20]
        0x0800194a:    61e1        .a      STR      r1,[r4,#0x1c]
        0x0800194c:    6220         b      STR      r0,[r4,#0x20]
        0x0800194e:    f7ffffbb    ....    BL       advance_software_protect_flash_verify_check ; 0x80018c8
        0x08001952:    b938        8.      CBNZ     r0,0x8001964 ; advance_software_protect_flash_verify_init + 68
        0x08001954:    2000        .       MOVS     r0,#0
        0x08001956:    9000        ..      STR      r0,[sp,#0]
        0x08001958:    4a0d        .J      LDR      r2,[pc,#52] ; [0x8001990] = 0x9b62c2e6
        0x0800195a:    4b0e        .K      LDR      r3,[pc,#56] ; [0x8001994] = 0xfb90ffcb
        0x0800195c:    2124        $!      MOVS     r1,#0x24
        0x0800195e:    4620         F      MOV      r0,r4
        0x08001960:    f7feff25    ..%.    BL       $Ven$TT$L$$advance_software_protect_encrypt_process ; 0x80007ae
        0x08001964:    68a0        .h      LDR      r0,[r4,#8]
        0x08001966:    68e6        .h      LDR      r6,[r4,#0xc]
        0x08001968:    00c5        ..      LSLS     r5,r0,#3
        0x0800196a:    4628        (F      MOV      r0,r5
        0x0800196c:    f7fefc66    ..f.    BL       malloc ; 0x800023c
        0x08001970:    60e0        .`      STR      r0,[r4,#0xc]
        0x08001972:    68e0        .h      LDR      r0,[r4,#0xc]
        0x08001974:    2800        .(      CMP      r0,#0
        0x08001976:    d005        ..      BEQ      0x8001984 ; advance_software_protect_flash_verify_init + 100
        0x08001978:    68e0        .h      LDR      r0,[r4,#0xc]
        0x0800197a:    462a        *F      MOV      r2,r5
        0x0800197c:    4631        1F      MOV      r1,r6
        0x0800197e:    f7fefd8e    ....    BL       __aeabi_memcpy4 ; 0x800049e
        0x08001982:    2001        .       MOVS     r0,#1
        0x08001984:    bdf8        ..      POP      {r3-r7,pc}
    $d
        0x08001986:    0000        ..      DCW    0
        0x08001988:    200000f8    ...     DCD    536871160
        0x0800198c:    08007fdc    ....    DCD    134250460
        0x08001990:    9b62c2e6    ..b.    DCD    2606940902
        0x08001994:    fb90ffcb    ....    DCD    4220583883
    $t
    i.advance_software_protect_objectwatch_list_add
    advance_software_protect_objectwatch_list_add
        0x08001998:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0800199c:    4617        .F      MOV      r7,r2
        0x0800199e:    460e        .F      MOV      r6,r1
        0x080019a0:    0005        ..      MOVS     r5,r0
        0x080019a2:    d008        ..      BEQ      0x80019b6 ; advance_software_protect_objectwatch_list_add + 30
        0x080019a4:    b13e        >.      CBZ      r6,0x80019b6 ; advance_software_protect_objectwatch_list_add + 30
        0x080019a6:    f000f863    ..c.    BL       advance_software_protect_objectwatch_list_find ; 0x8001a70
        0x080019aa:    b138        8.      CBZ      r0,0x80019bc ; advance_software_protect_objectwatch_list_add + 36
        0x080019ac:    4629        )F      MOV      r1,r5
        0x080019ae:    2002        .       MOVS     r0,#2
        0x080019b0:    f000f8b4    ....    BL       advance_software_protect_objectwatch_list_sigslot ; 0x8001b1c
        0x080019b4:    e025        %.      B        0x8001a02 ; advance_software_protect_objectwatch_list_add + 106
        0x080019b6:    2100        .!      MOVS     r1,#0
        0x080019b8:    4608        .F      MOV      r0,r1
        0x080019ba:    e016        ..      B        0x80019ea ; advance_software_protect_objectwatch_list_add + 82
        0x080019bc:    2014        .       MOVS     r0,#0x14
        0x080019be:    f7fefc3d    ..=.    BL       malloc ; 0x800023c
        0x080019c2:    0004        ..      MOVS     r4,r0
        0x080019c4:    d00f        ..      BEQ      0x80019e6 ; advance_software_protect_objectwatch_list_add + 78
        0x080019c6:    2000        .       MOVS     r0,#0
        0x080019c8:    6025        %`      STR      r5,[r4,#0]
        0x080019ca:    e9c46003    ...`    STRD     r6,r0,[r4,#0xc]
        0x080019ce:    4631        1F      MOV      r1,r6
        0x080019d0:    4628        (F      MOV      r0,r5
        0x080019d2:    f7fefee7    ....    BL       $Ven$TT$L$$advance_software_protect_crc32 ; 0x80007a4
        0x080019d6:    60a0        .`      STR      r0,[r4,#8]
        0x080019d8:    2001        .       MOVS     r0,#1
        0x080019da:    490b        .I      LDR      r1,[pc,#44] ; [0x8001a08] = 0x20000058
        0x080019dc:    7160        `q      STRB     r0,[r4,#5]
        0x080019de:    7127        'q      STRB     r7,[r4,#4]
        0x080019e0:    6808        .h      LDR      r0,[r1,#0]
        0x080019e2:    b138        8.      CBZ      r0,0x80019f4 ; advance_software_protect_objectwatch_list_add + 92
        0x080019e4:    e009        ..      B        0x80019fa ; advance_software_protect_objectwatch_list_add + 98
        0x080019e6:    2100        .!      MOVS     r1,#0
        0x080019e8:    2001        .       MOVS     r0,#1
        0x080019ea:    f000f897    ....    BL       advance_software_protect_objectwatch_list_sigslot ; 0x8001b1c
        0x080019ee:    2000        .       MOVS     r0,#0
        0x080019f0:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x080019f4:    600c        .`      STR      r4,[r1,#0]
        0x080019f6:    e004        ..      B        0x8001a02 ; advance_software_protect_objectwatch_list_add + 106
        0x080019f8:    4608        .F      MOV      r0,r1
        0x080019fa:    6901        .i      LDR      r1,[r0,#0x10]
        0x080019fc:    2900        .)      CMP      r1,#0
        0x080019fe:    d1fb        ..      BNE      0x80019f8 ; advance_software_protect_objectwatch_list_add + 96
        0x08001a00:    6104        .a      STR      r4,[r0,#0x10]
        0x08001a02:    2001        .       MOVS     r0,#1
        0x08001a04:    e7f4        ..      B        0x80019f0 ; advance_software_protect_objectwatch_list_add + 88
    $d
        0x08001a06:    0000        ..      DCW    0
        0x08001a08:    20000058    X..     DCD    536871000
    $t
    i.advance_software_protect_objectwatch_list_check
    advance_software_protect_objectwatch_list_check
        0x08001a0c:    490a        .I      LDR      r1,[pc,#40] ; [0x8001a38] = 0x20000058
        0x08001a0e:    b510        ..      PUSH     {r4,lr}
        0x08001a10:    680c        .h      LDR      r4,[r1,#0]
        0x08001a12:    e00e        ..      B        0x8001a32 ; advance_software_protect_objectwatch_list_check + 38
        0x08001a14:    6821        !h      LDR      r1,[r4,#0]
        0x08001a16:    4281        .B      CMP      r1,r0
        0x08001a18:    d10a        ..      BNE      0x8001a30 ; advance_software_protect_objectwatch_list_check + 36
        0x08001a1a:    68e1        .h      LDR      r1,[r4,#0xc]
        0x08001a1c:    6820         h      LDR      r0,[r4,#0]
        0x08001a1e:    f7fefec1    ....    BL       $Ven$TT$L$$advance_software_protect_crc32 ; 0x80007a4
        0x08001a22:    68a1        .h      LDR      r1,[r4,#8]
        0x08001a24:    4288        .B      CMP      r0,r1
        0x08001a26:    d101        ..      BNE      0x8001a2c ; advance_software_protect_objectwatch_list_check + 32
        0x08001a28:    2001        .       MOVS     r0,#1
        0x08001a2a:    bd10        ..      POP      {r4,pc}
        0x08001a2c:    2000        .       MOVS     r0,#0
        0x08001a2e:    bd10        ..      POP      {r4,pc}
        0x08001a30:    6924        $i      LDR      r4,[r4,#0x10]
        0x08001a32:    2c00        .,      CMP      r4,#0
        0x08001a34:    d1ee        ..      BNE      0x8001a14 ; advance_software_protect_objectwatch_list_check + 8
        0x08001a36:    e7f9        ..      B        0x8001a2c ; advance_software_protect_objectwatch_list_check + 32
    $d
        0x08001a38:    20000058    X..     DCD    536871000
    $t
    i.advance_software_protect_objectwatch_list_check_all
    advance_software_protect_objectwatch_list_check_all
        0x08001a3c:    b570        p.      PUSH     {r4-r6,lr}
        0x08001a3e:    480b        .H      LDR      r0,[pc,#44] ; [0x8001a6c] = 0x20000058
        0x08001a40:    2500        .%      MOVS     r5,#0
        0x08001a42:    6804        .h      LDR      r4,[r0,#0]
        0x08001a44:    e00d        ..      B        0x8001a62 ; advance_software_protect_objectwatch_list_check_all + 38
        0x08001a46:    68e1        .h      LDR      r1,[r4,#0xc]
        0x08001a48:    6820         h      LDR      r0,[r4,#0]
        0x08001a4a:    f7fefeab    ....    BL       $Ven$TT$L$$advance_software_protect_crc32 ; 0x80007a4
        0x08001a4e:    68a1        .h      LDR      r1,[r4,#8]
        0x08001a50:    4288        .B      CMP      r0,r1
        0x08001a52:    d101        ..      BNE      0x8001a58 ; advance_software_protect_objectwatch_list_check_all + 28
        0x08001a54:    1c6d        m.      ADDS     r5,r5,#1
        0x08001a56:    e003        ..      B        0x8001a60 ; advance_software_protect_objectwatch_list_check_all + 36
        0x08001a58:    2003        .       MOVS     r0,#3
        0x08001a5a:    6821        !h      LDR      r1,[r4,#0]
        0x08001a5c:    f000f85e    ..^.    BL       advance_software_protect_objectwatch_list_sigslot ; 0x8001b1c
        0x08001a60:    6924        $i      LDR      r4,[r4,#0x10]
        0x08001a62:    2c00        .,      CMP      r4,#0
        0x08001a64:    d1ef        ..      BNE      0x8001a46 ; advance_software_protect_objectwatch_list_check_all + 10
        0x08001a66:    4628        (F      MOV      r0,r5
        0x08001a68:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x08001a6a:    0000        ..      DCW    0
        0x08001a6c:    20000058    X..     DCD    536871000
    $t
    i.advance_software_protect_objectwatch_list_find
    advance_software_protect_objectwatch_list_find
        0x08001a70:    4909        .I      LDR      r1,[pc,#36] ; [0x8001a98] = 0x20000058
        0x08001a72:    b510        ..      PUSH     {r4,lr}
        0x08001a74:    6809        .h      LDR      r1,[r1,#0]
        0x08001a76:    b950        P.      CBNZ     r0,0x8001a8e ; advance_software_protect_objectwatch_list_find + 30
        0x08001a78:    2100        .!      MOVS     r1,#0
        0x08001a7a:    4608        .F      MOV      r0,r1
        0x08001a7c:    f000f84e    ..N.    BL       advance_software_protect_objectwatch_list_sigslot ; 0x8001b1c
        0x08001a80:    e007        ..      B        0x8001a92 ; advance_software_protect_objectwatch_list_find + 34
        0x08001a82:    680a        .h      LDR      r2,[r1,#0]
        0x08001a84:    4282        .B      CMP      r2,r0
        0x08001a86:    d101        ..      BNE      0x8001a8c ; advance_software_protect_objectwatch_list_find + 28
        0x08001a88:    2001        .       MOVS     r0,#1
        0x08001a8a:    bd10        ..      POP      {r4,pc}
        0x08001a8c:    6909        .i      LDR      r1,[r1,#0x10]
        0x08001a8e:    2900        .)      CMP      r1,#0
        0x08001a90:    d1f7        ..      BNE      0x8001a82 ; advance_software_protect_objectwatch_list_find + 18
        0x08001a92:    2000        .       MOVS     r0,#0
        0x08001a94:    bd10        ..      POP      {r4,pc}
    $d
        0x08001a96:    0000        ..      DCW    0
        0x08001a98:    20000058    X..     DCD    536871000
    $t
    i.advance_software_protect_objectwatch_list_remove
    advance_software_protect_objectwatch_list_remove
        0x08001a9c:    b570        p.      PUSH     {r4-r6,lr}
        0x08001a9e:    4910        .I      LDR      r1,[pc,#64] ; [0x8001ae0] = 0x20000058
        0x08001aa0:    4603        .F      MOV      r3,r0
        0x08001aa2:    680c        .h      LDR      r4,[r1,#0]
        0x08001aa4:    4622        "F      MOV      r2,r4
        0x08001aa6:    4620         F      MOV      r0,r4
        0x08001aa8:    e015        ..      B        0x8001ad6 ; advance_software_protect_objectwatch_list_remove + 58
        0x08001aaa:    6825        %h      LDR      r5,[r4,#0]
        0x08001aac:    429d        .B      CMP      r5,r3
        0x08001aae:    d110        ..      BNE      0x8001ad2 ; advance_software_protect_objectwatch_list_remove + 54
        0x08001ab0:    42a0        .B      CMP      r0,r4
        0x08001ab2:    d102        ..      BNE      0x8001aba ; advance_software_protect_objectwatch_list_remove + 30
        0x08001ab4:    6910        .i      LDR      r0,[r2,#0x10]
        0x08001ab6:    6008        .`      STR      r0,[r1,#0]
        0x08001ab8:    e001        ..      B        0x8001abe ; advance_software_protect_objectwatch_list_remove + 34
        0x08001aba:    6921        !i      LDR      r1,[r4,#0x10]
        0x08001abc:    6101        .a      STR      r1,[r0,#0x10]
        0x08001abe:    7920         y      LDRB     r0,[r4,#4]
        0x08001ac0:    b110        ..      CBZ      r0,0x8001ac8 ; advance_software_protect_objectwatch_list_remove + 44
        0x08001ac2:    6820         h      LDR      r0,[r4,#0]
        0x08001ac4:    f7fefbe9    ....    BL       free ; 0x800029a
        0x08001ac8:    4620         F      MOV      r0,r4
        0x08001aca:    f7fefbe6    ....    BL       free ; 0x800029a
        0x08001ace:    2001        .       MOVS     r0,#1
        0x08001ad0:    bd70        p.      POP      {r4-r6,pc}
        0x08001ad2:    4620         F      MOV      r0,r4
        0x08001ad4:    6924        $i      LDR      r4,[r4,#0x10]
        0x08001ad6:    2c00        .,      CMP      r4,#0
        0x08001ad8:    d1e7        ..      BNE      0x8001aaa ; advance_software_protect_objectwatch_list_remove + 14
        0x08001ada:    2000        .       MOVS     r0,#0
        0x08001adc:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x08001ade:    0000        ..      DCW    0
        0x08001ae0:    20000058    X..     DCD    536871000
    $t
    i.advance_software_protect_objectwatch_list_reset
    advance_software_protect_objectwatch_list_reset
        0x08001ae4:    b570        p.      PUSH     {r4-r6,lr}
        0x08001ae6:    4e09        .N      LDR      r6,[pc,#36] ; [0x8001b0c] = 0x20000058
        0x08001ae8:    6834        4h      LDR      r4,[r6,#0]
        0x08001aea:    e009        ..      B        0x8001b00 ; advance_software_protect_objectwatch_list_reset + 28
        0x08001aec:    7920         y      LDRB     r0,[r4,#4]
        0x08001aee:    6925        %i      LDR      r5,[r4,#0x10]
        0x08001af0:    b110        ..      CBZ      r0,0x8001af8 ; advance_software_protect_objectwatch_list_reset + 20
        0x08001af2:    6820         h      LDR      r0,[r4,#0]
        0x08001af4:    f7fefbd1    ....    BL       free ; 0x800029a
        0x08001af8:    4620         F      MOV      r0,r4
        0x08001afa:    f7fefbce    ....    BL       free ; 0x800029a
        0x08001afe:    462c        ,F      MOV      r4,r5
        0x08001b00:    2c00        .,      CMP      r4,#0
        0x08001b02:    d1f3        ..      BNE      0x8001aec ; advance_software_protect_objectwatch_list_reset + 8
        0x08001b04:    2000        .       MOVS     r0,#0
        0x08001b06:    6030        0`      STR      r0,[r6,#0]
        0x08001b08:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x08001b0a:    0000        ..      DCW    0
        0x08001b0c:    20000058    X..     DCD    536871000
    $t
    i.advance_software_protect_objectwatch_list_set_callback
    advance_software_protect_objectwatch_list_set_callback
        0x08001b10:    4901        .I      LDR      r1,[pc,#4] ; [0x8001b18] = 0x20000058
        0x08001b12:    6048        H`      STR      r0,[r1,#4]
        0x08001b14:    4770        pG      BX       lr
    $d
        0x08001b16:    0000        ..      DCW    0
        0x08001b18:    20000058    X..     DCD    536871000
    $t
    i.advance_software_protect_objectwatch_list_sigslot
    advance_software_protect_objectwatch_list_sigslot
        0x08001b1c:    4a02        .J      LDR      r2,[pc,#8] ; [0x8001b28] = 0x20000058
        0x08001b1e:    6852        Rh      LDR      r2,[r2,#4]
        0x08001b20:    2a00        .*      CMP      r2,#0
        0x08001b22:    d000        ..      BEQ      0x8001b26 ; advance_software_protect_objectwatch_list_sigslot + 10
        0x08001b24:    4710        .G      BX       r2
        0x08001b26:    4770        pG      BX       lr
    $d
        0x08001b28:    20000058    X..     DCD    536871000
    $t
    i.advance_software_protect_objectwatch_list_size
    advance_software_protect_objectwatch_list_size
        0x08001b2c:    4904        .I      LDR      r1,[pc,#16] ; [0x8001b40] = 0x20000058
        0x08001b2e:    2000        .       MOVS     r0,#0
        0x08001b30:    6809        .h      LDR      r1,[r1,#0]
        0x08001b32:    e001        ..      B        0x8001b38 ; advance_software_protect_objectwatch_list_size + 12
        0x08001b34:    6909        .i      LDR      r1,[r1,#0x10]
        0x08001b36:    1c40        @.      ADDS     r0,r0,#1
        0x08001b38:    2900        .)      CMP      r1,#0
        0x08001b3a:    d1fb        ..      BNE      0x8001b34 ; advance_software_protect_objectwatch_list_size + 8
        0x08001b3c:    4770        pG      BX       lr
    $d
        0x08001b3e:    0000        ..      DCW    0
        0x08001b40:    20000058    X..     DCD    536871000
    $t
    i.advance_software_protect_objectwatch_list_update
    advance_software_protect_objectwatch_list_update
        0x08001b44:    490b        .I      LDR      r1,[pc,#44] ; [0x8001b74] = 0x20000058
        0x08001b46:    b510        ..      PUSH     {r4,lr}
        0x08001b48:    680c        .h      LDR      r4,[r1,#0]
        0x08001b4a:    e00a        ..      B        0x8001b62 ; advance_software_protect_objectwatch_list_update + 30
        0x08001b4c:    6821        !h      LDR      r1,[r4,#0]
        0x08001b4e:    4281        .B      CMP      r1,r0
        0x08001b50:    d106        ..      BNE      0x8001b60 ; advance_software_protect_objectwatch_list_update + 28
        0x08001b52:    68e1        .h      LDR      r1,[r4,#0xc]
        0x08001b54:    6820         h      LDR      r0,[r4,#0]
        0x08001b56:    f7fefe25    ..%.    BL       $Ven$TT$L$$advance_software_protect_crc32 ; 0x80007a4
        0x08001b5a:    60a0        .`      STR      r0,[r4,#8]
        0x08001b5c:    2001        .       MOVS     r0,#1
        0x08001b5e:    bd10        ..      POP      {r4,pc}
        0x08001b60:    6924        $i      LDR      r4,[r4,#0x10]
        0x08001b62:    2c00        .,      CMP      r4,#0
        0x08001b64:    d1f2        ..      BNE      0x8001b4c ; advance_software_protect_objectwatch_list_update + 8
        0x08001b66:    2100        .!      MOVS     r1,#0
        0x08001b68:    4608        .F      MOV      r0,r1
        0x08001b6a:    f7ffffd7    ....    BL       advance_software_protect_objectwatch_list_sigslot ; 0x8001b1c
        0x08001b6e:    2000        .       MOVS     r0,#0
        0x08001b70:    bd10        ..      POP      {r4,pc}
    $d
        0x08001b72:    0000        ..      DCW    0
        0x08001b74:    20000058    X..     DCD    536871000
    $t
    i.advance_software_protect_objectwatch_list_update_all
    advance_software_protect_objectwatch_list_update_all
        0x08001b78:    4806        .H      LDR      r0,[pc,#24] ; [0x8001b94] = 0x20000058
        0x08001b7a:    b510        ..      PUSH     {r4,lr}
        0x08001b7c:    6804        .h      LDR      r4,[r0,#0]
        0x08001b7e:    e005        ..      B        0x8001b8c ; advance_software_protect_objectwatch_list_update_all + 20
        0x08001b80:    68e1        .h      LDR      r1,[r4,#0xc]
        0x08001b82:    6820         h      LDR      r0,[r4,#0]
        0x08001b84:    f7fefe0e    ....    BL       $Ven$TT$L$$advance_software_protect_crc32 ; 0x80007a4
        0x08001b88:    60a0        .`      STR      r0,[r4,#8]
        0x08001b8a:    6924        $i      LDR      r4,[r4,#0x10]
        0x08001b8c:    2c00        .,      CMP      r4,#0
        0x08001b8e:    d1f7        ..      BNE      0x8001b80 ; advance_software_protect_objectwatch_list_update_all + 8
        0x08001b90:    bd10        ..      POP      {r4,pc}
    $d
        0x08001b92:    0000        ..      DCW    0
        0x08001b94:    20000058    X..     DCD    536871000
    $t
    i.advance_software_protect_ramcode_loader
    advance_software_protect_ramcode_loader
        0x08001b98:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x08001b9c:    4e2d        -N      LDR      r6,[pc,#180] ; [0x8001c54] = 0x20000060
        0x08001b9e:    4605        .F      MOV      r5,r0
        0x08001ba0:    7830        0x      LDRB     r0,[r6,#0]
        0x08001ba2:    b108        ..      CBZ      r0,0x8001ba8 ; advance_software_protect_ramcode_loader + 16
        0x08001ba4:    2001        .       MOVS     r0,#1
        0x08001ba6:    e050        P.      B        0x8001c4a ; advance_software_protect_ramcode_loader + 178
        0x08001ba8:    482b        +H      LDR      r0,[pc,#172] ; [0x8001c58] = 0x8008100
        0x08001baa:    4c2c        ,L      LDR      r4,[pc,#176] ; [0x8001c5c] = 0x2000011c
        0x08001bac:    6801        .h      LDR      r1,[r0,#0]
        0x08001bae:    6842        Bh      LDR      r2,[r0,#4]
        0x08001bb0:    6021        !`      STR      r1,[r4,#0]
        0x08001bb2:    6062        b`      STR      r2,[r4,#4]
        0x08001bb4:    6881        .h      LDR      r1,[r0,#8]
        0x08001bb6:    60a1        .`      STR      r1,[r4,#8]
        0x08001bb8:    68c1        .h      LDR      r1,[r0,#0xc]
        0x08001bba:    60e1        .`      STR      r1,[r4,#0xc]
        0x08001bbc:    6901        .i      LDR      r1,[r0,#0x10]
        0x08001bbe:    6121        !a      STR      r1,[r4,#0x10]
        0x08001bc0:    6941        Ai      LDR      r1,[r0,#0x14]
        0x08001bc2:    6161        aa      STR      r1,[r4,#0x14]
        0x08001bc4:    6981        .i      LDR      r1,[r0,#0x18]
        0x08001bc6:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x08001bc8:    61a1        .a      STR      r1,[r4,#0x18]
        0x08001bca:    61e0        .a      STR      r0,[r4,#0x1c]
        0x08001bcc:    6822        "h      LDR      r2,[r4,#0]
        0x08001bce:    6863        ch      LDR      r3,[r4,#4]
        0x08001bd0:    4823        #H      LDR      r0,[pc,#140] ; [0x8001c60] = 0xf0586646
        0x08001bd2:    4924        $I      LDR      r1,[pc,#144] ; [0x8001c64] = 0xcc189032
        0x08001bd4:    4050        P@      EORS     r0,r0,r2
        0x08001bd6:    4059        Y@      EORS     r1,r1,r3
        0x08001bd8:    4b23        #K      LDR      r3,[pc,#140] ; [0x8001c68] = 0xf268c8eb
        0x08001bda:    4a24        $J      LDR      r2,[pc,#144] ; [0x8001c6c] = 0x9dfe4427
        0x08001bdc:    4058        X@      EORS     r0,r0,r3
        0x08001bde:    4051        Q@      EORS     r1,r1,r2
        0x08001be0:    4308        .C      ORRS     r0,r0,r1
        0x08001be2:    d10b        ..      BNE      0x8001bfc ; advance_software_protect_ramcode_loader + 100
        0x08001be4:    69a2        .i      LDR      r2,[r4,#0x18]
        0x08001be6:    69e3        .i      LDR      r3,[r4,#0x1c]
        0x08001be8:    4821        !H      LDR      r0,[pc,#132] ; [0x8001c70] = 0x2ff941c7
        0x08001bea:    4922        "I      LDR      r1,[pc,#136] ; [0x8001c74] = 0x56128fc1
        0x08001bec:    4050        P@      EORS     r0,r0,r2
        0x08001bee:    4059        Y@      EORS     r1,r1,r3
        0x08001bf0:    4b1d        .K      LDR      r3,[pc,#116] ; [0x8001c68] = 0xf268c8eb
        0x08001bf2:    4a1e        .J      LDR      r2,[pc,#120] ; [0x8001c6c] = 0x9dfe4427
        0x08001bf4:    4058        X@      EORS     r0,r0,r3
        0x08001bf6:    4051        Q@      EORS     r1,r1,r2
        0x08001bf8:    4308        .C      ORRS     r0,r0,r1
        0x08001bfa:    d019        ..      BEQ      0x8001c30 ; advance_software_protect_ramcode_loader + 152
        0x08001bfc:    4f1e        .O      LDR      r7,[pc,#120] ; [0x8001c78] = 0x9b62c2e6
        0x08001bfe:    f8df807c    ..|.    LDR      r8,[pc,#124] ; [0x8001c7c] = 0xfb90ffcb
        0x08001c02:    463a        :F      MOV      r2,r7
        0x08001c04:    4643        CF      MOV      r3,r8
        0x08001c06:    2120         !      MOVS     r1,#0x20
        0x08001c08:    4814        .H      LDR      r0,[pc,#80] ; [0x8001c5c] = 0x2000011c
        0x08001c0a:    f7fffdca    ....    BL       _advance_software_protect_ramcode_data_process ; 0x80017a2
        0x08001c0e:    6922        "i      LDR      r2,[r4,#0x10]
        0x08001c10:    68e1        .h      LDR      r1,[r4,#0xc]
        0x08001c12:    68a0        .h      LDR      r0,[r4,#8]
        0x08001c14:    f7fefbfe    ....    BL       __aeabi_memcpy ; 0x8000414
        0x08001c18:    6921        !i      LDR      r1,[r4,#0x10]
        0x08001c1a:    68a0        .h      LDR      r0,[r4,#8]
        0x08001c1c:    463a        :F      MOV      r2,r7
        0x08001c1e:    4643        CF      MOV      r3,r8
        0x08001c20:    f7fffdbf    ....    BL       _advance_software_protect_ramcode_data_process ; 0x80017a2
        0x08001c24:    68a7        .h      LDR      r7,[r4,#8]
        0x08001c26:    6922        "i      LDR      r2,[r4,#0x10]
        0x08001c28:    6963        ci      LDR      r3,[r4,#0x14]
        0x08001c2a:    2000        .       MOVS     r0,#0
        0x08001c2c:    4601        .F      MOV      r1,r0
        0x08001c2e:    e004        ..      B        0x8001c3a ; advance_software_protect_ramcode_loader + 162
        0x08001c30:    2000        .       MOVS     r0,#0
        0x08001c32:    e00a        ..      B        0x8001c4a ; advance_software_protect_ramcode_loader + 178
        0x08001c34:    5c3c        <\      LDRB     r4,[r7,r0]
        0x08001c36:    1c40        @.      ADDS     r0,r0,#1
        0x08001c38:    4421        !D      ADD      r1,r1,r4
        0x08001c3a:    4290        .B      CMP      r0,r2
        0x08001c3c:    d3fa        ..      BCC      0x8001c34 ; advance_software_protect_ramcode_loader + 156
        0x08001c3e:    4299        .B      CMP      r1,r3
        0x08001c40:    d102        ..      BNE      0x8001c48 ; advance_software_protect_ramcode_loader + 176
        0x08001c42:    2001        .       MOVS     r0,#1
        0x08001c44:    7030        0p      STRB     r0,[r6,#0]
        0x08001c46:    e7ad        ..      B        0x8001ba4 ; advance_software_protect_ramcode_loader + 12
        0x08001c48:    2002        .       MOVS     r0,#2
        0x08001c4a:    46ac        .F      MOV      r12,r5
        0x08001c4c:    e8bd41f0    ...A    POP      {r4-r8,lr}
        0x08001c50:    4760        `G      BX       r12
    $d
        0x08001c52:    0000        ..      DCW    0
        0x08001c54:    20000060    `..     DCD    536871008
        0x08001c58:    08008100    ....    DCD    134250752
        0x08001c5c:    2000011c    ...     DCD    536871196
        0x08001c60:    f0586646    FfX.    DCD    4032325190
        0x08001c64:    cc189032    2...    DCD    3424161842
        0x08001c68:    f268c8eb    ..h.    DCD    4066953451
        0x08001c6c:    9dfe4427    'D..    DCD    2650686503
        0x08001c70:    2ff941c7    .A./    DCD    804864455
        0x08001c74:    56128fc1    ...V    DCD    1444057025
        0x08001c78:    9b62c2e6    ..b.    DCD    2606940902
        0x08001c7c:    fb90ffcb    ....    DCD    4220583883
    $t
    i.advance_software_protect_ramcode_sample
    advance_software_protect_ramcode_sample
        0x08001c80:    2800        .(      CMP      r0,#0
        0x08001c82:    d005        ..      BEQ      0x8001c90 ; advance_software_protect_ramcode_sample + 16
        0x08001c84:    2801        .(      CMP      r0,#1
        0x08001c86:    d003        ..      BEQ      0x8001c90 ; advance_software_protect_ramcode_sample + 16
        0x08001c88:    2802        .(      CMP      r0,#2
        0x08001c8a:    d101        ..      BNE      0x8001c90 ; advance_software_protect_ramcode_sample + 16
        0x08001c8c:    f7febd94    ....    B        $Ven$TT$L$$advance_software_protect_system_reset ; 0x80007b8
        0x08001c90:    4770        pG      BX       lr
        0x08001c92:    0000        ..      MOVS     r0,r0
    i.advance_software_protect_rights
    advance_software_protect_rights
        0x08001c94:    4803        .H      LDR      r0,[pc,#12] ; [0x8001ca4] = 0x20000061
        0x08001c96:    7801        .x      LDRB     r1,[r0,#0]
        0x08001c98:    2900        .)      CMP      r1,#0
        0x08001c9a:    d101        ..      BNE      0x8001ca0 ; advance_software_protect_rights + 12
        0x08001c9c:    2101        .!      MOVS     r1,#1
        0x08001c9e:    7001        .p      STRB     r1,[r0,#0]
        0x08001ca0:    4770        pG      BX       lr
    $d
        0x08001ca2:    0000        ..      DCW    0
        0x08001ca4:    20000061    a..     DCD    536871009
    $t
    i.advance_software_protect_samples
    advance_software_protect_samples
        0x08001ca8:    b510        ..      PUSH     {r4,lr}
        0x08001caa:    f7fffff3    ....    BL       advance_software_protect_rights ; 0x8001c94
        0x08001cae:    4808        .H      LDR      r0,[pc,#32] ; [0x8001cd0] = 0x8001c81
        0x08001cb0:    f7ffff72    ..r.    BL       advance_software_protect_ramcode_loader ; 0x8001b98
        0x08001cb4:    f000f810    ....    BL       advance_software_protect_single_object_watcher ; 0x8001cd8
        0x08001cb8:    f7fffdae    ....    BL       advance_software_protect_dynamic_muti_object_watcher ; 0x8001818
        0x08001cbc:    f7fefd81    ....    BL       $Ven$TT$L$$advance_software_protect_verify_authorization ; 0x80007c2
        0x08001cc0:    f7fefd84    ....    BL       $Ven$TT$L$$advance_software_protect_flash_verify ; 0x80007cc
        0x08001cc4:    e8bd4010    ...@    POP      {r4,lr}
        0x08001cc8:    4802        .H      LDR      r0,[pc,#8] ; [0x8001cd4] = 0x800103b
        0x08001cca:    f7febd84    ....    B        $Ven$TT$L$$advance_software_protect_anti_debugger ; 0x80007d6
    $d
        0x08001cce:    0000        ..      DCW    0
        0x08001cd0:    08001c81    ....    DCD    134225025
        0x08001cd4:    0800103b    ;...    DCD    134221883
    $t
    i.advance_software_protect_single_object_watcher
    advance_software_protect_single_object_watcher
        0x08001cd8:    b510        ..      PUSH     {r4,lr}
        0x08001cda:    2110        .!      MOVS     r1,#0x10
        0x08001cdc:    480c        .H      LDR      r0,[pc,#48] ; [0x8001d10] = 0x2000013c
        0x08001cde:    f7fffd43    ..C.    BL       __advance_software_protect_objectwatch_check ; 0x8001768
        0x08001ce2:    480b        .H      LDR      r0,[pc,#44] ; [0x8001d10] = 0x2000013c
        0x08001ce4:    2101        .!      MOVS     r1,#1
        0x08001ce6:    6001        .`      STR      r1,[r0,#0]
        0x08001ce8:    2102        .!      MOVS     r1,#2
        0x08001cea:    6041        A`      STR      r1,[r0,#4]
        0x08001cec:    2103        .!      MOVS     r1,#3
        0x08001cee:    6081        .`      STR      r1,[r0,#8]
        0x08001cf0:    4908        .I      LDR      r1,[pc,#32] ; [0x8001d14] = 0x12345678
        0x08001cf2:    60c1        .`      STR      r1,[r0,#0xc]
        0x08001cf4:    2110        .!      MOVS     r1,#0x10
        0x08001cf6:    f7fffd37    ..7.    BL       __advance_software_protect_objectwatch_check ; 0x8001768
        0x08001cfa:    2110        .!      MOVS     r1,#0x10
        0x08001cfc:    4804        .H      LDR      r0,[pc,#16] ; [0x8001d10] = 0x2000013c
        0x08001cfe:    f7fffd44    ..D.    BL       __advance_software_protect_objectwatch_update ; 0x800178a
        0x08001d02:    e8bd4010    ...@    POP      {r4,lr}
        0x08001d06:    2110        .!      MOVS     r1,#0x10
        0x08001d08:    4801        .H      LDR      r0,[pc,#4] ; [0x8001d10] = 0x2000013c
        0x08001d0a:    f7ffbd2d    ..-.    B.W      __advance_software_protect_objectwatch_check ; 0x8001768
    $d
        0x08001d0e:    0000        ..      DCW    0
        0x08001d10:    2000013c    <..     DCD    536871228
        0x08001d14:    12345678    xV4.    DCD    305419896
    $t
    i.carry64
    carry64
        0x08001d18:    b510        ..      PUSH     {r4,lr}
        0x08001d1a:    2200        ."      MOVS     r2,#0
        0x08001d1c:    6803        .h      LDR      r3,[r0,#0]
        0x08001d1e:    680c        .h      LDR      r4,[r1,#0]
        0x08001d20:    4423        #D      ADD      r3,r3,r4
        0x08001d22:    6003        .`      STR      r3,[r0,#0]
        0x08001d24:    680c        .h      LDR      r4,[r1,#0]
        0x08001d26:    42a3        .B      CMP      r3,r4
        0x08001d28:    d201        ..      BCS      0x8001d2e ; carry64 + 22
        0x08001d2a:    2301        .#      MOVS     r3,#1
        0x08001d2c:    e000        ..      B        0x8001d30 ; carry64 + 24
        0x08001d2e:    2300        .#      MOVS     r3,#0
        0x08001d30:    1c52        R.      ADDS     r2,r2,#1
        0x08001d32:    b2d2        ..      UXTB     r2,r2
        0x08001d34:    1d00        ..      ADDS     r0,r0,#4
        0x08001d36:    600b        .`      STR      r3,[r1,#0]
        0x08001d38:    2a02        .*      CMP      r2,#2
        0x08001d3a:    d3ef        ..      BCC      0x8001d1c ; carry64 + 4
        0x08001d3c:    bd10        ..      POP      {r4,pc}
        0x08001d3e:    0000        ..      MOVS     r0,r0
    i.crc32
    crc32
        0x08001d40:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x08001d44:    460f        .F      MOV      r7,r1
        0x08001d46:    4606        .F      MOV      r6,r0
        0x08001d48:    f04f34ff    O..4    MOV      r4,#0xffffffff
        0x08001d4c:    2500        .%      MOVS     r5,#0
        0x08001d4e:    f8df803c    ..<.    LDR      r8,[pc,#60] ; [0x8001d8c] = 0x4c11db7
        0x08001d52:    e012        ..      B        0x8001d7a ; crc32 + 58
        0x08001d54:    5d70        p]      LDRB     r0,[r6,r5]
        0x08001d56:    2108        .!      MOVS     r1,#8
        0x08001d58:    f005fb77    ..w.    BL       reflect ; 0x800744a
        0x08001d5c:    ea846400    ...d    EOR      r4,r4,r0,LSL #24
        0x08001d60:    2008        .       MOVS     r0,#8
        0x08001d62:    4641        AF      MOV      r1,r8
        0x08001d64:    2c00        .,      CMP      r4,#0
        0x08001d66:    da02        ..      BGE      0x8001d6e ; crc32 + 46
        0x08001d68:    ea810444    ..D.    EOR      r4,r1,r4,LSL #1
        0x08001d6c:    e000        ..      B        0x8001d70 ; crc32 + 48
        0x08001d6e:    0064        d.      LSLS     r4,r4,#1
        0x08001d70:    1e40        @.      SUBS     r0,r0,#1
        0x08001d72:    f01000ff    ....    ANDS     r0,r0,#0xff
        0x08001d76:    d1f5        ..      BNE      0x8001d64 ; crc32 + 36
        0x08001d78:    1c6d        m.      ADDS     r5,r5,#1
        0x08001d7a:    42bd        .B      CMP      r5,r7
        0x08001d7c:    dbea        ..      BLT      0x8001d54 ; crc32 + 20
        0x08001d7e:    2120         !      MOVS     r1,#0x20
        0x08001d80:    4620         F      MOV      r0,r4
        0x08001d82:    f005fb62    ..b.    BL       reflect ; 0x800744a
        0x08001d86:    43c0        .C      MVNS     r0,r0
        0x08001d88:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x08001d8c:    04c11db7    ....    DCD    79764919
    $t
    i.crc32_continue
    crc32_continue
        0x08001d90:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x08001d94:    460e        .F      MOV      r6,r1
        0x08001d96:    4617        .F      MOV      r7,r2
        0x08001d98:    2120         !      MOVS     r1,#0x20
        0x08001d9a:    43c0        .C      MVNS     r0,r0
        0x08001d9c:    f005fb55    ..U.    BL       reflect ; 0x800744a
        0x08001da0:    4604        .F      MOV      r4,r0
        0x08001da2:    2500        .%      MOVS     r5,#0
        0x08001da4:    f8df803c    ..<.    LDR      r8,[pc,#60] ; [0x8001de4] = 0x4c11db7
        0x08001da8:    e012        ..      B        0x8001dd0 ; crc32_continue + 64
        0x08001daa:    5d70        p]      LDRB     r0,[r6,r5]
        0x08001dac:    2108        .!      MOVS     r1,#8
        0x08001dae:    f005fb4c    ..L.    BL       reflect ; 0x800744a
        0x08001db2:    ea846400    ...d    EOR      r4,r4,r0,LSL #24
        0x08001db6:    2008        .       MOVS     r0,#8
        0x08001db8:    4641        AF      MOV      r1,r8
        0x08001dba:    2c00        .,      CMP      r4,#0
        0x08001dbc:    da02        ..      BGE      0x8001dc4 ; crc32_continue + 52
        0x08001dbe:    ea810444    ..D.    EOR      r4,r1,r4,LSL #1
        0x08001dc2:    e000        ..      B        0x8001dc6 ; crc32_continue + 54
        0x08001dc4:    0064        d.      LSLS     r4,r4,#1
        0x08001dc6:    1e40        @.      SUBS     r0,r0,#1
        0x08001dc8:    f01000ff    ....    ANDS     r0,r0,#0xff
        0x08001dcc:    d1f5        ..      BNE      0x8001dba ; crc32_continue + 42
        0x08001dce:    1c6d        m.      ADDS     r5,r5,#1
        0x08001dd0:    42bd        .B      CMP      r5,r7
        0x08001dd2:    dbea        ..      BLT      0x8001daa ; crc32_continue + 26
        0x08001dd4:    2120         !      MOVS     r1,#0x20
        0x08001dd6:    4620         F      MOV      r0,r4
        0x08001dd8:    f005fb37    ..7.    BL       reflect ; 0x800744a
        0x08001ddc:    43c0        .C      MVNS     r0,r0
        0x08001dde:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x08001de2:    0000        ..      DCW    0
        0x08001de4:    04c11db7    ....    DCD    79764919
    $t
    i.derive_mpi
    derive_mpi
        0x08001de8:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x08001dec:    4605        .F      MOV      r5,r0
        0x08001dee:    6dc0        .m      LDR      r0,[r0,#0x5c]
        0x08001df0:    4617        .F      MOV      r7,r2
        0x08001df2:    1dc0        ..      ADDS     r0,r0,#7
        0x08001df4:    08c4        ..      LSRS     r4,r0,#3
        0x08001df6:    460e        .F      MOV      r6,r1
        0x08001df8:    42a3        .B      CMP      r3,r4
        0x08001dfa:    d800        ..      BHI      0x8001dfe ; derive_mpi + 22
        0x08001dfc:    461c        .F      MOV      r4,r3
        0x08001dfe:    4622        "F      MOV      r2,r4
        0x08001e00:    4639        9F      MOV      r1,r7
        0x08001e02:    4630        0F      MOV      r0,r6
        0x08001e04:    f004fcc5    ....    BL       mbedtls_mpi_read_binary ; 0x8006792
        0x08001e08:    0007        ..      MOVS     r7,r0
        0x08001e0a:    d118        ..      BNE      0x8001e3e ; derive_mpi + 86
        0x08001e0c:    6de8        .m      LDR      r0,[r5,#0x5c]
        0x08001e0e:    ebb00fc4    ....    CMP      r0,r4,LSL #3
        0x08001e12:    d206        ..      BCS      0x8001e22 ; derive_mpi + 58
        0x08001e14:    ebc001c4    ....    RSB      r1,r0,r4,LSL #3
        0x08001e18:    4630        0F      MOV      r0,r6
        0x08001e1a:    f004fea3    ....    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x08001e1e:    0007        ..      MOVS     r7,r0
        0x08001e20:    d10d        ..      BNE      0x8001e3e ; derive_mpi + 86
        0x08001e22:    f105014c    ..L.    ADD      r1,r5,#0x4c
        0x08001e26:    460c        .F      MOV      r4,r1
        0x08001e28:    4630        0F      MOV      r0,r6
        0x08001e2a:    f003ffa5    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08001e2e:    2800        .(      CMP      r0,#0
        0x08001e30:    db05        ..      BLT      0x8001e3e ; derive_mpi + 86
        0x08001e32:    4631        1F      MOV      r1,r6
        0x08001e34:    4622        "F      MOV      r2,r4
        0x08001e36:    4608        .F      MOV      r0,r1
        0x08001e38:    f004ff60    ..`.    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x08001e3c:    4607        .F      MOV      r7,r0
        0x08001e3e:    4638        8F      MOV      r0,r7
        0x08001e40:    e8bd81f0    ....    POP      {r4-r8,pc}
    i.ecdsa_verify_restartable
    ecdsa_verify_restartable
        0x08001e44:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x08001e48:    b09d        ..      SUB      sp,sp,#0x74
        0x08001e4a:    4605        .F      MOV      r5,r0
        0x08001e4c:    4699        .F      MOV      r9,r3
        0x08001e4e:    4614        .F      MOV      r4,r2
        0x08001e50:    468a        .F      MOV      r10,r1
        0x08001e52:    f10d0858    ..X.    ADD      r8,sp,#0x58
        0x08001e56:    af19        ..      ADD      r7,sp,#0x64
        0x08001e58:    a803        ..      ADD      r0,sp,#0xc
        0x08001e5a:    f8ddb09c    ....    LDR      r11,[sp,#0x9c]
        0x08001e5e:    f003f99b    ....    BL       mbedtls_ecp_point_init ; 0x8005198
        0x08001e62:    a813        ..      ADD      r0,sp,#0x4c
        0x08001e64:    f004fa88    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08001e68:    a810        ..      ADD      r0,sp,#0x40
        0x08001e6a:    f004fa85    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08001e6e:    a816        ..      ADD      r0,sp,#0x58
        0x08001e70:    f004fa82    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08001e74:    a819        ..      ADD      r0,sp,#0x64
        0x08001e76:    f004fa7f    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08001e7a:    6d68        hm      LDR      r0,[r5,#0x54]
        0x08001e7c:    b318        ..      CBZ      r0,0x8001ec6 ; ecdsa_verify_restartable + 130
        0x08001e7e:    2101        .!      MOVS     r1,#1
        0x08001e80:    9826        &.      LDR      r0,[sp,#0x98]
        0x08001e82:    f003ff61    ..a.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08001e86:    4e3b        ;N      LDR      r6,[pc,#236] ; [0x8001f74] = 0xffffb200
        0x08001e88:    2800        .(      CMP      r0,#0
        0x08001e8a:    db60        `.      BLT      0x8001f4e ; ecdsa_verify_restartable + 266
        0x08001e8c:    f105014c    ..L.    ADD      r1,r5,#0x4c
        0x08001e90:    910c        ..      STR      r1,[sp,#0x30]
        0x08001e92:    9826        &.      LDR      r0,[sp,#0x98]
        0x08001e94:    f003ff70    ..p.    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08001e98:    2800        .(      CMP      r0,#0
        0x08001e9a:    da58        X.      BGE      0x8001f4e ; ecdsa_verify_restartable + 266
        0x08001e9c:    2101        .!      MOVS     r1,#1
        0x08001e9e:    4658        XF      MOV      r0,r11
        0x08001ea0:    f003ff52    ..R.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08001ea4:    2800        .(      CMP      r0,#0
        0x08001ea6:    db52        R.      BLT      0x8001f4e ; ecdsa_verify_restartable + 266
        0x08001ea8:    4658        XF      MOV      r0,r11
        0x08001eaa:    990c        ..      LDR      r1,[sp,#0x30]
        0x08001eac:    f003ff64    ..d.    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08001eb0:    2800        .(      CMP      r0,#0
        0x08001eb2:    da4c        L.      BGE      0x8001f4e ; ecdsa_verify_restartable + 266
        0x08001eb4:    4623        #F      MOV      r3,r4
        0x08001eb6:    4652        RF      MOV      r2,r10
        0x08001eb8:    a913        ..      ADD      r1,sp,#0x4c
        0x08001eba:    4628        (F      MOV      r0,r5
        0x08001ebc:    f7ffff94    ....    BL       derive_mpi ; 0x8001de8
        0x08001ec0:    0004        ..      MOVS     r4,r0
        0x08001ec2:    d145        E.      BNE      0x8001f50 ; ecdsa_verify_restartable + 268
        0x08001ec4:    e003        ..      B        0x8001ece ; ecdsa_verify_restartable + 138
        0x08001ec6:    482c        ,H      LDR      r0,[pc,#176] ; [0x8001f78] = 0xffffb080
        0x08001ec8:    b01d        ..      ADD      sp,sp,#0x74
        0x08001eca:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x08001ece:    4659        YF      MOV      r1,r11
        0x08001ed0:    a810        ..      ADD      r0,sp,#0x40
        0x08001ed2:    9a0c        ..      LDR      r2,[sp,#0x30]
        0x08001ed4:    f004fa56    ..V.    BL       mbedtls_mpi_inv_mod ; 0x8006384
        0x08001ed8:    0004        ..      MOVS     r4,r0
        0x08001eda:    d139        9.      BNE      0x8001f50 ; ecdsa_verify_restartable + 268
        0x08001edc:    aa10        ..      ADD      r2,sp,#0x40
        0x08001ede:    a913        ..      ADD      r1,sp,#0x4c
        0x08001ee0:    4640        @F      MOV      r0,r8
        0x08001ee2:    f004fbf5    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08001ee6:    0004        ..      MOVS     r4,r0
        0x08001ee8:    d132        2.      BNE      0x8001f50 ; ecdsa_verify_restartable + 268
        0x08001eea:    4641        AF      MOV      r1,r8
        0x08001eec:    4608        .F      MOV      r0,r1
        0x08001eee:    9a0c        ..      LDR      r2,[sp,#0x30]
        0x08001ef0:    f004fbb1    ....    BL       mbedtls_mpi_mod_mpi ; 0x8006656
        0x08001ef4:    0004        ..      MOVS     r4,r0
        0x08001ef6:    d12b        +.      BNE      0x8001f50 ; ecdsa_verify_restartable + 268
        0x08001ef8:    aa10        ..      ADD      r2,sp,#0x40
        0x08001efa:    4638        8F      MOV      r0,r7
        0x08001efc:    9926        &.      LDR      r1,[sp,#0x98]
        0x08001efe:    f004fbe7    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08001f02:    0004        ..      MOVS     r4,r0
        0x08001f04:    d124        $.      BNE      0x8001f50 ; ecdsa_verify_restartable + 268
        0x08001f06:    4639        9F      MOV      r1,r7
        0x08001f08:    4608        .F      MOV      r0,r1
        0x08001f0a:    9a0c        ..      LDR      r2,[sp,#0x30]
        0x08001f0c:    f004fba3    ....    BL       mbedtls_mpi_mod_mpi ; 0x8006656
        0x08001f10:    0004        ..      MOVS     r4,r0
        0x08001f12:    d11d        ..      BNE      0x8001f50 ; ecdsa_verify_restartable + 268
        0x08001f14:    2100        .!      MOVS     r1,#0
        0x08001f16:    9700        ..      STR      r7,[sp,#0]
        0x08001f18:    e9cd9101    ....    STRD     r9,r1,[sp,#4]
        0x08001f1c:    f1050328    ..(.    ADD      r3,r5,#0x28
        0x08001f20:    4642        BF      MOV      r2,r8
        0x08001f22:    a903        ..      ADD      r1,sp,#0xc
        0x08001f24:    4628        (F      MOV      r0,r5
        0x08001f26:    f003f8e9    ....    BL       mbedtls_ecp_muladd_restartable ; 0x80050fc
        0x08001f2a:    0004        ..      MOVS     r4,r0
        0x08001f2c:    d110        ..      BNE      0x8001f50 ; ecdsa_verify_restartable + 268
        0x08001f2e:    a803        ..      ADD      r0,sp,#0xc
        0x08001f30:    f003f84a    ..J.    BL       mbedtls_ecp_is_zero ; 0x8004fc8
        0x08001f34:    b958        X.      CBNZ     r0,0x8001f4e ; ecdsa_verify_restartable + 266
        0x08001f36:    a903        ..      ADD      r1,sp,#0xc
        0x08001f38:    4608        .F      MOV      r0,r1
        0x08001f3a:    9a0c        ..      LDR      r2,[sp,#0x30]
        0x08001f3c:    f004fb8b    ....    BL       mbedtls_mpi_mod_mpi ; 0x8006656
        0x08001f40:    0004        ..      MOVS     r4,r0
        0x08001f42:    d105        ..      BNE      0x8001f50 ; ecdsa_verify_restartable + 268
        0x08001f44:    a803        ..      ADD      r0,sp,#0xc
        0x08001f46:    9926        &.      LDR      r1,[sp,#0x98]
        0x08001f48:    f003ff16    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08001f4c:    b100        ..      CBZ      r0,0x8001f50 ; ecdsa_verify_restartable + 268
        0x08001f4e:    4634        4F      MOV      r4,r6
        0x08001f50:    a803        ..      ADD      r0,sp,#0xc
        0x08001f52:    f003f911    ....    BL       mbedtls_ecp_point_free ; 0x8005178
        0x08001f56:    a813        ..      ADD      r0,sp,#0x4c
        0x08001f58:    f004f945    ..E.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08001f5c:    a810        ..      ADD      r0,sp,#0x40
        0x08001f5e:    f004f942    ..B.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08001f62:    a816        ..      ADD      r0,sp,#0x58
        0x08001f64:    f004f93f    ..?.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08001f68:    a819        ..      ADD      r0,sp,#0x64
        0x08001f6a:    f004f93c    ..<.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08001f6e:    4620         F      MOV      r0,r4
        0x08001f70:    e7aa        ..      B        0x8001ec8 ; ecdsa_verify_restartable + 132
    $d
        0x08001f72:    0000        ..      DCW    0
        0x08001f74:    ffffb200    ....    DCD    4294947328
        0x08001f78:    ffffb080    ....    DCD    4294946944
    $t
    i.ecp_comb_recode_core
    ecp_comb_recode_core
        0x08001f7c:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x08001f80:    460d        .F      MOV      r5,r1
        0x08001f82:    4699        .F      MOV      r9,r3
        0x08001f84:    4690        .F      MOV      r8,r2
        0x08001f86:    4604        .F      MOV      r4,r0
        0x08001f88:    1c49        I.      ADDS     r1,r1,#1
        0x08001f8a:    f7fefac5    ....    BL       __aeabi_memclr ; 0x8000518
        0x08001f8e:    2600        .&      MOVS     r6,#0
        0x08001f90:    e00f        ..      B        0x8001fb2 ; ecp_comb_recode_core + 54
        0x08001f92:    2700        .'      MOVS     r7,#0
        0x08001f94:    e00a        ..      B        0x8001fac ; ecp_comb_recode_core + 48
        0x08001f96:    bf00        ..      NOP      
        0x08001f98:    fb056107    ...a    MLA      r1,r5,r7,r6
        0x08001f9c:    4648        HF      MOV      r0,r9
        0x08001f9e:    f004f9b3    ....    BL       mbedtls_mpi_get_bit ; 0x8006308
        0x08001fa2:    5da1        .]      LDRB     r1,[r4,r6]
        0x08001fa4:    40b8        .@      LSLS     r0,r0,r7
        0x08001fa6:    4308        .C      ORRS     r0,r0,r1
        0x08001fa8:    55a0        .U      STRB     r0,[r4,r6]
        0x08001faa:    1c7f        ..      ADDS     r7,r7,#1
        0x08001fac:    4547        GE      CMP      r7,r8
        0x08001fae:    d3f3        ..      BCC      0x8001f98 ; ecp_comb_recode_core + 28
        0x08001fb0:    1c76        v.      ADDS     r6,r6,#1
        0x08001fb2:    42ae        .B      CMP      r6,r5
        0x08001fb4:    d3ed        ..      BCC      0x8001f92 ; ecp_comb_recode_core + 22
        0x08001fb6:    2200        ."      MOVS     r2,#0
        0x08001fb8:    2101        .!      MOVS     r1,#1
        0x08001fba:    e018        ..      B        0x8001fee ; ecp_comb_recode_core + 114
        0x08001fbc:    5c60        `\      LDRB     r0,[r4,r1]
        0x08001fbe:    eb040801    ....    ADD      r8,r4,r1
        0x08001fc2:    4603        .F      MOV      r3,r0
        0x08001fc4:    4010        .@      ANDS     r0,r0,r2
        0x08001fc6:    4053        S@      EORS     r3,r3,r2
        0x08001fc8:    f8186c01    ...l    LDRB     r6,[r8,#-1]
        0x08001fcc:    f0030201    ....    AND      r2,r3,#1
        0x08001fd0:    f1c20c01    ....    RSB      r12,r2,#1
        0x08001fd4:    4637        7F      MOV      r7,r6
        0x08001fd6:    fb06f60c    ....    MUL      r6,r6,r12
        0x08001fda:    ea030206    ....    AND      r2,r3,r6
        0x08001fde:    4302        .C      ORRS     r2,r2,r0
        0x08001fe0:    4073        s@      EORS     r3,r3,r6
        0x08001fe2:    5463        cT      STRB     r3,[r4,r1]
        0x08001fe4:    ea4710cc    G...    ORR      r0,r7,r12,LSL #7
        0x08001fe8:    f8080c01    ....    STRB     r0,[r8,#-1]
        0x08001fec:    1c49        I.      ADDS     r1,r1,#1
        0x08001fee:    42a9        .B      CMP      r1,r5
        0x08001ff0:    d9e4        ..      BLS      0x8001fbc ; ecp_comb_recode_core + 64
        0x08001ff2:    e8bd87f0    ....    POP      {r4-r10,pc}
    i.mbedtls_ecdsa_init
    mbedtls_ecdsa_init
        0x08001ff6:    f003b801    ....    B.W      mbedtls_ecp_keypair_init ; 0x8004ffc
    i.mbedtls_mpi_zeroize
    mbedtls_mpi_zeroize
        0x08001ffa:    0089        ..      LSLS     r1,r1,#2
        0x08001ffc:    f004bea6    ....    B.W      mbedtls_platform_zeroize ; 0x8006d4c
    $d.realdata
    .ARM.__AT_0x08002000
    m_signature_data
        0x08002000:    00000000    ....    DCD    0
        0x08002004:    00000000    ....    DCD    0
        0x08002008:    00000000    ....    DCD    0
        0x0800200c:    00000000    ....    DCD    0
        0x08002010:    00000000    ....    DCD    0
        0x08002014:    00000000    ....    DCD    0
        0x08002018:    00000000    ....    DCD    0
        0x0800201c:    00000000    ....    DCD    0
        0x08002020:    00000000    ....    DCD    0
        0x08002024:    00000000    ....    DCD    0
        0x08002028:    00000000    ....    DCD    0
        0x0800202c:    00000000    ....    DCD    0
        0x08002030:    00000000    ....    DCD    0
        0x08002034:    00000000    ....    DCD    0
        0x08002038:    00000000    ....    DCD    0
        0x0800203c:    00000000    ....    DCD    0
        0x08002040:    00000000    ....    DCD    0
        0x08002044:    00000000    ....    DCD    0
        0x08002048:    00000000    ....    DCD    0
        0x0800204c:    00000000    ....    DCD    0
        0x08002050:    00000000    ....    DCD    0
        0x08002054:    00000000    ....    DCD    0
        0x08002058:    00000000    ....    DCD    0
        0x0800205c:    00000000    ....    DCD    0
        0x08002060:    00000000    ....    DCD    0
        0x08002064:    00000000    ....    DCD    0
        0x08002068:    00000000    ....    DCD    0
        0x0800206c:    00000000    ....    DCD    0
        0x08002070:    00000000    ....    DCD    0
        0x08002074:    00000000    ....    DCD    0
        0x08002078:    00000000    ....    DCD    0
        0x0800207c:    00000000    ....    DCD    0
        0x08002080:    00000000    ....    DCD    0
        0x08002084:    00000000    ....    DCD    0
        0x08002088:    00000000    ....    DCD    0
        0x0800208c:    00000000    ....    DCD    0
    $t
    i.ecp_mod_p192k1
    ecp_mod_p192k1
        0x08002090:    b51c        ..      PUSH     {r2-r4,lr}
        0x08002092:    2100        .!      MOVS     r1,#0
        0x08002094:    9100        ..      STR      r1,[sp,#0]
        0x08002096:    460b        .F      MOV      r3,r1
        0x08002098:    9101        ..      STR      r1,[sp,#4]
        0x0800209a:    2206        ."      MOVS     r2,#6
        0x0800209c:    4901        .I      LDR      r1,[pc,#4] ; [0x80020a4] = 0x20000024
        0x0800209e:    f000fe43    ..C.    BL       ecp_mod_koblitz ; 0x8002d28
        0x080020a2:    bd1c        ..      POP      {r2-r4,pc}
    $d
        0x080020a4:    20000024    $..     DCD    536870948
    $t
    i.ecp_mod_p224k1
    ecp_mod_p224k1
        0x080020a8:    b51c        ..      PUSH     {r2-r4,lr}
        0x080020aa:    2100        .!      MOVS     r1,#0
        0x080020ac:    9100        ..      STR      r1,[sp,#0]
        0x080020ae:    460b        .F      MOV      r3,r1
        0x080020b0:    9101        ..      STR      r1,[sp,#4]
        0x080020b2:    2207        ."      MOVS     r2,#7
        0x080020b4:    4901        .I      LDR      r1,[pc,#4] ; [0x80020bc] = 0x2000002c
        0x080020b6:    f000fe37    ..7.    BL       ecp_mod_koblitz ; 0x8002d28
        0x080020ba:    bd1c        ..      POP      {r2-r4,pc}
    $d
        0x080020bc:    2000002c    ,..     DCD    536870956
    $t
    i.ecp_mpi_load
    ecp_mpi_load
        0x080020c0:    2301        .#      MOVS     r3,#1
        0x080020c2:    0892        ..      LSRS     r2,r2,#2
        0x080020c4:    6003        .`      STR      r3,[r0,#0]
        0x080020c6:    e9c02101    ...!    STRD     r2,r1,[r0,#4]
        0x080020ca:    4770        pG      BX       lr
    i.ecp_add_mixed
    ecp_add_mixed
        0x080020cc:    e92d43f0    -..C    PUSH     {r4-r9,lr}
        0x080020d0:    4605        .F      MOV      r5,r0
        0x080020d2:    4688        .F      MOV      r8,r1
        0x080020d4:    f1020018    ....    ADD      r0,r2,#0x18
        0x080020d8:    b095        ..      SUB      sp,sp,#0x54
        0x080020da:    461e        .F      MOV      r6,r3
        0x080020dc:    4617        .F      MOV      r7,r2
        0x080020de:    2100        .!      MOVS     r1,#0
        0x080020e0:    4681        .F      MOV      r9,r0
        0x080020e2:    f003fe31    ..1.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080020e6:    b198        ..      CBZ      r0,0x8002110 ; ecp_add_mixed + 68
        0x080020e8:    6a30        0j      LDR      r0,[r6,#0x20]
        0x080020ea:    b1c0        ..      CBZ      r0,0x800211e ; ecp_add_mixed + 82
        0x080020ec:    f1060018    ....    ADD      r0,r6,#0x18
        0x080020f0:    2100        .!      MOVS     r1,#0
        0x080020f2:    4604        .F      MOV      r4,r0
        0x080020f4:    f003fe28    ..(.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080020f8:    b160        `.      CBZ      r0,0x8002114 ; ecp_add_mixed + 72
        0x080020fa:    6a30        0j      LDR      r0,[r6,#0x20]
        0x080020fc:    b178        x.      CBZ      r0,0x800211e ; ecp_add_mixed + 82
        0x080020fe:    2101        .!      MOVS     r1,#1
        0x08002100:    4620         F      MOV      r0,r4
        0x08002102:    f003fe21    ..!.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08002106:    b150        P.      CBZ      r0,0x800211e ; ecp_add_mixed + 82
        0x08002108:    48c5        .H      LDR      r0,[pc,#788] ; [0x8002420] = 0xffffb080
        0x0800210a:    b015        ..      ADD      sp,sp,#0x54
        0x0800210c:    e8bd83f0    ....    POP      {r4-r9,pc}
        0x08002110:    4631        1F      MOV      r1,r6
        0x08002112:    e000        ..      B        0x8002116 ; ecp_add_mixed + 74
        0x08002114:    4639        9F      MOV      r1,r7
        0x08002116:    4640        @F      MOV      r0,r8
        0x08002118:    f002fd96    ....    BL       mbedtls_ecp_copy ; 0x8004c48
        0x0800211c:    e7f5        ..      B        0x800210a ; ecp_add_mixed + 62
        0x0800211e:    4668        hF      MOV      r0,sp
        0x08002120:    f004f92a    ..*.    BL       mbedtls_mpi_init ; 0x8006378
        0x08002124:    a809        ..      ADD      r0,sp,#0x24
        0x08002126:    f004f927    ..'.    BL       mbedtls_mpi_init ; 0x8006378
        0x0800212a:    a803        ..      ADD      r0,sp,#0xc
        0x0800212c:    f004f924    ..$.    BL       mbedtls_mpi_init ; 0x8006378
        0x08002130:    a80f        ..      ADD      r0,sp,#0x3c
        0x08002132:    f004f921    ..!.    BL       mbedtls_mpi_init ; 0x8006378
        0x08002136:    a806        ..      ADD      r0,sp,#0x18
        0x08002138:    f004f91e    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x0800213c:    a80c        ..      ADD      r0,sp,#0x30
        0x0800213e:    f004f91b    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08002142:    a812        ..      ADD      r0,sp,#0x48
        0x08002144:    f004f918    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08002148:    464a        JF      MOV      r2,r9
        0x0800214a:    4611        .F      MOV      r1,r2
        0x0800214c:    4668        hF      MOV      r0,sp
        0x0800214e:    f004fabf    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002152:    0004        ..      MOVS     r4,r0
        0x08002154:    d171        q.      BNE      0x800223a ; ecp_add_mixed + 366
        0x08002156:    4629        )F      MOV      r1,r5
        0x08002158:    4668        hF      MOV      r0,sp
        0x0800215a:    f001fdb5    ....    BL       ecp_modp ; 0x8003cc8
        0x0800215e:    0004        ..      MOVS     r4,r0
        0x08002160:    d1f8        ..      BNE      0x8002154 ; ecp_add_mixed + 136
        0x08002162:    464a        JF      MOV      r2,r9
        0x08002164:    4669        iF      MOV      r1,sp
        0x08002166:    a809        ..      ADD      r0,sp,#0x24
        0x08002168:    f004fab2    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x0800216c:    0004        ..      MOVS     r4,r0
        0x0800216e:    d1f1        ..      BNE      0x8002154 ; ecp_add_mixed + 136
        0x08002170:    4629        )F      MOV      r1,r5
        0x08002172:    a809        ..      ADD      r0,sp,#0x24
        0x08002174:    f001fda8    ....    BL       ecp_modp ; 0x8003cc8
        0x08002178:    0004        ..      MOVS     r4,r0
        0x0800217a:    d1eb        ..      BNE      0x8002154 ; ecp_add_mixed + 136
        0x0800217c:    4669        iF      MOV      r1,sp
        0x0800217e:    4632        2F      MOV      r2,r6
        0x08002180:    4608        .F      MOV      r0,r1
        0x08002182:    f004faa5    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002186:    0004        ..      MOVS     r4,r0
        0x08002188:    d1e4        ..      BNE      0x8002154 ; ecp_add_mixed + 136
        0x0800218a:    4629        )F      MOV      r1,r5
        0x0800218c:    4668        hF      MOV      r0,sp
        0x0800218e:    f001fd9b    ....    BL       ecp_modp ; 0x8003cc8
        0x08002192:    0004        ..      MOVS     r4,r0
        0x08002194:    d1de        ..      BNE      0x8002154 ; ecp_add_mixed + 136
        0x08002196:    a909        ..      ADD      r1,sp,#0x24
        0x08002198:    f106020c    ....    ADD      r2,r6,#0xc
        0x0800219c:    4608        .F      MOV      r0,r1
        0x0800219e:    f004fa97    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x080021a2:    0004        ..      MOVS     r4,r0
        0x080021a4:    d1d6        ..      BNE      0x8002154 ; ecp_add_mixed + 136
        0x080021a6:    4629        )F      MOV      r1,r5
        0x080021a8:    a809        ..      ADD      r0,sp,#0x24
        0x080021aa:    f001fd8d    ....    BL       ecp_modp ; 0x8003cc8
        0x080021ae:    0004        ..      MOVS     r4,r0
        0x080021b0:    d1d0        ..      BNE      0x8002154 ; ecp_add_mixed + 136
        0x080021b2:    4669        iF      MOV      r1,sp
        0x080021b4:    463a        :F      MOV      r2,r7
        0x080021b6:    4608        .F      MOV      r0,r1
        0x080021b8:    f004fda0    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x080021bc:    e004        ..      B        0x80021c8 ; ecp_add_mixed + 252
        0x080021be:    4669        iF      MOV      r1,sp
        0x080021c0:    1d2a        *.      ADDS     r2,r5,#4
        0x080021c2:    4608        .F      MOV      r0,r1
        0x080021c4:    f003fd48    ..H.    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x080021c8:    0004        ..      MOVS     r4,r0
        0x080021ca:    d1c3        ..      BNE      0x8002154 ; ecp_add_mixed + 136
        0x080021cc:    9800        ..      LDR      r0,[sp,#0]
        0x080021ce:    2800        .(      CMP      r0,#0
        0x080021d0:    da05        ..      BGE      0x80021de ; ecp_add_mixed + 274
        0x080021d2:    2100        .!      MOVS     r1,#0
        0x080021d4:    4668        hF      MOV      r0,sp
        0x080021d6:    f003fdb7    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080021da:    2800        .(      CMP      r0,#0
        0x080021dc:    d1ef        ..      BNE      0x80021be ; ecp_add_mixed + 242
        0x080021de:    f107020c    ....    ADD      r2,r7,#0xc
        0x080021e2:    a909        ..      ADD      r1,sp,#0x24
        0x080021e4:    4616        .F      MOV      r6,r2
        0x080021e6:    4608        .F      MOV      r0,r1
        0x080021e8:    f004fd88    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x080021ec:    e004        ..      B        0x80021f8 ; ecp_add_mixed + 300
        0x080021ee:    a909        ..      ADD      r1,sp,#0x24
        0x080021f0:    1d2a        *.      ADDS     r2,r5,#4
        0x080021f2:    4608        .F      MOV      r0,r1
        0x080021f4:    f003fd30    ..0.    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x080021f8:    0004        ..      MOVS     r4,r0
        0x080021fa:    d1ab        ..      BNE      0x8002154 ; ecp_add_mixed + 136
        0x080021fc:    9809        ..      LDR      r0,[sp,#0x24]
        0x080021fe:    2800        .(      CMP      r0,#0
        0x08002200:    da05        ..      BGE      0x800220e ; ecp_add_mixed + 322
        0x08002202:    2100        .!      MOVS     r1,#0
        0x08002204:    a809        ..      ADD      r0,sp,#0x24
        0x08002206:    f003fd9f    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x0800220a:    2800        .(      CMP      r0,#0
        0x0800220c:    d1ef        ..      BNE      0x80021ee ; ecp_add_mixed + 290
        0x0800220e:    2100        .!      MOVS     r1,#0
        0x08002210:    4668        hF      MOV      r0,sp
        0x08002212:    f003fd99    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08002216:    b138        8.      CBZ      r0,0x8002228 ; ecp_add_mixed + 348
        0x08002218:    466a        jF      MOV      r2,sp
        0x0800221a:    4649        IF      MOV      r1,r9
        0x0800221c:    a812        ..      ADD      r0,sp,#0x48
        0x0800221e:    f004fa57    ..W.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002222:    0004        ..      MOVS     r4,r0
        0x08002224:    d196        ..      BNE      0x8002154 ; ecp_add_mixed + 136
        0x08002226:    e00f        ..      B        0x8002248 ; ecp_add_mixed + 380
        0x08002228:    2100        .!      MOVS     r1,#0
        0x0800222a:    a809        ..      ADD      r0,sp,#0x24
        0x0800222c:    f003fd8c    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08002230:    b120         .      CBZ      r0,0x800223c ; ecp_add_mixed + 368
        0x08002232:    4640        @F      MOV      r0,r8
        0x08002234:    f003f834    ..4.    BL       mbedtls_ecp_set_zero ; 0x80052a0
        0x08002238:    e0d9        ..      B        0x80023ee ; ecp_add_mixed + 802
        0x0800223a:    e097        ..      B        0x800236c ; ecp_add_mixed + 672
        0x0800223c:    463a        :F      MOV      r2,r7
        0x0800223e:    4641        AF      MOV      r1,r8
        0x08002240:    4628        (F      MOV      r0,r5
        0x08002242:    f000fb47    ..G.    BL       ecp_double_jac ; 0x80028d4
        0x08002246:    e0d2        ..      B        0x80023ee ; ecp_add_mixed + 802
        0x08002248:    4629        )F      MOV      r1,r5
        0x0800224a:    a812        ..      ADD      r0,sp,#0x48
        0x0800224c:    f001fd3c    ..<.    BL       ecp_modp ; 0x8003cc8
        0x08002250:    0004        ..      MOVS     r4,r0
        0x08002252:    d185        ..      BNE      0x8002160 ; ecp_add_mixed + 148
        0x08002254:    466a        jF      MOV      r2,sp
        0x08002256:    4611        .F      MOV      r1,r2
        0x08002258:    a803        ..      ADD      r0,sp,#0xc
        0x0800225a:    f004fa39    ..9.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x0800225e:    0004        ..      MOVS     r4,r0
        0x08002260:    d185        ..      BNE      0x800216e ; ecp_add_mixed + 162
        0x08002262:    4629        )F      MOV      r1,r5
        0x08002264:    a803        ..      ADD      r0,sp,#0xc
        0x08002266:    f001fd2f    ../.    BL       ecp_modp ; 0x8003cc8
        0x0800226a:    0004        ..      MOVS     r4,r0
        0x0800226c:    d17e        ~.      BNE      0x800236c ; ecp_add_mixed + 672
        0x0800226e:    466a        jF      MOV      r2,sp
        0x08002270:    a903        ..      ADD      r1,sp,#0xc
        0x08002272:    a80f        ..      ADD      r0,sp,#0x3c
        0x08002274:    f004fa2c    ..,.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002278:    0004        ..      MOVS     r4,r0
        0x0800227a:    d177        w.      BNE      0x800236c ; ecp_add_mixed + 672
        0x0800227c:    4629        )F      MOV      r1,r5
        0x0800227e:    a80f        ..      ADD      r0,sp,#0x3c
        0x08002280:    f001fd22    ..".    BL       ecp_modp ; 0x8003cc8
        0x08002284:    0004        ..      MOVS     r4,r0
        0x08002286:    d171        q.      BNE      0x800236c ; ecp_add_mixed + 672
        0x08002288:    a903        ..      ADD      r1,sp,#0xc
        0x0800228a:    463a        :F      MOV      r2,r7
        0x0800228c:    4608        .F      MOV      r0,r1
        0x0800228e:    f004fa1f    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002292:    0004        ..      MOVS     r4,r0
        0x08002294:    d16a        j.      BNE      0x800236c ; ecp_add_mixed + 672
        0x08002296:    4629        )F      MOV      r1,r5
        0x08002298:    a803        ..      ADD      r0,sp,#0xc
        0x0800229a:    f001fd15    ....    BL       ecp_modp ; 0x8003cc8
        0x0800229e:    0004        ..      MOVS     r4,r0
        0x080022a0:    d164        d.      BNE      0x800236c ; ecp_add_mixed + 672
        0x080022a2:    2202        ."      MOVS     r2,#2
        0x080022a4:    a903        ..      ADD      r1,sp,#0xc
        0x080022a6:    4668        hF      MOV      r0,sp
        0x080022a8:    f004fa06    ....    BL       mbedtls_mpi_mul_int ; 0x80066b8
        0x080022ac:    e004        ..      B        0x80022b8 ; ecp_add_mixed + 492
        0x080022ae:    4669        iF      MOV      r1,sp
        0x080022b0:    1d2a        *.      ADDS     r2,r5,#4
        0x080022b2:    4608        .F      MOV      r0,r1
        0x080022b4:    f004fcd3    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x080022b8:    0004        ..      MOVS     r4,r0
        0x080022ba:    d157        W.      BNE      0x800236c ; ecp_add_mixed + 672
        0x080022bc:    1d29        ).      ADDS     r1,r5,#4
        0x080022be:    4668        hF      MOV      r0,sp
        0x080022c0:    f003fd5a    ..Z.    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x080022c4:    2800        .(      CMP      r0,#0
        0x080022c6:    daf2        ..      BGE      0x80022ae ; ecp_add_mixed + 482
        0x080022c8:    aa09        ..      ADD      r2,sp,#0x24
        0x080022ca:    4611        .F      MOV      r1,r2
        0x080022cc:    a806        ..      ADD      r0,sp,#0x18
        0x080022ce:    f004f9ff    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x080022d2:    0004        ..      MOVS     r4,r0
        0x080022d4:    d14a        J.      BNE      0x800236c ; ecp_add_mixed + 672
        0x080022d6:    4629        )F      MOV      r1,r5
        0x080022d8:    a806        ..      ADD      r0,sp,#0x18
        0x080022da:    f001fcf5    ....    BL       ecp_modp ; 0x8003cc8
        0x080022de:    0004        ..      MOVS     r4,r0
        0x080022e0:    d144        D.      BNE      0x800236c ; ecp_add_mixed + 672
        0x080022e2:    a906        ..      ADD      r1,sp,#0x18
        0x080022e4:    466a        jF      MOV      r2,sp
        0x080022e6:    4608        .F      MOV      r0,r1
        0x080022e8:    f004fd08    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x080022ec:    e004        ..      B        0x80022f8 ; ecp_add_mixed + 556
        0x080022ee:    a906        ..      ADD      r1,sp,#0x18
        0x080022f0:    1d2a        *.      ADDS     r2,r5,#4
        0x080022f2:    4608        .F      MOV      r0,r1
        0x080022f4:    f003fcb0    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x080022f8:    0004        ..      MOVS     r4,r0
        0x080022fa:    d179        y.      BNE      0x80023f0 ; ecp_add_mixed + 804
        0x080022fc:    9806        ..      LDR      r0,[sp,#0x18]
        0x080022fe:    2800        .(      CMP      r0,#0
        0x08002300:    da05        ..      BGE      0x800230e ; ecp_add_mixed + 578
        0x08002302:    2100        .!      MOVS     r1,#0
        0x08002304:    a806        ..      ADD      r0,sp,#0x18
        0x08002306:    f003fd1f    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x0800230a:    2800        .(      CMP      r0,#0
        0x0800230c:    d1ef        ..      BNE      0x80022ee ; ecp_add_mixed + 546
        0x0800230e:    a906        ..      ADD      r1,sp,#0x18
        0x08002310:    aa0f        ..      ADD      r2,sp,#0x3c
        0x08002312:    4608        .F      MOV      r0,r1
        0x08002314:    f004fcf2    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x08002318:    e004        ..      B        0x8002324 ; ecp_add_mixed + 600
        0x0800231a:    a906        ..      ADD      r1,sp,#0x18
        0x0800231c:    1d2a        *.      ADDS     r2,r5,#4
        0x0800231e:    4608        .F      MOV      r0,r1
        0x08002320:    f003fc9a    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08002324:    0004        ..      MOVS     r4,r0
        0x08002326:    d163        c.      BNE      0x80023f0 ; ecp_add_mixed + 804
        0x08002328:    9806        ..      LDR      r0,[sp,#0x18]
        0x0800232a:    2800        .(      CMP      r0,#0
        0x0800232c:    da05        ..      BGE      0x800233a ; ecp_add_mixed + 622
        0x0800232e:    2100        .!      MOVS     r1,#0
        0x08002330:    a806        ..      ADD      r0,sp,#0x18
        0x08002332:    f003fd09    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08002336:    2800        .(      CMP      r0,#0
        0x08002338:    d1ef        ..      BNE      0x800231a ; ecp_add_mixed + 590
        0x0800233a:    a903        ..      ADD      r1,sp,#0xc
        0x0800233c:    aa06        ..      ADD      r2,sp,#0x18
        0x0800233e:    4608        .F      MOV      r0,r1
        0x08002340:    f004fcdc    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x08002344:    e004        ..      B        0x8002350 ; ecp_add_mixed + 644
        0x08002346:    a903        ..      ADD      r1,sp,#0xc
        0x08002348:    1d2a        *.      ADDS     r2,r5,#4
        0x0800234a:    4608        .F      MOV      r0,r1
        0x0800234c:    f003fc84    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08002350:    0004        ..      MOVS     r4,r0
        0x08002352:    d14d        M.      BNE      0x80023f0 ; ecp_add_mixed + 804
        0x08002354:    9803        ..      LDR      r0,[sp,#0xc]
        0x08002356:    2800        .(      CMP      r0,#0
        0x08002358:    da05        ..      BGE      0x8002366 ; ecp_add_mixed + 666
        0x0800235a:    2100        .!      MOVS     r1,#0
        0x0800235c:    a803        ..      ADD      r0,sp,#0xc
        0x0800235e:    f003fcf3    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08002362:    2800        .(      CMP      r0,#0
        0x08002364:    d1ef        ..      BNE      0x8002346 ; ecp_add_mixed + 634
        0x08002366:    aa09        ..      ADD      r2,sp,#0x24
        0x08002368:    a903        ..      ADD      r1,sp,#0xc
        0x0800236a:    e000        ..      B        0x800236e ; ecp_add_mixed + 674
        0x0800236c:    e040        @.      B        0x80023f0 ; ecp_add_mixed + 804
        0x0800236e:    4608        .F      MOV      r0,r1
        0x08002370:    f004f9ae    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002374:    0004        ..      MOVS     r4,r0
        0x08002376:    d13b        ;.      BNE      0x80023f0 ; ecp_add_mixed + 804
        0x08002378:    4629        )F      MOV      r1,r5
        0x0800237a:    a803        ..      ADD      r0,sp,#0xc
        0x0800237c:    f001fca4    ....    BL       ecp_modp ; 0x8003cc8
        0x08002380:    0004        ..      MOVS     r4,r0
        0x08002382:    d135        5.      BNE      0x80023f0 ; ecp_add_mixed + 804
        0x08002384:    a90f        ..      ADD      r1,sp,#0x3c
        0x08002386:    4632        2F      MOV      r2,r6
        0x08002388:    4608        .F      MOV      r0,r1
        0x0800238a:    f004f9a1    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x0800238e:    0004        ..      MOVS     r4,r0
        0x08002390:    d12e        ..      BNE      0x80023f0 ; ecp_add_mixed + 804
        0x08002392:    4629        )F      MOV      r1,r5
        0x08002394:    a80f        ..      ADD      r0,sp,#0x3c
        0x08002396:    f001fc97    ....    BL       ecp_modp ; 0x8003cc8
        0x0800239a:    0004        ..      MOVS     r4,r0
        0x0800239c:    d128        (.      BNE      0x80023f0 ; ecp_add_mixed + 804
        0x0800239e:    aa0f        ..      ADD      r2,sp,#0x3c
        0x080023a0:    a903        ..      ADD      r1,sp,#0xc
        0x080023a2:    a80c        ..      ADD      r0,sp,#0x30
        0x080023a4:    f004fcaa    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x080023a8:    e004        ..      B        0x80023b4 ; ecp_add_mixed + 744
        0x080023aa:    a90c        ..      ADD      r1,sp,#0x30
        0x080023ac:    1d2a        *.      ADDS     r2,r5,#4
        0x080023ae:    4608        .F      MOV      r0,r1
        0x080023b0:    f003fc52    ..R.    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x080023b4:    0004        ..      MOVS     r4,r0
        0x080023b6:    d11b        ..      BNE      0x80023f0 ; ecp_add_mixed + 804
        0x080023b8:    980c        ..      LDR      r0,[sp,#0x30]
        0x080023ba:    2800        .(      CMP      r0,#0
        0x080023bc:    da05        ..      BGE      0x80023ca ; ecp_add_mixed + 766
        0x080023be:    2100        .!      MOVS     r1,#0
        0x080023c0:    a80c        ..      ADD      r0,sp,#0x30
        0x080023c2:    f003fcc1    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080023c6:    2800        .(      CMP      r0,#0
        0x080023c8:    d1ef        ..      BNE      0x80023aa ; ecp_add_mixed + 734
        0x080023ca:    a906        ..      ADD      r1,sp,#0x18
        0x080023cc:    4640        @F      MOV      r0,r8
        0x080023ce:    f003fd19    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x080023d2:    0004        ..      MOVS     r4,r0
        0x080023d4:    d10c        ..      BNE      0x80023f0 ; ecp_add_mixed + 804
        0x080023d6:    a90c        ..      ADD      r1,sp,#0x30
        0x080023d8:    f108000c    ....    ADD      r0,r8,#0xc
        0x080023dc:    f003fd12    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x080023e0:    0004        ..      MOVS     r4,r0
        0x080023e2:    d105        ..      BNE      0x80023f0 ; ecp_add_mixed + 804
        0x080023e4:    a912        ..      ADD      r1,sp,#0x48
        0x080023e6:    f1080018    ....    ADD      r0,r8,#0x18
        0x080023ea:    f003fd0b    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x080023ee:    4604        .F      MOV      r4,r0
        0x080023f0:    4668        hF      MOV      r0,sp
        0x080023f2:    f003fef8    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080023f6:    a809        ..      ADD      r0,sp,#0x24
        0x080023f8:    f003fef5    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080023fc:    a803        ..      ADD      r0,sp,#0xc
        0x080023fe:    f003fef2    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08002402:    a80f        ..      ADD      r0,sp,#0x3c
        0x08002404:    f003feef    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08002408:    a806        ..      ADD      r0,sp,#0x18
        0x0800240a:    f003feec    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x0800240e:    a80c        ..      ADD      r0,sp,#0x30
        0x08002410:    f003fee9    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08002414:    a812        ..      ADD      r0,sp,#0x48
        0x08002416:    f003fee6    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x0800241a:    4620         F      MOV      r0,r4
        0x0800241c:    e675        u.      B        0x800210a ; ecp_add_mixed + 62
    $d
        0x0800241e:    0000        ..      DCW    0
        0x08002420:    ffffb080    ....    DCD    4294946944
    $t
    i.ecp_check_pubkey_sw
    ecp_check_pubkey_sw
        0x08002424:    b5f0        ..      PUSH     {r4-r7,lr}
        0x08002426:    460e        .F      MOV      r6,r1
        0x08002428:    4605        .F      MOV      r5,r0
        0x0800242a:    b087        ..      SUB      sp,sp,#0x1c
        0x0800242c:    2100        .!      MOVS     r1,#0
        0x0800242e:    4630        0F      MOV      r0,r6
        0x08002430:    f003fc8a    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08002434:    4f4a        JO      LDR      r7,[pc,#296] ; [0x8002560] = 0xffffb380
        0x08002436:    2800        .(      CMP      r0,#0
        0x08002438:    db13        ..      BLT      0x8002462 ; ecp_check_pubkey_sw + 62
        0x0800243a:    f106000c    ....    ADD      r0,r6,#0xc
        0x0800243e:    2100        .!      MOVS     r1,#0
        0x08002440:    4604        .F      MOV      r4,r0
        0x08002442:    f003fc81    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08002446:    2800        .(      CMP      r0,#0
        0x08002448:    db0b        ..      BLT      0x8002462 ; ecp_check_pubkey_sw + 62
        0x0800244a:    1d29        ).      ADDS     r1,r5,#4
        0x0800244c:    4630        0F      MOV      r0,r6
        0x0800244e:    f003fc93    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08002452:    2800        .(      CMP      r0,#0
        0x08002454:    da05        ..      BGE      0x8002462 ; ecp_check_pubkey_sw + 62
        0x08002456:    1d29        ).      ADDS     r1,r5,#4
        0x08002458:    4620         F      MOV      r0,r4
        0x0800245a:    f003fc8d    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x0800245e:    2800        .(      CMP      r0,#0
        0x08002460:    db02        ..      BLT      0x8002468 ; ecp_check_pubkey_sw + 68
        0x08002462:    4638        8F      MOV      r0,r7
        0x08002464:    b007        ..      ADD      sp,sp,#0x1c
        0x08002466:    bdf0        ..      POP      {r4-r7,pc}
        0x08002468:    a803        ..      ADD      r0,sp,#0xc
        0x0800246a:    f003ff85    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x0800246e:    4668        hF      MOV      r0,sp
        0x08002470:    f003ff82    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08002474:    4622        "F      MOV      r2,r4
        0x08002476:    4611        .F      MOV      r1,r2
        0x08002478:    a803        ..      ADD      r0,sp,#0xc
        0x0800247a:    f004f929    ..).    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x0800247e:    0004        ..      MOVS     r4,r0
        0x08002480:    d166        f.      BNE      0x8002550 ; ecp_check_pubkey_sw + 300
        0x08002482:    4629        )F      MOV      r1,r5
        0x08002484:    a803        ..      ADD      r0,sp,#0xc
        0x08002486:    f001fc1f    ....    BL       ecp_modp ; 0x8003cc8
        0x0800248a:    0004        ..      MOVS     r4,r0
        0x0800248c:    d160        `.      BNE      0x8002550 ; ecp_check_pubkey_sw + 300
        0x0800248e:    4632        2F      MOV      r2,r6
        0x08002490:    4611        .F      MOV      r1,r2
        0x08002492:    4668        hF      MOV      r0,sp
        0x08002494:    f004f91c    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002498:    0004        ..      MOVS     r4,r0
        0x0800249a:    d159        Y.      BNE      0x8002550 ; ecp_check_pubkey_sw + 300
        0x0800249c:    4629        )F      MOV      r1,r5
        0x0800249e:    4668        hF      MOV      r0,sp
        0x080024a0:    f001fc12    ....    BL       ecp_modp ; 0x8003cc8
        0x080024a4:    0004        ..      MOVS     r4,r0
        0x080024a6:    d153        S.      BNE      0x8002550 ; ecp_check_pubkey_sw + 300
        0x080024a8:    69a8        .i      LDR      r0,[r5,#0x18]
        0x080024aa:    b130        0.      CBZ      r0,0x80024ba ; ecp_check_pubkey_sw + 150
        0x080024ac:    4669        iF      MOV      r1,sp
        0x080024ae:    f1050210    ....    ADD      r2,r5,#0x10
        0x080024b2:    4608        .F      MOV      r0,r1
        0x080024b4:    f003fbd0    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x080024b8:    e01b        ..      B        0x80024f2 ; ecp_check_pubkey_sw + 206
        0x080024ba:    4669        iF      MOV      r1,sp
        0x080024bc:    2203        ."      MOVS     r2,#3
        0x080024be:    4608        .F      MOV      r0,r1
        0x080024c0:    f004fc04    ....    BL       mbedtls_mpi_sub_int ; 0x8006ccc
        0x080024c4:    e004        ..      B        0x80024d0 ; ecp_check_pubkey_sw + 172
        0x080024c6:    4669        iF      MOV      r1,sp
        0x080024c8:    1d2a        *.      ADDS     r2,r5,#4
        0x080024ca:    4608        .F      MOV      r0,r1
        0x080024cc:    f003fbc4    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x080024d0:    0004        ..      MOVS     r4,r0
        0x080024d2:    d13d        =.      BNE      0x8002550 ; ecp_check_pubkey_sw + 300
        0x080024d4:    9800        ..      LDR      r0,[sp,#0]
        0x080024d6:    2800        .(      CMP      r0,#0
        0x080024d8:    da13        ..      BGE      0x8002502 ; ecp_check_pubkey_sw + 222
        0x080024da:    2100        .!      MOVS     r1,#0
        0x080024dc:    4668        hF      MOV      r0,sp
        0x080024de:    f003fc33    ..3.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080024e2:    2800        .(      CMP      r0,#0
        0x080024e4:    d1ef        ..      BNE      0x80024c6 ; ecp_check_pubkey_sw + 162
        0x080024e6:    e00c        ..      B        0x8002502 ; ecp_check_pubkey_sw + 222
        0x080024e8:    4669        iF      MOV      r1,sp
        0x080024ea:    1d2a        *.      ADDS     r2,r5,#4
        0x080024ec:    4608        .F      MOV      r0,r1
        0x080024ee:    f004fbb6    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x080024f2:    0004        ..      MOVS     r4,r0
        0x080024f4:    d12c        ,.      BNE      0x8002550 ; ecp_check_pubkey_sw + 300
        0x080024f6:    1d29        ).      ADDS     r1,r5,#4
        0x080024f8:    4668        hF      MOV      r0,sp
        0x080024fa:    f003fc3d    ..=.    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x080024fe:    2800        .(      CMP      r0,#0
        0x08002500:    daf2        ..      BGE      0x80024e8 ; ecp_check_pubkey_sw + 196
        0x08002502:    4669        iF      MOV      r1,sp
        0x08002504:    4632        2F      MOV      r2,r6
        0x08002506:    4608        .F      MOV      r0,r1
        0x08002508:    f004f8e2    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x0800250c:    0004        ..      MOVS     r4,r0
        0x0800250e:    d11f        ..      BNE      0x8002550 ; ecp_check_pubkey_sw + 300
        0x08002510:    4629        )F      MOV      r1,r5
        0x08002512:    4668        hF      MOV      r0,sp
        0x08002514:    f001fbd8    ....    BL       ecp_modp ; 0x8003cc8
        0x08002518:    0004        ..      MOVS     r4,r0
        0x0800251a:    d119        ..      BNE      0x8002550 ; ecp_check_pubkey_sw + 300
        0x0800251c:    4669        iF      MOV      r1,sp
        0x0800251e:    f105021c    ....    ADD      r2,r5,#0x1c
        0x08002522:    4608        .F      MOV      r0,r1
        0x08002524:    f003fb98    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08002528:    e004        ..      B        0x8002534 ; ecp_check_pubkey_sw + 272
        0x0800252a:    4669        iF      MOV      r1,sp
        0x0800252c:    1d2a        *.      ADDS     r2,r5,#4
        0x0800252e:    4608        .F      MOV      r0,r1
        0x08002530:    f004fb95    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08002534:    0004        ..      MOVS     r4,r0
        0x08002536:    d10b        ..      BNE      0x8002550 ; ecp_check_pubkey_sw + 300
        0x08002538:    1d29        ).      ADDS     r1,r5,#4
        0x0800253a:    4668        hF      MOV      r0,sp
        0x0800253c:    f003fc1c    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08002540:    2800        .(      CMP      r0,#0
        0x08002542:    daf2        ..      BGE      0x800252a ; ecp_check_pubkey_sw + 262
        0x08002544:    4669        iF      MOV      r1,sp
        0x08002546:    a803        ..      ADD      r0,sp,#0xc
        0x08002548:    f003fc16    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x0800254c:    b100        ..      CBZ      r0,0x8002550 ; ecp_check_pubkey_sw + 300
        0x0800254e:    463c        <F      MOV      r4,r7
        0x08002550:    a803        ..      ADD      r0,sp,#0xc
        0x08002552:    f003fe48    ..H.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08002556:    4668        hF      MOV      r0,sp
        0x08002558:    f003fe45    ..E.    BL       mbedtls_mpi_free ; 0x80061e6
        0x0800255c:    4620         F      MOV      r0,r4
        0x0800255e:    e781        ..      B        0x8002464 ; ecp_check_pubkey_sw + 64
    $d
        0x08002560:    ffffb380    ....    DCD    4294947712
    $t
    i.ecp_comb_recode_scalar
    ecp_comb_recode_scalar
        0x08002564:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x08002568:    b086        ..      SUB      sp,sp,#0x18
        0x0800256a:    4604        .F      MOV      r4,r0
        0x0800256c:    e9dd950e    ....    LDRD     r9,r5,[sp,#0x38]
        0x08002570:    461f        .F      MOV      r7,r3
        0x08002572:    4690        .F      MOV      r8,r2
        0x08002574:    460e        .F      MOV      r6,r1
        0x08002576:    4668        hF      MOV      r0,sp
        0x08002578:    f003fefe    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x0800257c:    a803        ..      ADD      r0,sp,#0xc
        0x0800257e:    f003fefb    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08002582:    f104004c    ..L.    ADD      r0,r4,#0x4c
        0x08002586:    2100        .!      MOVS     r1,#0
        0x08002588:    4682        .F      MOV      r10,r0
        0x0800258a:    f003febd    ....    BL       mbedtls_mpi_get_bit ; 0x8006308
        0x0800258e:    2801        .(      CMP      r0,#1
        0x08002590:    d003        ..      BEQ      0x800259a ; ecp_comb_recode_scalar + 54
        0x08002592:    4818        .H      LDR      r0,[pc,#96] ; [0x80025f4] = 0xffffb080
        0x08002594:    b006        ..      ADD      sp,sp,#0x18
        0x08002596:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x0800259a:    2100        .!      MOVS     r1,#0
        0x0800259c:    4630        0F      MOV      r0,r6
        0x0800259e:    f003feb3    ....    BL       mbedtls_mpi_get_bit ; 0x8006308
        0x080025a2:    b140        @.      CBZ      r0,0x80025b6 ; ecp_comb_recode_scalar + 82
        0x080025a4:    2000        .       MOVS     r0,#0
        0x080025a6:    7028        (p      STRB     r0,[r5,#0]
        0x080025a8:    4631        1F      MOV      r1,r6
        0x080025aa:    4668        hF      MOV      r0,sp
        0x080025ac:    f003fc2a    ..*.    BL       mbedtls_mpi_copy ; 0x8005e04
        0x080025b0:    0004        ..      MOVS     r4,r0
        0x080025b2:    d116        ..      BNE      0x80025e2 ; ecp_comb_recode_scalar + 126
        0x080025b4:    e001        ..      B        0x80025ba ; ecp_comb_recode_scalar + 86
        0x080025b6:    2001        .       MOVS     r0,#1
        0x080025b8:    e7f5        ..      B        0x80025a6 ; ecp_comb_recode_scalar + 66
        0x080025ba:    4632        2F      MOV      r2,r6
        0x080025bc:    4651        QF      MOV      r1,r10
        0x080025be:    a803        ..      ADD      r0,sp,#0xc
        0x080025c0:    f004fb9c    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x080025c4:    0004        ..      MOVS     r4,r0
        0x080025c6:    d10c        ..      BNE      0x80025e2 ; ecp_comb_recode_scalar + 126
        0x080025c8:    782a        *x      LDRB     r2,[r5,#0]
        0x080025ca:    a903        ..      ADD      r1,sp,#0xc
        0x080025cc:    4668        hF      MOV      r0,sp
        0x080025ce:    f004f9d3    ....    BL       mbedtls_mpi_safe_cond_assign ; 0x8006978
        0x080025d2:    0004        ..      MOVS     r4,r0
        0x080025d4:    d105        ..      BNE      0x80025e2 ; ecp_comb_recode_scalar + 126
        0x080025d6:    466b        kF      MOV      r3,sp
        0x080025d8:    464a        JF      MOV      r2,r9
        0x080025da:    4639        9F      MOV      r1,r7
        0x080025dc:    4640        @F      MOV      r0,r8
        0x080025de:    f7fffccd    ....    BL       ecp_comb_recode_core ; 0x8001f7c
        0x080025e2:    a803        ..      ADD      r0,sp,#0xc
        0x080025e4:    f003fdff    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080025e8:    4668        hF      MOV      r0,sp
        0x080025ea:    f003fdfc    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080025ee:    4620         F      MOV      r0,r4
        0x080025f0:    e7d0        ..      B        0x8002594 ; ecp_comb_recode_scalar + 48
    $d
        0x080025f2:    0000        ..      DCW    0
        0x080025f4:    ffffb080    ....    DCD    4294946944
    $t
    i.ecp_double_add_mxz
    ecp_double_add_mxz
        0x080025f8:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x080025fc:    b09b        ..      SUB      sp,sp,#0x6c
        0x080025fe:    4605        .F      MOV      r5,r0
        0x08002600:    e9dd8a24    ..$.    LDRD     r8,r10,[sp,#0x90]
        0x08002604:    461f        .F      MOV      r7,r3
        0x08002606:    4616        .F      MOV      r6,r2
        0x08002608:    4689        .F      MOV      r9,r1
        0x0800260a:    a809        ..      ADD      r0,sp,#0x24
        0x0800260c:    f003feb4    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08002610:    a812        ..      ADD      r0,sp,#0x48
        0x08002612:    f003feb1    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08002616:    4668        hF      MOV      r0,sp
        0x08002618:    f003feae    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x0800261c:    a80c        ..      ADD      r0,sp,#0x30
        0x0800261e:    f003feab    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08002622:    a803        ..      ADD      r0,sp,#0xc
        0x08002624:    f003fea8    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08002628:    a80f        ..      ADD      r0,sp,#0x3c
        0x0800262a:    f003fea5    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x0800262e:    a806        ..      ADD      r0,sp,#0x18
        0x08002630:    f003fea2    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08002634:    a815        ..      ADD      r0,sp,#0x54
        0x08002636:    f003fe9f    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x0800263a:    a818        ..      ADD      r0,sp,#0x60
        0x0800263c:    f003fe9c    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08002640:    f1070218    ....    ADD      r2,r7,#0x18
        0x08002644:    4693        .F      MOV      r11,r2
        0x08002646:    4639        9F      MOV      r1,r7
        0x08002648:    a809        ..      ADD      r0,sp,#0x24
        0x0800264a:    f003fb05    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x0800264e:    e004        ..      B        0x800265a ; ecp_double_add_mxz + 98
        0x08002650:    a909        ..      ADD      r1,sp,#0x24
        0x08002652:    1d2a        *.      ADDS     r2,r5,#4
        0x08002654:    4608        .F      MOV      r0,r1
        0x08002656:    f004fb02    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x0800265a:    0004        ..      MOVS     r4,r0
        0x0800265c:    d17e        ~.      BNE      0x800275c ; ecp_double_add_mxz + 356
        0x0800265e:    1d29        ).      ADDS     r1,r5,#4
        0x08002660:    a809        ..      ADD      r0,sp,#0x24
        0x08002662:    f003fb89    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08002666:    2800        .(      CMP      r0,#0
        0x08002668:    daf2        ..      BGE      0x8002650 ; ecp_double_add_mxz + 88
        0x0800266a:    aa09        ..      ADD      r2,sp,#0x24
        0x0800266c:    4611        .F      MOV      r1,r2
        0x0800266e:    a812        ..      ADD      r0,sp,#0x48
        0x08002670:    f004f82e    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002674:    0004        ..      MOVS     r4,r0
        0x08002676:    d1f1        ..      BNE      0x800265c ; ecp_double_add_mxz + 100
        0x08002678:    4629        )F      MOV      r1,r5
        0x0800267a:    a812        ..      ADD      r0,sp,#0x48
        0x0800267c:    f001fb24    ..$.    BL       ecp_modp ; 0x8003cc8
        0x08002680:    0004        ..      MOVS     r4,r0
        0x08002682:    d1eb        ..      BNE      0x800265c ; ecp_double_add_mxz + 100
        0x08002684:    465a        ZF      MOV      r2,r11
        0x08002686:    4639        9F      MOV      r1,r7
        0x08002688:    4668        hF      MOV      r0,sp
        0x0800268a:    f004fb37    ..7.    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x0800268e:    e004        ..      B        0x800269a ; ecp_double_add_mxz + 162
        0x08002690:    4669        iF      MOV      r1,sp
        0x08002692:    1d2a        *.      ADDS     r2,r5,#4
        0x08002694:    4608        .F      MOV      r0,r1
        0x08002696:    f003fadf    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x0800269a:    0004        ..      MOVS     r4,r0
        0x0800269c:    d1de        ..      BNE      0x800265c ; ecp_double_add_mxz + 100
        0x0800269e:    9800        ..      LDR      r0,[sp,#0]
        0x080026a0:    2800        .(      CMP      r0,#0
        0x080026a2:    da05        ..      BGE      0x80026b0 ; ecp_double_add_mxz + 184
        0x080026a4:    2100        .!      MOVS     r1,#0
        0x080026a6:    4668        hF      MOV      r0,sp
        0x080026a8:    f003fb4e    ..N.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080026ac:    2800        .(      CMP      r0,#0
        0x080026ae:    d1ef        ..      BNE      0x8002690 ; ecp_double_add_mxz + 152
        0x080026b0:    466a        jF      MOV      r2,sp
        0x080026b2:    4611        .F      MOV      r1,r2
        0x080026b4:    a80c        ..      ADD      r0,sp,#0x30
        0x080026b6:    f004f80b    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x080026ba:    0004        ..      MOVS     r4,r0
        0x080026bc:    d1ce        ..      BNE      0x800265c ; ecp_double_add_mxz + 100
        0x080026be:    4629        )F      MOV      r1,r5
        0x080026c0:    a80c        ..      ADD      r0,sp,#0x30
        0x080026c2:    f001fb01    ....    BL       ecp_modp ; 0x8003cc8
        0x080026c6:    0004        ..      MOVS     r4,r0
        0x080026c8:    d1c8        ..      BNE      0x800265c ; ecp_double_add_mxz + 100
        0x080026ca:    aa0c        ..      ADD      r2,sp,#0x30
        0x080026cc:    a912        ..      ADD      r1,sp,#0x48
        0x080026ce:    a803        ..      ADD      r0,sp,#0xc
        0x080026d0:    f004fb14    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x080026d4:    e004        ..      B        0x80026e0 ; ecp_double_add_mxz + 232
        0x080026d6:    a903        ..      ADD      r1,sp,#0xc
        0x080026d8:    1d2a        *.      ADDS     r2,r5,#4
        0x080026da:    4608        .F      MOV      r0,r1
        0x080026dc:    f003fabc    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x080026e0:    0004        ..      MOVS     r4,r0
        0x080026e2:    d1bb        ..      BNE      0x800265c ; ecp_double_add_mxz + 100
        0x080026e4:    9803        ..      LDR      r0,[sp,#0xc]
        0x080026e6:    2800        .(      CMP      r0,#0
        0x080026e8:    da05        ..      BGE      0x80026f6 ; ecp_double_add_mxz + 254
        0x080026ea:    2100        .!      MOVS     r1,#0
        0x080026ec:    a803        ..      ADD      r0,sp,#0xc
        0x080026ee:    f003fb2b    ..+.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080026f2:    2800        .(      CMP      r0,#0
        0x080026f4:    d1ef        ..      BNE      0x80026d6 ; ecp_double_add_mxz + 222
        0x080026f6:    f1080218    ....    ADD      r2,r8,#0x18
        0x080026fa:    4617        .F      MOV      r7,r2
        0x080026fc:    4641        AF      MOV      r1,r8
        0x080026fe:    a80f        ..      ADD      r0,sp,#0x3c
        0x08002700:    f003faaa    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08002704:    e004        ..      B        0x8002710 ; ecp_double_add_mxz + 280
        0x08002706:    a90f        ..      ADD      r1,sp,#0x3c
        0x08002708:    1d2a        *.      ADDS     r2,r5,#4
        0x0800270a:    4608        .F      MOV      r0,r1
        0x0800270c:    f004faa7    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08002710:    0004        ..      MOVS     r4,r0
        0x08002712:    d1a3        ..      BNE      0x800265c ; ecp_double_add_mxz + 100
        0x08002714:    1d29        ).      ADDS     r1,r5,#4
        0x08002716:    a80f        ..      ADD      r0,sp,#0x3c
        0x08002718:    f003fb2e    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x0800271c:    2800        .(      CMP      r0,#0
        0x0800271e:    daf2        ..      BGE      0x8002706 ; ecp_double_add_mxz + 270
        0x08002720:    463a        :F      MOV      r2,r7
        0x08002722:    4641        AF      MOV      r1,r8
        0x08002724:    a806        ..      ADD      r0,sp,#0x18
        0x08002726:    f004fae9    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x0800272a:    e004        ..      B        0x8002736 ; ecp_double_add_mxz + 318
        0x0800272c:    a906        ..      ADD      r1,sp,#0x18
        0x0800272e:    1d2a        *.      ADDS     r2,r5,#4
        0x08002730:    4608        .F      MOV      r0,r1
        0x08002732:    f003fa91    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08002736:    0004        ..      MOVS     r4,r0
        0x08002738:    d110        ..      BNE      0x800275c ; ecp_double_add_mxz + 356
        0x0800273a:    9806        ..      LDR      r0,[sp,#0x18]
        0x0800273c:    2800        .(      CMP      r0,#0
        0x0800273e:    da05        ..      BGE      0x800274c ; ecp_double_add_mxz + 340
        0x08002740:    2100        .!      MOVS     r1,#0
        0x08002742:    a806        ..      ADD      r0,sp,#0x18
        0x08002744:    f003fb00    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08002748:    2800        .(      CMP      r0,#0
        0x0800274a:    d1ef        ..      BNE      0x800272c ; ecp_double_add_mxz + 308
        0x0800274c:    aa09        ..      ADD      r2,sp,#0x24
        0x0800274e:    a906        ..      ADD      r1,sp,#0x18
        0x08002750:    a815        ..      ADD      r0,sp,#0x54
        0x08002752:    f003ffbd    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002756:    0004        ..      MOVS     r4,r0
        0x08002758:    d100        ..      BNE      0x800275c ; ecp_double_add_mxz + 356
        0x0800275a:    e000        ..      B        0x800275e ; ecp_double_add_mxz + 358
        0x0800275c:    e081        ..      B        0x8002862 ; ecp_double_add_mxz + 618
        0x0800275e:    4629        )F      MOV      r1,r5
        0x08002760:    a815        ..      ADD      r0,sp,#0x54
        0x08002762:    f001fab1    ....    BL       ecp_modp ; 0x8003cc8
        0x08002766:    0004        ..      MOVS     r4,r0
        0x08002768:    d17b        {.      BNE      0x8002862 ; ecp_double_add_mxz + 618
        0x0800276a:    466a        jF      MOV      r2,sp
        0x0800276c:    a90f        ..      ADD      r1,sp,#0x3c
        0x0800276e:    a818        ..      ADD      r0,sp,#0x60
        0x08002770:    f003ffae    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002774:    0004        ..      MOVS     r4,r0
        0x08002776:    d174        t.      BNE      0x8002862 ; ecp_double_add_mxz + 618
        0x08002778:    4629        )F      MOV      r1,r5
        0x0800277a:    a818        ..      ADD      r0,sp,#0x60
        0x0800277c:    f001faa4    ....    BL       ecp_modp ; 0x8003cc8
        0x08002780:    0004        ..      MOVS     r4,r0
        0x08002782:    d16e        n.      BNE      0x8002862 ; ecp_double_add_mxz + 618
        0x08002784:    aa18        ..      ADD      r2,sp,#0x60
        0x08002786:    a915        ..      ADD      r1,sp,#0x54
        0x08002788:    4630        0F      MOV      r0,r6
        0x0800278a:    f003fa65    ..e.    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x0800278e:    0004        ..      MOVS     r4,r0
        0x08002790:    d167        g.      BNE      0x8002862 ; ecp_double_add_mxz + 618
        0x08002792:    4629        )F      MOV      r1,r5
        0x08002794:    4630        0F      MOV      r0,r6
        0x08002796:    f001fa97    ....    BL       ecp_modp ; 0x8003cc8
        0x0800279a:    0004        ..      MOVS     r4,r0
        0x0800279c:    d17b        {.      BNE      0x8002896 ; ecp_double_add_mxz + 670
        0x0800279e:    4632        2F      MOV      r2,r6
        0x080027a0:    4611        .F      MOV      r1,r2
        0x080027a2:    4608        .F      MOV      r0,r1
        0x080027a4:    f003ff94    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x080027a8:    0004        ..      MOVS     r4,r0
        0x080027aa:    d174        t.      BNE      0x8002896 ; ecp_double_add_mxz + 670
        0x080027ac:    4629        )F      MOV      r1,r5
        0x080027ae:    4630        0F      MOV      r0,r6
        0x080027b0:    f001fa8a    ....    BL       ecp_modp ; 0x8003cc8
        0x080027b4:    0004        ..      MOVS     r4,r0
        0x080027b6:    d16e        n.      BNE      0x8002896 ; ecp_double_add_mxz + 670
        0x080027b8:    f1060018    ....    ADD      r0,r6,#0x18
        0x080027bc:    aa18        ..      ADD      r2,sp,#0x60
        0x080027be:    a915        ..      ADD      r1,sp,#0x54
        0x080027c0:    4607        .F      MOV      r7,r0
        0x080027c2:    f004fa9b    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x080027c6:    e004        ..      B        0x80027d2 ; ecp_double_add_mxz + 474
        0x080027c8:    4639        9F      MOV      r1,r7
        0x080027ca:    1d2a        *.      ADDS     r2,r5,#4
        0x080027cc:    4608        .F      MOV      r0,r1
        0x080027ce:    f003fa43    ..C.    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x080027d2:    0004        ..      MOVS     r4,r0
        0x080027d4:    d15f        _.      BNE      0x8002896 ; ecp_double_add_mxz + 670
        0x080027d6:    69b0        .i      LDR      r0,[r6,#0x18]
        0x080027d8:    2800        .(      CMP      r0,#0
        0x080027da:    da05        ..      BGE      0x80027e8 ; ecp_double_add_mxz + 496
        0x080027dc:    2100        .!      MOVS     r1,#0
        0x080027de:    4638        8F      MOV      r0,r7
        0x080027e0:    f003fab2    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080027e4:    2800        .(      CMP      r0,#0
        0x080027e6:    d1ef        ..      BNE      0x80027c8 ; ecp_double_add_mxz + 464
        0x080027e8:    463a        :F      MOV      r2,r7
        0x080027ea:    4611        .F      MOV      r1,r2
        0x080027ec:    4608        .F      MOV      r0,r1
        0x080027ee:    f003ff6f    ..o.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x080027f2:    0004        ..      MOVS     r4,r0
        0x080027f4:    d14f        O.      BNE      0x8002896 ; ecp_double_add_mxz + 670
        0x080027f6:    4629        )F      MOV      r1,r5
        0x080027f8:    4638        8F      MOV      r0,r7
        0x080027fa:    f001fa65    ..e.    BL       ecp_modp ; 0x8003cc8
        0x080027fe:    0004        ..      MOVS     r4,r0
        0x08002800:    d149        I.      BNE      0x8002896 ; ecp_double_add_mxz + 670
        0x08002802:    463a        :F      MOV      r2,r7
        0x08002804:    4651        QF      MOV      r1,r10
        0x08002806:    4610        .F      MOV      r0,r2
        0x08002808:    f003ff62    ..b.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x0800280c:    0004        ..      MOVS     r4,r0
        0x0800280e:    d142        B.      BNE      0x8002896 ; ecp_double_add_mxz + 670
        0x08002810:    4629        )F      MOV      r1,r5
        0x08002812:    4638        8F      MOV      r0,r7
        0x08002814:    f001fa58    ..X.    BL       ecp_modp ; 0x8003cc8
        0x08002818:    0004        ..      MOVS     r4,r0
        0x0800281a:    d13c        <.      BNE      0x8002896 ; ecp_double_add_mxz + 670
        0x0800281c:    aa0c        ..      ADD      r2,sp,#0x30
        0x0800281e:    a912        ..      ADD      r1,sp,#0x48
        0x08002820:    4648        HF      MOV      r0,r9
        0x08002822:    f003ff55    ..U.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002826:    0004        ..      MOVS     r4,r0
        0x08002828:    d135        5.      BNE      0x8002896 ; ecp_double_add_mxz + 670
        0x0800282a:    4629        )F      MOV      r1,r5
        0x0800282c:    4648        HF      MOV      r0,r9
        0x0800282e:    f001fa4b    ..K.    BL       ecp_modp ; 0x8003cc8
        0x08002832:    0004        ..      MOVS     r4,r0
        0x08002834:    d12f        /.      BNE      0x8002896 ; ecp_double_add_mxz + 670
        0x08002836:    f1090018    ....    ADD      r0,r9,#0x18
        0x0800283a:    aa03        ..      ADD      r2,sp,#0xc
        0x0800283c:    f1050110    ....    ADD      r1,r5,#0x10
        0x08002840:    4606        .F      MOV      r6,r0
        0x08002842:    f003ff45    ..E.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002846:    0004        ..      MOVS     r4,r0
        0x08002848:    d125        %.      BNE      0x8002896 ; ecp_double_add_mxz + 670
        0x0800284a:    4629        )F      MOV      r1,r5
        0x0800284c:    4630        0F      MOV      r0,r6
        0x0800284e:    f001fa3b    ..;.    BL       ecp_modp ; 0x8003cc8
        0x08002852:    0004        ..      MOVS     r4,r0
        0x08002854:    d11f        ..      BNE      0x8002896 ; ecp_double_add_mxz + 670
        0x08002856:    4632        2F      MOV      r2,r6
        0x08002858:    a90c        ..      ADD      r1,sp,#0x30
        0x0800285a:    4610        .F      MOV      r0,r2
        0x0800285c:    f003f9fc    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08002860:    e005        ..      B        0x800286e ; ecp_double_add_mxz + 630
        0x08002862:    e018        ..      B        0x8002896 ; ecp_double_add_mxz + 670
        0x08002864:    4631        1F      MOV      r1,r6
        0x08002866:    1d2a        *.      ADDS     r2,r5,#4
        0x08002868:    4608        .F      MOV      r0,r1
        0x0800286a:    f004f9f8    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x0800286e:    0004        ..      MOVS     r4,r0
        0x08002870:    d111        ..      BNE      0x8002896 ; ecp_double_add_mxz + 670
        0x08002872:    1d29        ).      ADDS     r1,r5,#4
        0x08002874:    4630        0F      MOV      r0,r6
        0x08002876:    f003fa7f    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x0800287a:    2800        .(      CMP      r0,#0
        0x0800287c:    daf2        ..      BGE      0x8002864 ; ecp_double_add_mxz + 620
        0x0800287e:    4632        2F      MOV      r2,r6
        0x08002880:    a903        ..      ADD      r1,sp,#0xc
        0x08002882:    4610        .F      MOV      r0,r2
        0x08002884:    f003ff24    ..$.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002888:    0004        ..      MOVS     r4,r0
        0x0800288a:    d104        ..      BNE      0x8002896 ; ecp_double_add_mxz + 670
        0x0800288c:    4629        )F      MOV      r1,r5
        0x0800288e:    4630        0F      MOV      r0,r6
        0x08002890:    f001fa1a    ....    BL       ecp_modp ; 0x8003cc8
        0x08002894:    4604        .F      MOV      r4,r0
        0x08002896:    a809        ..      ADD      r0,sp,#0x24
        0x08002898:    f003fca5    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x0800289c:    a812        ..      ADD      r0,sp,#0x48
        0x0800289e:    f003fca2    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080028a2:    4668        hF      MOV      r0,sp
        0x080028a4:    f003fc9f    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080028a8:    a80c        ..      ADD      r0,sp,#0x30
        0x080028aa:    f003fc9c    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080028ae:    a803        ..      ADD      r0,sp,#0xc
        0x080028b0:    f003fc99    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080028b4:    a80f        ..      ADD      r0,sp,#0x3c
        0x080028b6:    f003fc96    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080028ba:    a806        ..      ADD      r0,sp,#0x18
        0x080028bc:    f003fc93    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080028c0:    a815        ..      ADD      r0,sp,#0x54
        0x080028c2:    f003fc90    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080028c6:    a818        ..      ADD      r0,sp,#0x60
        0x080028c8:    f003fc8d    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080028cc:    b01b        ..      ADD      sp,sp,#0x6c
        0x080028ce:    4620         F      MOV      r0,r4
        0x080028d0:    e8bd8ff0    ....    POP      {r4-r11,pc}
    i.ecp_double_jac
    ecp_double_jac
        0x080028d4:    e92d43f0    -..C    PUSH     {r4-r9,lr}
        0x080028d8:    b08d        ..      SUB      sp,sp,#0x34
        0x080028da:    4605        .F      MOV      r5,r0
        0x080028dc:    4616        .F      MOV      r6,r2
        0x080028de:    460f        .F      MOV      r7,r1
        0x080028e0:    a809        ..      ADD      r0,sp,#0x24
        0x080028e2:    f003fd49    ..I.    BL       mbedtls_mpi_init ; 0x8006378
        0x080028e6:    4668        hF      MOV      r0,sp
        0x080028e8:    f003fd46    ..F.    BL       mbedtls_mpi_init ; 0x8006378
        0x080028ec:    a803        ..      ADD      r0,sp,#0xc
        0x080028ee:    f003fd43    ..C.    BL       mbedtls_mpi_init ; 0x8006378
        0x080028f2:    a806        ..      ADD      r0,sp,#0x18
        0x080028f4:    f003fd40    ..@.    BL       mbedtls_mpi_init ; 0x8006378
        0x080028f8:    f1060018    ....    ADD      r0,r6,#0x18
        0x080028fc:    69a9        .i      LDR      r1,[r5,#0x18]
        0x080028fe:    4680        .F      MOV      r8,r0
        0x08002900:    b139        9.      CBZ      r1,0x8002912 ; ecp_double_jac + 62
        0x08002902:    4632        2F      MOV      r2,r6
        0x08002904:    4611        .F      MOV      r1,r2
        0x08002906:    4668        hF      MOV      r0,sp
        0x08002908:    f003fee2    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x0800290c:    0004        ..      MOVS     r4,r0
        0x0800290e:    d17d        }.      BNE      0x8002a0c ; ecp_double_jac + 312
        0x08002910:    e056        V.      B        0x80029c0 ; ecp_double_jac + 236
        0x08002912:    4602        .F      MOV      r2,r0
        0x08002914:    4611        .F      MOV      r1,r2
        0x08002916:    4668        hF      MOV      r0,sp
        0x08002918:    f003feda    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x0800291c:    0004        ..      MOVS     r4,r0
        0x0800291e:    d1f6        ..      BNE      0x800290e ; ecp_double_jac + 58
        0x08002920:    4629        )F      MOV      r1,r5
        0x08002922:    4668        hF      MOV      r0,sp
        0x08002924:    f001f9d0    ....    BL       ecp_modp ; 0x8003cc8
        0x08002928:    0004        ..      MOVS     r4,r0
        0x0800292a:    d1f0        ..      BNE      0x800290e ; ecp_double_jac + 58
        0x0800292c:    466a        jF      MOV      r2,sp
        0x0800292e:    4631        1F      MOV      r1,r6
        0x08002930:    a803        ..      ADD      r0,sp,#0xc
        0x08002932:    f003f991    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08002936:    e004        ..      B        0x8002942 ; ecp_double_jac + 110
        0x08002938:    a903        ..      ADD      r1,sp,#0xc
        0x0800293a:    1d2a        *.      ADDS     r2,r5,#4
        0x0800293c:    4608        .F      MOV      r0,r1
        0x0800293e:    f004f98e    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08002942:    0004        ..      MOVS     r4,r0
        0x08002944:    d1e3        ..      BNE      0x800290e ; ecp_double_jac + 58
        0x08002946:    1d29        ).      ADDS     r1,r5,#4
        0x08002948:    a803        ..      ADD      r0,sp,#0xc
        0x0800294a:    f003fa15    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x0800294e:    2800        .(      CMP      r0,#0
        0x08002950:    daf2        ..      BGE      0x8002938 ; ecp_double_jac + 100
        0x08002952:    466a        jF      MOV      r2,sp
        0x08002954:    4631        1F      MOV      r1,r6
        0x08002956:    a806        ..      ADD      r0,sp,#0x18
        0x08002958:    f004f9d0    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x0800295c:    e004        ..      B        0x8002968 ; ecp_double_jac + 148
        0x0800295e:    a906        ..      ADD      r1,sp,#0x18
        0x08002960:    1d2a        *.      ADDS     r2,r5,#4
        0x08002962:    4608        .F      MOV      r0,r1
        0x08002964:    f003f978    ..x.    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08002968:    0004        ..      MOVS     r4,r0
        0x0800296a:    d1d0        ..      BNE      0x800290e ; ecp_double_jac + 58
        0x0800296c:    9806        ..      LDR      r0,[sp,#0x18]
        0x0800296e:    2800        .(      CMP      r0,#0
        0x08002970:    da05        ..      BGE      0x800297e ; ecp_double_jac + 170
        0x08002972:    2100        .!      MOVS     r1,#0
        0x08002974:    a806        ..      ADD      r0,sp,#0x18
        0x08002976:    f003f9e7    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x0800297a:    2800        .(      CMP      r0,#0
        0x0800297c:    d1ef        ..      BNE      0x800295e ; ecp_double_jac + 138
        0x0800297e:    aa06        ..      ADD      r2,sp,#0x18
        0x08002980:    a903        ..      ADD      r1,sp,#0xc
        0x08002982:    4668        hF      MOV      r0,sp
        0x08002984:    f003fea4    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002988:    0004        ..      MOVS     r4,r0
        0x0800298a:    d1c0        ..      BNE      0x800290e ; ecp_double_jac + 58
        0x0800298c:    4629        )F      MOV      r1,r5
        0x0800298e:    4668        hF      MOV      r0,sp
        0x08002990:    f001f99a    ....    BL       ecp_modp ; 0x8003cc8
        0x08002994:    0004        ..      MOVS     r4,r0
        0x08002996:    d1ba        ..      BNE      0x800290e ; ecp_double_jac + 58
        0x08002998:    2203        ."      MOVS     r2,#3
        0x0800299a:    4669        iF      MOV      r1,sp
        0x0800299c:    a809        ..      ADD      r0,sp,#0x24
        0x0800299e:    f003fe8b    ....    BL       mbedtls_mpi_mul_int ; 0x80066b8
        0x080029a2:    e004        ..      B        0x80029ae ; ecp_double_jac + 218
        0x080029a4:    a909        ..      ADD      r1,sp,#0x24
        0x080029a6:    1d2a        *.      ADDS     r2,r5,#4
        0x080029a8:    4608        .F      MOV      r0,r1
        0x080029aa:    f004f958    ..X.    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x080029ae:    0004        ..      MOVS     r4,r0
        0x080029b0:    d1ad        ..      BNE      0x800290e ; ecp_double_jac + 58
        0x080029b2:    1d29        ).      ADDS     r1,r5,#4
        0x080029b4:    a809        ..      ADD      r0,sp,#0x24
        0x080029b6:    f003f9df    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x080029ba:    2800        .(      CMP      r0,#0
        0x080029bc:    daf2        ..      BGE      0x80029a4 ; ecp_double_jac + 208
        0x080029be:    e05c        \.      B        0x8002a7a ; ecp_double_jac + 422
        0x080029c0:    4629        )F      MOV      r1,r5
        0x080029c2:    4668        hF      MOV      r0,sp
        0x080029c4:    f001f980    ....    BL       ecp_modp ; 0x8003cc8
        0x080029c8:    0004        ..      MOVS     r4,r0
        0x080029ca:    d1a0        ..      BNE      0x800290e ; ecp_double_jac + 58
        0x080029cc:    2203        ."      MOVS     r2,#3
        0x080029ce:    4669        iF      MOV      r1,sp
        0x080029d0:    a809        ..      ADD      r0,sp,#0x24
        0x080029d2:    f003fe71    ..q.    BL       mbedtls_mpi_mul_int ; 0x80066b8
        0x080029d6:    e004        ..      B        0x80029e2 ; ecp_double_jac + 270
        0x080029d8:    a909        ..      ADD      r1,sp,#0x24
        0x080029da:    1d2a        *.      ADDS     r2,r5,#4
        0x080029dc:    4608        .F      MOV      r0,r1
        0x080029de:    f004f93e    ..>.    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x080029e2:    0004        ..      MOVS     r4,r0
        0x080029e4:    d193        ..      BNE      0x800290e ; ecp_double_jac + 58
        0x080029e6:    1d29        ).      ADDS     r1,r5,#4
        0x080029e8:    a809        ..      ADD      r0,sp,#0x24
        0x080029ea:    f003f9c5    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x080029ee:    2800        .(      CMP      r0,#0
        0x080029f0:    daf2        ..      BGE      0x80029d8 ; ecp_double_jac + 260
        0x080029f2:    f1050010    ....    ADD      r0,r5,#0x10
        0x080029f6:    2100        .!      MOVS     r1,#0
        0x080029f8:    4681        .F      MOV      r9,r0
        0x080029fa:    f003f9a5    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080029fe:    b370        p.      CBZ      r0,0x8002a5e ; ecp_double_jac + 394
        0x08002a00:    4642        BF      MOV      r2,r8
        0x08002a02:    4611        .F      MOV      r1,r2
        0x08002a04:    4668        hF      MOV      r0,sp
        0x08002a06:    f003fe63    ..c.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002a0a:    e000        ..      B        0x8002a0e ; ecp_double_jac + 314
        0x08002a0c:    e0ed        ..      B        0x8002bea ; ecp_double_jac + 790
        0x08002a0e:    0004        ..      MOVS     r4,r0
        0x08002a10:    d185        ..      BNE      0x800291e ; ecp_double_jac + 74
        0x08002a12:    4629        )F      MOV      r1,r5
        0x08002a14:    4668        hF      MOV      r0,sp
        0x08002a16:    f001f957    ..W.    BL       ecp_modp ; 0x8003cc8
        0x08002a1a:    0004        ..      MOVS     r4,r0
        0x08002a1c:    d185        ..      BNE      0x800292a ; ecp_double_jac + 86
        0x08002a1e:    466a        jF      MOV      r2,sp
        0x08002a20:    4611        .F      MOV      r1,r2
        0x08002a22:    a803        ..      ADD      r0,sp,#0xc
        0x08002a24:    f003fe54    ..T.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002a28:    0004        ..      MOVS     r4,r0
        0x08002a2a:    d18b        ..      BNE      0x8002944 ; ecp_double_jac + 112
        0x08002a2c:    4629        )F      MOV      r1,r5
        0x08002a2e:    a803        ..      ADD      r0,sp,#0xc
        0x08002a30:    f001f94a    ..J.    BL       ecp_modp ; 0x8003cc8
        0x08002a34:    0004        ..      MOVS     r4,r0
        0x08002a36:    d185        ..      BNE      0x8002944 ; ecp_double_jac + 112
        0x08002a38:    464a        JF      MOV      r2,r9
        0x08002a3a:    a903        ..      ADD      r1,sp,#0xc
        0x08002a3c:    4668        hF      MOV      r0,sp
        0x08002a3e:    f003fe47    ..G.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002a42:    0004        ..      MOVS     r4,r0
        0x08002a44:    d191        ..      BNE      0x800296a ; ecp_double_jac + 150
        0x08002a46:    4629        )F      MOV      r1,r5
        0x08002a48:    4668        hF      MOV      r0,sp
        0x08002a4a:    f001f93d    ..=.    BL       ecp_modp ; 0x8003cc8
        0x08002a4e:    0004        ..      MOVS     r4,r0
        0x08002a50:    d18b        ..      BNE      0x800296a ; ecp_double_jac + 150
        0x08002a52:    a909        ..      ADD      r1,sp,#0x24
        0x08002a54:    466a        jF      MOV      r2,sp
        0x08002a56:    4608        .F      MOV      r0,r1
        0x08002a58:    f003f8fe    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08002a5c:    e005        ..      B        0x8002a6a ; ecp_double_jac + 406
        0x08002a5e:    e00c        ..      B        0x8002a7a ; ecp_double_jac + 422
        0x08002a60:    a909        ..      ADD      r1,sp,#0x24
        0x08002a62:    1d2a        *.      ADDS     r2,r5,#4
        0x08002a64:    4608        .F      MOV      r0,r1
        0x08002a66:    f004f8fa    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08002a6a:    0004        ..      MOVS     r4,r0
        0x08002a6c:    d18d        ..      BNE      0x800298a ; ecp_double_jac + 182
        0x08002a6e:    1d29        ).      ADDS     r1,r5,#4
        0x08002a70:    a809        ..      ADD      r0,sp,#0x24
        0x08002a72:    f003f981    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08002a76:    2800        .(      CMP      r0,#0
        0x08002a78:    daf2        ..      BGE      0x8002a60 ; ecp_double_jac + 396
        0x08002a7a:    f106020c    ....    ADD      r2,r6,#0xc
        0x08002a7e:    4691        .F      MOV      r9,r2
        0x08002a80:    4611        .F      MOV      r1,r2
        0x08002a82:    a803        ..      ADD      r0,sp,#0xc
        0x08002a84:    f003fe24    ..$.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002a88:    0004        ..      MOVS     r4,r0
        0x08002a8a:    d184        ..      BNE      0x8002996 ; ecp_double_jac + 194
        0x08002a8c:    4629        )F      MOV      r1,r5
        0x08002a8e:    a803        ..      ADD      r0,sp,#0xc
        0x08002a90:    f001f91a    ....    BL       ecp_modp ; 0x8003cc8
        0x08002a94:    0004        ..      MOVS     r4,r0
        0x08002a96:    d18b        ..      BNE      0x80029b0 ; ecp_double_jac + 220
        0x08002a98:    2101        .!      MOVS     r1,#1
        0x08002a9a:    a803        ..      ADD      r0,sp,#0xc
        0x08002a9c:    f004f812    ....    BL       mbedtls_mpi_shift_l ; 0x8006ac4
        0x08002aa0:    e004        ..      B        0x8002aac ; ecp_double_jac + 472
        0x08002aa2:    a903        ..      ADD      r1,sp,#0xc
        0x08002aa4:    1d2a        *.      ADDS     r2,r5,#4
        0x08002aa6:    4608        .F      MOV      r0,r1
        0x08002aa8:    f004f8d9    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08002aac:    0004        ..      MOVS     r4,r0
        0x08002aae:    d18c        ..      BNE      0x80029ca ; ecp_double_jac + 246
        0x08002ab0:    1d29        ).      ADDS     r1,r5,#4
        0x08002ab2:    a803        ..      ADD      r0,sp,#0xc
        0x08002ab4:    f003f960    ..`.    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08002ab8:    2800        .(      CMP      r0,#0
        0x08002aba:    daf2        ..      BGE      0x8002aa2 ; ecp_double_jac + 462
        0x08002abc:    aa03        ..      ADD      r2,sp,#0xc
        0x08002abe:    4631        1F      MOV      r1,r6
        0x08002ac0:    4668        hF      MOV      r0,sp
        0x08002ac2:    f003fe05    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002ac6:    0004        ..      MOVS     r4,r0
        0x08002ac8:    d18c        ..      BNE      0x80029e4 ; ecp_double_jac + 272
        0x08002aca:    4629        )F      MOV      r1,r5
        0x08002acc:    4668        hF      MOV      r0,sp
        0x08002ace:    f001f8fb    ....    BL       ecp_modp ; 0x8003cc8
        0x08002ad2:    0004        ..      MOVS     r4,r0
        0x08002ad4:    d186        ..      BNE      0x80029e4 ; ecp_double_jac + 272
        0x08002ad6:    2101        .!      MOVS     r1,#1
        0x08002ad8:    4668        hF      MOV      r0,sp
        0x08002ada:    f003fff3    ....    BL       mbedtls_mpi_shift_l ; 0x8006ac4
        0x08002ade:    e004        ..      B        0x8002aea ; ecp_double_jac + 534
        0x08002ae0:    4669        iF      MOV      r1,sp
        0x08002ae2:    1d2a        *.      ADDS     r2,r5,#4
        0x08002ae4:    4608        .F      MOV      r0,r1
        0x08002ae6:    f004f8ba    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08002aea:    0004        ..      MOVS     r4,r0
        0x08002aec:    d17d        }.      BNE      0x8002bea ; ecp_double_jac + 790
        0x08002aee:    1d29        ).      ADDS     r1,r5,#4
        0x08002af0:    4668        hF      MOV      r0,sp
        0x08002af2:    f003f941    ..A.    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08002af6:    2800        .(      CMP      r0,#0
        0x08002af8:    daf2        ..      BGE      0x8002ae0 ; ecp_double_jac + 524
        0x08002afa:    aa03        ..      ADD      r2,sp,#0xc
        0x08002afc:    4611        .F      MOV      r1,r2
        0x08002afe:    a806        ..      ADD      r0,sp,#0x18
        0x08002b00:    f003fde6    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002b04:    0004        ..      MOVS     r4,r0
        0x08002b06:    d170        p.      BNE      0x8002bea ; ecp_double_jac + 790
        0x08002b08:    4629        )F      MOV      r1,r5
        0x08002b0a:    a806        ..      ADD      r0,sp,#0x18
        0x08002b0c:    f001f8dc    ....    BL       ecp_modp ; 0x8003cc8
        0x08002b10:    0004        ..      MOVS     r4,r0
        0x08002b12:    d16a        j.      BNE      0x8002bea ; ecp_double_jac + 790
        0x08002b14:    2101        .!      MOVS     r1,#1
        0x08002b16:    a806        ..      ADD      r0,sp,#0x18
        0x08002b18:    f003ffd4    ....    BL       mbedtls_mpi_shift_l ; 0x8006ac4
        0x08002b1c:    e004        ..      B        0x8002b28 ; ecp_double_jac + 596
        0x08002b1e:    a906        ..      ADD      r1,sp,#0x18
        0x08002b20:    1d2a        *.      ADDS     r2,r5,#4
        0x08002b22:    4608        .F      MOV      r0,r1
        0x08002b24:    f004f89b    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08002b28:    0004        ..      MOVS     r4,r0
        0x08002b2a:    d15e        ^.      BNE      0x8002bea ; ecp_double_jac + 790
        0x08002b2c:    1d29        ).      ADDS     r1,r5,#4
        0x08002b2e:    a806        ..      ADD      r0,sp,#0x18
        0x08002b30:    f003f922    ..".    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08002b34:    2800        .(      CMP      r0,#0
        0x08002b36:    daf2        ..      BGE      0x8002b1e ; ecp_double_jac + 586
        0x08002b38:    aa09        ..      ADD      r2,sp,#0x24
        0x08002b3a:    4611        .F      MOV      r1,r2
        0x08002b3c:    a803        ..      ADD      r0,sp,#0xc
        0x08002b3e:    f003fdc7    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002b42:    0004        ..      MOVS     r4,r0
        0x08002b44:    d151        Q.      BNE      0x8002bea ; ecp_double_jac + 790
        0x08002b46:    4629        )F      MOV      r1,r5
        0x08002b48:    a803        ..      ADD      r0,sp,#0xc
        0x08002b4a:    f001f8bd    ....    BL       ecp_modp ; 0x8003cc8
        0x08002b4e:    0004        ..      MOVS     r4,r0
        0x08002b50:    d14b        K.      BNE      0x8002bea ; ecp_double_jac + 790
        0x08002b52:    a903        ..      ADD      r1,sp,#0xc
        0x08002b54:    466a        jF      MOV      r2,sp
        0x08002b56:    4608        .F      MOV      r0,r1
        0x08002b58:    f004f8d0    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x08002b5c:    e004        ..      B        0x8002b68 ; ecp_double_jac + 660
        0x08002b5e:    a903        ..      ADD      r1,sp,#0xc
        0x08002b60:    1d2a        *.      ADDS     r2,r5,#4
        0x08002b62:    4608        .F      MOV      r0,r1
        0x08002b64:    f003f878    ..x.    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08002b68:    0004        ..      MOVS     r4,r0
        0x08002b6a:    d13e        >.      BNE      0x8002bea ; ecp_double_jac + 790
        0x08002b6c:    9803        ..      LDR      r0,[sp,#0xc]
        0x08002b6e:    2800        .(      CMP      r0,#0
        0x08002b70:    da05        ..      BGE      0x8002b7e ; ecp_double_jac + 682
        0x08002b72:    2100        .!      MOVS     r1,#0
        0x08002b74:    a803        ..      ADD      r0,sp,#0xc
        0x08002b76:    f003f8e7    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08002b7a:    2800        .(      CMP      r0,#0
        0x08002b7c:    d1ef        ..      BNE      0x8002b5e ; ecp_double_jac + 650
        0x08002b7e:    a903        ..      ADD      r1,sp,#0xc
        0x08002b80:    466a        jF      MOV      r2,sp
        0x08002b82:    4608        .F      MOV      r0,r1
        0x08002b84:    f004f8ba    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x08002b88:    e004        ..      B        0x8002b94 ; ecp_double_jac + 704
        0x08002b8a:    a903        ..      ADD      r1,sp,#0xc
        0x08002b8c:    1d2a        *.      ADDS     r2,r5,#4
        0x08002b8e:    4608        .F      MOV      r0,r1
        0x08002b90:    f003f862    ..b.    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08002b94:    0004        ..      MOVS     r4,r0
        0x08002b96:    d175        u.      BNE      0x8002c84 ; ecp_double_jac + 944
        0x08002b98:    9803        ..      LDR      r0,[sp,#0xc]
        0x08002b9a:    2800        .(      CMP      r0,#0
        0x08002b9c:    da05        ..      BGE      0x8002baa ; ecp_double_jac + 726
        0x08002b9e:    2100        .!      MOVS     r1,#0
        0x08002ba0:    a803        ..      ADD      r0,sp,#0xc
        0x08002ba2:    f003f8d1    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08002ba6:    2800        .(      CMP      r0,#0
        0x08002ba8:    d1ef        ..      BNE      0x8002b8a ; ecp_double_jac + 694
        0x08002baa:    4669        iF      MOV      r1,sp
        0x08002bac:    aa03        ..      ADD      r2,sp,#0xc
        0x08002bae:    4608        .F      MOV      r0,r1
        0x08002bb0:    f004f8a4    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x08002bb4:    e004        ..      B        0x8002bc0 ; ecp_double_jac + 748
        0x08002bb6:    4669        iF      MOV      r1,sp
        0x08002bb8:    1d2a        *.      ADDS     r2,r5,#4
        0x08002bba:    4608        .F      MOV      r0,r1
        0x08002bbc:    f003f84c    ..L.    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08002bc0:    0004        ..      MOVS     r4,r0
        0x08002bc2:    d15f        _.      BNE      0x8002c84 ; ecp_double_jac + 944
        0x08002bc4:    9800        ..      LDR      r0,[sp,#0]
        0x08002bc6:    2800        .(      CMP      r0,#0
        0x08002bc8:    da05        ..      BGE      0x8002bd6 ; ecp_double_jac + 770
        0x08002bca:    2100        .!      MOVS     r1,#0
        0x08002bcc:    4668        hF      MOV      r0,sp
        0x08002bce:    f003f8bb    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08002bd2:    2800        .(      CMP      r0,#0
        0x08002bd4:    d1ef        ..      BNE      0x8002bb6 ; ecp_double_jac + 738
        0x08002bd6:    4669        iF      MOV      r1,sp
        0x08002bd8:    aa09        ..      ADD      r2,sp,#0x24
        0x08002bda:    4608        .F      MOV      r0,r1
        0x08002bdc:    f003fd78    ..x.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002be0:    0004        ..      MOVS     r4,r0
        0x08002be2:    d14f        O.      BNE      0x8002c84 ; ecp_double_jac + 944
        0x08002be4:    4629        )F      MOV      r1,r5
        0x08002be6:    4668        hF      MOV      r0,sp
        0x08002be8:    e000        ..      B        0x8002bec ; ecp_double_jac + 792
        0x08002bea:    e04b        K.      B        0x8002c84 ; ecp_double_jac + 944
        0x08002bec:    f001f86c    ..l.    BL       ecp_modp ; 0x8003cc8
        0x08002bf0:    0004        ..      MOVS     r4,r0
        0x08002bf2:    d147        G.      BNE      0x8002c84 ; ecp_double_jac + 944
        0x08002bf4:    4669        iF      MOV      r1,sp
        0x08002bf6:    aa06        ..      ADD      r2,sp,#0x18
        0x08002bf8:    4608        .F      MOV      r0,r1
        0x08002bfa:    f004f87f    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x08002bfe:    e004        ..      B        0x8002c0a ; ecp_double_jac + 822
        0x08002c00:    4669        iF      MOV      r1,sp
        0x08002c02:    1d2a        *.      ADDS     r2,r5,#4
        0x08002c04:    4608        .F      MOV      r0,r1
        0x08002c06:    f003f827    ..'.    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08002c0a:    0004        ..      MOVS     r4,r0
        0x08002c0c:    d13a        :.      BNE      0x8002c84 ; ecp_double_jac + 944
        0x08002c0e:    9800        ..      LDR      r0,[sp,#0]
        0x08002c10:    2800        .(      CMP      r0,#0
        0x08002c12:    da05        ..      BGE      0x8002c20 ; ecp_double_jac + 844
        0x08002c14:    2100        .!      MOVS     r1,#0
        0x08002c16:    4668        hF      MOV      r0,sp
        0x08002c18:    f003f896    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08002c1c:    2800        .(      CMP      r0,#0
        0x08002c1e:    d1ef        ..      BNE      0x8002c00 ; ecp_double_jac + 812
        0x08002c20:    4642        BF      MOV      r2,r8
        0x08002c22:    4649        IF      MOV      r1,r9
        0x08002c24:    a806        ..      ADD      r0,sp,#0x18
        0x08002c26:    f003fd53    ..S.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002c2a:    0004        ..      MOVS     r4,r0
        0x08002c2c:    d12a        *.      BNE      0x8002c84 ; ecp_double_jac + 944
        0x08002c2e:    4629        )F      MOV      r1,r5
        0x08002c30:    a806        ..      ADD      r0,sp,#0x18
        0x08002c32:    f001f849    ..I.    BL       ecp_modp ; 0x8003cc8
        0x08002c36:    0004        ..      MOVS     r4,r0
        0x08002c38:    d124        $.      BNE      0x8002c84 ; ecp_double_jac + 944
        0x08002c3a:    2101        .!      MOVS     r1,#1
        0x08002c3c:    a806        ..      ADD      r0,sp,#0x18
        0x08002c3e:    f003ff41    ..A.    BL       mbedtls_mpi_shift_l ; 0x8006ac4
        0x08002c42:    e004        ..      B        0x8002c4e ; ecp_double_jac + 890
        0x08002c44:    a906        ..      ADD      r1,sp,#0x18
        0x08002c46:    1d2a        *.      ADDS     r2,r5,#4
        0x08002c48:    4608        .F      MOV      r0,r1
        0x08002c4a:    f004f808    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08002c4e:    0004        ..      MOVS     r4,r0
        0x08002c50:    d118        ..      BNE      0x8002c84 ; ecp_double_jac + 944
        0x08002c52:    1d29        ).      ADDS     r1,r5,#4
        0x08002c54:    a806        ..      ADD      r0,sp,#0x18
        0x08002c56:    f003f88f    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08002c5a:    2800        .(      CMP      r0,#0
        0x08002c5c:    daf2        ..      BGE      0x8002c44 ; ecp_double_jac + 880
        0x08002c5e:    a903        ..      ADD      r1,sp,#0xc
        0x08002c60:    4638        8F      MOV      r0,r7
        0x08002c62:    f003f8cf    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08002c66:    0004        ..      MOVS     r4,r0
        0x08002c68:    d10c        ..      BNE      0x8002c84 ; ecp_double_jac + 944
        0x08002c6a:    4669        iF      MOV      r1,sp
        0x08002c6c:    f107000c    ....    ADD      r0,r7,#0xc
        0x08002c70:    f003f8c8    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08002c74:    0004        ..      MOVS     r4,r0
        0x08002c76:    d105        ..      BNE      0x8002c84 ; ecp_double_jac + 944
        0x08002c78:    a906        ..      ADD      r1,sp,#0x18
        0x08002c7a:    f1070018    ....    ADD      r0,r7,#0x18
        0x08002c7e:    f003f8c1    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08002c82:    4604        .F      MOV      r4,r0
        0x08002c84:    a809        ..      ADD      r0,sp,#0x24
        0x08002c86:    f003faae    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08002c8a:    4668        hF      MOV      r0,sp
        0x08002c8c:    f003faab    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08002c90:    a803        ..      ADD      r0,sp,#0xc
        0x08002c92:    f003faa8    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08002c96:    a806        ..      ADD      r0,sp,#0x18
        0x08002c98:    f003faa5    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08002c9c:    b00d        ..      ADD      sp,sp,#0x34
        0x08002c9e:    4620         F      MOV      r0,r4
        0x08002ca0:    e8bd83f0    ....    POP      {r4-r9,pc}
    i.ecp_group_load
    ecp_group_load
        0x08002ca4:    e92d5ff0    -.._    PUSH     {r4-r12,lr}
        0x08002ca8:    4604        .F      MOV      r4,r0
        0x08002caa:    e9dd8611    ....    LDRD     r8,r6,[sp,#0x44]
        0x08002cae:    e9dda70b    ....    LDRD     r10,r7,[sp,#0x2c]
        0x08002cb2:    461d        .F      MOV      r5,r3
        0x08002cb4:    1d00        ..      ADDS     r0,r0,#4
        0x08002cb6:    f8ddb028    ..(.    LDR      r11,[sp,#0x28]
        0x08002cba:    f8dd9038    ..8.    LDR      r9,[sp,#0x38]
        0x08002cbe:    f7fff9ff    ....    BL       ecp_mpi_load ; 0x80020c0
        0x08002cc2:    b12d        -.      CBZ      r5,0x8002cd0 ; ecp_group_load + 44
        0x08002cc4:    465a        ZF      MOV      r2,r11
        0x08002cc6:    4629        )F      MOV      r1,r5
        0x08002cc8:    f1040010    ....    ADD      r0,r4,#0x10
        0x08002ccc:    f7fff9f8    ....    BL       ecp_mpi_load ; 0x80020c0
        0x08002cd0:    463a        :F      MOV      r2,r7
        0x08002cd2:    4651        QF      MOV      r1,r10
        0x08002cd4:    f104001c    ....    ADD      r0,r4,#0x1c
        0x08002cd8:    f7fff9f2    ....    BL       ecp_mpi_load ; 0x80020c0
        0x08002cdc:    4632        2F      MOV      r2,r6
        0x08002cde:    f104004c    ..L.    ADD      r0,r4,#0x4c
        0x08002ce2:    4641        AF      MOV      r1,r8
        0x08002ce4:    4606        .F      MOV      r6,r0
        0x08002ce6:    f7fff9eb    ....    BL       ecp_mpi_load ; 0x80020c0
        0x08002cea:    464a        JF      MOV      r2,r9
        0x08002cec:    f1040028    ..(.    ADD      r0,r4,#0x28
        0x08002cf0:    990d        ..      LDR      r1,[sp,#0x34]
        0x08002cf2:    f7fff9e5    ....    BL       ecp_mpi_load ; 0x80020c0
        0x08002cf6:    e9dd120f    ....    LDRD     r1,r2,[sp,#0x3c]
        0x08002cfa:    f1040034    ..4.    ADD      r0,r4,#0x34
        0x08002cfe:    f7fff9df    ....    BL       ecp_mpi_load ; 0x80020c0
        0x08002d02:    2501        .%      MOVS     r5,#1
        0x08002d04:    4807        .H      LDR      r0,[pc,#28] ; [0x8002d24] = 0x20000020
        0x08002d06:    6425        %d      STR      r5,[r4,#0x40]
        0x08002d08:    e9c45011    ...P    STRD     r5,r0,[r4,#0x44]
        0x08002d0c:    1d20         .      ADDS     r0,r4,#4
        0x08002d0e:    f002ffca    ....    BL       mbedtls_mpi_bitlen ; 0x8005ca6
        0x08002d12:    65a0        .e      STR      r0,[r4,#0x58]
        0x08002d14:    4630        0F      MOV      r0,r6
        0x08002d16:    f002ffc6    ....    BL       mbedtls_mpi_bitlen ; 0x8005ca6
        0x08002d1a:    e9c40517    ....    STRD     r0,r5,[r4,#0x5c]
        0x08002d1e:    2000        .       MOVS     r0,#0
        0x08002d20:    e8bd9ff0    ....    POP      {r4-r12,pc}
    $d
        0x08002d24:    20000020     ..     DCD    536870944
    $t
    i.ecp_mod_koblitz
    ecp_mod_koblitz
        0x08002d28:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x08002d2c:    b095        ..      SUB      sp,sp,#0x54
        0x08002d2e:    4605        .F      MOV      r5,r0
        0x08002d30:    e9dda91e    ....    LDRD     r10,r9,[sp,#0x78]
        0x08002d34:    6840        @h      LDR      r0,[r0,#4]
        0x08002d36:    4614        .F      MOV      r4,r2
        0x08002d38:    461f        .F      MOV      r7,r3
        0x08002d3a:    42a0        .B      CMP      r0,r4
        0x08002d3c:    d203        ..      BCS      0x8002d46 ; ecp_mod_koblitz + 30
        0x08002d3e:    2000        .       MOVS     r0,#0
        0x08002d40:    b015        ..      ADD      sp,sp,#0x54
        0x08002d42:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x08002d46:    9103        ..      STR      r1,[sp,#0xc]
        0x08002d48:    2001        .       MOVS     r0,#1
        0x08002d4a:    2102        .!      MOVS     r1,#2
        0x08002d4c:    e9cd0101    ....    STRD     r0,r1,[sp,#4]
        0x08002d50:    9011        ..      STR      r0,[sp,#0x44]
        0x08002d52:    a804        ..      ADD      r0,sp,#0x10
        0x08002d54:    9013        ..      STR      r0,[sp,#0x4c]
        0x08002d56:    6869        ih      LDR      r1,[r5,#4]
        0x08002d58:    eba40b07    ....    SUB      r11,r4,r7
        0x08002d5c:    eba1010b    ....    SUB      r1,r1,r11
        0x08002d60:    eb040807    ....    ADD      r8,r4,r7
        0x08002d64:    9112        ..      STR      r1,[sp,#0x48]
        0x08002d66:    4541        AE      CMP      r1,r8
        0x08002d68:    d901        ..      BLS      0x8002d6e ; ecp_mod_koblitz + 70
        0x08002d6a:    f8cd8048    ..H.    STR      r8,[sp,#0x48]
        0x08002d6e:    212c        ,!      MOVS     r1,#0x2c
        0x08002d70:    a804        ..      ADD      r0,sp,#0x10
        0x08002d72:    f7fdfbf3    ....    BL       __aeabi_memclr4 ; 0x800055c
        0x08002d76:    68a8        .h      LDR      r0,[r5,#8]
        0x08002d78:    eb000084    ....    ADD      r0,r0,r4,LSL #2
        0x08002d7c:    eba00187    ....    SUB      r1,r0,r7,LSL #2
        0x08002d80:    9812        ..      LDR      r0,[sp,#0x48]
        0x08002d82:    0082        ..      LSLS     r2,r0,#2
        0x08002d84:    a804        ..      ADD      r0,sp,#0x10
        0x08002d86:    f7fdfb8a    ....    BL       __aeabi_memcpy4 ; 0x800049e
        0x08002d8a:    f1ba0000    ....    SUBS     r0,r10,#0
        0x08002d8e:    d005        ..      BEQ      0x8002d9c ; ecp_mod_koblitz + 116
        0x08002d90:    4601        .F      MOV      r1,r0
        0x08002d92:    a811        ..      ADD      r0,sp,#0x44
        0x08002d94:    f003fee6    ....    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x08002d98:    2800        .(      CMP      r0,#0
        0x08002d9a:    d1d1        ..      BNE      0x8002d40 ; ecp_mod_koblitz + 24
        0x08002d9c:    9902        ..      LDR      r1,[sp,#8]
        0x08002d9e:    9812        ..      LDR      r0,[sp,#0x48]
        0x08002da0:    f1b90f00    ....    CMP      r9,#0
        0x08002da4:    4408        .D      ADD      r0,r0,r1
        0x08002da6:    f06f0103    o...    MVN      r1,#3
        0x08002daa:    eb010684    ....    ADD      r6,r1,r4,LSL #2
        0x08002dae:    9012        ..      STR      r0,[sp,#0x48]
        0x08002db0:    d004        ..      BEQ      0x8002dbc ; ecp_mod_koblitz + 148
        0x08002db2:    68a8        .h      LDR      r0,[r5,#8]
        0x08002db4:    5981        .Y      LDR      r1,[r0,r6]
        0x08002db6:    ea010109    ....    AND      r1,r1,r9
        0x08002dba:    5181        .Q      STR      r1,[r0,r6]
        0x08002dbc:    4620         F      MOV      r0,r4
        0x08002dbe:    e004        ..      B        0x8002dca ; ecp_mod_koblitz + 162
        0x08002dc0:    68aa        .h      LDR      r2,[r5,#8]
        0x08002dc2:    2100        .!      MOVS     r1,#0
        0x08002dc4:    f8421020    B. .    STR      r1,[r2,r0,LSL #2]
        0x08002dc8:    1c40        @.      ADDS     r0,r0,#1
        0x08002dca:    6869        ih      LDR      r1,[r5,#4]
        0x08002dcc:    4281        .B      CMP      r1,r0
        0x08002dce:    d8f7        ..      BHI      0x8002dc0 ; ecp_mod_koblitz + 152
        0x08002dd0:    a911        ..      ADD      r1,sp,#0x44
        0x08002dd2:    aa01        ..      ADD      r2,sp,#4
        0x08002dd4:    4608        .F      MOV      r0,r1
        0x08002dd6:    f003fc7b    ..{.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002dda:    2800        .(      CMP      r0,#0
        0x08002ddc:    d1b0        ..      BNE      0x8002d40 ; ecp_mod_koblitz + 24
        0x08002dde:    4629        )F      MOV      r1,r5
        0x08002de0:    aa11        ..      ADD      r2,sp,#0x44
        0x08002de2:    4608        .F      MOV      r0,r1
        0x08002de4:    f002fec4    ....    BL       mbedtls_mpi_add_abs ; 0x8005b70
        0x08002de8:    2800        .(      CMP      r0,#0
        0x08002dea:    d1a9        ..      BNE      0x8002d40 ; ecp_mod_koblitz + 24
        0x08002dec:    6869        ih      LDR      r1,[r5,#4]
        0x08002dee:    eba1000b    ....    SUB      r0,r1,r11
        0x08002df2:    9012        ..      STR      r0,[sp,#0x48]
        0x08002df4:    4540        @E      CMP      r0,r8
        0x08002df6:    d901        ..      BLS      0x8002dfc ; ecp_mod_koblitz + 212
        0x08002df8:    f8cd8048    ..H.    STR      r8,[sp,#0x48]
        0x08002dfc:    212c        ,!      MOVS     r1,#0x2c
        0x08002dfe:    a804        ..      ADD      r0,sp,#0x10
        0x08002e00:    f7fdfbac    ....    BL       __aeabi_memclr4 ; 0x800055c
        0x08002e04:    68a8        .h      LDR      r0,[r5,#8]
        0x08002e06:    eb000084    ....    ADD      r0,r0,r4,LSL #2
        0x08002e0a:    eba00187    ....    SUB      r1,r0,r7,LSL #2
        0x08002e0e:    9812        ..      LDR      r0,[sp,#0x48]
        0x08002e10:    0082        ..      LSLS     r2,r0,#2
        0x08002e12:    a804        ..      ADD      r0,sp,#0x10
        0x08002e14:    f7fdfb43    ..C.    BL       __aeabi_memcpy4 ; 0x800049e
        0x08002e18:    f1ba0000    ....    SUBS     r0,r10,#0
        0x08002e1c:    d005        ..      BEQ      0x8002e2a ; ecp_mod_koblitz + 258
        0x08002e1e:    4601        .F      MOV      r1,r0
        0x08002e20:    a811        ..      ADD      r0,sp,#0x44
        0x08002e22:    f003fe9f    ....    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x08002e26:    2800        .(      CMP      r0,#0
        0x08002e28:    d18a        ..      BNE      0x8002d40 ; ecp_mod_koblitz + 24
        0x08002e2a:    9902        ..      LDR      r1,[sp,#8]
        0x08002e2c:    9812        ..      LDR      r0,[sp,#0x48]
        0x08002e2e:    f1b90f00    ....    CMP      r9,#0
        0x08002e32:    4408        .D      ADD      r0,r0,r1
        0x08002e34:    9012        ..      STR      r0,[sp,#0x48]
        0x08002e36:    d004        ..      BEQ      0x8002e42 ; ecp_mod_koblitz + 282
        0x08002e38:    68a8        .h      LDR      r0,[r5,#8]
        0x08002e3a:    5981        .Y      LDR      r1,[r0,r6]
        0x08002e3c:    ea010109    ....    AND      r1,r1,r9
        0x08002e40:    5181        .Q      STR      r1,[r0,r6]
        0x08002e42:    2000        .       MOVS     r0,#0
        0x08002e44:    e003        ..      B        0x8002e4e ; ecp_mod_koblitz + 294
        0x08002e46:    68a9        .h      LDR      r1,[r5,#8]
        0x08002e48:    f8410024    A.$.    STR      r0,[r1,r4,LSL #2]
        0x08002e4c:    1c64        d.      ADDS     r4,r4,#1
        0x08002e4e:    6869        ih      LDR      r1,[r5,#4]
        0x08002e50:    42a1        .B      CMP      r1,r4
        0x08002e52:    d8f8        ..      BHI      0x8002e46 ; ecp_mod_koblitz + 286
        0x08002e54:    a911        ..      ADD      r1,sp,#0x44
        0x08002e56:    aa01        ..      ADD      r2,sp,#4
        0x08002e58:    4608        .F      MOV      r0,r1
        0x08002e5a:    f003fc39    ..9.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08002e5e:    2800        .(      CMP      r0,#0
        0x08002e60:    d19b        ..      BNE      0x8002d9a ; ecp_mod_koblitz + 114
        0x08002e62:    4629        )F      MOV      r1,r5
        0x08002e64:    aa11        ..      ADD      r2,sp,#0x44
        0x08002e66:    4608        .F      MOV      r0,r1
        0x08002e68:    f002fe82    ....    BL       mbedtls_mpi_add_abs ; 0x8005b70
        0x08002e6c:    e768        h.      B        0x8002d40 ; ecp_mod_koblitz + 24
    i.ecp_mod_p192
    ecp_mod_p192
        0x08002e6e:    e92d43f8    -..C    PUSH     {r3-r9,lr}
        0x08002e72:    2600        .&      MOVS     r6,#0
        0x08002e74:    4605        .F      MOV      r5,r0
        0x08002e76:    210c        .!      MOVS     r1,#0xc
        0x08002e78:    9600        ..      STR      r6,[sp,#0]
        0x08002e7a:    f003fa55    ..U.    BL       mbedtls_mpi_grow ; 0x8006328
        0x08002e7e:    ea5f0800    _...    MOVS     r8,r0
        0x08002e82:    d13f        ?.      BNE      0x8002f04 ; ecp_mod_p192 + 150
        0x08002e84:    e9d50401    ....    LDRD     r0,r4,[r5,#4]
        0x08002e88:    eb040780    ....    ADD      r7,r4,r0,LSL #2
        0x08002e8c:    f1040118    ....    ADD      r1,r4,#0x18
        0x08002e90:    466a        jF      MOV      r2,sp
        0x08002e92:    4620         F      MOV      r0,r4
        0x08002e94:    f7fefca0    ....    BL       add64 ; 0x80017d8
        0x08002e98:    68a9        .h      LDR      r1,[r5,#8]
        0x08002e9a:    466a        jF      MOV      r2,sp
        0x08002e9c:    4620         F      MOV      r0,r4
        0x08002e9e:    3128        (1      ADDS     r1,r1,#0x28
        0x08002ea0:    f7fefc9a    ....    BL       add64 ; 0x80017d8
        0x08002ea4:    3408        .4      ADDS     r4,r4,#8
        0x08002ea6:    4669        iF      MOV      r1,sp
        0x08002ea8:    4620         F      MOV      r0,r4
        0x08002eaa:    f7feff35    ..5.    BL       carry64 ; 0x8001d18
        0x08002eae:    68a9        .h      LDR      r1,[r5,#8]
        0x08002eb0:    466a        jF      MOV      r2,sp
        0x08002eb2:    4620         F      MOV      r0,r4
        0x08002eb4:    3118        .1      ADDS     r1,r1,#0x18
        0x08002eb6:    f7fefc8f    ....    BL       add64 ; 0x80017d8
        0x08002eba:    68a9        .h      LDR      r1,[r5,#8]
        0x08002ebc:    466a        jF      MOV      r2,sp
        0x08002ebe:    4620         F      MOV      r0,r4
        0x08002ec0:    3120         1      ADDS     r1,r1,#0x20
        0x08002ec2:    f7fefc89    ....    BL       add64 ; 0x80017d8
        0x08002ec6:    68a9        .h      LDR      r1,[r5,#8]
        0x08002ec8:    466a        jF      MOV      r2,sp
        0x08002eca:    4620         F      MOV      r0,r4
        0x08002ecc:    3128        (1      ADDS     r1,r1,#0x28
        0x08002ece:    f7fefc83    ....    BL       add64 ; 0x80017d8
        0x08002ed2:    3408        .4      ADDS     r4,r4,#8
        0x08002ed4:    4669        iF      MOV      r1,sp
        0x08002ed6:    4620         F      MOV      r0,r4
        0x08002ed8:    f7feff1e    ....    BL       carry64 ; 0x8001d18
        0x08002edc:    68a9        .h      LDR      r1,[r5,#8]
        0x08002ede:    466a        jF      MOV      r2,sp
        0x08002ee0:    4620         F      MOV      r0,r4
        0x08002ee2:    3120         1      ADDS     r1,r1,#0x20
        0x08002ee4:    f7fefc78    ..x.    BL       add64 ; 0x80017d8
        0x08002ee8:    68a9        .h      LDR      r1,[r5,#8]
        0x08002eea:    466a        jF      MOV      r2,sp
        0x08002eec:    4620         F      MOV      r0,r4
        0x08002eee:    3128        (1      ADDS     r1,r1,#0x28
        0x08002ef0:    f7fefc72    ..r.    BL       add64 ; 0x80017d8
        0x08002ef4:    9800        ..      LDR      r0,[sp,#0]
        0x08002ef6:    f8440f08    D...    STR      r0,[r4,#8]!
        0x08002efa:    e000        ..      B        0x8002efe ; ecp_mod_p192 + 144
        0x08002efc:    6026        &`      STR      r6,[r4,#0]
        0x08002efe:    1d24        $.      ADDS     r4,r4,#4
        0x08002f00:    42bc        .B      CMP      r4,r7
        0x08002f02:    d3fb        ..      BCC      0x8002efc ; ecp_mod_p192 + 142
        0x08002f04:    4640        @F      MOV      r0,r8
        0x08002f06:    e8bd83f8    ....    POP      {r3-r9,pc}
    i.ecp_mod_p224
    ecp_mod_p224
        0x08002f0a:    b5f0        ..      PUSH     {r4-r7,lr}
        0x08002f0c:    b091        ..      SUB      sp,sp,#0x44
        0x08002f0e:    4604        .F      MOV      r4,r0
        0x08002f10:    2001        .       MOVS     r0,#1
        0x08002f12:    9003        ..      STR      r0,[sp,#0xc]
        0x08002f14:    2008        .       MOVS     r0,#8
        0x08002f16:    9004        ..      STR      r0,[sp,#0x10]
        0x08002f18:    2500        .%      MOVS     r5,#0
        0x08002f1a:    a806        ..      ADD      r0,sp,#0x18
        0x08002f1c:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x08002f20:    27e0        .'      MOVS     r7,#0xe0
        0x08002f22:    2120         !      MOVS     r1,#0x20
        0x08002f24:    9005        ..      STR      r0,[sp,#0x14]
        0x08002f26:    f7fdfb19    ....    BL       __aeabi_memclr4 ; 0x800055c
        0x08002f2a:    210e        .!      MOVS     r1,#0xe
        0x08002f2c:    4620         F      MOV      r0,r4
        0x08002f2e:    f003f9fb    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x08002f32:    0006        ..      MOVS     r6,r0
        0x08002f34:    d17d        }.      BNE      0x8003032 ; ecp_mod_p224 + 296
        0x08002f36:    68a0        .h      LDR      r0,[r4,#8]
        0x08002f38:    aa01        ..      ADD      r2,sp,#4
        0x08002f3a:    6800        .h      LDR      r0,[r0,#0]
        0x08002f3c:    9000        ..      STR      r0,[sp,#0]
        0x08002f3e:    68a0        .h      LDR      r0,[r4,#8]
        0x08002f40:    69c1        .i      LDR      r1,[r0,#0x1c]
        0x08002f42:    4668        hF      MOV      r0,sp
        0x08002f44:    f004faf9    ....    BL       sub32 ; 0x800753a
        0x08002f48:    68a0        .h      LDR      r0,[r4,#8]
        0x08002f4a:    aa01        ..      ADD      r2,sp,#4
        0x08002f4c:    6ac1        .j      LDR      r1,[r0,#0x2c]
        0x08002f4e:    4668        hF      MOV      r0,sp
        0x08002f50:    f004faf3    ....    BL       sub32 ; 0x800753a
        0x08002f54:    68a1        .h      LDR      r1,[r4,#8]
        0x08002f56:    9800        ..      LDR      r0,[sp,#0]
        0x08002f58:    aa01        ..      ADD      r2,sp,#4
        0x08002f5a:    6008        .`      STR      r0,[r1,#0]
        0x08002f5c:    68a0        .h      LDR      r0,[r4,#8]
        0x08002f5e:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08002f62:    6840        @h      LDR      r0,[r0,#4]
        0x08002f64:    9000        ..      STR      r0,[sp,#0]
        0x08002f66:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x08002f6a:    2900        .)      CMP      r1,#0
        0x08002f6c:    da04        ..      BGE      0x8002f78 ; ecp_mod_p224 + 110
        0x08002f6e:    4249        IB      RSBS     r1,r1,#0
        0x08002f70:    4668        hF      MOV      r0,sp
        0x08002f72:    f004fae2    ....    BL       sub32 ; 0x800753a
        0x08002f76:    e002        ..      B        0x8002f7e ; ecp_mod_p224 + 116
        0x08002f78:    4668        hF      MOV      r0,sp
        0x08002f7a:    f7fefc20    .. .    BL       add32 ; 0x80017be
        0x08002f7e:    68a0        .h      LDR      r0,[r4,#8]
        0x08002f80:    aa01        ..      ADD      r2,sp,#4
        0x08002f82:    6a01        .j      LDR      r1,[r0,#0x20]
        0x08002f84:    4668        hF      MOV      r0,sp
        0x08002f86:    f004fad8    ....    BL       sub32 ; 0x800753a
        0x08002f8a:    68a0        .h      LDR      r0,[r4,#8]
        0x08002f8c:    aa01        ..      ADD      r2,sp,#4
        0x08002f8e:    6b01        .k      LDR      r1,[r0,#0x30]
        0x08002f90:    4668        hF      MOV      r0,sp
        0x08002f92:    f004fad2    ....    BL       sub32 ; 0x800753a
        0x08002f96:    68a1        .h      LDR      r1,[r4,#8]
        0x08002f98:    9800        ..      LDR      r0,[sp,#0]
        0x08002f9a:    aa01        ..      ADD      r2,sp,#4
        0x08002f9c:    6048        H`      STR      r0,[r1,#4]
        0x08002f9e:    68a0        .h      LDR      r0,[r4,#8]
        0x08002fa0:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08002fa4:    6880        .h      LDR      r0,[r0,#8]
        0x08002fa6:    9000        ..      STR      r0,[sp,#0]
        0x08002fa8:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x08002fac:    2900        .)      CMP      r1,#0
        0x08002fae:    da04        ..      BGE      0x8002fba ; ecp_mod_p224 + 176
        0x08002fb0:    4249        IB      RSBS     r1,r1,#0
        0x08002fb2:    4668        hF      MOV      r0,sp
        0x08002fb4:    f004fac1    ....    BL       sub32 ; 0x800753a
        0x08002fb8:    e002        ..      B        0x8002fc0 ; ecp_mod_p224 + 182
        0x08002fba:    4668        hF      MOV      r0,sp
        0x08002fbc:    f7fefbff    ....    BL       add32 ; 0x80017be
        0x08002fc0:    68a0        .h      LDR      r0,[r4,#8]
        0x08002fc2:    aa01        ..      ADD      r2,sp,#4
        0x08002fc4:    6a41        Aj      LDR      r1,[r0,#0x24]
        0x08002fc6:    4668        hF      MOV      r0,sp
        0x08002fc8:    f004fab7    ....    BL       sub32 ; 0x800753a
        0x08002fcc:    68a0        .h      LDR      r0,[r4,#8]
        0x08002fce:    aa01        ..      ADD      r2,sp,#4
        0x08002fd0:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x08002fd2:    4668        hF      MOV      r0,sp
        0x08002fd4:    f004fab1    ....    BL       sub32 ; 0x800753a
        0x08002fd8:    68a1        .h      LDR      r1,[r4,#8]
        0x08002fda:    9800        ..      LDR      r0,[sp,#0]
        0x08002fdc:    aa01        ..      ADD      r2,sp,#4
        0x08002fde:    6088        .`      STR      r0,[r1,#8]
        0x08002fe0:    68a0        .h      LDR      r0,[r4,#8]
        0x08002fe2:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08002fe6:    68c0        .h      LDR      r0,[r0,#0xc]
        0x08002fe8:    9000        ..      STR      r0,[sp,#0]
        0x08002fea:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x08002fee:    2900        .)      CMP      r1,#0
        0x08002ff0:    da04        ..      BGE      0x8002ffc ; ecp_mod_p224 + 242
        0x08002ff2:    4249        IB      RSBS     r1,r1,#0
        0x08002ff4:    4668        hF      MOV      r0,sp
        0x08002ff6:    f004faa0    ....    BL       sub32 ; 0x800753a
        0x08002ffa:    e002        ..      B        0x8003002 ; ecp_mod_p224 + 248
        0x08002ffc:    4668        hF      MOV      r0,sp
        0x08002ffe:    f7fefbde    ....    BL       add32 ; 0x80017be
        0x08003002:    68a0        .h      LDR      r0,[r4,#8]
        0x08003004:    aa01        ..      ADD      r2,sp,#4
        0x08003006:    6a81        .j      LDR      r1,[r0,#0x28]
        0x08003008:    4668        hF      MOV      r0,sp
        0x0800300a:    f004fa96    ....    BL       sub32 ; 0x800753a
        0x0800300e:    68a0        .h      LDR      r0,[r4,#8]
        0x08003010:    aa01        ..      ADD      r2,sp,#4
        0x08003012:    69c1        .i      LDR      r1,[r0,#0x1c]
        0x08003014:    4668        hF      MOV      r0,sp
        0x08003016:    f7fefbd2    ....    BL       add32 ; 0x80017be
        0x0800301a:    68a0        .h      LDR      r0,[r4,#8]
        0x0800301c:    aa01        ..      ADD      r2,sp,#4
        0x0800301e:    6ac1        .j      LDR      r1,[r0,#0x2c]
        0x08003020:    4668        hF      MOV      r0,sp
        0x08003022:    f7fefbcc    ....    BL       add32 ; 0x80017be
        0x08003026:    68a1        .h      LDR      r1,[r4,#8]
        0x08003028:    9800        ..      LDR      r0,[sp,#0]
        0x0800302a:    60c8        .`      STR      r0,[r1,#0xc]
        0x0800302c:    68a0        .h      LDR      r0,[r4,#8]
        0x0800302e:    6900        .i      LDR      r0,[r0,#0x10]
        0x08003030:    e000        ..      B        0x8003034 ; ecp_mod_p224 + 298
        0x08003032:    e087        ..      B        0x8003144 ; ecp_mod_p224 + 570
        0x08003034:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003038:    9000        ..      STR      r0,[sp,#0]
        0x0800303a:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x0800303e:    2900        .)      CMP      r1,#0
        0x08003040:    aa01        ..      ADD      r2,sp,#4
        0x08003042:    da04        ..      BGE      0x800304e ; ecp_mod_p224 + 324
        0x08003044:    4249        IB      RSBS     r1,r1,#0
        0x08003046:    4668        hF      MOV      r0,sp
        0x08003048:    f004fa77    ..w.    BL       sub32 ; 0x800753a
        0x0800304c:    e002        ..      B        0x8003054 ; ecp_mod_p224 + 330
        0x0800304e:    4668        hF      MOV      r0,sp
        0x08003050:    f7fefbb5    ....    BL       add32 ; 0x80017be
        0x08003054:    68a0        .h      LDR      r0,[r4,#8]
        0x08003056:    aa01        ..      ADD      r2,sp,#4
        0x08003058:    6ac1        .j      LDR      r1,[r0,#0x2c]
        0x0800305a:    4668        hF      MOV      r0,sp
        0x0800305c:    f004fa6d    ..m.    BL       sub32 ; 0x800753a
        0x08003060:    68a0        .h      LDR      r0,[r4,#8]
        0x08003062:    aa01        ..      ADD      r2,sp,#4
        0x08003064:    6a01        .j      LDR      r1,[r0,#0x20]
        0x08003066:    4668        hF      MOV      r0,sp
        0x08003068:    f7fefba9    ....    BL       add32 ; 0x80017be
        0x0800306c:    68a0        .h      LDR      r0,[r4,#8]
        0x0800306e:    aa01        ..      ADD      r2,sp,#4
        0x08003070:    6b01        .k      LDR      r1,[r0,#0x30]
        0x08003072:    4668        hF      MOV      r0,sp
        0x08003074:    f7fefba3    ....    BL       add32 ; 0x80017be
        0x08003078:    68a1        .h      LDR      r1,[r4,#8]
        0x0800307a:    9800        ..      LDR      r0,[sp,#0]
        0x0800307c:    aa01        ..      ADD      r2,sp,#4
        0x0800307e:    6108        .a      STR      r0,[r1,#0x10]
        0x08003080:    68a0        .h      LDR      r0,[r4,#8]
        0x08003082:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003086:    6940        @i      LDR      r0,[r0,#0x14]
        0x08003088:    9000        ..      STR      r0,[sp,#0]
        0x0800308a:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x0800308e:    2900        .)      CMP      r1,#0
        0x08003090:    da04        ..      BGE      0x800309c ; ecp_mod_p224 + 402
        0x08003092:    4249        IB      RSBS     r1,r1,#0
        0x08003094:    4668        hF      MOV      r0,sp
        0x08003096:    f004fa50    ..P.    BL       sub32 ; 0x800753a
        0x0800309a:    e002        ..      B        0x80030a2 ; ecp_mod_p224 + 408
        0x0800309c:    4668        hF      MOV      r0,sp
        0x0800309e:    f7fefb8e    ....    BL       add32 ; 0x80017be
        0x080030a2:    68a0        .h      LDR      r0,[r4,#8]
        0x080030a4:    aa01        ..      ADD      r2,sp,#4
        0x080030a6:    6b01        .k      LDR      r1,[r0,#0x30]
        0x080030a8:    4668        hF      MOV      r0,sp
        0x080030aa:    f004fa46    ..F.    BL       sub32 ; 0x800753a
        0x080030ae:    68a0        .h      LDR      r0,[r4,#8]
        0x080030b0:    aa01        ..      ADD      r2,sp,#4
        0x080030b2:    6a41        Aj      LDR      r1,[r0,#0x24]
        0x080030b4:    4668        hF      MOV      r0,sp
        0x080030b6:    f7fefb82    ....    BL       add32 ; 0x80017be
        0x080030ba:    68a0        .h      LDR      r0,[r4,#8]
        0x080030bc:    aa01        ..      ADD      r2,sp,#4
        0x080030be:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x080030c0:    4668        hF      MOV      r0,sp
        0x080030c2:    f7fefb7c    ..|.    BL       add32 ; 0x80017be
        0x080030c6:    68a1        .h      LDR      r1,[r4,#8]
        0x080030c8:    9800        ..      LDR      r0,[sp,#0]
        0x080030ca:    aa01        ..      ADD      r2,sp,#4
        0x080030cc:    6148        Ha      STR      r0,[r1,#0x14]
        0x080030ce:    68a0        .h      LDR      r0,[r4,#8]
        0x080030d0:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x080030d4:    6980        .i      LDR      r0,[r0,#0x18]
        0x080030d6:    9000        ..      STR      r0,[sp,#0]
        0x080030d8:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x080030dc:    2900        .)      CMP      r1,#0
        0x080030de:    da04        ..      BGE      0x80030ea ; ecp_mod_p224 + 480
        0x080030e0:    4249        IB      RSBS     r1,r1,#0
        0x080030e2:    4668        hF      MOV      r0,sp
        0x080030e4:    f004fa29    ..).    BL       sub32 ; 0x800753a
        0x080030e8:    e002        ..      B        0x80030f0 ; ecp_mod_p224 + 486
        0x080030ea:    4668        hF      MOV      r0,sp
        0x080030ec:    f7fefb67    ..g.    BL       add32 ; 0x80017be
        0x080030f0:    68a0        .h      LDR      r0,[r4,#8]
        0x080030f2:    aa01        ..      ADD      r2,sp,#4
        0x080030f4:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x080030f6:    4668        hF      MOV      r0,sp
        0x080030f8:    f004fa1f    ....    BL       sub32 ; 0x800753a
        0x080030fc:    68a0        .h      LDR      r0,[r4,#8]
        0x080030fe:    aa01        ..      ADD      r2,sp,#4
        0x08003100:    6a81        .j      LDR      r1,[r0,#0x28]
        0x08003102:    4668        hF      MOV      r0,sp
        0x08003104:    f7fefb5b    ..[.    BL       add32 ; 0x80017be
        0x08003108:    68a1        .h      LDR      r1,[r4,#8]
        0x0800310a:    9800        ..      LDR      r0,[sp,#0]
        0x0800310c:    6188        .a      STR      r0,[r1,#0x18]
        0x0800310e:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003112:    2007        .       MOVS     r0,#7
        0x08003114:    2900        .)      CMP      r1,#0
        0x08003116:    dc00        ..      BGT      0x800311a ; ecp_mod_p224 + 528
        0x08003118:    2100        .!      MOVS     r1,#0
        0x0800311a:    68a2        .h      LDR      r2,[r4,#8]
        0x0800311c:    61d1        .a      STR      r1,[r2,#0x1c]
        0x0800311e:    9500        ..      STR      r5,[sp,#0]
        0x08003120:    e003        ..      B        0x800312a ; ecp_mod_p224 + 544
        0x08003122:    68a2        .h      LDR      r2,[r4,#8]
        0x08003124:    9900        ..      LDR      r1,[sp,#0]
        0x08003126:    f8421020    B. .    STR      r1,[r2,r0,LSL #2]
        0x0800312a:    6861        ah      LDR      r1,[r4,#4]
        0x0800312c:    1c40        @.      ADDS     r0,r0,#1
        0x0800312e:    4288        .B      CMP      r0,r1
        0x08003130:    d3f7        ..      BCC      0x8003122 ; ecp_mod_p224 + 536
        0x08003132:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003136:    2900        .)      CMP      r1,#0
        0x08003138:    da04        ..      BGE      0x8003144 ; ecp_mod_p224 + 570
        0x0800313a:    463b        ;F      MOV      r3,r7
        0x0800313c:    aa03        ..      ADD      r2,sp,#0xc
        0x0800313e:    4620         F      MOV      r0,r4
        0x08003140:    f001fbda    ....    BL       fix_negative ; 0x80048f8
        0x08003144:    b011        ..      ADD      sp,sp,#0x44
        0x08003146:    4630        0F      MOV      r0,r6
        0x08003148:    bdf0        ..      POP      {r4-r7,pc}
        0x0800314a:    0000        ..      MOVS     r0,r0
    i.ecp_mod_p255
    ecp_mod_p255
        0x0800314c:    b510        ..      PUSH     {r4,lr}
        0x0800314e:    4604        .F      MOV      r4,r0
        0x08003150:    6840        @h      LDR      r0,[r0,#4]
        0x08003152:    b08e        ..      SUB      sp,sp,#0x38
        0x08003154:    2808        .(      CMP      r0,#8
        0x08003156:    d202        ..      BCS      0x800315e ; ecp_mod_p255 + 18
        0x08003158:    2000        .       MOVS     r0,#0
        0x0800315a:    b00e        ..      ADD      sp,sp,#0x38
        0x0800315c:    bd10        ..      POP      {r4,pc}
        0x0800315e:    2001        .       MOVS     r0,#1
        0x08003160:    900a        ..      STR      r0,[sp,#0x28]
        0x08003162:    6860        `h      LDR      r0,[r4,#4]
        0x08003164:    1fc0        ..      SUBS     r0,r0,#7
        0x08003166:    900b        ..      STR      r0,[sp,#0x2c]
        0x08003168:    2809        .(      CMP      r0,#9
        0x0800316a:    d901        ..      BLS      0x8003170 ; ecp_mod_p255 + 36
        0x0800316c:    481a        .H      LDR      r0,[pc,#104] ; [0x80031d8] = 0xffffb080
        0x0800316e:    e7f4        ..      B        0x800315a ; ecp_mod_p255 + 14
        0x08003170:    f8cdd030    ..0.    STR      sp,[sp,#0x30]
        0x08003174:    2128        (!      MOVS     r1,#0x28
        0x08003176:    4668        hF      MOV      r0,sp
        0x08003178:    f7fdf9f0    ....    BL       __aeabi_memclr4 ; 0x800055c
        0x0800317c:    980b        ..      LDR      r0,[sp,#0x2c]
        0x0800317e:    68a1        .h      LDR      r1,[r4,#8]
        0x08003180:    0082        ..      LSLS     r2,r0,#2
        0x08003182:    4668        hF      MOV      r0,sp
        0x08003184:    311c        .1      ADDS     r1,r1,#0x1c
        0x08003186:    f7fdf98a    ....    BL       __aeabi_memcpy4 ; 0x800049e
        0x0800318a:    211f        .!      MOVS     r1,#0x1f
        0x0800318c:    a80a        ..      ADD      r0,sp,#0x28
        0x0800318e:    f003fce9    ....    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x08003192:    2800        .(      CMP      r0,#0
        0x08003194:    d1e1        ..      BNE      0x800315a ; ecp_mod_p255 + 14
        0x08003196:    980b        ..      LDR      r0,[sp,#0x2c]
        0x08003198:    2200        ."      MOVS     r2,#0
        0x0800319a:    1c40        @.      ADDS     r0,r0,#1
        0x0800319c:    900b        ..      STR      r0,[sp,#0x2c]
        0x0800319e:    21ff        .!      MOVS     r1,#0xff
        0x080031a0:    4620         F      MOV      r0,r4
        0x080031a2:    f003fc64    ..d.    BL       mbedtls_mpi_set_bit ; 0x8006a6e
        0x080031a6:    2800        .(      CMP      r0,#0
        0x080031a8:    d1d7        ..      BNE      0x800315a ; ecp_mod_p255 + 14
        0x080031aa:    2008        .       MOVS     r0,#8
        0x080031ac:    2100        .!      MOVS     r1,#0
        0x080031ae:    e003        ..      B        0x80031b8 ; ecp_mod_p255 + 108
        0x080031b0:    68a2        .h      LDR      r2,[r4,#8]
        0x080031b2:    f8421020    B. .    STR      r1,[r2,r0,LSL #2]
        0x080031b6:    1c40        @.      ADDS     r0,r0,#1
        0x080031b8:    6862        bh      LDR      r2,[r4,#4]
        0x080031ba:    4282        .B      CMP      r2,r0
        0x080031bc:    d8f8        ..      BHI      0x80031b0 ; ecp_mod_p255 + 100
        0x080031be:    a90a        ..      ADD      r1,sp,#0x28
        0x080031c0:    2213        ."      MOVS     r2,#0x13
        0x080031c2:    4608        .F      MOV      r0,r1
        0x080031c4:    f003fa78    ..x.    BL       mbedtls_mpi_mul_int ; 0x80066b8
        0x080031c8:    2800        .(      CMP      r0,#0
        0x080031ca:    d1c6        ..      BNE      0x800315a ; ecp_mod_p255 + 14
        0x080031cc:    4621        !F      MOV      r1,r4
        0x080031ce:    aa0a        ..      ADD      r2,sp,#0x28
        0x080031d0:    4608        .F      MOV      r0,r1
        0x080031d2:    f002fccd    ....    BL       mbedtls_mpi_add_abs ; 0x8005b70
        0x080031d6:    e7c0        ..      B        0x800315a ; ecp_mod_p255 + 14
    $d
        0x080031d8:    ffffb080    ....    DCD    4294946944
    $t
    i.ecp_mod_p256
    ecp_mod_p256
        0x080031dc:    b5f0        ..      PUSH     {r4-r7,lr}
        0x080031de:    b091        ..      SUB      sp,sp,#0x44
        0x080031e0:    4604        .F      MOV      r4,r0
        0x080031e2:    2001        .       MOVS     r0,#1
        0x080031e4:    9003        ..      STR      r0,[sp,#0xc]
        0x080031e6:    2009        .       MOVS     r0,#9
        0x080031e8:    9004        ..      STR      r0,[sp,#0x10]
        0x080031ea:    2500        .%      MOVS     r5,#0
        0x080031ec:    a806        ..      ADD      r0,sp,#0x18
        0x080031ee:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x080031f2:    f44f7780    O..w    MOV      r7,#0x100
        0x080031f6:    2124        $!      MOVS     r1,#0x24
        0x080031f8:    9005        ..      STR      r0,[sp,#0x14]
        0x080031fa:    f7fdf9af    ....    BL       __aeabi_memclr4 ; 0x800055c
        0x080031fe:    2110        .!      MOVS     r1,#0x10
        0x08003200:    4620         F      MOV      r0,r4
        0x08003202:    f003f891    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x08003206:    0006        ..      MOVS     r6,r0
        0x08003208:    d171        q.      BNE      0x80032ee ; ecp_mod_p256 + 274
        0x0800320a:    68a0        .h      LDR      r0,[r4,#8]
        0x0800320c:    aa01        ..      ADD      r2,sp,#4
        0x0800320e:    6800        .h      LDR      r0,[r0,#0]
        0x08003210:    9000        ..      STR      r0,[sp,#0]
        0x08003212:    68a0        .h      LDR      r0,[r4,#8]
        0x08003214:    6a01        .j      LDR      r1,[r0,#0x20]
        0x08003216:    4668        hF      MOV      r0,sp
        0x08003218:    f7fefad1    ....    BL       add32 ; 0x80017be
        0x0800321c:    68a0        .h      LDR      r0,[r4,#8]
        0x0800321e:    aa01        ..      ADD      r2,sp,#4
        0x08003220:    6a41        Aj      LDR      r1,[r0,#0x24]
        0x08003222:    4668        hF      MOV      r0,sp
        0x08003224:    f7fefacb    ....    BL       add32 ; 0x80017be
        0x08003228:    68a0        .h      LDR      r0,[r4,#8]
        0x0800322a:    aa01        ..      ADD      r2,sp,#4
        0x0800322c:    6ac1        .j      LDR      r1,[r0,#0x2c]
        0x0800322e:    4668        hF      MOV      r0,sp
        0x08003230:    f004f983    ....    BL       sub32 ; 0x800753a
        0x08003234:    68a0        .h      LDR      r0,[r4,#8]
        0x08003236:    aa01        ..      ADD      r2,sp,#4
        0x08003238:    6b01        .k      LDR      r1,[r0,#0x30]
        0x0800323a:    4668        hF      MOV      r0,sp
        0x0800323c:    f004f97d    ..}.    BL       sub32 ; 0x800753a
        0x08003240:    68a0        .h      LDR      r0,[r4,#8]
        0x08003242:    aa01        ..      ADD      r2,sp,#4
        0x08003244:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x08003246:    4668        hF      MOV      r0,sp
        0x08003248:    f004f977    ..w.    BL       sub32 ; 0x800753a
        0x0800324c:    68a0        .h      LDR      r0,[r4,#8]
        0x0800324e:    aa01        ..      ADD      r2,sp,#4
        0x08003250:    6b81        .k      LDR      r1,[r0,#0x38]
        0x08003252:    4668        hF      MOV      r0,sp
        0x08003254:    f004f971    ..q.    BL       sub32 ; 0x800753a
        0x08003258:    68a1        .h      LDR      r1,[r4,#8]
        0x0800325a:    9800        ..      LDR      r0,[sp,#0]
        0x0800325c:    aa01        ..      ADD      r2,sp,#4
        0x0800325e:    6008        .`      STR      r0,[r1,#0]
        0x08003260:    68a0        .h      LDR      r0,[r4,#8]
        0x08003262:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003266:    6840        @h      LDR      r0,[r0,#4]
        0x08003268:    9000        ..      STR      r0,[sp,#0]
        0x0800326a:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x0800326e:    2900        .)      CMP      r1,#0
        0x08003270:    da04        ..      BGE      0x800327c ; ecp_mod_p256 + 160
        0x08003272:    4249        IB      RSBS     r1,r1,#0
        0x08003274:    4668        hF      MOV      r0,sp
        0x08003276:    f004f960    ..`.    BL       sub32 ; 0x800753a
        0x0800327a:    e002        ..      B        0x8003282 ; ecp_mod_p256 + 166
        0x0800327c:    4668        hF      MOV      r0,sp
        0x0800327e:    f7fefa9e    ....    BL       add32 ; 0x80017be
        0x08003282:    68a0        .h      LDR      r0,[r4,#8]
        0x08003284:    aa01        ..      ADD      r2,sp,#4
        0x08003286:    6a41        Aj      LDR      r1,[r0,#0x24]
        0x08003288:    4668        hF      MOV      r0,sp
        0x0800328a:    f7fefa98    ....    BL       add32 ; 0x80017be
        0x0800328e:    68a0        .h      LDR      r0,[r4,#8]
        0x08003290:    aa01        ..      ADD      r2,sp,#4
        0x08003292:    6a81        .j      LDR      r1,[r0,#0x28]
        0x08003294:    4668        hF      MOV      r0,sp
        0x08003296:    f7fefa92    ....    BL       add32 ; 0x80017be
        0x0800329a:    68a0        .h      LDR      r0,[r4,#8]
        0x0800329c:    aa01        ..      ADD      r2,sp,#4
        0x0800329e:    6b01        .k      LDR      r1,[r0,#0x30]
        0x080032a0:    4668        hF      MOV      r0,sp
        0x080032a2:    f004f94a    ..J.    BL       sub32 ; 0x800753a
        0x080032a6:    68a0        .h      LDR      r0,[r4,#8]
        0x080032a8:    aa01        ..      ADD      r2,sp,#4
        0x080032aa:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x080032ac:    4668        hF      MOV      r0,sp
        0x080032ae:    f004f944    ..D.    BL       sub32 ; 0x800753a
        0x080032b2:    68a0        .h      LDR      r0,[r4,#8]
        0x080032b4:    aa01        ..      ADD      r2,sp,#4
        0x080032b6:    6b81        .k      LDR      r1,[r0,#0x38]
        0x080032b8:    4668        hF      MOV      r0,sp
        0x080032ba:    f004f93e    ..>.    BL       sub32 ; 0x800753a
        0x080032be:    68a0        .h      LDR      r0,[r4,#8]
        0x080032c0:    aa01        ..      ADD      r2,sp,#4
        0x080032c2:    6bc1        .k      LDR      r1,[r0,#0x3c]
        0x080032c4:    4668        hF      MOV      r0,sp
        0x080032c6:    f004f938    ..8.    BL       sub32 ; 0x800753a
        0x080032ca:    68a1        .h      LDR      r1,[r4,#8]
        0x080032cc:    9800        ..      LDR      r0,[sp,#0]
        0x080032ce:    aa01        ..      ADD      r2,sp,#4
        0x080032d0:    6048        H`      STR      r0,[r1,#4]
        0x080032d2:    68a0        .h      LDR      r0,[r4,#8]
        0x080032d4:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x080032d8:    6880        .h      LDR      r0,[r0,#8]
        0x080032da:    9000        ..      STR      r0,[sp,#0]
        0x080032dc:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x080032e0:    2900        .)      CMP      r1,#0
        0x080032e2:    da05        ..      BGE      0x80032f0 ; ecp_mod_p256 + 276
        0x080032e4:    4249        IB      RSBS     r1,r1,#0
        0x080032e6:    4668        hF      MOV      r0,sp
        0x080032e8:    f004f927    ..'.    BL       sub32 ; 0x800753a
        0x080032ec:    e003        ..      B        0x80032f6 ; ecp_mod_p256 + 282
        0x080032ee:    e18b        ..      B        0x8003608 ; ecp_mod_p256 + 1068
        0x080032f0:    4668        hF      MOV      r0,sp
        0x080032f2:    f7fefa64    ..d.    BL       add32 ; 0x80017be
        0x080032f6:    68a0        .h      LDR      r0,[r4,#8]
        0x080032f8:    aa01        ..      ADD      r2,sp,#4
        0x080032fa:    6a81        .j      LDR      r1,[r0,#0x28]
        0x080032fc:    4668        hF      MOV      r0,sp
        0x080032fe:    f7fefa5e    ..^.    BL       add32 ; 0x80017be
        0x08003302:    68a0        .h      LDR      r0,[r4,#8]
        0x08003304:    aa01        ..      ADD      r2,sp,#4
        0x08003306:    6ac1        .j      LDR      r1,[r0,#0x2c]
        0x08003308:    4668        hF      MOV      r0,sp
        0x0800330a:    f7fefa58    ..X.    BL       add32 ; 0x80017be
        0x0800330e:    68a0        .h      LDR      r0,[r4,#8]
        0x08003310:    aa01        ..      ADD      r2,sp,#4
        0x08003312:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x08003314:    4668        hF      MOV      r0,sp
        0x08003316:    f004f910    ....    BL       sub32 ; 0x800753a
        0x0800331a:    68a0        .h      LDR      r0,[r4,#8]
        0x0800331c:    aa01        ..      ADD      r2,sp,#4
        0x0800331e:    6b81        .k      LDR      r1,[r0,#0x38]
        0x08003320:    4668        hF      MOV      r0,sp
        0x08003322:    f004f90a    ....    BL       sub32 ; 0x800753a
        0x08003326:    68a0        .h      LDR      r0,[r4,#8]
        0x08003328:    aa01        ..      ADD      r2,sp,#4
        0x0800332a:    6bc1        .k      LDR      r1,[r0,#0x3c]
        0x0800332c:    4668        hF      MOV      r0,sp
        0x0800332e:    f004f904    ....    BL       sub32 ; 0x800753a
        0x08003332:    68a1        .h      LDR      r1,[r4,#8]
        0x08003334:    9800        ..      LDR      r0,[sp,#0]
        0x08003336:    aa01        ..      ADD      r2,sp,#4
        0x08003338:    6088        .`      STR      r0,[r1,#8]
        0x0800333a:    68a0        .h      LDR      r0,[r4,#8]
        0x0800333c:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003340:    68c0        .h      LDR      r0,[r0,#0xc]
        0x08003342:    9000        ..      STR      r0,[sp,#0]
        0x08003344:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x08003348:    2900        .)      CMP      r1,#0
        0x0800334a:    da04        ..      BGE      0x8003356 ; ecp_mod_p256 + 378
        0x0800334c:    4249        IB      RSBS     r1,r1,#0
        0x0800334e:    4668        hF      MOV      r0,sp
        0x08003350:    f004f8f3    ....    BL       sub32 ; 0x800753a
        0x08003354:    e002        ..      B        0x800335c ; ecp_mod_p256 + 384
        0x08003356:    4668        hF      MOV      r0,sp
        0x08003358:    f7fefa31    ..1.    BL       add32 ; 0x80017be
        0x0800335c:    68a0        .h      LDR      r0,[r4,#8]
        0x0800335e:    aa01        ..      ADD      r2,sp,#4
        0x08003360:    6ac1        .j      LDR      r1,[r0,#0x2c]
        0x08003362:    4668        hF      MOV      r0,sp
        0x08003364:    f7fefa2b    ..+.    BL       add32 ; 0x80017be
        0x08003368:    68a0        .h      LDR      r0,[r4,#8]
        0x0800336a:    aa01        ..      ADD      r2,sp,#4
        0x0800336c:    6ac1        .j      LDR      r1,[r0,#0x2c]
        0x0800336e:    4668        hF      MOV      r0,sp
        0x08003370:    f7fefa25    ..%.    BL       add32 ; 0x80017be
        0x08003374:    68a0        .h      LDR      r0,[r4,#8]
        0x08003376:    aa01        ..      ADD      r2,sp,#4
        0x08003378:    6b01        .k      LDR      r1,[r0,#0x30]
        0x0800337a:    4668        hF      MOV      r0,sp
        0x0800337c:    f7fefa1f    ....    BL       add32 ; 0x80017be
        0x08003380:    68a0        .h      LDR      r0,[r4,#8]
        0x08003382:    aa01        ..      ADD      r2,sp,#4
        0x08003384:    6b01        .k      LDR      r1,[r0,#0x30]
        0x08003386:    4668        hF      MOV      r0,sp
        0x08003388:    f7fefa19    ....    BL       add32 ; 0x80017be
        0x0800338c:    68a0        .h      LDR      r0,[r4,#8]
        0x0800338e:    aa01        ..      ADD      r2,sp,#4
        0x08003390:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x08003392:    4668        hF      MOV      r0,sp
        0x08003394:    f7fefa13    ....    BL       add32 ; 0x80017be
        0x08003398:    68a0        .h      LDR      r0,[r4,#8]
        0x0800339a:    aa01        ..      ADD      r2,sp,#4
        0x0800339c:    6bc1        .k      LDR      r1,[r0,#0x3c]
        0x0800339e:    4668        hF      MOV      r0,sp
        0x080033a0:    f004f8cb    ....    BL       sub32 ; 0x800753a
        0x080033a4:    68a0        .h      LDR      r0,[r4,#8]
        0x080033a6:    aa01        ..      ADD      r2,sp,#4
        0x080033a8:    6a01        .j      LDR      r1,[r0,#0x20]
        0x080033aa:    4668        hF      MOV      r0,sp
        0x080033ac:    f004f8c5    ....    BL       sub32 ; 0x800753a
        0x080033b0:    68a0        .h      LDR      r0,[r4,#8]
        0x080033b2:    aa01        ..      ADD      r2,sp,#4
        0x080033b4:    6a41        Aj      LDR      r1,[r0,#0x24]
        0x080033b6:    4668        hF      MOV      r0,sp
        0x080033b8:    f004f8bf    ....    BL       sub32 ; 0x800753a
        0x080033bc:    68a1        .h      LDR      r1,[r4,#8]
        0x080033be:    9800        ..      LDR      r0,[sp,#0]
        0x080033c0:    aa01        ..      ADD      r2,sp,#4
        0x080033c2:    60c8        .`      STR      r0,[r1,#0xc]
        0x080033c4:    68a0        .h      LDR      r0,[r4,#8]
        0x080033c6:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x080033ca:    6900        .i      LDR      r0,[r0,#0x10]
        0x080033cc:    9000        ..      STR      r0,[sp,#0]
        0x080033ce:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x080033d2:    2900        .)      CMP      r1,#0
        0x080033d4:    da04        ..      BGE      0x80033e0 ; ecp_mod_p256 + 516
        0x080033d6:    4249        IB      RSBS     r1,r1,#0
        0x080033d8:    4668        hF      MOV      r0,sp
        0x080033da:    f004f8ae    ....    BL       sub32 ; 0x800753a
        0x080033de:    e002        ..      B        0x80033e6 ; ecp_mod_p256 + 522
        0x080033e0:    4668        hF      MOV      r0,sp
        0x080033e2:    f7fef9ec    ....    BL       add32 ; 0x80017be
        0x080033e6:    68a0        .h      LDR      r0,[r4,#8]
        0x080033e8:    aa01        ..      ADD      r2,sp,#4
        0x080033ea:    6b01        .k      LDR      r1,[r0,#0x30]
        0x080033ec:    4668        hF      MOV      r0,sp
        0x080033ee:    f7fef9e6    ....    BL       add32 ; 0x80017be
        0x080033f2:    68a0        .h      LDR      r0,[r4,#8]
        0x080033f4:    aa01        ..      ADD      r2,sp,#4
        0x080033f6:    6b01        .k      LDR      r1,[r0,#0x30]
        0x080033f8:    4668        hF      MOV      r0,sp
        0x080033fa:    f7fef9e0    ....    BL       add32 ; 0x80017be
        0x080033fe:    68a0        .h      LDR      r0,[r4,#8]
        0x08003400:    aa01        ..      ADD      r2,sp,#4
        0x08003402:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x08003404:    4668        hF      MOV      r0,sp
        0x08003406:    f7fef9da    ....    BL       add32 ; 0x80017be
        0x0800340a:    68a0        .h      LDR      r0,[r4,#8]
        0x0800340c:    aa01        ..      ADD      r2,sp,#4
        0x0800340e:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x08003410:    4668        hF      MOV      r0,sp
        0x08003412:    f7fef9d4    ....    BL       add32 ; 0x80017be
        0x08003416:    68a0        .h      LDR      r0,[r4,#8]
        0x08003418:    aa01        ..      ADD      r2,sp,#4
        0x0800341a:    6b81        .k      LDR      r1,[r0,#0x38]
        0x0800341c:    4668        hF      MOV      r0,sp
        0x0800341e:    f7fef9ce    ....    BL       add32 ; 0x80017be
        0x08003422:    68a0        .h      LDR      r0,[r4,#8]
        0x08003424:    aa01        ..      ADD      r2,sp,#4
        0x08003426:    6a41        Aj      LDR      r1,[r0,#0x24]
        0x08003428:    4668        hF      MOV      r0,sp
        0x0800342a:    f004f886    ....    BL       sub32 ; 0x800753a
        0x0800342e:    68a0        .h      LDR      r0,[r4,#8]
        0x08003430:    aa01        ..      ADD      r2,sp,#4
        0x08003432:    6a81        .j      LDR      r1,[r0,#0x28]
        0x08003434:    4668        hF      MOV      r0,sp
        0x08003436:    f004f880    ....    BL       sub32 ; 0x800753a
        0x0800343a:    68a1        .h      LDR      r1,[r4,#8]
        0x0800343c:    9800        ..      LDR      r0,[sp,#0]
        0x0800343e:    aa01        ..      ADD      r2,sp,#4
        0x08003440:    6108        .a      STR      r0,[r1,#0x10]
        0x08003442:    68a0        .h      LDR      r0,[r4,#8]
        0x08003444:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003448:    6940        @i      LDR      r0,[r0,#0x14]
        0x0800344a:    9000        ..      STR      r0,[sp,#0]
        0x0800344c:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x08003450:    2900        .)      CMP      r1,#0
        0x08003452:    da04        ..      BGE      0x800345e ; ecp_mod_p256 + 642
        0x08003454:    4249        IB      RSBS     r1,r1,#0
        0x08003456:    4668        hF      MOV      r0,sp
        0x08003458:    f004f86f    ..o.    BL       sub32 ; 0x800753a
        0x0800345c:    e002        ..      B        0x8003464 ; ecp_mod_p256 + 648
        0x0800345e:    4668        hF      MOV      r0,sp
        0x08003460:    f7fef9ad    ....    BL       add32 ; 0x80017be
        0x08003464:    68a0        .h      LDR      r0,[r4,#8]
        0x08003466:    aa01        ..      ADD      r2,sp,#4
        0x08003468:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x0800346a:    4668        hF      MOV      r0,sp
        0x0800346c:    f7fef9a7    ....    BL       add32 ; 0x80017be
        0x08003470:    68a0        .h      LDR      r0,[r4,#8]
        0x08003472:    aa01        ..      ADD      r2,sp,#4
        0x08003474:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x08003476:    4668        hF      MOV      r0,sp
        0x08003478:    f7fef9a1    ....    BL       add32 ; 0x80017be
        0x0800347c:    68a0        .h      LDR      r0,[r4,#8]
        0x0800347e:    aa01        ..      ADD      r2,sp,#4
        0x08003480:    6b81        .k      LDR      r1,[r0,#0x38]
        0x08003482:    4668        hF      MOV      r0,sp
        0x08003484:    f7fef99b    ....    BL       add32 ; 0x80017be
        0x08003488:    68a0        .h      LDR      r0,[r4,#8]
        0x0800348a:    aa01        ..      ADD      r2,sp,#4
        0x0800348c:    6b81        .k      LDR      r1,[r0,#0x38]
        0x0800348e:    4668        hF      MOV      r0,sp
        0x08003490:    f7fef995    ....    BL       add32 ; 0x80017be
        0x08003494:    68a0        .h      LDR      r0,[r4,#8]
        0x08003496:    aa01        ..      ADD      r2,sp,#4
        0x08003498:    6bc1        .k      LDR      r1,[r0,#0x3c]
        0x0800349a:    4668        hF      MOV      r0,sp
        0x0800349c:    f7fef98f    ....    BL       add32 ; 0x80017be
        0x080034a0:    68a0        .h      LDR      r0,[r4,#8]
        0x080034a2:    aa01        ..      ADD      r2,sp,#4
        0x080034a4:    6a81        .j      LDR      r1,[r0,#0x28]
        0x080034a6:    4668        hF      MOV      r0,sp
        0x080034a8:    f004f847    ..G.    BL       sub32 ; 0x800753a
        0x080034ac:    68a0        .h      LDR      r0,[r4,#8]
        0x080034ae:    aa01        ..      ADD      r2,sp,#4
        0x080034b0:    6ac1        .j      LDR      r1,[r0,#0x2c]
        0x080034b2:    4668        hF      MOV      r0,sp
        0x080034b4:    f004f841    ..A.    BL       sub32 ; 0x800753a
        0x080034b8:    68a1        .h      LDR      r1,[r4,#8]
        0x080034ba:    9800        ..      LDR      r0,[sp,#0]
        0x080034bc:    aa01        ..      ADD      r2,sp,#4
        0x080034be:    6148        Ha      STR      r0,[r1,#0x14]
        0x080034c0:    68a0        .h      LDR      r0,[r4,#8]
        0x080034c2:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x080034c6:    6980        .i      LDR      r0,[r0,#0x18]
        0x080034c8:    9000        ..      STR      r0,[sp,#0]
        0x080034ca:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x080034ce:    2900        .)      CMP      r1,#0
        0x080034d0:    da04        ..      BGE      0x80034dc ; ecp_mod_p256 + 768
        0x080034d2:    4249        IB      RSBS     r1,r1,#0
        0x080034d4:    4668        hF      MOV      r0,sp
        0x080034d6:    f004f830    ..0.    BL       sub32 ; 0x800753a
        0x080034da:    e002        ..      B        0x80034e2 ; ecp_mod_p256 + 774
        0x080034dc:    4668        hF      MOV      r0,sp
        0x080034de:    f7fef96e    ..n.    BL       add32 ; 0x80017be
        0x080034e2:    68a0        .h      LDR      r0,[r4,#8]
        0x080034e4:    aa01        ..      ADD      r2,sp,#4
        0x080034e6:    6b81        .k      LDR      r1,[r0,#0x38]
        0x080034e8:    4668        hF      MOV      r0,sp
        0x080034ea:    f7fef968    ..h.    BL       add32 ; 0x80017be
        0x080034ee:    68a0        .h      LDR      r0,[r4,#8]
        0x080034f0:    aa01        ..      ADD      r2,sp,#4
        0x080034f2:    6b81        .k      LDR      r1,[r0,#0x38]
        0x080034f4:    4668        hF      MOV      r0,sp
        0x080034f6:    f7fef962    ..b.    BL       add32 ; 0x80017be
        0x080034fa:    68a0        .h      LDR      r0,[r4,#8]
        0x080034fc:    aa01        ..      ADD      r2,sp,#4
        0x080034fe:    6bc1        .k      LDR      r1,[r0,#0x3c]
        0x08003500:    4668        hF      MOV      r0,sp
        0x08003502:    f7fef95c    ..\.    BL       add32 ; 0x80017be
        0x08003506:    68a0        .h      LDR      r0,[r4,#8]
        0x08003508:    aa01        ..      ADD      r2,sp,#4
        0x0800350a:    6bc1        .k      LDR      r1,[r0,#0x3c]
        0x0800350c:    4668        hF      MOV      r0,sp
        0x0800350e:    f7fef956    ..V.    BL       add32 ; 0x80017be
        0x08003512:    68a0        .h      LDR      r0,[r4,#8]
        0x08003514:    aa01        ..      ADD      r2,sp,#4
        0x08003516:    6b81        .k      LDR      r1,[r0,#0x38]
        0x08003518:    4668        hF      MOV      r0,sp
        0x0800351a:    f7fef950    ..P.    BL       add32 ; 0x80017be
        0x0800351e:    68a0        .h      LDR      r0,[r4,#8]
        0x08003520:    aa01        ..      ADD      r2,sp,#4
        0x08003522:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x08003524:    4668        hF      MOV      r0,sp
        0x08003526:    f7fef94a    ..J.    BL       add32 ; 0x80017be
        0x0800352a:    68a0        .h      LDR      r0,[r4,#8]
        0x0800352c:    aa01        ..      ADD      r2,sp,#4
        0x0800352e:    6a01        .j      LDR      r1,[r0,#0x20]
        0x08003530:    4668        hF      MOV      r0,sp
        0x08003532:    f004f802    ....    BL       sub32 ; 0x800753a
        0x08003536:    68a0        .h      LDR      r0,[r4,#8]
        0x08003538:    aa01        ..      ADD      r2,sp,#4
        0x0800353a:    6a41        Aj      LDR      r1,[r0,#0x24]
        0x0800353c:    4668        hF      MOV      r0,sp
        0x0800353e:    f003fffc    ....    BL       sub32 ; 0x800753a
        0x08003542:    68a1        .h      LDR      r1,[r4,#8]
        0x08003544:    9800        ..      LDR      r0,[sp,#0]
        0x08003546:    aa01        ..      ADD      r2,sp,#4
        0x08003548:    6188        .a      STR      r0,[r1,#0x18]
        0x0800354a:    68a0        .h      LDR      r0,[r4,#8]
        0x0800354c:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003550:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x08003552:    9000        ..      STR      r0,[sp,#0]
        0x08003554:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x08003558:    2900        .)      CMP      r1,#0
        0x0800355a:    da04        ..      BGE      0x8003566 ; ecp_mod_p256 + 906
        0x0800355c:    4249        IB      RSBS     r1,r1,#0
        0x0800355e:    4668        hF      MOV      r0,sp
        0x08003560:    f003ffeb    ....    BL       sub32 ; 0x800753a
        0x08003564:    e002        ..      B        0x800356c ; ecp_mod_p256 + 912
        0x08003566:    4668        hF      MOV      r0,sp
        0x08003568:    f7fef929    ..).    BL       add32 ; 0x80017be
        0x0800356c:    68a0        .h      LDR      r0,[r4,#8]
        0x0800356e:    aa01        ..      ADD      r2,sp,#4
        0x08003570:    6bc1        .k      LDR      r1,[r0,#0x3c]
        0x08003572:    4668        hF      MOV      r0,sp
        0x08003574:    f7fef923    ..#.    BL       add32 ; 0x80017be
        0x08003578:    68a0        .h      LDR      r0,[r4,#8]
        0x0800357a:    aa01        ..      ADD      r2,sp,#4
        0x0800357c:    6bc1        .k      LDR      r1,[r0,#0x3c]
        0x0800357e:    4668        hF      MOV      r0,sp
        0x08003580:    f7fef91d    ....    BL       add32 ; 0x80017be
        0x08003584:    68a0        .h      LDR      r0,[r4,#8]
        0x08003586:    aa01        ..      ADD      r2,sp,#4
        0x08003588:    6bc1        .k      LDR      r1,[r0,#0x3c]
        0x0800358a:    4668        hF      MOV      r0,sp
        0x0800358c:    f7fef917    ....    BL       add32 ; 0x80017be
        0x08003590:    68a0        .h      LDR      r0,[r4,#8]
        0x08003592:    aa01        ..      ADD      r2,sp,#4
        0x08003594:    6a01        .j      LDR      r1,[r0,#0x20]
        0x08003596:    4668        hF      MOV      r0,sp
        0x08003598:    f7fef911    ....    BL       add32 ; 0x80017be
        0x0800359c:    68a0        .h      LDR      r0,[r4,#8]
        0x0800359e:    aa01        ..      ADD      r2,sp,#4
        0x080035a0:    6a81        .j      LDR      r1,[r0,#0x28]
        0x080035a2:    4668        hF      MOV      r0,sp
        0x080035a4:    f003ffc9    ....    BL       sub32 ; 0x800753a
        0x080035a8:    68a0        .h      LDR      r0,[r4,#8]
        0x080035aa:    aa01        ..      ADD      r2,sp,#4
        0x080035ac:    6ac1        .j      LDR      r1,[r0,#0x2c]
        0x080035ae:    4668        hF      MOV      r0,sp
        0x080035b0:    f003ffc3    ....    BL       sub32 ; 0x800753a
        0x080035b4:    68a0        .h      LDR      r0,[r4,#8]
        0x080035b6:    aa01        ..      ADD      r2,sp,#4
        0x080035b8:    6b01        .k      LDR      r1,[r0,#0x30]
        0x080035ba:    4668        hF      MOV      r0,sp
        0x080035bc:    f003ffbd    ....    BL       sub32 ; 0x800753a
        0x080035c0:    68a0        .h      LDR      r0,[r4,#8]
        0x080035c2:    aa01        ..      ADD      r2,sp,#4
        0x080035c4:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x080035c6:    4668        hF      MOV      r0,sp
        0x080035c8:    f003ffb7    ....    BL       sub32 ; 0x800753a
        0x080035cc:    68a1        .h      LDR      r1,[r4,#8]
        0x080035ce:    9800        ..      LDR      r0,[sp,#0]
        0x080035d0:    61c8        .a      STR      r0,[r1,#0x1c]
        0x080035d2:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x080035d6:    2008        .       MOVS     r0,#8
        0x080035d8:    2900        .)      CMP      r1,#0
        0x080035da:    dc00        ..      BGT      0x80035de ; ecp_mod_p256 + 1026
        0x080035dc:    2100        .!      MOVS     r1,#0
        0x080035de:    68a2        .h      LDR      r2,[r4,#8]
        0x080035e0:    6211        .b      STR      r1,[r2,#0x20]
        0x080035e2:    9500        ..      STR      r5,[sp,#0]
        0x080035e4:    e003        ..      B        0x80035ee ; ecp_mod_p256 + 1042
        0x080035e6:    68a2        .h      LDR      r2,[r4,#8]
        0x080035e8:    9900        ..      LDR      r1,[sp,#0]
        0x080035ea:    f8421020    B. .    STR      r1,[r2,r0,LSL #2]
        0x080035ee:    6861        ah      LDR      r1,[r4,#4]
        0x080035f0:    1c40        @.      ADDS     r0,r0,#1
        0x080035f2:    4288        .B      CMP      r0,r1
        0x080035f4:    d3f7        ..      BCC      0x80035e6 ; ecp_mod_p256 + 1034
        0x080035f6:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x080035fa:    2900        .)      CMP      r1,#0
        0x080035fc:    da04        ..      BGE      0x8003608 ; ecp_mod_p256 + 1068
        0x080035fe:    463b        ;F      MOV      r3,r7
        0x08003600:    aa03        ..      ADD      r2,sp,#0xc
        0x08003602:    4620         F      MOV      r0,r4
        0x08003604:    f001f978    ..x.    BL       fix_negative ; 0x80048f8
        0x08003608:    b011        ..      ADD      sp,sp,#0x44
        0x0800360a:    4630        0F      MOV      r0,r6
        0x0800360c:    bdf0        ..      POP      {r4-r7,pc}
        0x0800360e:    0000        ..      MOVS     r0,r0
    i.ecp_mod_p256k1
    ecp_mod_p256k1
        0x08003610:    b51c        ..      PUSH     {r2-r4,lr}
        0x08003612:    2100        .!      MOVS     r1,#0
        0x08003614:    9100        ..      STR      r1,[sp,#0]
        0x08003616:    460b        .F      MOV      r3,r1
        0x08003618:    9101        ..      STR      r1,[sp,#4]
        0x0800361a:    2208        ."      MOVS     r2,#8
        0x0800361c:    4901        .I      LDR      r1,[pc,#4] ; [0x8003624] = 0x20000034
        0x0800361e:    f7fffb83    ....    BL       ecp_mod_koblitz ; 0x8002d28
        0x08003622:    bd1c        ..      POP      {r2-r4,pc}
    $d
        0x08003624:    20000034    4..     DCD    536870964
    $t
    i.ecp_mod_p384
    ecp_mod_p384
        0x08003628:    b5f0        ..      PUSH     {r4-r7,lr}
        0x0800362a:    b095        ..      SUB      sp,sp,#0x54
        0x0800362c:    4604        .F      MOV      r4,r0
        0x0800362e:    2001        .       MOVS     r0,#1
        0x08003630:    9003        ..      STR      r0,[sp,#0xc]
        0x08003632:    200d        .       MOVS     r0,#0xd
        0x08003634:    9004        ..      STR      r0,[sp,#0x10]
        0x08003636:    2500        .%      MOVS     r5,#0
        0x08003638:    a806        ..      ADD      r0,sp,#0x18
        0x0800363a:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x0800363e:    f44f77c0    O..w    MOV      r7,#0x180
        0x08003642:    2134        4!      MOVS     r1,#0x34
        0x08003644:    9005        ..      STR      r0,[sp,#0x14]
        0x08003646:    f7fcff89    ....    BL       __aeabi_memclr4 ; 0x800055c
        0x0800364a:    2118        .!      MOVS     r1,#0x18
        0x0800364c:    4620         F      MOV      r0,r4
        0x0800364e:    f002fe6b    ..k.    BL       mbedtls_mpi_grow ; 0x8006328
        0x08003652:    0006        ..      MOVS     r6,r0
        0x08003654:    d17e        ~.      BNE      0x8003754 ; ecp_mod_p384 + 300
        0x08003656:    68a0        .h      LDR      r0,[r4,#8]
        0x08003658:    aa01        ..      ADD      r2,sp,#4
        0x0800365a:    6800        .h      LDR      r0,[r0,#0]
        0x0800365c:    9000        ..      STR      r0,[sp,#0]
        0x0800365e:    68a0        .h      LDR      r0,[r4,#8]
        0x08003660:    6b01        .k      LDR      r1,[r0,#0x30]
        0x08003662:    4668        hF      MOV      r0,sp
        0x08003664:    f7fef8ab    ....    BL       add32 ; 0x80017be
        0x08003668:    68a0        .h      LDR      r0,[r4,#8]
        0x0800366a:    aa01        ..      ADD      r2,sp,#4
        0x0800366c:    6d41        Am      LDR      r1,[r0,#0x54]
        0x0800366e:    4668        hF      MOV      r0,sp
        0x08003670:    f7fef8a5    ....    BL       add32 ; 0x80017be
        0x08003674:    68a0        .h      LDR      r0,[r4,#8]
        0x08003676:    aa01        ..      ADD      r2,sp,#4
        0x08003678:    6d01        .m      LDR      r1,[r0,#0x50]
        0x0800367a:    4668        hF      MOV      r0,sp
        0x0800367c:    f7fef89f    ....    BL       add32 ; 0x80017be
        0x08003680:    68a0        .h      LDR      r0,[r4,#8]
        0x08003682:    aa01        ..      ADD      r2,sp,#4
        0x08003684:    6dc1        .m      LDR      r1,[r0,#0x5c]
        0x08003686:    4668        hF      MOV      r0,sp
        0x08003688:    f003ff57    ..W.    BL       sub32 ; 0x800753a
        0x0800368c:    68a1        .h      LDR      r1,[r4,#8]
        0x0800368e:    9800        ..      LDR      r0,[sp,#0]
        0x08003690:    aa01        ..      ADD      r2,sp,#4
        0x08003692:    6008        .`      STR      r0,[r1,#0]
        0x08003694:    68a0        .h      LDR      r0,[r4,#8]
        0x08003696:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x0800369a:    6840        @h      LDR      r0,[r0,#4]
        0x0800369c:    9000        ..      STR      r0,[sp,#0]
        0x0800369e:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x080036a2:    2900        .)      CMP      r1,#0
        0x080036a4:    da04        ..      BGE      0x80036b0 ; ecp_mod_p384 + 136
        0x080036a6:    4249        IB      RSBS     r1,r1,#0
        0x080036a8:    4668        hF      MOV      r0,sp
        0x080036aa:    f003ff46    ..F.    BL       sub32 ; 0x800753a
        0x080036ae:    e002        ..      B        0x80036b6 ; ecp_mod_p384 + 142
        0x080036b0:    4668        hF      MOV      r0,sp
        0x080036b2:    f7fef884    ....    BL       add32 ; 0x80017be
        0x080036b6:    68a0        .h      LDR      r0,[r4,#8]
        0x080036b8:    aa01        ..      ADD      r2,sp,#4
        0x080036ba:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x080036bc:    4668        hF      MOV      r0,sp
        0x080036be:    f7fef87e    ..~.    BL       add32 ; 0x80017be
        0x080036c2:    68a0        .h      LDR      r0,[r4,#8]
        0x080036c4:    aa01        ..      ADD      r2,sp,#4
        0x080036c6:    6d81        .m      LDR      r1,[r0,#0x58]
        0x080036c8:    4668        hF      MOV      r0,sp
        0x080036ca:    f7fef878    ..x.    BL       add32 ; 0x80017be
        0x080036ce:    68a0        .h      LDR      r0,[r4,#8]
        0x080036d0:    aa01        ..      ADD      r2,sp,#4
        0x080036d2:    6dc1        .m      LDR      r1,[r0,#0x5c]
        0x080036d4:    4668        hF      MOV      r0,sp
        0x080036d6:    f7fef872    ..r.    BL       add32 ; 0x80017be
        0x080036da:    68a0        .h      LDR      r0,[r4,#8]
        0x080036dc:    aa01        ..      ADD      r2,sp,#4
        0x080036de:    6b01        .k      LDR      r1,[r0,#0x30]
        0x080036e0:    4668        hF      MOV      r0,sp
        0x080036e2:    f003ff2a    ..*.    BL       sub32 ; 0x800753a
        0x080036e6:    68a0        .h      LDR      r0,[r4,#8]
        0x080036e8:    aa01        ..      ADD      r2,sp,#4
        0x080036ea:    6d01        .m      LDR      r1,[r0,#0x50]
        0x080036ec:    4668        hF      MOV      r0,sp
        0x080036ee:    f003ff24    ..$.    BL       sub32 ; 0x800753a
        0x080036f2:    68a1        .h      LDR      r1,[r4,#8]
        0x080036f4:    9800        ..      LDR      r0,[sp,#0]
        0x080036f6:    aa01        ..      ADD      r2,sp,#4
        0x080036f8:    6048        H`      STR      r0,[r1,#4]
        0x080036fa:    68a0        .h      LDR      r0,[r4,#8]
        0x080036fc:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003700:    6880        .h      LDR      r0,[r0,#8]
        0x08003702:    9000        ..      STR      r0,[sp,#0]
        0x08003704:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x08003708:    2900        .)      CMP      r1,#0
        0x0800370a:    da04        ..      BGE      0x8003716 ; ecp_mod_p384 + 238
        0x0800370c:    4249        IB      RSBS     r1,r1,#0
        0x0800370e:    4668        hF      MOV      r0,sp
        0x08003710:    f003ff13    ....    BL       sub32 ; 0x800753a
        0x08003714:    e002        ..      B        0x800371c ; ecp_mod_p384 + 244
        0x08003716:    4668        hF      MOV      r0,sp
        0x08003718:    f7fef851    ..Q.    BL       add32 ; 0x80017be
        0x0800371c:    68a0        .h      LDR      r0,[r4,#8]
        0x0800371e:    aa01        ..      ADD      r2,sp,#4
        0x08003720:    6b81        .k      LDR      r1,[r0,#0x38]
        0x08003722:    4668        hF      MOV      r0,sp
        0x08003724:    f7fef84b    ..K.    BL       add32 ; 0x80017be
        0x08003728:    68a0        .h      LDR      r0,[r4,#8]
        0x0800372a:    aa01        ..      ADD      r2,sp,#4
        0x0800372c:    6dc1        .m      LDR      r1,[r0,#0x5c]
        0x0800372e:    4668        hF      MOV      r0,sp
        0x08003730:    f7fef845    ..E.    BL       add32 ; 0x80017be
        0x08003734:    68a0        .h      LDR      r0,[r4,#8]
        0x08003736:    aa01        ..      ADD      r2,sp,#4
        0x08003738:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x0800373a:    4668        hF      MOV      r0,sp
        0x0800373c:    f003fefd    ....    BL       sub32 ; 0x800753a
        0x08003740:    68a0        .h      LDR      r0,[r4,#8]
        0x08003742:    aa01        ..      ADD      r2,sp,#4
        0x08003744:    6d41        Am      LDR      r1,[r0,#0x54]
        0x08003746:    4668        hF      MOV      r0,sp
        0x08003748:    f003fef7    ....    BL       sub32 ; 0x800753a
        0x0800374c:    68a1        .h      LDR      r1,[r4,#8]
        0x0800374e:    9800        ..      LDR      r0,[sp,#0]
        0x08003750:    6088        .`      STR      r0,[r1,#8]
        0x08003752:    e000        ..      B        0x8003756 ; ecp_mod_p384 + 302
        0x08003754:    e215        ..      B        0x8003b82 ; ecp_mod_p384 + 1370
        0x08003756:    68a0        .h      LDR      r0,[r4,#8]
        0x08003758:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x0800375c:    aa01        ..      ADD      r2,sp,#4
        0x0800375e:    68c0        .h      LDR      r0,[r0,#0xc]
        0x08003760:    9000        ..      STR      r0,[sp,#0]
        0x08003762:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x08003766:    2900        .)      CMP      r1,#0
        0x08003768:    da04        ..      BGE      0x8003774 ; ecp_mod_p384 + 332
        0x0800376a:    4249        IB      RSBS     r1,r1,#0
        0x0800376c:    4668        hF      MOV      r0,sp
        0x0800376e:    f003fee4    ....    BL       sub32 ; 0x800753a
        0x08003772:    e002        ..      B        0x800377a ; ecp_mod_p384 + 338
        0x08003774:    4668        hF      MOV      r0,sp
        0x08003776:    f7fef822    ..".    BL       add32 ; 0x80017be
        0x0800377a:    68a0        .h      LDR      r0,[r4,#8]
        0x0800377c:    aa01        ..      ADD      r2,sp,#4
        0x0800377e:    6bc1        .k      LDR      r1,[r0,#0x3c]
        0x08003780:    4668        hF      MOV      r0,sp
        0x08003782:    f7fef81c    ....    BL       add32 ; 0x80017be
        0x08003786:    68a0        .h      LDR      r0,[r4,#8]
        0x08003788:    aa01        ..      ADD      r2,sp,#4
        0x0800378a:    6b01        .k      LDR      r1,[r0,#0x30]
        0x0800378c:    4668        hF      MOV      r0,sp
        0x0800378e:    f7fef816    ....    BL       add32 ; 0x80017be
        0x08003792:    68a0        .h      LDR      r0,[r4,#8]
        0x08003794:    aa01        ..      ADD      r2,sp,#4
        0x08003796:    6d01        .m      LDR      r1,[r0,#0x50]
        0x08003798:    4668        hF      MOV      r0,sp
        0x0800379a:    f7fef810    ....    BL       add32 ; 0x80017be
        0x0800379e:    68a0        .h      LDR      r0,[r4,#8]
        0x080037a0:    aa01        ..      ADD      r2,sp,#4
        0x080037a2:    6d41        Am      LDR      r1,[r0,#0x54]
        0x080037a4:    4668        hF      MOV      r0,sp
        0x080037a6:    f7fef80a    ....    BL       add32 ; 0x80017be
        0x080037aa:    68a0        .h      LDR      r0,[r4,#8]
        0x080037ac:    aa01        ..      ADD      r2,sp,#4
        0x080037ae:    6b81        .k      LDR      r1,[r0,#0x38]
        0x080037b0:    4668        hF      MOV      r0,sp
        0x080037b2:    f003fec2    ....    BL       sub32 ; 0x800753a
        0x080037b6:    68a0        .h      LDR      r0,[r4,#8]
        0x080037b8:    aa01        ..      ADD      r2,sp,#4
        0x080037ba:    6d81        .m      LDR      r1,[r0,#0x58]
        0x080037bc:    4668        hF      MOV      r0,sp
        0x080037be:    f003febc    ....    BL       sub32 ; 0x800753a
        0x080037c2:    68a0        .h      LDR      r0,[r4,#8]
        0x080037c4:    aa01        ..      ADD      r2,sp,#4
        0x080037c6:    6dc1        .m      LDR      r1,[r0,#0x5c]
        0x080037c8:    4668        hF      MOV      r0,sp
        0x080037ca:    f003feb6    ....    BL       sub32 ; 0x800753a
        0x080037ce:    68a1        .h      LDR      r1,[r4,#8]
        0x080037d0:    9800        ..      LDR      r0,[sp,#0]
        0x080037d2:    aa01        ..      ADD      r2,sp,#4
        0x080037d4:    60c8        .`      STR      r0,[r1,#0xc]
        0x080037d6:    68a0        .h      LDR      r0,[r4,#8]
        0x080037d8:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x080037dc:    6900        .i      LDR      r0,[r0,#0x10]
        0x080037de:    9000        ..      STR      r0,[sp,#0]
        0x080037e0:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x080037e4:    2900        .)      CMP      r1,#0
        0x080037e6:    da04        ..      BGE      0x80037f2 ; ecp_mod_p384 + 458
        0x080037e8:    4249        IB      RSBS     r1,r1,#0
        0x080037ea:    4668        hF      MOV      r0,sp
        0x080037ec:    f003fea5    ....    BL       sub32 ; 0x800753a
        0x080037f0:    e002        ..      B        0x80037f8 ; ecp_mod_p384 + 464
        0x080037f2:    4668        hF      MOV      r0,sp
        0x080037f4:    f7fdffe3    ....    BL       add32 ; 0x80017be
        0x080037f8:    68a0        .h      LDR      r0,[r4,#8]
        0x080037fa:    aa01        ..      ADD      r2,sp,#4
        0x080037fc:    6d41        Am      LDR      r1,[r0,#0x54]
        0x080037fe:    4668        hF      MOV      r0,sp
        0x08003800:    f7fdffdd    ....    BL       add32 ; 0x80017be
        0x08003804:    68a0        .h      LDR      r0,[r4,#8]
        0x08003806:    aa01        ..      ADD      r2,sp,#4
        0x08003808:    6d41        Am      LDR      r1,[r0,#0x54]
        0x0800380a:    4668        hF      MOV      r0,sp
        0x0800380c:    f7fdffd7    ....    BL       add32 ; 0x80017be
        0x08003810:    68a0        .h      LDR      r0,[r4,#8]
        0x08003812:    aa01        ..      ADD      r2,sp,#4
        0x08003814:    6c01        .l      LDR      r1,[r0,#0x40]
        0x08003816:    4668        hF      MOV      r0,sp
        0x08003818:    f7fdffd1    ....    BL       add32 ; 0x80017be
        0x0800381c:    68a0        .h      LDR      r0,[r4,#8]
        0x0800381e:    aa01        ..      ADD      r2,sp,#4
        0x08003820:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x08003822:    4668        hF      MOV      r0,sp
        0x08003824:    f7fdffcb    ....    BL       add32 ; 0x80017be
        0x08003828:    68a0        .h      LDR      r0,[r4,#8]
        0x0800382a:    aa01        ..      ADD      r2,sp,#4
        0x0800382c:    6b01        .k      LDR      r1,[r0,#0x30]
        0x0800382e:    4668        hF      MOV      r0,sp
        0x08003830:    f7fdffc5    ....    BL       add32 ; 0x80017be
        0x08003834:    68a0        .h      LDR      r0,[r4,#8]
        0x08003836:    aa01        ..      ADD      r2,sp,#4
        0x08003838:    6d01        .m      LDR      r1,[r0,#0x50]
        0x0800383a:    4668        hF      MOV      r0,sp
        0x0800383c:    f7fdffbf    ....    BL       add32 ; 0x80017be
        0x08003840:    68a0        .h      LDR      r0,[r4,#8]
        0x08003842:    aa01        ..      ADD      r2,sp,#4
        0x08003844:    6d81        .m      LDR      r1,[r0,#0x58]
        0x08003846:    4668        hF      MOV      r0,sp
        0x08003848:    f7fdffb9    ....    BL       add32 ; 0x80017be
        0x0800384c:    68a0        .h      LDR      r0,[r4,#8]
        0x0800384e:    aa01        ..      ADD      r2,sp,#4
        0x08003850:    6bc1        .k      LDR      r1,[r0,#0x3c]
        0x08003852:    4668        hF      MOV      r0,sp
        0x08003854:    f003fe71    ..q.    BL       sub32 ; 0x800753a
        0x08003858:    68a0        .h      LDR      r0,[r4,#8]
        0x0800385a:    aa01        ..      ADD      r2,sp,#4
        0x0800385c:    6dc1        .m      LDR      r1,[r0,#0x5c]
        0x0800385e:    4668        hF      MOV      r0,sp
        0x08003860:    f003fe6b    ..k.    BL       sub32 ; 0x800753a
        0x08003864:    68a0        .h      LDR      r0,[r4,#8]
        0x08003866:    aa01        ..      ADD      r2,sp,#4
        0x08003868:    6dc1        .m      LDR      r1,[r0,#0x5c]
        0x0800386a:    4668        hF      MOV      r0,sp
        0x0800386c:    f003fe65    ..e.    BL       sub32 ; 0x800753a
        0x08003870:    68a1        .h      LDR      r1,[r4,#8]
        0x08003872:    9800        ..      LDR      r0,[sp,#0]
        0x08003874:    aa01        ..      ADD      r2,sp,#4
        0x08003876:    6108        .a      STR      r0,[r1,#0x10]
        0x08003878:    68a0        .h      LDR      r0,[r4,#8]
        0x0800387a:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x0800387e:    6940        @i      LDR      r0,[r0,#0x14]
        0x08003880:    9000        ..      STR      r0,[sp,#0]
        0x08003882:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x08003886:    2900        .)      CMP      r1,#0
        0x08003888:    da04        ..      BGE      0x8003894 ; ecp_mod_p384 + 620
        0x0800388a:    4249        IB      RSBS     r1,r1,#0
        0x0800388c:    4668        hF      MOV      r0,sp
        0x0800388e:    f003fe54    ..T.    BL       sub32 ; 0x800753a
        0x08003892:    e002        ..      B        0x800389a ; ecp_mod_p384 + 626
        0x08003894:    4668        hF      MOV      r0,sp
        0x08003896:    f7fdff92    ....    BL       add32 ; 0x80017be
        0x0800389a:    68a0        .h      LDR      r0,[r4,#8]
        0x0800389c:    aa01        ..      ADD      r2,sp,#4
        0x0800389e:    6d81        .m      LDR      r1,[r0,#0x58]
        0x080038a0:    4668        hF      MOV      r0,sp
        0x080038a2:    f7fdff8c    ....    BL       add32 ; 0x80017be
        0x080038a6:    68a0        .h      LDR      r0,[r4,#8]
        0x080038a8:    aa01        ..      ADD      r2,sp,#4
        0x080038aa:    6d81        .m      LDR      r1,[r0,#0x58]
        0x080038ac:    4668        hF      MOV      r0,sp
        0x080038ae:    f7fdff86    ....    BL       add32 ; 0x80017be
        0x080038b2:    68a0        .h      LDR      r0,[r4,#8]
        0x080038b4:    aa01        ..      ADD      r2,sp,#4
        0x080038b6:    6c41        Al      LDR      r1,[r0,#0x44]
        0x080038b8:    4668        hF      MOV      r0,sp
        0x080038ba:    f7fdff80    ....    BL       add32 ; 0x80017be
        0x080038be:    68a0        .h      LDR      r0,[r4,#8]
        0x080038c0:    aa01        ..      ADD      r2,sp,#4
        0x080038c2:    6b81        .k      LDR      r1,[r0,#0x38]
        0x080038c4:    4668        hF      MOV      r0,sp
        0x080038c6:    f7fdff7a    ..z.    BL       add32 ; 0x80017be
        0x080038ca:    68a0        .h      LDR      r0,[r4,#8]
        0x080038cc:    aa01        ..      ADD      r2,sp,#4
        0x080038ce:    6b41        Ak      LDR      r1,[r0,#0x34]
        0x080038d0:    4668        hF      MOV      r0,sp
        0x080038d2:    f7fdff74    ..t.    BL       add32 ; 0x80017be
        0x080038d6:    68a0        .h      LDR      r0,[r4,#8]
        0x080038d8:    aa01        ..      ADD      r2,sp,#4
        0x080038da:    6d41        Am      LDR      r1,[r0,#0x54]
        0x080038dc:    4668        hF      MOV      r0,sp
        0x080038de:    f7fdff6e    ..n.    BL       add32 ; 0x80017be
        0x080038e2:    68a0        .h      LDR      r0,[r4,#8]
        0x080038e4:    aa01        ..      ADD      r2,sp,#4
        0x080038e6:    6dc1        .m      LDR      r1,[r0,#0x5c]
        0x080038e8:    4668        hF      MOV      r0,sp
        0x080038ea:    f7fdff68    ..h.    BL       add32 ; 0x80017be
        0x080038ee:    68a0        .h      LDR      r0,[r4,#8]
        0x080038f0:    aa01        ..      ADD      r2,sp,#4
        0x080038f2:    6c01        .l      LDR      r1,[r0,#0x40]
        0x080038f4:    4668        hF      MOV      r0,sp
        0x080038f6:    f003fe20    .. .    BL       sub32 ; 0x800753a
        0x080038fa:    68a1        .h      LDR      r1,[r4,#8]
        0x080038fc:    9800        ..      LDR      r0,[sp,#0]
        0x080038fe:    aa01        ..      ADD      r2,sp,#4
        0x08003900:    6148        Ha      STR      r0,[r1,#0x14]
        0x08003902:    68a0        .h      LDR      r0,[r4,#8]
        0x08003904:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003908:    6980        .i      LDR      r0,[r0,#0x18]
        0x0800390a:    9000        ..      STR      r0,[sp,#0]
        0x0800390c:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x08003910:    2900        .)      CMP      r1,#0
        0x08003912:    da04        ..      BGE      0x800391e ; ecp_mod_p384 + 758
        0x08003914:    4249        IB      RSBS     r1,r1,#0
        0x08003916:    4668        hF      MOV      r0,sp
        0x08003918:    f003fe0f    ....    BL       sub32 ; 0x800753a
        0x0800391c:    e002        ..      B        0x8003924 ; ecp_mod_p384 + 764
        0x0800391e:    4668        hF      MOV      r0,sp
        0x08003920:    f7fdff4d    ..M.    BL       add32 ; 0x80017be
        0x08003924:    68a0        .h      LDR      r0,[r4,#8]
        0x08003926:    aa01        ..      ADD      r2,sp,#4
        0x08003928:    6dc1        .m      LDR      r1,[r0,#0x5c]
        0x0800392a:    4668        hF      MOV      r0,sp
        0x0800392c:    f7fdff47    ..G.    BL       add32 ; 0x80017be
        0x08003930:    68a0        .h      LDR      r0,[r4,#8]
        0x08003932:    aa01        ..      ADD      r2,sp,#4
        0x08003934:    6dc1        .m      LDR      r1,[r0,#0x5c]
        0x08003936:    4668        hF      MOV      r0,sp
        0x08003938:    f7fdff41    ..A.    BL       add32 ; 0x80017be
        0x0800393c:    68a0        .h      LDR      r0,[r4,#8]
        0x0800393e:    aa01        ..      ADD      r2,sp,#4
        0x08003940:    6c81        .l      LDR      r1,[r0,#0x48]
        0x08003942:    4668        hF      MOV      r0,sp
        0x08003944:    f7fdff3b    ..;.    BL       add32 ; 0x80017be
        0x08003948:    68a0        .h      LDR      r0,[r4,#8]
        0x0800394a:    aa01        ..      ADD      r2,sp,#4
        0x0800394c:    6bc1        .k      LDR      r1,[r0,#0x3c]
        0x0800394e:    4668        hF      MOV      r0,sp
        0x08003950:    f7fdff35    ..5.    BL       add32 ; 0x80017be
        0x08003954:    68a0        .h      LDR      r0,[r4,#8]
        0x08003956:    aa01        ..      ADD      r2,sp,#4
        0x08003958:    6b81        .k      LDR      r1,[r0,#0x38]
        0x0800395a:    4668        hF      MOV      r0,sp
        0x0800395c:    f7fdff2f    ../.    BL       add32 ; 0x80017be
        0x08003960:    68a0        .h      LDR      r0,[r4,#8]
        0x08003962:    aa01        ..      ADD      r2,sp,#4
        0x08003964:    6d81        .m      LDR      r1,[r0,#0x58]
        0x08003966:    4668        hF      MOV      r0,sp
        0x08003968:    f7fdff29    ..).    BL       add32 ; 0x80017be
        0x0800396c:    68a0        .h      LDR      r0,[r4,#8]
        0x0800396e:    aa01        ..      ADD      r2,sp,#4
        0x08003970:    6c41        Al      LDR      r1,[r0,#0x44]
        0x08003972:    4668        hF      MOV      r0,sp
        0x08003974:    f003fde1    ....    BL       sub32 ; 0x800753a
        0x08003978:    68a1        .h      LDR      r1,[r4,#8]
        0x0800397a:    9800        ..      LDR      r0,[sp,#0]
        0x0800397c:    aa01        ..      ADD      r2,sp,#4
        0x0800397e:    6188        .a      STR      r0,[r1,#0x18]
        0x08003980:    68a0        .h      LDR      r0,[r4,#8]
        0x08003982:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003986:    69c0        .i      LDR      r0,[r0,#0x1c]
        0x08003988:    9000        ..      STR      r0,[sp,#0]
        0x0800398a:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x0800398e:    2900        .)      CMP      r1,#0
        0x08003990:    da04        ..      BGE      0x800399c ; ecp_mod_p384 + 884
        0x08003992:    4249        IB      RSBS     r1,r1,#0
        0x08003994:    4668        hF      MOV      r0,sp
        0x08003996:    f003fdd0    ....    BL       sub32 ; 0x800753a
        0x0800399a:    e002        ..      B        0x80039a2 ; ecp_mod_p384 + 890
        0x0800399c:    4668        hF      MOV      r0,sp
        0x0800399e:    f7fdff0e    ....    BL       add32 ; 0x80017be
        0x080039a2:    68a0        .h      LDR      r0,[r4,#8]
        0x080039a4:    aa01        ..      ADD      r2,sp,#4
        0x080039a6:    6cc1        .l      LDR      r1,[r0,#0x4c]
        0x080039a8:    4668        hF      MOV      r0,sp
        0x080039aa:    f7fdff08    ....    BL       add32 ; 0x80017be
        0x080039ae:    68a0        .h      LDR      r0,[r4,#8]
        0x080039b0:    aa01        ..      ADD      r2,sp,#4
        0x080039b2:    6c01        .l      LDR      r1,[r0,#0x40]
        0x080039b4:    4668        hF      MOV      r0,sp
        0x080039b6:    f7fdff02    ....    BL       add32 ; 0x80017be
        0x080039ba:    68a0        .h      LDR      r0,[r4,#8]
        0x080039bc:    aa01        ..      ADD      r2,sp,#4
        0x080039be:    6bc1        .k      LDR      r1,[r0,#0x3c]
        0x080039c0:    4668        hF      MOV      r0,sp
        0x080039c2:    f7fdfefc    ....    BL       add32 ; 0x80017be
        0x080039c6:    68a0        .h      LDR      r0,[r4,#8]
        0x080039c8:    aa01        ..      ADD      r2,sp,#4
        0x080039ca:    6dc1        .m      LDR      r1,[r0,#0x5c]
        0x080039cc:    4668        hF      MOV      r0,sp
        0x080039ce:    f7fdfef6    ....    BL       add32 ; 0x80017be
        0x080039d2:    68a0        .h      LDR      r0,[r4,#8]
        0x080039d4:    aa01        ..      ADD      r2,sp,#4
        0x080039d6:    6c81        .l      LDR      r1,[r0,#0x48]
        0x080039d8:    4668        hF      MOV      r0,sp
        0x080039da:    f003fdae    ....    BL       sub32 ; 0x800753a
        0x080039de:    68a1        .h      LDR      r1,[r4,#8]
        0x080039e0:    9800        ..      LDR      r0,[sp,#0]
        0x080039e2:    aa01        ..      ADD      r2,sp,#4
        0x080039e4:    61c8        .a      STR      r0,[r1,#0x1c]
        0x080039e6:    68a0        .h      LDR      r0,[r4,#8]
        0x080039e8:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x080039ec:    6a00        .j      LDR      r0,[r0,#0x20]
        0x080039ee:    9000        ..      STR      r0,[sp,#0]
        0x080039f0:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x080039f4:    2900        .)      CMP      r1,#0
        0x080039f6:    da04        ..      BGE      0x8003a02 ; ecp_mod_p384 + 986
        0x080039f8:    4249        IB      RSBS     r1,r1,#0
        0x080039fa:    4668        hF      MOV      r0,sp
        0x080039fc:    f003fd9d    ....    BL       sub32 ; 0x800753a
        0x08003a00:    e002        ..      B        0x8003a08 ; ecp_mod_p384 + 992
        0x08003a02:    4668        hF      MOV      r0,sp
        0x08003a04:    f7fdfedb    ....    BL       add32 ; 0x80017be
        0x08003a08:    68a0        .h      LDR      r0,[r4,#8]
        0x08003a0a:    aa01        ..      ADD      r2,sp,#4
        0x08003a0c:    6d01        .m      LDR      r1,[r0,#0x50]
        0x08003a0e:    4668        hF      MOV      r0,sp
        0x08003a10:    f7fdfed5    ....    BL       add32 ; 0x80017be
        0x08003a14:    68a0        .h      LDR      r0,[r4,#8]
        0x08003a16:    aa01        ..      ADD      r2,sp,#4
        0x08003a18:    6c41        Al      LDR      r1,[r0,#0x44]
        0x08003a1a:    4668        hF      MOV      r0,sp
        0x08003a1c:    f7fdfecf    ....    BL       add32 ; 0x80017be
        0x08003a20:    68a0        .h      LDR      r0,[r4,#8]
        0x08003a22:    aa01        ..      ADD      r2,sp,#4
        0x08003a24:    6c01        .l      LDR      r1,[r0,#0x40]
        0x08003a26:    4668        hF      MOV      r0,sp
        0x08003a28:    f7fdfec9    ....    BL       add32 ; 0x80017be
        0x08003a2c:    68a0        .h      LDR      r0,[r4,#8]
        0x08003a2e:    aa01        ..      ADD      r2,sp,#4
        0x08003a30:    6cc1        .l      LDR      r1,[r0,#0x4c]
        0x08003a32:    4668        hF      MOV      r0,sp
        0x08003a34:    f003fd81    ....    BL       sub32 ; 0x800753a
        0x08003a38:    68a1        .h      LDR      r1,[r4,#8]
        0x08003a3a:    9800        ..      LDR      r0,[sp,#0]
        0x08003a3c:    aa01        ..      ADD      r2,sp,#4
        0x08003a3e:    6208        .b      STR      r0,[r1,#0x20]
        0x08003a40:    68a0        .h      LDR      r0,[r4,#8]
        0x08003a42:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003a46:    6a40        @j      LDR      r0,[r0,#0x24]
        0x08003a48:    9000        ..      STR      r0,[sp,#0]
        0x08003a4a:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x08003a4e:    2900        .)      CMP      r1,#0
        0x08003a50:    da04        ..      BGE      0x8003a5c ; ecp_mod_p384 + 1076
        0x08003a52:    4249        IB      RSBS     r1,r1,#0
        0x08003a54:    4668        hF      MOV      r0,sp
        0x08003a56:    f003fd70    ..p.    BL       sub32 ; 0x800753a
        0x08003a5a:    e002        ..      B        0x8003a62 ; ecp_mod_p384 + 1082
        0x08003a5c:    4668        hF      MOV      r0,sp
        0x08003a5e:    f7fdfeae    ....    BL       add32 ; 0x80017be
        0x08003a62:    68a0        .h      LDR      r0,[r4,#8]
        0x08003a64:    aa01        ..      ADD      r2,sp,#4
        0x08003a66:    6d41        Am      LDR      r1,[r0,#0x54]
        0x08003a68:    4668        hF      MOV      r0,sp
        0x08003a6a:    f7fdfea8    ....    BL       add32 ; 0x80017be
        0x08003a6e:    68a0        .h      LDR      r0,[r4,#8]
        0x08003a70:    aa01        ..      ADD      r2,sp,#4
        0x08003a72:    6c81        .l      LDR      r1,[r0,#0x48]
        0x08003a74:    4668        hF      MOV      r0,sp
        0x08003a76:    f7fdfea2    ....    BL       add32 ; 0x80017be
        0x08003a7a:    68a0        .h      LDR      r0,[r4,#8]
        0x08003a7c:    aa01        ..      ADD      r2,sp,#4
        0x08003a7e:    6c41        Al      LDR      r1,[r0,#0x44]
        0x08003a80:    4668        hF      MOV      r0,sp
        0x08003a82:    f7fdfe9c    ....    BL       add32 ; 0x80017be
        0x08003a86:    68a0        .h      LDR      r0,[r4,#8]
        0x08003a88:    aa01        ..      ADD      r2,sp,#4
        0x08003a8a:    6d01        .m      LDR      r1,[r0,#0x50]
        0x08003a8c:    4668        hF      MOV      r0,sp
        0x08003a8e:    f003fd54    ..T.    BL       sub32 ; 0x800753a
        0x08003a92:    68a1        .h      LDR      r1,[r4,#8]
        0x08003a94:    9800        ..      LDR      r0,[sp,#0]
        0x08003a96:    aa01        ..      ADD      r2,sp,#4
        0x08003a98:    6248        Hb      STR      r0,[r1,#0x24]
        0x08003a9a:    68a0        .h      LDR      r0,[r4,#8]
        0x08003a9c:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003aa0:    6a80        .j      LDR      r0,[r0,#0x28]
        0x08003aa2:    9000        ..      STR      r0,[sp,#0]
        0x08003aa4:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x08003aa8:    2900        .)      CMP      r1,#0
        0x08003aaa:    da04        ..      BGE      0x8003ab6 ; ecp_mod_p384 + 1166
        0x08003aac:    4249        IB      RSBS     r1,r1,#0
        0x08003aae:    4668        hF      MOV      r0,sp
        0x08003ab0:    f003fd43    ..C.    BL       sub32 ; 0x800753a
        0x08003ab4:    e002        ..      B        0x8003abc ; ecp_mod_p384 + 1172
        0x08003ab6:    4668        hF      MOV      r0,sp
        0x08003ab8:    f7fdfe81    ....    BL       add32 ; 0x80017be
        0x08003abc:    68a0        .h      LDR      r0,[r4,#8]
        0x08003abe:    aa01        ..      ADD      r2,sp,#4
        0x08003ac0:    6d81        .m      LDR      r1,[r0,#0x58]
        0x08003ac2:    4668        hF      MOV      r0,sp
        0x08003ac4:    f7fdfe7b    ..{.    BL       add32 ; 0x80017be
        0x08003ac8:    68a0        .h      LDR      r0,[r4,#8]
        0x08003aca:    aa01        ..      ADD      r2,sp,#4
        0x08003acc:    6cc1        .l      LDR      r1,[r0,#0x4c]
        0x08003ace:    4668        hF      MOV      r0,sp
        0x08003ad0:    f7fdfe75    ..u.    BL       add32 ; 0x80017be
        0x08003ad4:    68a0        .h      LDR      r0,[r4,#8]
        0x08003ad6:    aa01        ..      ADD      r2,sp,#4
        0x08003ad8:    6c81        .l      LDR      r1,[r0,#0x48]
        0x08003ada:    4668        hF      MOV      r0,sp
        0x08003adc:    f7fdfe6f    ..o.    BL       add32 ; 0x80017be
        0x08003ae0:    68a0        .h      LDR      r0,[r4,#8]
        0x08003ae2:    aa01        ..      ADD      r2,sp,#4
        0x08003ae4:    6d41        Am      LDR      r1,[r0,#0x54]
        0x08003ae6:    4668        hF      MOV      r0,sp
        0x08003ae8:    f003fd27    ..'.    BL       sub32 ; 0x800753a
        0x08003aec:    68a1        .h      LDR      r1,[r4,#8]
        0x08003aee:    9800        ..      LDR      r0,[sp,#0]
        0x08003af0:    aa01        ..      ADD      r2,sp,#4
        0x08003af2:    6288        .b      STR      r0,[r1,#0x28]
        0x08003af4:    68a0        .h      LDR      r0,[r4,#8]
        0x08003af6:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003afa:    6ac0        .j      LDR      r0,[r0,#0x2c]
        0x08003afc:    9000        ..      STR      r0,[sp,#0]
        0x08003afe:    f88d5004    ...P    STRB     r5,[sp,#4]
        0x08003b02:    2900        .)      CMP      r1,#0
        0x08003b04:    da04        ..      BGE      0x8003b10 ; ecp_mod_p384 + 1256
        0x08003b06:    4249        IB      RSBS     r1,r1,#0
        0x08003b08:    4668        hF      MOV      r0,sp
        0x08003b0a:    f003fd16    ....    BL       sub32 ; 0x800753a
        0x08003b0e:    e002        ..      B        0x8003b16 ; ecp_mod_p384 + 1262
        0x08003b10:    4668        hF      MOV      r0,sp
        0x08003b12:    f7fdfe54    ..T.    BL       add32 ; 0x80017be
        0x08003b16:    68a0        .h      LDR      r0,[r4,#8]
        0x08003b18:    aa01        ..      ADD      r2,sp,#4
        0x08003b1a:    6dc1        .m      LDR      r1,[r0,#0x5c]
        0x08003b1c:    4668        hF      MOV      r0,sp
        0x08003b1e:    f7fdfe4e    ..N.    BL       add32 ; 0x80017be
        0x08003b22:    68a0        .h      LDR      r0,[r4,#8]
        0x08003b24:    aa01        ..      ADD      r2,sp,#4
        0x08003b26:    6d01        .m      LDR      r1,[r0,#0x50]
        0x08003b28:    4668        hF      MOV      r0,sp
        0x08003b2a:    f7fdfe48    ..H.    BL       add32 ; 0x80017be
        0x08003b2e:    68a0        .h      LDR      r0,[r4,#8]
        0x08003b30:    aa01        ..      ADD      r2,sp,#4
        0x08003b32:    6cc1        .l      LDR      r1,[r0,#0x4c]
        0x08003b34:    4668        hF      MOV      r0,sp
        0x08003b36:    f7fdfe42    ..B.    BL       add32 ; 0x80017be
        0x08003b3a:    68a0        .h      LDR      r0,[r4,#8]
        0x08003b3c:    aa01        ..      ADD      r2,sp,#4
        0x08003b3e:    6d81        .m      LDR      r1,[r0,#0x58]
        0x08003b40:    4668        hF      MOV      r0,sp
        0x08003b42:    f003fcfa    ....    BL       sub32 ; 0x800753a
        0x08003b46:    68a1        .h      LDR      r1,[r4,#8]
        0x08003b48:    9800        ..      LDR      r0,[sp,#0]
        0x08003b4a:    62c8        .b      STR      r0,[r1,#0x2c]
        0x08003b4c:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003b50:    200c        .       MOVS     r0,#0xc
        0x08003b52:    2900        .)      CMP      r1,#0
        0x08003b54:    dc00        ..      BGT      0x8003b58 ; ecp_mod_p384 + 1328
        0x08003b56:    2100        .!      MOVS     r1,#0
        0x08003b58:    68a2        .h      LDR      r2,[r4,#8]
        0x08003b5a:    6311        .c      STR      r1,[r2,#0x30]
        0x08003b5c:    9500        ..      STR      r5,[sp,#0]
        0x08003b5e:    e003        ..      B        0x8003b68 ; ecp_mod_p384 + 1344
        0x08003b60:    68a2        .h      LDR      r2,[r4,#8]
        0x08003b62:    9900        ..      LDR      r1,[sp,#0]
        0x08003b64:    f8421020    B. .    STR      r1,[r2,r0,LSL #2]
        0x08003b68:    6861        ah      LDR      r1,[r4,#4]
        0x08003b6a:    1c40        @.      ADDS     r0,r0,#1
        0x08003b6c:    4288        .B      CMP      r0,r1
        0x08003b6e:    d3f7        ..      BCC      0x8003b60 ; ecp_mod_p384 + 1336
        0x08003b70:    f99d1004    ....    LDRSB    r1,[sp,#4]
        0x08003b74:    2900        .)      CMP      r1,#0
        0x08003b76:    da04        ..      BGE      0x8003b82 ; ecp_mod_p384 + 1370
        0x08003b78:    463b        ;F      MOV      r3,r7
        0x08003b7a:    aa03        ..      ADD      r2,sp,#0xc
        0x08003b7c:    4620         F      MOV      r0,r4
        0x08003b7e:    f000febb    ....    BL       fix_negative ; 0x80048f8
        0x08003b82:    b015        ..      ADD      sp,sp,#0x54
        0x08003b84:    4630        0F      MOV      r0,r6
        0x08003b86:    bdf0        ..      POP      {r4-r7,pc}
    i.ecp_mod_p448
    ecp_mod_p448
        0x08003b88:    b570        p.      PUSH     {r4-r6,lr}
        0x08003b8a:    4604        .F      MOV      r4,r0
        0x08003b8c:    6840        @h      LDR      r0,[r0,#4]
        0x08003b8e:    b0a6        ..      SUB      sp,sp,#0x98
        0x08003b90:    280e        .(      CMP      r0,#0xe
        0x08003b92:    d802        ..      BHI      0x8003b9a ; ecp_mod_p448 + 18
        0x08003b94:    2000        .       MOVS     r0,#0
        0x08003b96:    b026        &.      ADD      sp,sp,#0x98
        0x08003b98:    bd70        p.      POP      {r4-r6,pc}
        0x08003b9a:    2001        .       MOVS     r0,#1
        0x08003b9c:    9002        ..      STR      r0,[sp,#8]
        0x08003b9e:    6860        `h      LDR      r0,[r4,#4]
        0x08003ba0:    380e        .8      SUBS     r0,r0,#0xe
        0x08003ba2:    9003        ..      STR      r0,[sp,#0xc]
        0x08003ba4:    280e        .(      CMP      r0,#0xe
        0x08003ba6:    d901        ..      BLS      0x8003bac ; ecp_mod_p448 + 36
        0x08003ba8:    482a        *H      LDR      r0,[pc,#168] ; [0x8003c54] = 0xffffb080
        0x08003baa:    e7f4        ..      B        0x8003b96 ; ecp_mod_p448 + 14
        0x08003bac:    ae05        ..      ADD      r6,sp,#0x14
        0x08003bae:    213c        <!      MOVS     r1,#0x3c
        0x08003bb0:    a805        ..      ADD      r0,sp,#0x14
        0x08003bb2:    9604        ..      STR      r6,[sp,#0x10]
        0x08003bb4:    f7fcfcd2    ....    BL       __aeabi_memclr4 ; 0x800055c
        0x08003bb8:    9803        ..      LDR      r0,[sp,#0xc]
        0x08003bba:    68a1        .h      LDR      r1,[r4,#8]
        0x08003bbc:    0082        ..      LSLS     r2,r0,#2
        0x08003bbe:    a805        ..      ADD      r0,sp,#0x14
        0x08003bc0:    3138        81      ADDS     r1,r1,#0x38
        0x08003bc2:    f7fcfc6c    ..l.    BL       __aeabi_memcpy4 ; 0x800049e
        0x08003bc6:    200e        .       MOVS     r0,#0xe
        0x08003bc8:    2500        .%      MOVS     r5,#0
        0x08003bca:    e003        ..      B        0x8003bd4 ; ecp_mod_p448 + 76
        0x08003bcc:    68a1        .h      LDR      r1,[r4,#8]
        0x08003bce:    f8415020    A. P    STR      r5,[r1,r0,LSL #2]
        0x08003bd2:    1c40        @.      ADDS     r0,r0,#1
        0x08003bd4:    6861        ah      LDR      r1,[r4,#4]
        0x08003bd6:    4281        .B      CMP      r1,r0
        0x08003bd8:    d8f8        ..      BHI      0x8003bcc ; ecp_mod_p448 + 68
        0x08003bda:    4621        !F      MOV      r1,r4
        0x08003bdc:    aa02        ..      ADD      r2,sp,#8
        0x08003bde:    4608        .F      MOV      r0,r1
        0x08003be0:    f002f83a    ..:.    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08003be4:    2800        .(      CMP      r0,#0
        0x08003be6:    d1d6        ..      BNE      0x8003b96 ; ecp_mod_p448 + 14
        0x08003be8:    e9dd0102    ....    LDRD     r0,r1,[sp,#8]
        0x08003bec:    e9cd0114    ....    STRD     r0,r1,[sp,#0x50]
        0x08003bf0:    a817        ..      ADD      r0,sp,#0x5c
        0x08003bf2:    2238        8"      MOVS     r2,#0x38
        0x08003bf4:    a905        ..      ADD      r1,sp,#0x14
        0x08003bf6:    9016        ..      STR      r0,[sp,#0x58]
        0x08003bf8:    f7fcfc51    ..Q.    BL       __aeabi_memcpy4 ; 0x800049e
        0x08003bfc:    21e0        .!      MOVS     r1,#0xe0
        0x08003bfe:    a814        ..      ADD      r0,sp,#0x50
        0x08003c00:    f002ffb0    ....    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x08003c04:    2800        .(      CMP      r0,#0
        0x08003c06:    d1c6        ..      BNE      0x8003b96 ; ecp_mod_p448 + 14
        0x08003c08:    4621        !F      MOV      r1,r4
        0x08003c0a:    aa14        ..      ADD      r2,sp,#0x50
        0x08003c0c:    4608        .F      MOV      r0,r1
        0x08003c0e:    f002f823    ..#.    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08003c12:    2800        .(      CMP      r0,#0
        0x08003c14:    d1bf        ..      BNE      0x8003b96 ; ecp_mod_p448 + 14
        0x08003c16:    2007        .       MOVS     r0,#7
        0x08003c18:    e003        ..      B        0x8003c22 ; ecp_mod_p448 + 154
        0x08003c1a:    bf00        ..      NOP      
        0x08003c1c:    f8465020    F. P    STR      r5,[r6,r0,LSL #2]
        0x08003c20:    1c40        @.      ADDS     r0,r0,#1
        0x08003c22:    9903        ..      LDR      r1,[sp,#0xc]
        0x08003c24:    4281        .B      CMP      r1,r0
        0x08003c26:    d8f9        ..      BHI      0x8003c1c ; ecp_mod_p448 + 148
        0x08003c28:    a902        ..      ADD      r1,sp,#8
        0x08003c2a:    aa14        ..      ADD      r2,sp,#0x50
        0x08003c2c:    4608        .F      MOV      r0,r1
        0x08003c2e:    f002f813    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08003c32:    2800        .(      CMP      r0,#0
        0x08003c34:    d1af        ..      BNE      0x8003b96 ; ecp_mod_p448 + 14
        0x08003c36:    200f        .       MOVS     r0,#0xf
        0x08003c38:    9003        ..      STR      r0,[sp,#0xc]
        0x08003c3a:    21e0        .!      MOVS     r1,#0xe0
        0x08003c3c:    a802        ..      ADD      r0,sp,#8
        0x08003c3e:    f002ff41    ..A.    BL       mbedtls_mpi_shift_l ; 0x8006ac4
        0x08003c42:    2800        .(      CMP      r0,#0
        0x08003c44:    d1a7        ..      BNE      0x8003b96 ; ecp_mod_p448 + 14
        0x08003c46:    4621        !F      MOV      r1,r4
        0x08003c48:    aa02        ..      ADD      r2,sp,#8
        0x08003c4a:    4608        .F      MOV      r0,r1
        0x08003c4c:    f002f804    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08003c50:    e7a1        ..      B        0x8003b96 ; ecp_mod_p448 + 14
    $d
        0x08003c52:    0000        ..      DCW    0
        0x08003c54:    ffffb080    ....    DCD    4294946944
    $t
    i.ecp_mod_p521
    ecp_mod_p521
        0x08003c58:    b510        ..      PUSH     {r4,lr}
        0x08003c5a:    4604        .F      MOV      r4,r0
        0x08003c5c:    6840        @h      LDR      r0,[r0,#4]
        0x08003c5e:    b096        ..      SUB      sp,sp,#0x58
        0x08003c60:    2811        .(      CMP      r0,#0x11
        0x08003c62:    d202        ..      BCS      0x8003c6a ; ecp_mod_p521 + 18
        0x08003c64:    2000        .       MOVS     r0,#0
        0x08003c66:    b016        ..      ADD      sp,sp,#0x58
        0x08003c68:    bd10        ..      POP      {r4,pc}
        0x08003c6a:    2001        .       MOVS     r0,#1
        0x08003c6c:    9012        ..      STR      r0,[sp,#0x48]
        0x08003c6e:    6860        `h      LDR      r0,[r4,#4]
        0x08003c70:    3810        .8      SUBS     r0,r0,#0x10
        0x08003c72:    9013        ..      STR      r0,[sp,#0x4c]
        0x08003c74:    2812        .(      CMP      r0,#0x12
        0x08003c76:    d901        ..      BLS      0x8003c7c ; ecp_mod_p521 + 36
        0x08003c78:    2012        .       MOVS     r0,#0x12
        0x08003c7a:    9013        ..      STR      r0,[sp,#0x4c]
        0x08003c7c:    f8cdd050    ..P.    STR      sp,[sp,#0x50]
        0x08003c80:    9813        ..      LDR      r0,[sp,#0x4c]
        0x08003c82:    68a1        .h      LDR      r1,[r4,#8]
        0x08003c84:    0082        ..      LSLS     r2,r0,#2
        0x08003c86:    4668        hF      MOV      r0,sp
        0x08003c88:    3140        @1      ADDS     r1,r1,#0x40
        0x08003c8a:    f7fcfc08    ....    BL       __aeabi_memcpy4 ; 0x800049e
        0x08003c8e:    2109        .!      MOVS     r1,#9
        0x08003c90:    a812        ..      ADD      r0,sp,#0x48
        0x08003c92:    f002ff67    ..g.    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x08003c96:    2800        .(      CMP      r0,#0
        0x08003c98:    d1e5        ..      BNE      0x8003c66 ; ecp_mod_p521 + 14
        0x08003c9a:    68a0        .h      LDR      r0,[r4,#8]
        0x08003c9c:    f8b01040    ..@.    LDRH     r1,[r0,#0x40]
        0x08003ca0:    f3c10108    ....    UBFX     r1,r1,#0,#9
        0x08003ca4:    6401        .d      STR      r1,[r0,#0x40]
        0x08003ca6:    2011        .       MOVS     r0,#0x11
        0x08003ca8:    2100        .!      MOVS     r1,#0
        0x08003caa:    e003        ..      B        0x8003cb4 ; ecp_mod_p521 + 92
        0x08003cac:    68a2        .h      LDR      r2,[r4,#8]
        0x08003cae:    f8421020    B. .    STR      r1,[r2,r0,LSL #2]
        0x08003cb2:    1c40        @.      ADDS     r0,r0,#1
        0x08003cb4:    6862        bh      LDR      r2,[r4,#4]
        0x08003cb6:    4282        .B      CMP      r2,r0
        0x08003cb8:    d8f8        ..      BHI      0x8003cac ; ecp_mod_p521 + 84
        0x08003cba:    4621        !F      MOV      r1,r4
        0x08003cbc:    aa12        ..      ADD      r2,sp,#0x48
        0x08003cbe:    4608        .F      MOV      r0,r1
        0x08003cc0:    f001ff56    ..V.    BL       mbedtls_mpi_add_abs ; 0x8005b70
        0x08003cc4:    e7cf        ..      B        0x8003c66 ; ecp_mod_p521 + 14
        0x08003cc6:    0000        ..      MOVS     r0,r0
    i.ecp_modp
    ecp_modp
        0x08003cc8:    b570        p.      PUSH     {r4-r6,lr}
        0x08003cca:    4605        .F      MOV      r5,r0
        0x08003ccc:    6e48        Hn      LDR      r0,[r1,#0x64]
        0x08003cce:    460c        .F      MOV      r4,r1
        0x08003cd0:    b140        @.      CBZ      r0,0x8003ce4 ; ecp_modp + 28
        0x08003cd2:    6828        (h      LDR      r0,[r5,#0]
        0x08003cd4:    2800        .(      CMP      r0,#0
        0x08003cd6:    da0c        ..      BGE      0x8003cf2 ; ecp_modp + 42
        0x08003cd8:    2100        .!      MOVS     r1,#0
        0x08003cda:    4628        (F      MOV      r0,r5
        0x08003cdc:    f002f834    ..4.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08003ce0:    b970        p.      CBNZ     r0,0x8003d00 ; ecp_modp + 56
        0x08003ce2:    e006        ..      B        0x8003cf2 ; ecp_modp + 42
        0x08003ce4:    4629        )F      MOV      r1,r5
        0x08003ce6:    1d22        ".      ADDS     r2,r4,#4
        0x08003ce8:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x08003cec:    4608        .F      MOV      r0,r1
        0x08003cee:    f002bcb2    ....    B.W      mbedtls_mpi_mod_mpi ; 0x8006656
        0x08003cf2:    4628        (F      MOV      r0,r5
        0x08003cf4:    f001ffd7    ....    BL       mbedtls_mpi_bitlen ; 0x8005ca6
        0x08003cf8:    6da1        .m      LDR      r1,[r4,#0x58]
        0x08003cfa:    ebb00f41    ..A.    CMP      r0,r1,LSL #1
        0x08003cfe:    d901        ..      BLS      0x8003d04 ; ecp_modp + 60
        0x08003d00:    4812        .H      LDR      r0,[pc,#72] ; [0x8003d4c] = 0xffffb080
        0x08003d02:    bd70        p.      POP      {r4-r6,pc}
        0x08003d04:    6e61        an      LDR      r1,[r4,#0x64]
        0x08003d06:    4628        (F      MOV      r0,r5
        0x08003d08:    4788        .G      BLX      r1
        0x08003d0a:    e004        ..      B        0x8003d16 ; ecp_modp + 78
        0x08003d0c:    4629        )F      MOV      r1,r5
        0x08003d0e:    1d22        ".      ADDS     r2,r4,#4
        0x08003d10:    4608        .F      MOV      r0,r1
        0x08003d12:    f001ffa1    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08003d16:    0006        ..      MOVS     r6,r0
        0x08003d18:    d116        ..      BNE      0x8003d48 ; ecp_modp + 128
        0x08003d1a:    6828        (h      LDR      r0,[r5,#0]
        0x08003d1c:    2800        .(      CMP      r0,#0
        0x08003d1e:    da0d        ..      BGE      0x8003d3c ; ecp_modp + 116
        0x08003d20:    2100        .!      MOVS     r1,#0
        0x08003d22:    4628        (F      MOV      r0,r5
        0x08003d24:    f002f810    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08003d28:    2800        .(      CMP      r0,#0
        0x08003d2a:    d1ef        ..      BNE      0x8003d0c ; ecp_modp + 68
        0x08003d2c:    e006        ..      B        0x8003d3c ; ecp_modp + 116
        0x08003d2e:    4629        )F      MOV      r1,r5
        0x08003d30:    1d22        ".      ADDS     r2,r4,#4
        0x08003d32:    4608        .F      MOV      r0,r1
        0x08003d34:    f002ff93    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08003d38:    0006        ..      MOVS     r6,r0
        0x08003d3a:    d105        ..      BNE      0x8003d48 ; ecp_modp + 128
        0x08003d3c:    1d21        !.      ADDS     r1,r4,#4
        0x08003d3e:    4628        (F      MOV      r0,r5
        0x08003d40:    f002f81a    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08003d44:    2800        .(      CMP      r0,#0
        0x08003d46:    daf2        ..      BGE      0x8003d2e ; ecp_modp + 102
        0x08003d48:    4630        0F      MOV      r0,r6
        0x08003d4a:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x08003d4c:    ffffb080    ....    DCD    4294946944
    $t
    i.ecp_mul_comb
    ecp_mul_comb
        0x08003d50:    e92d4fff    -..O    PUSH     {r0-r11,lr}
        0x08003d54:    b0c9        ..      SUB      sp,sp,#0x124
        0x08003d56:    4605        .F      MOV      r5,r0
        0x08003d58:    f1000134    ..4.    ADD      r1,r0,#0x34
        0x08003d5c:    984c        L.      LDR      r0,[sp,#0x130]
        0x08003d5e:    f8ddb160    ..`.    LDR      r11,[sp,#0x160]
        0x08003d62:    300c        .0      ADDS     r0,r0,#0xc
        0x08003d64:    f002f808    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08003d68:    b928        (.      CBNZ     r0,0x8003d76 ; ecp_mul_comb + 38
        0x08003d6a:    f1050128    ..(.    ADD      r1,r5,#0x28
        0x08003d6e:    984c        L.      LDR      r0,[sp,#0x130]
        0x08003d70:    f002f802    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08003d74:    b138        8.      CBZ      r0,0x8003d86 ; ecp_mul_comb + 54
        0x08003d76:    2100        .!      MOVS     r1,#0
        0x08003d78:    6dea        .m      LDR      r2,[r5,#0x5c]
        0x08003d7a:    4689        .F      MOV      r9,r1
        0x08003d7c:    f5b27fc0    ....    CMP      r2,#0x180
        0x08003d80:    d303        ..      BCC      0x8003d8a ; ecp_mul_comb + 58
        0x08003d82:    2005        .       MOVS     r0,#5
        0x08003d84:    e002        ..      B        0x8003d8c ; ecp_mul_comb + 60
        0x08003d86:    2101        .!      MOVS     r1,#1
        0x08003d88:    e7f6        ..      B        0x8003d78 ; ecp_mul_comb + 40
        0x08003d8a:    2004        .       MOVS     r0,#4
        0x08003d8c:    f1b90f00    ....    CMP      r9,#0
        0x08003d90:    d000        ..      BEQ      0x8003d94 ; ecp_mul_comb + 68
        0x08003d92:    1c40        @.      ADDS     r0,r0,#1
        0x08003d94:    2806        .(      CMP      r0,#6
        0x08003d96:    d900        ..      BLS      0x8003d9a ; ecp_mul_comb + 74
        0x08003d98:    2006        .       MOVS     r0,#6
        0x08003d9a:    4282        .B      CMP      r2,r0
        0x08003d9c:    d800        ..      BHI      0x8003da0 ; ecp_mul_comb + 80
        0x08003d9e:    2002        .       MOVS     r0,#2
        0x08003da0:    4680        .F      MOV      r8,r0
        0x08003da2:    1e40        @.      SUBS     r0,r0,#1
        0x08003da4:    2101        .!      MOVS     r1,#1
        0x08003da6:    4081        .@      LSLS     r1,r1,r0
        0x08003da8:    b2ce        ..      UXTB     r6,r1
        0x08003daa:    1811        ..      ADDS     r1,r2,r0
        0x08003dac:    fbb1faf8    ....    UDIV     r10,r1,r8
        0x08003db0:    f1b90f00    ....    CMP      r9,#0
        0x08003db4:    d001        ..      BEQ      0x8003dba ; ecp_mul_comb + 106
        0x08003db6:    6f6c        lo      LDR      r4,[r5,#0x74]
        0x08003db8:    bb1c        ..      CBNZ     r4,0x8003e02 ; ecp_mul_comb + 178
        0x08003dba:    2124        $!      MOVS     r1,#0x24
        0x08003dbc:    4630        0F      MOV      r0,r6
        0x08003dbe:    f7fcfa29    ..).    BL       calloc ; 0x8000214
        0x08003dc2:    0004        ..      MOVS     r4,r0
        0x08003dc4:    d001        ..      BEQ      0x8003dca ; ecp_mul_comb + 122
        0x08003dc6:    2700        .'      MOVS     r7,#0
        0x08003dc8:    e00a        ..      B        0x8003de0 ; ecp_mul_comb + 144
        0x08003dca:    4f31        1O      LDR      r7,[pc,#196] ; [0x8003e90] = 0xffffb280
        0x08003dcc:    e043        C.      B        0x8003e56 ; ecp_mul_comb + 262
        0x08003dce:    bf00        ..      NOP      
        0x08003dd0:    eb0700c7    ....    ADD      r0,r7,r7,LSL #3
        0x08003dd4:    eb040080    ....    ADD      r0,r4,r0,LSL #2
        0x08003dd8:    f001f9de    ....    BL       mbedtls_ecp_point_init ; 0x8005198
        0x08003ddc:    1c7f        ..      ADDS     r7,r7,#1
        0x08003dde:    b2ff        ..      UXTB     r7,r7
        0x08003de0:    42b7        .B      CMP      r7,r6
        0x08003de2:    d3f5        ..      BCC      0x8003dd0 ; ecp_mul_comb + 128
        0x08003de4:    e9cdab00    ....    STRD     r10,r11,[sp,#0]
        0x08003de8:    4643        CF      MOV      r3,r8
        0x08003dea:    4621        !F      MOV      r1,r4
        0x08003dec:    4628        (F      MOV      r0,r5
        0x08003dee:    9a4c        L.      LDR      r2,[sp,#0x130]
        0x08003df0:    f000fa8a    ....    BL       ecp_precompute_comb ; 0x8004308
        0x08003df4:    0007        ..      MOVS     r7,r0
        0x08003df6:    d12e        ..      BNE      0x8003e56 ; ecp_mul_comb + 262
        0x08003df8:    f1b90f00    ....    CMP      r9,#0
        0x08003dfc:    d001        ..      BEQ      0x8003e02 ; ecp_mul_comb + 178
        0x08003dfe:    e9c5461d    ...F    STRD     r4,r6,[r5,#0x74]
        0x08003e02:    4642        BF      MOV      r2,r8
        0x08003e04:    46d8        .F      MOV      r8,r11
        0x08003e06:    e9ddb14a    ..J.    LDRD     r11,r1,[sp,#0x128]
        0x08003e0a:    a847        G.      ADD      r0,sp,#0x11c
        0x08003e0c:    f8dd9158    ..X.    LDR      r9,[sp,#0x158]
        0x08003e10:    e9cd2000    ...     STRD     r2,r0,[sp,#0]
        0x08003e14:    4653        SF      MOV      r3,r10
        0x08003e16:    9f57        W.      LDR      r7,[sp,#0x15c]
        0x08003e18:    aa05        ..      ADD      r2,sp,#0x14
        0x08003e1a:    4628        (F      MOV      r0,r5
        0x08003e1c:    f7fefba2    ....    BL       ecp_comb_recode_scalar ; 0x8002564
        0x08003e20:    b9c0        ..      CBNZ     r0,0x8003e54 ; ecp_mul_comb + 260
        0x08003e22:    a805        ..      ADD      r0,sp,#0x14
        0x08003e24:    e9cd0a00    ....    STRD     r0,r10,[sp,#0]
        0x08003e28:    f8cd9008    ....    STR      r9,[sp,#8]
        0x08003e2c:    e9cd7803    ...x    STRD     r7,r8,[sp,#0xc]
        0x08003e30:    4633        3F      MOV      r3,r6
        0x08003e32:    4622        "F      MOV      r2,r4
        0x08003e34:    4659        YF      MOV      r1,r11
        0x08003e36:    4628        (F      MOV      r0,r5
        0x08003e38:    f000f82c    ..,.    BL       ecp_mul_comb_core ; 0x8003e94
        0x08003e3c:    b950        P.      CBNZ     r0,0x8003e54 ; ecp_mul_comb + 260
        0x08003e3e:    f89d211c    ...!    LDRB     r2,[sp,#0x11c]
        0x08003e42:    4659        YF      MOV      r1,r11
        0x08003e44:    4628        (F      MOV      r0,r5
        0x08003e46:    f000fbb5    ....    BL       ecp_safe_invert_jac ; 0x80045b4
        0x08003e4a:    b918        ..      CBNZ     r0,0x8003e54 ; ecp_mul_comb + 260
        0x08003e4c:    4659        YF      MOV      r1,r11
        0x08003e4e:    4628        (F      MOV      r0,r5
        0x08003e50:    f000f907    ....    BL       ecp_normalize_jac ; 0x8004062
        0x08003e54:    4607        .F      MOV      r7,r0
        0x08003e56:    6f68        ho      LDR      r0,[r5,#0x74]
        0x08003e58:    42a0        .B      CMP      r0,r4
        0x08003e5a:    d010        ..      BEQ      0x8003e7e ; ecp_mul_comb + 302
        0x08003e5c:    b17c        |.      CBZ      r4,0x8003e7e ; ecp_mul_comb + 302
        0x08003e5e:    2500        .%      MOVS     r5,#0
        0x08003e60:    e008        ..      B        0x8003e74 ; ecp_mul_comb + 292
        0x08003e62:    bf00        ..      NOP      
        0x08003e64:    eb0500c5    ....    ADD      r0,r5,r5,LSL #3
        0x08003e68:    eb040080    ....    ADD      r0,r4,r0,LSL #2
        0x08003e6c:    f001f984    ....    BL       mbedtls_ecp_point_free ; 0x8005178
        0x08003e70:    1c6d        m.      ADDS     r5,r5,#1
        0x08003e72:    b2ed        ..      UXTB     r5,r5
        0x08003e74:    42b5        .B      CMP      r5,r6
        0x08003e76:    d3f5        ..      BCC      0x8003e64 ; ecp_mul_comb + 276
        0x08003e78:    4620         F      MOV      r0,r4
        0x08003e7a:    f7fcfa0e    ....    BL       free ; 0x800029a
        0x08003e7e:    b117        ..      CBZ      r7,0x8003e86 ; ecp_mul_comb + 310
        0x08003e80:    984a        J.      LDR      r0,[sp,#0x128]
        0x08003e82:    f001f979    ..y.    BL       mbedtls_ecp_point_free ; 0x8005178
        0x08003e86:    b04d        M.      ADD      sp,sp,#0x134
        0x08003e88:    4638        8F      MOV      r0,r7
        0x08003e8a:    e8bd8ff0    ....    POP      {r4-r11,pc}
    $d
        0x08003e8e:    0000        ..      DCW    0
        0x08003e90:    ffffb280    ....    DCD    4294947456
    $t
    i.ecp_mul_comb_core
    ecp_mul_comb_core
        0x08003e94:    e92d4fff    -..O    PUSH     {r0-r11,lr}
        0x08003e98:    b08b        ..      SUB      sp,sp,#0x2c
        0x08003e9a:    460e        .F      MOV      r6,r1
        0x08003e9c:    a919        ..      ADD      r1,sp,#0x64
        0x08003e9e:    469a        .F      MOV      r10,r3
        0x08003ea0:    e8910310    ....    LDM      r1,{r4,r8,r9}
        0x08003ea4:    4693        .F      MOV      r11,r2
        0x08003ea6:    a801        ..      ADD      r0,sp,#4
        0x08003ea8:    9f18        ..      LDR      r7,[sp,#0x60]
        0x08003eaa:    f001f975    ..u.    BL       mbedtls_ecp_point_init ; 0x8005198
        0x08003eae:    5d38        8]      LDRB     r0,[r7,r4]
        0x08003eb0:    9000        ..      STR      r0,[sp,#0]
        0x08003eb2:    4653        SF      MOV      r3,r10
        0x08003eb4:    465a        ZF      MOV      r2,r11
        0x08003eb6:    4631        1F      MOV      r1,r6
        0x08003eb8:    980b        ..      LDR      r0,[sp,#0x2c]
        0x08003eba:    f000fb9d    ....    BL       ecp_select_comb ; 0x80045f8
        0x08003ebe:    0005        ..      MOVS     r5,r0
        0x08003ec0:    d12c        ,.      BNE      0x8003f1c ; ecp_mul_comb_core + 136
        0x08003ec2:    2101        .!      MOVS     r1,#1
        0x08003ec4:    f1060018    ....    ADD      r0,r6,#0x18
        0x08003ec8:    f002fba8    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x08003ecc:    0005        ..      MOVS     r5,r0
        0x08003ece:    d125        %.      BNE      0x8003f1c ; ecp_mul_comb_core + 136
        0x08003ed0:    f1b80000    ....    SUBS     r0,r8,#0
        0x08003ed4:    d020         .      BEQ      0x8003f18 ; ecp_mul_comb_core + 132
        0x08003ed6:    4602        .F      MOV      r2,r0
        0x08003ed8:    464b        KF      MOV      r3,r9
        0x08003eda:    4631        1F      MOV      r1,r6
        0x08003edc:    980b        ..      LDR      r0,[sp,#0x2c]
        0x08003ede:    f000fa97    ....    BL       ecp_randomize_jac ; 0x8004410
        0x08003ee2:    e017        ..      B        0x8003f14 ; ecp_mul_comb_core + 128
        0x08003ee4:    4632        2F      MOV      r2,r6
        0x08003ee6:    4611        .F      MOV      r1,r2
        0x08003ee8:    1e64        d.      SUBS     r4,r4,#1
        0x08003eea:    980b        ..      LDR      r0,[sp,#0x2c]
        0x08003eec:    f7fefcf2    ....    BL       ecp_double_jac ; 0x80028d4
        0x08003ef0:    0005        ..      MOVS     r5,r0
        0x08003ef2:    d113        ..      BNE      0x8003f1c ; ecp_mul_comb_core + 136
        0x08003ef4:    5d38        8]      LDRB     r0,[r7,r4]
        0x08003ef6:    9000        ..      STR      r0,[sp,#0]
        0x08003ef8:    4653        SF      MOV      r3,r10
        0x08003efa:    465a        ZF      MOV      r2,r11
        0x08003efc:    a901        ..      ADD      r1,sp,#4
        0x08003efe:    980b        ..      LDR      r0,[sp,#0x2c]
        0x08003f00:    f000fb7a    ..z.    BL       ecp_select_comb ; 0x80045f8
        0x08003f04:    0005        ..      MOVS     r5,r0
        0x08003f06:    d109        ..      BNE      0x8003f1c ; ecp_mul_comb_core + 136
        0x08003f08:    4632        2F      MOV      r2,r6
        0x08003f0a:    ab01        ..      ADD      r3,sp,#4
        0x08003f0c:    4611        .F      MOV      r1,r2
        0x08003f0e:    980b        ..      LDR      r0,[sp,#0x2c]
        0x08003f10:    f7fef8dc    ....    BL       ecp_add_mixed ; 0x80020cc
        0x08003f14:    0005        ..      MOVS     r5,r0
        0x08003f16:    d101        ..      BNE      0x8003f1c ; ecp_mul_comb_core + 136
        0x08003f18:    2c00        .,      CMP      r4,#0
        0x08003f1a:    d1e3        ..      BNE      0x8003ee4 ; ecp_mul_comb_core + 80
        0x08003f1c:    a801        ..      ADD      r0,sp,#4
        0x08003f1e:    f001f92b    ..+.    BL       mbedtls_ecp_point_free ; 0x8005178
        0x08003f22:    b00f        ..      ADD      sp,sp,#0x3c
        0x08003f24:    4628        (F      MOV      r0,r5
        0x08003f26:    e8bd8ff0    ....    POP      {r4-r11,pc}
    i.ecp_mul_mxz
    ecp_mul_mxz
        0x08003f2a:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x08003f2e:    b08f        ..      SUB      sp,sp,#0x3c
        0x08003f30:    4605        .F      MOV      r5,r0
        0x08003f32:    e9dd7918    ...y    LDRD     r7,r9,[sp,#0x60]
        0x08003f36:    4698        .F      MOV      r8,r3
        0x08003f38:    4692        .F      MOV      r10,r2
        0x08003f3a:    460e        .F      MOV      r6,r1
        0x08003f3c:    a802        ..      ADD      r0,sp,#8
        0x08003f3e:    f001f92b    ..+.    BL       mbedtls_ecp_point_init ; 0x8005198
        0x08003f42:    a80b        ..      ADD      r0,sp,#0x2c
        0x08003f44:    f002fa18    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08003f48:    4641        AF      MOV      r1,r8
        0x08003f4a:    a80b        ..      ADD      r0,sp,#0x2c
        0x08003f4c:    f001ff5a    ..Z.    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08003f50:    0004        ..      MOVS     r4,r0
        0x08003f52:    d17c        |.      BNE      0x800404e ; ecp_mul_mxz + 292
        0x08003f54:    4641        AF      MOV      r1,r8
        0x08003f56:    a802        ..      ADD      r0,sp,#8
        0x08003f58:    f000fe76    ..v.    BL       mbedtls_ecp_copy ; 0x8004c48
        0x08003f5c:    0004        ..      MOVS     r4,r0
        0x08003f5e:    d176        v.      BNE      0x800404e ; ecp_mul_mxz + 292
        0x08003f60:    2101        .!      MOVS     r1,#1
        0x08003f62:    4630        0F      MOV      r0,r6
        0x08003f64:    f002fb5a    ..Z.    BL       mbedtls_mpi_lset ; 0x800661c
        0x08003f68:    0004        ..      MOVS     r4,r0
        0x08003f6a:    d170        p.      BNE      0x800404e ; ecp_mul_mxz + 292
        0x08003f6c:    f1060018    ....    ADD      r0,r6,#0x18
        0x08003f70:    2100        .!      MOVS     r1,#0
        0x08003f72:    4683        .F      MOV      r11,r0
        0x08003f74:    f002fb52    ..R.    BL       mbedtls_mpi_lset ; 0x800661c
        0x08003f78:    0004        ..      MOVS     r4,r0
        0x08003f7a:    d168        h.      BNE      0x800404e ; ecp_mul_mxz + 292
        0x08003f7c:    f106000c    ....    ADD      r0,r6,#0xc
        0x08003f80:    f002f931    ..1.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08003f84:    e006        ..      B        0x8003f94 ; ecp_mul_mxz + 106
        0x08003f86:    a902        ..      ADD      r1,sp,#8
        0x08003f88:    1d2a        *.      ADDS     r2,r5,#4
        0x08003f8a:    4608        .F      MOV      r0,r1
        0x08003f8c:    f002fe67    ..g.    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08003f90:    0004        ..      MOVS     r4,r0
        0x08003f92:    d15c        \.      BNE      0x800404e ; ecp_mul_mxz + 292
        0x08003f94:    1d29        ).      ADDS     r1,r5,#4
        0x08003f96:    a802        ..      ADD      r0,sp,#8
        0x08003f98:    f001feee    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08003f9c:    2800        .(      CMP      r0,#0
        0x08003f9e:    daf2        ..      BGE      0x8003f86 ; ecp_mul_mxz + 92
        0x08003fa0:    b13f        ?.      CBZ      r7,0x8003fb2 ; ecp_mul_mxz + 136
        0x08003fa2:    464b        KF      MOV      r3,r9
        0x08003fa4:    463a        :F      MOV      r2,r7
        0x08003fa6:    a902        ..      ADD      r1,sp,#8
        0x08003fa8:    4628        (F      MOV      r0,r5
        0x08003faa:    f000fab3    ....    BL       ecp_randomize_mxz ; 0x8004514
        0x08003fae:    0004        ..      MOVS     r4,r0
        0x08003fb0:    d14d        M.      BNE      0x800404e ; ecp_mul_mxz + 292
        0x08003fb2:    4650        PF      MOV      r0,r10
        0x08003fb4:    f001fe77    ..w.    BL       mbedtls_mpi_bitlen ; 0x8005ca6
        0x08003fb8:    4607        .F      MOV      r7,r0
        0x08003fba:    f10d0820    .. .    ADD      r8,sp,#0x20
        0x08003fbe:    e02d        -.      B        0x800401c ; ecp_mul_mxz + 242
        0x08003fc0:    4639        9F      MOV      r1,r7
        0x08003fc2:    4650        PF      MOV      r0,r10
        0x08003fc4:    f002f9a0    ....    BL       mbedtls_mpi_get_bit ; 0x8006308
        0x08003fc8:    b2c0        ..      UXTB     r0,r0
        0x08003fca:    4681        .F      MOV      r9,r0
        0x08003fcc:    4602        .F      MOV      r2,r0
        0x08003fce:    a902        ..      ADD      r1,sp,#8
        0x08003fd0:    4630        0F      MOV      r0,r6
        0x08003fd2:    f002fd07    ....    BL       mbedtls_mpi_safe_cond_swap ; 0x80069e4
        0x08003fd6:    0004        ..      MOVS     r4,r0
        0x08003fd8:    d139        9.      BNE      0x800404e ; ecp_mul_mxz + 292
        0x08003fda:    464a        JF      MOV      r2,r9
        0x08003fdc:    4641        AF      MOV      r1,r8
        0x08003fde:    4658        XF      MOV      r0,r11
        0x08003fe0:    f002fd00    ....    BL       mbedtls_mpi_safe_cond_swap ; 0x80069e4
        0x08003fe4:    0004        ..      MOVS     r4,r0
        0x08003fe6:    d132        2.      BNE      0x800404e ; ecp_mul_mxz + 292
        0x08003fe8:    a90b        ..      ADD      r1,sp,#0x2c
        0x08003fea:    a802        ..      ADD      r0,sp,#8
        0x08003fec:    e9cd0100    ....    STRD     r0,r1,[sp,#0]
        0x08003ff0:    4633        3F      MOV      r3,r6
        0x08003ff2:    aa02        ..      ADD      r2,sp,#8
        0x08003ff4:    4619        .F      MOV      r1,r3
        0x08003ff6:    4628        (F      MOV      r0,r5
        0x08003ff8:    f7fefafe    ....    BL       ecp_double_add_mxz ; 0x80025f8
        0x08003ffc:    0004        ..      MOVS     r4,r0
        0x08003ffe:    d126        &.      BNE      0x800404e ; ecp_mul_mxz + 292
        0x08004000:    464a        JF      MOV      r2,r9
        0x08004002:    a902        ..      ADD      r1,sp,#8
        0x08004004:    4630        0F      MOV      r0,r6
        0x08004006:    f002fced    ....    BL       mbedtls_mpi_safe_cond_swap ; 0x80069e4
        0x0800400a:    0004        ..      MOVS     r4,r0
        0x0800400c:    d11f        ..      BNE      0x800404e ; ecp_mul_mxz + 292
        0x0800400e:    464a        JF      MOV      r2,r9
        0x08004010:    4641        AF      MOV      r1,r8
        0x08004012:    4658        XF      MOV      r0,r11
        0x08004014:    f002fce6    ....    BL       mbedtls_mpi_safe_cond_swap ; 0x80069e4
        0x08004018:    0004        ..      MOVS     r4,r0
        0x0800401a:    d118        ..      BNE      0x800404e ; ecp_mul_mxz + 292
        0x0800401c:    1e7f        ..      SUBS     r7,r7,#1
        0x0800401e:    d2cf        ..      BCS      0x8003fc0 ; ecp_mul_mxz + 150
        0x08004020:    465c        \F      MOV      r4,r11
        0x08004022:    1d2a        *.      ADDS     r2,r5,#4
        0x08004024:    4659        YF      MOV      r1,r11
        0x08004026:    4620         F      MOV      r0,r4
        0x08004028:    f002f9ac    ....    BL       mbedtls_mpi_inv_mod ; 0x8006384
        0x0800402c:    b970        p.      CBNZ     r0,0x800404c ; ecp_mul_mxz + 290
        0x0800402e:    4631        1F      MOV      r1,r6
        0x08004030:    4622        "F      MOV      r2,r4
        0x08004032:    4608        .F      MOV      r0,r1
        0x08004034:    f002fb4c    ..L.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08004038:    b940        @.      CBNZ     r0,0x800404c ; ecp_mul_mxz + 290
        0x0800403a:    4629        )F      MOV      r1,r5
        0x0800403c:    4630        0F      MOV      r0,r6
        0x0800403e:    f7fffe43    ..C.    BL       ecp_modp ; 0x8003cc8
        0x08004042:    b918        ..      CBNZ     r0,0x800404c ; ecp_mul_mxz + 290
        0x08004044:    2101        .!      MOVS     r1,#1
        0x08004046:    4620         F      MOV      r0,r4
        0x08004048:    f002fae8    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x0800404c:    4604        .F      MOV      r4,r0
        0x0800404e:    a802        ..      ADD      r0,sp,#8
        0x08004050:    f001f892    ....    BL       mbedtls_ecp_point_free ; 0x8005178
        0x08004054:    a80b        ..      ADD      r0,sp,#0x2c
        0x08004056:    f002f8c6    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x0800405a:    b00f        ..      ADD      sp,sp,#0x3c
        0x0800405c:    4620         F      MOV      r0,r4
        0x0800405e:    e8bd8ff0    ....    POP      {r4-r11,pc}
    i.ecp_normalize_jac
    ecp_normalize_jac
        0x08004062:    b5f0        ..      PUSH     {r4-r7,lr}
        0x08004064:    460d        .F      MOV      r5,r1
        0x08004066:    4606        .F      MOV      r6,r0
        0x08004068:    f1050018    ....    ADD      r0,r5,#0x18
        0x0800406c:    b087        ..      SUB      sp,sp,#0x1c
        0x0800406e:    2100        .!      MOVS     r1,#0
        0x08004070:    4607        .F      MOV      r7,r0
        0x08004072:    f001fe69    ..i.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08004076:    2800        .(      CMP      r0,#0
        0x08004078:    d04e        N.      BEQ      0x8004118 ; ecp_normalize_jac + 182
        0x0800407a:    4668        hF      MOV      r0,sp
        0x0800407c:    f002f97c    ..|.    BL       mbedtls_mpi_init ; 0x8006378
        0x08004080:    a803        ..      ADD      r0,sp,#0xc
        0x08004082:    f002f979    ..y.    BL       mbedtls_mpi_init ; 0x8006378
        0x08004086:    1d32        2.      ADDS     r2,r6,#4
        0x08004088:    4639        9F      MOV      r1,r7
        0x0800408a:    4668        hF      MOV      r0,sp
        0x0800408c:    f002f97a    ..z.    BL       mbedtls_mpi_inv_mod ; 0x8006384
        0x08004090:    0004        ..      MOVS     r4,r0
        0x08004092:    d13a        :.      BNE      0x800410a ; ecp_normalize_jac + 168
        0x08004094:    466a        jF      MOV      r2,sp
        0x08004096:    4611        .F      MOV      r1,r2
        0x08004098:    a803        ..      ADD      r0,sp,#0xc
        0x0800409a:    f002fb19    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x0800409e:    0004        ..      MOVS     r4,r0
        0x080040a0:    d133        3.      BNE      0x800410a ; ecp_normalize_jac + 168
        0x080040a2:    4631        1F      MOV      r1,r6
        0x080040a4:    a803        ..      ADD      r0,sp,#0xc
        0x080040a6:    f7fffe0f    ....    BL       ecp_modp ; 0x8003cc8
        0x080040aa:    0004        ..      MOVS     r4,r0
        0x080040ac:    d12d        -.      BNE      0x800410a ; ecp_normalize_jac + 168
        0x080040ae:    4629        )F      MOV      r1,r5
        0x080040b0:    aa03        ..      ADD      r2,sp,#0xc
        0x080040b2:    4608        .F      MOV      r0,r1
        0x080040b4:    f002fb0c    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x080040b8:    0004        ..      MOVS     r4,r0
        0x080040ba:    d126        &.      BNE      0x800410a ; ecp_normalize_jac + 168
        0x080040bc:    4631        1F      MOV      r1,r6
        0x080040be:    4628        (F      MOV      r0,r5
        0x080040c0:    f7fffe02    ....    BL       ecp_modp ; 0x8003cc8
        0x080040c4:    0004        ..      MOVS     r4,r0
        0x080040c6:    d120         .      BNE      0x800410a ; ecp_normalize_jac + 168
        0x080040c8:    f105010c    ....    ADD      r1,r5,#0xc
        0x080040cc:    aa03        ..      ADD      r2,sp,#0xc
        0x080040ce:    460d        .F      MOV      r5,r1
        0x080040d0:    4608        .F      MOV      r0,r1
        0x080040d2:    f002fafd    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x080040d6:    0004        ..      MOVS     r4,r0
        0x080040d8:    d117        ..      BNE      0x800410a ; ecp_normalize_jac + 168
        0x080040da:    4631        1F      MOV      r1,r6
        0x080040dc:    4628        (F      MOV      r0,r5
        0x080040de:    f7fffdf3    ....    BL       ecp_modp ; 0x8003cc8
        0x080040e2:    0004        ..      MOVS     r4,r0
        0x080040e4:    d111        ..      BNE      0x800410a ; ecp_normalize_jac + 168
        0x080040e6:    4629        )F      MOV      r1,r5
        0x080040e8:    466a        jF      MOV      r2,sp
        0x080040ea:    4608        .F      MOV      r0,r1
        0x080040ec:    f002faf0    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x080040f0:    0004        ..      MOVS     r4,r0
        0x080040f2:    d10a        ..      BNE      0x800410a ; ecp_normalize_jac + 168
        0x080040f4:    4631        1F      MOV      r1,r6
        0x080040f6:    4628        (F      MOV      r0,r5
        0x080040f8:    f7fffde6    ....    BL       ecp_modp ; 0x8003cc8
        0x080040fc:    0004        ..      MOVS     r4,r0
        0x080040fe:    d104        ..      BNE      0x800410a ; ecp_normalize_jac + 168
        0x08004100:    2101        .!      MOVS     r1,#1
        0x08004102:    4638        8F      MOV      r0,r7
        0x08004104:    f002fa8a    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x08004108:    4604        .F      MOV      r4,r0
        0x0800410a:    4668        hF      MOV      r0,sp
        0x0800410c:    f002f86b    ..k.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08004110:    a803        ..      ADD      r0,sp,#0xc
        0x08004112:    f002f868    ..h.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08004116:    4620         F      MOV      r0,r4
        0x08004118:    b007        ..      ADD      sp,sp,#0x1c
        0x0800411a:    bdf0        ..      POP      {r4-r7,pc}
    i.ecp_normalize_jac_many
    ecp_normalize_jac_many
        0x0800411c:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x08004120:    b08e        ..      SUB      sp,sp,#0x38
        0x08004122:    4688        .F      MOV      r8,r1
        0x08004124:    4681        .F      MOV      r9,r0
        0x08004126:    4616        .F      MOV      r6,r2
        0x08004128:    2a02        .*      CMP      r2,#2
        0x0800412a:    d207        ..      BCS      0x800413c ; ecp_normalize_jac_many + 32
        0x0800412c:    4648        HF      MOV      r0,r9
        0x0800412e:    f8d81000    ....    LDR      r1,[r8,#0]
        0x08004132:    f7ffff96    ....    BL       ecp_normalize_jac ; 0x8004062
        0x08004136:    b00e        ..      ADD      sp,sp,#0x38
        0x08004138:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x0800413c:    210c        .!      MOVS     r1,#0xc
        0x0800413e:    4610        .F      MOV      r0,r2
        0x08004140:    f7fcf868    ..h.    BL       calloc ; 0x8000214
        0x08004144:    0007        ..      MOVS     r7,r0
        0x08004146:    d001        ..      BEQ      0x800414c ; ecp_normalize_jac_many + 48
        0x08004148:    2400        .$      MOVS     r4,#0
        0x0800414a:    e008        ..      B        0x800415e ; ecp_normalize_jac_many + 66
        0x0800414c:    486d        mH      LDR      r0,[pc,#436] ; [0x8004304] = 0xffffb280
        0x0800414e:    e7f2        ..      B        0x8004136 ; ecp_normalize_jac_many + 26
        0x08004150:    eb040044    ..D.    ADD      r0,r4,r4,LSL #1
        0x08004154:    eb070080    ....    ADD      r0,r7,r0,LSL #2
        0x08004158:    f002f90e    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x0800415c:    1c64        d.      ADDS     r4,r4,#1
        0x0800415e:    42b4        .B      CMP      r4,r6
        0x08004160:    d3f6        ..      BCC      0x8004150 ; ecp_normalize_jac_many + 52
        0x08004162:    a802        ..      ADD      r0,sp,#8
        0x08004164:    f002f908    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08004168:    a809        ..      ADD      r0,sp,#0x24
        0x0800416a:    f002f905    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x0800416e:    a805        ..      ADD      r0,sp,#0x14
        0x08004170:    f002f902    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08004174:    f8d81000    ....    LDR      r1,[r8,#0]
        0x08004178:    4638        8F      MOV      r0,r7
        0x0800417a:    3118        .1      ADDS     r1,r1,#0x18
        0x0800417c:    f001fe42    ..B.    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08004180:    0004        ..      MOVS     r4,r0
        0x08004182:    d17d        }.      BNE      0x8004280 ; ecp_normalize_jac_many + 356
        0x08004184:    2501        .%      MOVS     r5,#1
        0x08004186:    e014        ..      B        0x80041b2 ; ecp_normalize_jac_many + 150
        0x08004188:    eb050045    ..E.    ADD      r0,r5,r5,LSL #1
        0x0800418c:    f8582025    X.%     LDR      r2,[r8,r5,LSL #2]
        0x08004190:    eb070080    ....    ADD      r0,r7,r0,LSL #2
        0x08004194:    4682        .F      MOV      r10,r0
        0x08004196:    f1a0010c    ....    SUB      r1,r0,#0xc
        0x0800419a:    3218        .2      ADDS     r2,r2,#0x18
        0x0800419c:    f002fa98    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x080041a0:    0004        ..      MOVS     r4,r0
        0x080041a2:    d16d        m.      BNE      0x8004280 ; ecp_normalize_jac_many + 356
        0x080041a4:    4650        PF      MOV      r0,r10
        0x080041a6:    4649        IF      MOV      r1,r9
        0x080041a8:    f7fffd8e    ....    BL       ecp_modp ; 0x8003cc8
        0x080041ac:    0004        ..      MOVS     r4,r0
        0x080041ae:    d167        g.      BNE      0x8004280 ; ecp_normalize_jac_many + 356
        0x080041b0:    1c6d        m.      ADDS     r5,r5,#1
        0x080041b2:    42b5        .B      CMP      r5,r6
        0x080041b4:    d3e8        ..      BCC      0x8004188 ; ecp_normalize_jac_many + 108
        0x080041b6:    eb060046    ..F.    ADD      r0,r6,r6,LSL #1
        0x080041ba:    eb070180    ....    ADD      r1,r7,r0,LSL #2
        0x080041be:    f1090204    ....    ADD      r2,r9,#4
        0x080041c2:    a802        ..      ADD      r0,sp,#8
        0x080041c4:    390c        .9      SUBS     r1,r1,#0xc
        0x080041c6:    f002f8dd    ....    BL       mbedtls_mpi_inv_mod ; 0x8006384
        0x080041ca:    0004        ..      MOVS     r4,r0
        0x080041cc:    d158        X.      BNE      0x8004280 ; ecp_normalize_jac_many + 356
        0x080041ce:    1e75        u.      SUBS     r5,r6,#1
        0x080041d0:    b15d        ].      CBZ      r5,0x80041ea ; ecp_normalize_jac_many + 206
        0x080041d2:    eb050045    ..E.    ADD      r0,r5,r5,LSL #1
        0x080041d6:    eb070280    ....    ADD      r2,r7,r0,LSL #2
        0x080041da:    a902        ..      ADD      r1,sp,#8
        0x080041dc:    a809        ..      ADD      r0,sp,#0x24
        0x080041de:    3a0c        .:      SUBS     r2,r2,#0xc
        0x080041e0:    f002fa76    ..v.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x080041e4:    0004        ..      MOVS     r4,r0
        0x080041e6:    d173        s.      BNE      0x80042d0 ; ecp_normalize_jac_many + 436
        0x080041e8:    e004        ..      B        0x80041f4 ; ecp_normalize_jac_many + 216
        0x080041ea:    a902        ..      ADD      r1,sp,#8
        0x080041ec:    a809        ..      ADD      r0,sp,#0x24
        0x080041ee:    f001fe09    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x080041f2:    e012        ..      B        0x800421a ; ecp_normalize_jac_many + 254
        0x080041f4:    4649        IF      MOV      r1,r9
        0x080041f6:    a809        ..      ADD      r0,sp,#0x24
        0x080041f8:    f7fffd66    ..f.    BL       ecp_modp ; 0x8003cc8
        0x080041fc:    0004        ..      MOVS     r4,r0
        0x080041fe:    d167        g.      BNE      0x80042d0 ; ecp_normalize_jac_many + 436
        0x08004200:    f8582025    X.%     LDR      r2,[r8,r5,LSL #2]
        0x08004204:    a902        ..      ADD      r1,sp,#8
        0x08004206:    4608        .F      MOV      r0,r1
        0x08004208:    3218        .2      ADDS     r2,r2,#0x18
        0x0800420a:    f002fa61    ..a.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x0800420e:    0004        ..      MOVS     r4,r0
        0x08004210:    d15e        ^.      BNE      0x80042d0 ; ecp_normalize_jac_many + 436
        0x08004212:    4649        IF      MOV      r1,r9
        0x08004214:    a802        ..      ADD      r0,sp,#8
        0x08004216:    f7fffd57    ..W.    BL       ecp_modp ; 0x8003cc8
        0x0800421a:    0004        ..      MOVS     r4,r0
        0x0800421c:    d158        X.      BNE      0x80042d0 ; ecp_normalize_jac_many + 436
        0x0800421e:    aa09        ..      ADD      r2,sp,#0x24
        0x08004220:    4611        .F      MOV      r1,r2
        0x08004222:    a805        ..      ADD      r0,sp,#0x14
        0x08004224:    f002fa54    ..T.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08004228:    0004        ..      MOVS     r4,r0
        0x0800422a:    d151        Q.      BNE      0x80042d0 ; ecp_normalize_jac_many + 436
        0x0800422c:    4649        IF      MOV      r1,r9
        0x0800422e:    a805        ..      ADD      r0,sp,#0x14
        0x08004230:    f7fffd4a    ..J.    BL       ecp_modp ; 0x8003cc8
        0x08004234:    0004        ..      MOVS     r4,r0
        0x08004236:    d14b        K.      BNE      0x80042d0 ; ecp_normalize_jac_many + 436
        0x08004238:    f8580025    X.%.    LDR      r0,[r8,r5,LSL #2]
        0x0800423c:    aa05        ..      ADD      r2,sp,#0x14
        0x0800423e:    4601        .F      MOV      r1,r0
        0x08004240:    f002fa46    ..F.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08004244:    0004        ..      MOVS     r4,r0
        0x08004246:    d143        C.      BNE      0x80042d0 ; ecp_normalize_jac_many + 436
        0x08004248:    f8580025    X.%.    LDR      r0,[r8,r5,LSL #2]
        0x0800424c:    4649        IF      MOV      r1,r9
        0x0800424e:    f7fffd3b    ..;.    BL       ecp_modp ; 0x8003cc8
        0x08004252:    0004        ..      MOVS     r4,r0
        0x08004254:    d13c        <.      BNE      0x80042d0 ; ecp_normalize_jac_many + 436
        0x08004256:    f8580025    X.%.    LDR      r0,[r8,r5,LSL #2]
        0x0800425a:    aa05        ..      ADD      r2,sp,#0x14
        0x0800425c:    300c        .0      ADDS     r0,r0,#0xc
        0x0800425e:    4601        .F      MOV      r1,r0
        0x08004260:    f002fa36    ..6.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08004264:    0004        ..      MOVS     r4,r0
        0x08004266:    d133        3.      BNE      0x80042d0 ; ecp_normalize_jac_many + 436
        0x08004268:    f8580025    X.%.    LDR      r0,[r8,r5,LSL #2]
        0x0800426c:    4649        IF      MOV      r1,r9
        0x0800426e:    300c        .0      ADDS     r0,r0,#0xc
        0x08004270:    f7fffd2a    ..*.    BL       ecp_modp ; 0x8003cc8
        0x08004274:    0004        ..      MOVS     r4,r0
        0x08004276:    d12b        +.      BNE      0x80042d0 ; ecp_normalize_jac_many + 436
        0x08004278:    f8580025    X.%.    LDR      r0,[r8,r5,LSL #2]
        0x0800427c:    300c        .0      ADDS     r0,r0,#0xc
        0x0800427e:    e000        ..      B        0x8004282 ; ecp_normalize_jac_many + 358
        0x08004280:    e026        &.      B        0x80042d0 ; ecp_normalize_jac_many + 436
        0x08004282:    4601        .F      MOV      r1,r0
        0x08004284:    aa09        ..      ADD      r2,sp,#0x24
        0x08004286:    f002fa23    ..#.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x0800428a:    0004        ..      MOVS     r4,r0
        0x0800428c:    d120         .      BNE      0x80042d0 ; ecp_normalize_jac_many + 436
        0x0800428e:    f8580025    X.%.    LDR      r0,[r8,r5,LSL #2]
        0x08004292:    4649        IF      MOV      r1,r9
        0x08004294:    300c        .0      ADDS     r0,r0,#0xc
        0x08004296:    f7fffd17    ....    BL       ecp_modp ; 0x8003cc8
        0x0800429a:    0004        ..      MOVS     r4,r0
        0x0800429c:    d118        ..      BNE      0x80042d0 ; ecp_normalize_jac_many + 436
        0x0800429e:    f8580025    X.%.    LDR      r0,[r8,r5,LSL #2]
        0x080042a2:    f8d91008    ....    LDR      r1,[r9,#8]
        0x080042a6:    f002fc9e    ....    BL       mbedtls_mpi_shrink ; 0x8006be6
        0x080042aa:    0004        ..      MOVS     r4,r0
        0x080042ac:    d110        ..      BNE      0x80042d0 ; ecp_normalize_jac_many + 436
        0x080042ae:    f8580025    X.%.    LDR      r0,[r8,r5,LSL #2]
        0x080042b2:    f8d91008    ....    LDR      r1,[r9,#8]
        0x080042b6:    300c        .0      ADDS     r0,r0,#0xc
        0x080042b8:    f002fc95    ....    BL       mbedtls_mpi_shrink ; 0x8006be6
        0x080042bc:    0004        ..      MOVS     r4,r0
        0x080042be:    d107        ..      BNE      0x80042d0 ; ecp_normalize_jac_many + 436
        0x080042c0:    f8580025    X.%.    LDR      r0,[r8,r5,LSL #2]
        0x080042c4:    3018        .0      ADDS     r0,r0,#0x18
        0x080042c6:    f001ff8e    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080042ca:    b10d        ..      CBZ      r5,0x80042d0 ; ecp_normalize_jac_many + 436
        0x080042cc:    1e6d        m.      SUBS     r5,r5,#1
        0x080042ce:    e77f        ..      B        0x80041d0 ; ecp_normalize_jac_many + 180
        0x080042d0:    a802        ..      ADD      r0,sp,#8
        0x080042d2:    f001ff88    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080042d6:    a809        ..      ADD      r0,sp,#0x24
        0x080042d8:    f001ff85    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080042dc:    a805        ..      ADD      r0,sp,#0x14
        0x080042de:    f001ff82    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080042e2:    2500        .%      MOVS     r5,#0
        0x080042e4:    e007        ..      B        0x80042f6 ; ecp_normalize_jac_many + 474
        0x080042e6:    bf00        ..      NOP      
        0x080042e8:    eb050045    ..E.    ADD      r0,r5,r5,LSL #1
        0x080042ec:    eb070080    ....    ADD      r0,r7,r0,LSL #2
        0x080042f0:    f001ff79    ..y.    BL       mbedtls_mpi_free ; 0x80061e6
        0x080042f4:    1c6d        m.      ADDS     r5,r5,#1
        0x080042f6:    42b5        .B      CMP      r5,r6
        0x080042f8:    d3f6        ..      BCC      0x80042e8 ; ecp_normalize_jac_many + 460
        0x080042fa:    4638        8F      MOV      r0,r7
        0x080042fc:    f7fbffcd    ....    BL       free ; 0x800029a
        0x08004300:    4620         F      MOV      r0,r4
        0x08004302:    e718        ..      B        0x8004136 ; ecp_normalize_jac_many + 26
    $d
        0x08004304:    ffffb280    ....    DCD    4294947456
    $t
    i.ecp_precompute_comb
    ecp_precompute_comb
        0x08004308:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x0800430c:    4683        .F      MOV      r11,r0
        0x0800430e:    f1a30801    ....    SUB      r8,r3,#1
        0x08004312:    f04f0901    O...    MOV      r9,#1
        0x08004316:    b09f        ..      SUB      sp,sp,#0x7c
        0x08004318:    460c        .F      MOV      r4,r1
        0x0800431a:    fa09f008    ....    LSL      r0,r9,r8
        0x0800431e:    b2c7        ..      UXTB     r7,r0
        0x08004320:    2500        .%      MOVS     r5,#0
        0x08004322:    4611        .F      MOV      r1,r2
        0x08004324:    4620         F      MOV      r0,r4
        0x08004326:    9e28        (.      LDR      r6,[sp,#0xa0]
        0x08004328:    f000fc8e    ....    BL       mbedtls_ecp_copy ; 0x8004c48
        0x0800432c:    2800        .(      CMP      r0,#0
        0x0800432e:    d16c        l.      BNE      0x800440a ; ecp_precompute_comb + 258
        0x08004330:    fb08f806    ....    MUL      r8,r8,r6
        0x08004334:    e020         .      B        0x8004378 ; ecp_precompute_comb + 112
        0x08004336:    bf00        ..      NOP      
        0x08004338:    fbb5f1f6    ....    UDIV     r1,r5,r6
        0x0800433c:    fa09f001    ....    LSL      r0,r9,r1
        0x08004340:    b2c0        ..      UXTB     r0,r0
        0x08004342:    eb0001c0    ....    ADD      r1,r0,r0,LSL #3
        0x08004346:    eb040a81    ....    ADD      r10,r4,r1,LSL #2
        0x0800434a:    fbb5f1f6    ....    UDIV     r1,r5,r6
        0x0800434e:    fb065111    ...Q    MLS      r1,r6,r1,r5
        0x08004352:    b949        I.      CBNZ     r1,0x8004368 ; ecp_precompute_comb + 96
        0x08004354:    0840        @.      LSRS     r0,r0,#1
        0x08004356:    eb0000c0    ....    ADD      r0,r0,r0,LSL #3
        0x0800435a:    eb040180    ....    ADD      r1,r4,r0,LSL #2
        0x0800435e:    4650        PF      MOV      r0,r10
        0x08004360:    f000fc72    ..r.    BL       mbedtls_ecp_copy ; 0x8004c48
        0x08004364:    2800        .(      CMP      r0,#0
        0x08004366:    d150        P.      BNE      0x800440a ; ecp_precompute_comb + 258
        0x08004368:    4652        RF      MOV      r2,r10
        0x0800436a:    4611        .F      MOV      r1,r2
        0x0800436c:    4658        XF      MOV      r0,r11
        0x0800436e:    f7fefab1    ....    BL       ecp_double_jac ; 0x80028d4
        0x08004372:    2800        .(      CMP      r0,#0
        0x08004374:    d149        I.      BNE      0x800440a ; ecp_precompute_comb + 258
        0x08004376:    1c6d        m.      ADDS     r5,r5,#1
        0x08004378:    45a8        .E      CMP      r8,r5
        0x0800437a:    d8dd        ..      BHI      0x8004338 ; ecp_precompute_comb + 48
        0x0800437c:    2200        ."      MOVS     r2,#0
        0x0800437e:    4669        iF      MOV      r1,sp
        0x08004380:    2001        .       MOVS     r0,#1
        0x08004382:    4689        .F      MOV      r9,r1
        0x08004384:    e00a        ..      B        0x800439c ; ecp_precompute_comb + 148
        0x08004386:    bf00        ..      NOP      
        0x08004388:    eb0001c0    ....    ADD      r1,r0,r0,LSL #3
        0x0800438c:    eb040381    ....    ADD      r3,r4,r1,LSL #2
        0x08004390:    0640        @.      LSLS     r0,r0,#25
        0x08004392:    f8493022    I."0    STR      r3,[r9,r2,LSL #2]
        0x08004396:    0e00        ..      LSRS     r0,r0,#24
        0x08004398:    4649        IF      MOV      r1,r9
        0x0800439a:    1c52        R.      ADDS     r2,r2,#1
        0x0800439c:    42b8        .B      CMP      r0,r7
        0x0800439e:    d3f3        ..      BCC      0x8004388 ; ecp_precompute_comb + 128
        0x080043a0:    4658        XF      MOV      r0,r11
        0x080043a2:    f7fffebb    ....    BL       ecp_normalize_jac_many ; 0x800411c
        0x080043a6:    2800        .(      CMP      r0,#0
        0x080043a8:    d12f        /.      BNE      0x800440a ; ecp_precompute_comb + 258
        0x080043aa:    2601        .&      MOVS     r6,#1
        0x080043ac:    e018        ..      B        0x80043e0 ; ecp_precompute_comb + 216
        0x080043ae:    eb0600c6    ....    ADD      r0,r6,r6,LSL #3
        0x080043b2:    4635        5F      MOV      r5,r6
        0x080043b4:    eb040880    ....    ADD      r8,r4,r0,LSL #2
        0x080043b8:    e00e        ..      B        0x80043d8 ; ecp_precompute_comb + 208
        0x080043ba:    eb0500c5    ....    ADD      r0,r5,r5,LSL #3
        0x080043be:    eb040280    ....    ADD      r2,r4,r0,LSL #2
        0x080043c2:    1970        p.      ADDS     r0,r6,r5
        0x080043c4:    eb0000c0    ....    ADD      r0,r0,r0,LSL #3
        0x080043c8:    eb040180    ....    ADD      r1,r4,r0,LSL #2
        0x080043cc:    4643        CF      MOV      r3,r8
        0x080043ce:    4658        XF      MOV      r0,r11
        0x080043d0:    f7fdfe7c    ..|.    BL       ecp_add_mixed ; 0x80020cc
        0x080043d4:    2800        .(      CMP      r0,#0
        0x080043d6:    d118        ..      BNE      0x800440a ; ecp_precompute_comb + 258
        0x080043d8:    1e6d        m.      SUBS     r5,r5,#1
        0x080043da:    d2ee        ..      BCS      0x80043ba ; ecp_precompute_comb + 178
        0x080043dc:    0670        p.      LSLS     r0,r6,#25
        0x080043de:    0e06        ..      LSRS     r6,r0,#24
        0x080043e0:    42be        .B      CMP      r6,r7
        0x080043e2:    d3e4        ..      BCC      0x80043ae ; ecp_precompute_comb + 166
        0x080043e4:    2200        ."      MOVS     r2,#0
        0x080043e6:    4648        HF      MOV      r0,r9
        0x080043e8:    e008        ..      B        0x80043fc ; ecp_precompute_comb + 244
        0x080043ea:    bf00        ..      NOP      
        0x080043ec:    eb0201c2    ....    ADD      r1,r2,r2,LSL #3
        0x080043f0:    eb040181    ....    ADD      r1,r4,r1,LSL #2
        0x080043f4:    3124        $1      ADDS     r1,r1,#0x24
        0x080043f6:    f8401022    @.".    STR      r1,[r0,r2,LSL #2]
        0x080043fa:    1c52        R.      ADDS     r2,r2,#1
        0x080043fc:    1c51        Q.      ADDS     r1,r2,#1
        0x080043fe:    42b9        .B      CMP      r1,r7
        0x08004400:    d3f4        ..      BCC      0x80043ec ; ecp_precompute_comb + 228
        0x08004402:    4669        iF      MOV      r1,sp
        0x08004404:    4658        XF      MOV      r0,r11
        0x08004406:    f7fffe89    ....    BL       ecp_normalize_jac_many ; 0x800411c
        0x0800440a:    b01f        ..      ADD      sp,sp,#0x7c
        0x0800440c:    e8bd8ff0    ....    POP      {r4-r11,pc}
    i.ecp_randomize_jac
    ecp_randomize_jac
        0x08004410:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x08004414:    4605        .F      MOV      r5,r0
        0x08004416:    6d80        .m      LDR      r0,[r0,#0x58]
        0x08004418:    b086        ..      SUB      sp,sp,#0x18
        0x0800441a:    1dc0        ..      ADDS     r0,r0,#7
        0x0800441c:    ea4f08d0    O...    LSR      r8,r0,#3
        0x08004420:    4699        .F      MOV      r9,r3
        0x08004422:    4692        .F      MOV      r10,r2
        0x08004424:    460f        .F      MOV      r7,r1
        0x08004426:    2600        .&      MOVS     r6,#0
        0x08004428:    4668        hF      MOV      r0,sp
        0x0800442a:    f001ffa5    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x0800442e:    a803        ..      ADD      r0,sp,#0xc
        0x08004430:    f001ffa2    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08004434:    464b        KF      MOV      r3,r9
        0x08004436:    4652        RF      MOV      r2,r10
        0x08004438:    4641        AF      MOV      r1,r8
        0x0800443a:    4668        hF      MOV      r0,sp
        0x0800443c:    f001fea3    ....    BL       mbedtls_mpi_fill_random ; 0x8006186
        0x08004440:    e003        ..      B        0x800444a ; ecp_randomize_jac + 58
        0x08004442:    2101        .!      MOVS     r1,#1
        0x08004444:    4668        hF      MOV      r0,sp
        0x08004446:    f002fb8d    ....    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x0800444a:    0004        ..      MOVS     r4,r0
        0x0800444c:    d157        W.      BNE      0x80044fe ; ecp_randomize_jac + 238
        0x0800444e:    1d29        ).      ADDS     r1,r5,#4
        0x08004450:    4668        hF      MOV      r0,sp
        0x08004452:    f001fc91    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08004456:    2800        .(      CMP      r0,#0
        0x08004458:    daf3        ..      BGE      0x8004442 ; ecp_randomize_jac + 50
        0x0800445a:    4630        0F      MOV      r0,r6
        0x0800445c:    1c76        v.      ADDS     r6,r6,#1
        0x0800445e:    280a        .(      CMP      r0,#0xa
        0x08004460:    dd03        ..      BLE      0x800446a ; ecp_randomize_jac + 90
        0x08004462:    482b        +H      LDR      r0,[pc,#172] ; [0x8004510] = 0xffffb300
        0x08004464:    b006        ..      ADD      sp,sp,#0x18
        0x08004466:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x0800446a:    2101        .!      MOVS     r1,#1
        0x0800446c:    4668        hF      MOV      r0,sp
        0x0800446e:    f001fc6b    ..k.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08004472:    2800        .(      CMP      r0,#0
        0x08004474:    ddde        ..      BLE      0x8004434 ; ecp_randomize_jac + 36
        0x08004476:    f1070118    ....    ADD      r1,r7,#0x18
        0x0800447a:    466a        jF      MOV      r2,sp
        0x0800447c:    460e        .F      MOV      r6,r1
        0x0800447e:    4608        .F      MOV      r0,r1
        0x08004480:    f002f926    ..&.    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08004484:    0004        ..      MOVS     r4,r0
        0x08004486:    d13a        :.      BNE      0x80044fe ; ecp_randomize_jac + 238
        0x08004488:    4629        )F      MOV      r1,r5
        0x0800448a:    4630        0F      MOV      r0,r6
        0x0800448c:    f7fffc1c    ....    BL       ecp_modp ; 0x8003cc8
        0x08004490:    0004        ..      MOVS     r4,r0
        0x08004492:    d134        4.      BNE      0x80044fe ; ecp_randomize_jac + 238
        0x08004494:    466a        jF      MOV      r2,sp
        0x08004496:    4611        .F      MOV      r1,r2
        0x08004498:    a803        ..      ADD      r0,sp,#0xc
        0x0800449a:    f002f919    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x0800449e:    0004        ..      MOVS     r4,r0
        0x080044a0:    d12d        -.      BNE      0x80044fe ; ecp_randomize_jac + 238
        0x080044a2:    4629        )F      MOV      r1,r5
        0x080044a4:    a803        ..      ADD      r0,sp,#0xc
        0x080044a6:    f7fffc0f    ....    BL       ecp_modp ; 0x8003cc8
        0x080044aa:    0004        ..      MOVS     r4,r0
        0x080044ac:    d127        '.      BNE      0x80044fe ; ecp_randomize_jac + 238
        0x080044ae:    4639        9F      MOV      r1,r7
        0x080044b0:    aa03        ..      ADD      r2,sp,#0xc
        0x080044b2:    4608        .F      MOV      r0,r1
        0x080044b4:    f002f90c    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x080044b8:    0004        ..      MOVS     r4,r0
        0x080044ba:    d120         .      BNE      0x80044fe ; ecp_randomize_jac + 238
        0x080044bc:    4629        )F      MOV      r1,r5
        0x080044be:    4638        8F      MOV      r0,r7
        0x080044c0:    f7fffc02    ....    BL       ecp_modp ; 0x8003cc8
        0x080044c4:    0004        ..      MOVS     r4,r0
        0x080044c6:    d11a        ..      BNE      0x80044fe ; ecp_randomize_jac + 238
        0x080044c8:    a903        ..      ADD      r1,sp,#0xc
        0x080044ca:    466a        jF      MOV      r2,sp
        0x080044cc:    4608        .F      MOV      r0,r1
        0x080044ce:    f002f8ff    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x080044d2:    0004        ..      MOVS     r4,r0
        0x080044d4:    d113        ..      BNE      0x80044fe ; ecp_randomize_jac + 238
        0x080044d6:    4629        )F      MOV      r1,r5
        0x080044d8:    a803        ..      ADD      r0,sp,#0xc
        0x080044da:    f7fffbf5    ....    BL       ecp_modp ; 0x8003cc8
        0x080044de:    0004        ..      MOVS     r4,r0
        0x080044e0:    d10d        ..      BNE      0x80044fe ; ecp_randomize_jac + 238
        0x080044e2:    f107010c    ....    ADD      r1,r7,#0xc
        0x080044e6:    aa03        ..      ADD      r2,sp,#0xc
        0x080044e8:    460e        .F      MOV      r6,r1
        0x080044ea:    4608        .F      MOV      r0,r1
        0x080044ec:    f002f8f0    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x080044f0:    0004        ..      MOVS     r4,r0
        0x080044f2:    d104        ..      BNE      0x80044fe ; ecp_randomize_jac + 238
        0x080044f4:    4629        )F      MOV      r1,r5
        0x080044f6:    4630        0F      MOV      r0,r6
        0x080044f8:    f7fffbe6    ....    BL       ecp_modp ; 0x8003cc8
        0x080044fc:    4604        .F      MOV      r4,r0
        0x080044fe:    4668        hF      MOV      r0,sp
        0x08004500:    f001fe71    ..q.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08004504:    a803        ..      ADD      r0,sp,#0xc
        0x08004506:    f001fe6e    ..n.    BL       mbedtls_mpi_free ; 0x80061e6
        0x0800450a:    4620         F      MOV      r0,r4
        0x0800450c:    e7aa        ..      B        0x8004464 ; ecp_randomize_jac + 84
    $d
        0x0800450e:    0000        ..      DCW    0
        0x08004510:    ffffb300    ....    DCD    4294947584
    $t
    i.ecp_randomize_mxz
    ecp_randomize_mxz
        0x08004514:    e92d4ffe    -..O    PUSH     {r1-r11,lr}
        0x08004518:    4605        .F      MOV      r5,r0
        0x0800451a:    6d80        .m      LDR      r0,[r0,#0x58]
        0x0800451c:    4699        .F      MOV      r9,r3
        0x0800451e:    1dc0        ..      ADDS     r0,r0,#7
        0x08004520:    ea4f08d0    O...    LSR      r8,r0,#3
        0x08004524:    4692        .F      MOV      r10,r2
        0x08004526:    460f        .F      MOV      r7,r1
        0x08004528:    2600        .&      MOVS     r6,#0
        0x0800452a:    4668        hF      MOV      r0,sp
        0x0800452c:    f001ff24    ..$.    BL       mbedtls_mpi_init ; 0x8006378
        0x08004530:    464b        KF      MOV      r3,r9
        0x08004532:    4652        RF      MOV      r2,r10
        0x08004534:    4641        AF      MOV      r1,r8
        0x08004536:    4668        hF      MOV      r0,sp
        0x08004538:    f001fe25    ..%.    BL       mbedtls_mpi_fill_random ; 0x8006186
        0x0800453c:    e003        ..      B        0x8004546 ; ecp_randomize_mxz + 50
        0x0800453e:    2101        .!      MOVS     r1,#1
        0x08004540:    4668        hF      MOV      r0,sp
        0x08004542:    f002fb0f    ....    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x08004546:    0004        ..      MOVS     r4,r0
        0x08004548:    d12d        -.      BNE      0x80045a6 ; ecp_randomize_mxz + 146
        0x0800454a:    1d29        ).      ADDS     r1,r5,#4
        0x0800454c:    4668        hF      MOV      r0,sp
        0x0800454e:    f001fc13    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08004552:    2800        .(      CMP      r0,#0
        0x08004554:    daf3        ..      BGE      0x800453e ; ecp_randomize_mxz + 42
        0x08004556:    4630        0F      MOV      r0,r6
        0x08004558:    1c76        v.      ADDS     r6,r6,#1
        0x0800455a:    280a        .(      CMP      r0,#0xa
        0x0800455c:    dd02        ..      BLE      0x8004564 ; ecp_randomize_mxz + 80
        0x0800455e:    4814        .H      LDR      r0,[pc,#80] ; [0x80045b0] = 0xffffb300
        0x08004560:    e8bd8ffe    ....    POP      {r1-r11,pc}
        0x08004564:    2101        .!      MOVS     r1,#1
        0x08004566:    4668        hF      MOV      r0,sp
        0x08004568:    f001fbee    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x0800456c:    2800        .(      CMP      r0,#0
        0x0800456e:    dddf        ..      BLE      0x8004530 ; ecp_randomize_mxz + 28
        0x08004570:    4639        9F      MOV      r1,r7
        0x08004572:    466a        jF      MOV      r2,sp
        0x08004574:    4608        .F      MOV      r0,r1
        0x08004576:    f002f8ab    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x0800457a:    0004        ..      MOVS     r4,r0
        0x0800457c:    d113        ..      BNE      0x80045a6 ; ecp_randomize_mxz + 146
        0x0800457e:    4629        )F      MOV      r1,r5
        0x08004580:    4638        8F      MOV      r0,r7
        0x08004582:    f7fffba1    ....    BL       ecp_modp ; 0x8003cc8
        0x08004586:    0004        ..      MOVS     r4,r0
        0x08004588:    d10d        ..      BNE      0x80045a6 ; ecp_randomize_mxz + 146
        0x0800458a:    f1070118    ....    ADD      r1,r7,#0x18
        0x0800458e:    466a        jF      MOV      r2,sp
        0x08004590:    460e        .F      MOV      r6,r1
        0x08004592:    4608        .F      MOV      r0,r1
        0x08004594:    f002f89c    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x08004598:    0004        ..      MOVS     r4,r0
        0x0800459a:    d104        ..      BNE      0x80045a6 ; ecp_randomize_mxz + 146
        0x0800459c:    4629        )F      MOV      r1,r5
        0x0800459e:    4630        0F      MOV      r0,r6
        0x080045a0:    f7fffb92    ....    BL       ecp_modp ; 0x8003cc8
        0x080045a4:    4604        .F      MOV      r4,r0
        0x080045a6:    4668        hF      MOV      r0,sp
        0x080045a8:    f001fe1d    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080045ac:    4620         F      MOV      r0,r4
        0x080045ae:    e7d7        ..      B        0x8004560 ; ecp_randomize_mxz + 76
    $d
        0x080045b0:    ffffb300    ....    DCD    4294947584
    $t
    i.ecp_safe_invert_jac
    ecp_safe_invert_jac
        0x080045b4:    b5fe        ..      PUSH     {r1-r7,lr}
        0x080045b6:    4604        .F      MOV      r4,r0
        0x080045b8:    4616        .F      MOV      r6,r2
        0x080045ba:    460d        .F      MOV      r5,r1
        0x080045bc:    4668        hF      MOV      r0,sp
        0x080045be:    f001fedb    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x080045c2:    f105020c    ....    ADD      r2,r5,#0xc
        0x080045c6:    4615        .F      MOV      r5,r2
        0x080045c8:    1d21        !.      ADDS     r1,r4,#4
        0x080045ca:    4668        hF      MOV      r0,sp
        0x080045cc:    f002fb96    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x080045d0:    0004        ..      MOVS     r4,r0
        0x080045d2:    d10c        ..      BNE      0x80045ee ; ecp_safe_invert_jac + 58
        0x080045d4:    2100        .!      MOVS     r1,#0
        0x080045d6:    4628        (F      MOV      r0,r5
        0x080045d8:    f001fbb6    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080045dc:    b100        ..      CBZ      r0,0x80045e0 ; ecp_safe_invert_jac + 44
        0x080045de:    2001        .       MOVS     r0,#1
        0x080045e0:    ea060200    ....    AND      r2,r6,r0
        0x080045e4:    4669        iF      MOV      r1,sp
        0x080045e6:    4628        (F      MOV      r0,r5
        0x080045e8:    f002f9c6    ....    BL       mbedtls_mpi_safe_cond_assign ; 0x8006978
        0x080045ec:    4604        .F      MOV      r4,r0
        0x080045ee:    4668        hF      MOV      r0,sp
        0x080045f0:    f001fdf9    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080045f4:    4620         F      MOV      r0,r4
        0x080045f6:    bdfe        ..      POP      {r1-r7,pc}
    i.ecp_select_comb
    ecp_select_comb
        0x080045f8:    e92d5ff0    -.._    PUSH     {r4-r12,lr}
        0x080045fc:    461f        .F      MOV      r7,r3
        0x080045fe:    9e0a        ..      LDR      r6,[sp,#0x28]
        0x08004600:    4691        .F      MOV      r9,r2
        0x08004602:    468a        .F      MOV      r10,r1
        0x08004604:    4683        .F      MOV      r11,r0
        0x08004606:    f3c60545    ..E.    UBFX     r5,r6,#1,#6
        0x0800460a:    2400        .$      MOVS     r4,#0
        0x0800460c:    e01d        ..      B        0x800464a ; ecp_select_comb + 82
        0x0800460e:    42ac        .B      CMP      r4,r5
        0x08004610:    d101        ..      BNE      0x8004616 ; ecp_select_comb + 30
        0x08004612:    2201        ."      MOVS     r2,#1
        0x08004614:    e000        ..      B        0x8004618 ; ecp_select_comb + 32
        0x08004616:    2200        ."      MOVS     r2,#0
        0x08004618:    eb0401c4    ....    ADD      r1,r4,r4,LSL #3
        0x0800461c:    eb090181    ....    ADD      r1,r9,r1,LSL #2
        0x08004620:    4688        .F      MOV      r8,r1
        0x08004622:    4650        PF      MOV      r0,r10
        0x08004624:    f002f9a8    ....    BL       mbedtls_mpi_safe_cond_assign ; 0x8006978
        0x08004628:    2800        .(      CMP      r0,#0
        0x0800462a:    d117        ..      BNE      0x800465c ; ecp_select_comb + 100
        0x0800462c:    42ac        .B      CMP      r4,r5
        0x0800462e:    d101        ..      BNE      0x8004634 ; ecp_select_comb + 60
        0x08004630:    2201        ."      MOVS     r2,#1
        0x08004632:    e000        ..      B        0x8004636 ; ecp_select_comb + 62
        0x08004634:    2200        ."      MOVS     r2,#0
        0x08004636:    f108010c    ....    ADD      r1,r8,#0xc
        0x0800463a:    f10a000c    ....    ADD      r0,r10,#0xc
        0x0800463e:    f002f99b    ....    BL       mbedtls_mpi_safe_cond_assign ; 0x8006978
        0x08004642:    2800        .(      CMP      r0,#0
        0x08004644:    d10a        ..      BNE      0x800465c ; ecp_select_comb + 100
        0x08004646:    1c64        d.      ADDS     r4,r4,#1
        0x08004648:    b2e4        ..      UXTB     r4,r4
        0x0800464a:    42bc        .B      CMP      r4,r7
        0x0800464c:    d3df        ..      BCC      0x800460e ; ecp_select_comb + 22
        0x0800464e:    09f2        ..      LSRS     r2,r6,#7
        0x08004650:    4651        QF      MOV      r1,r10
        0x08004652:    4658        XF      MOV      r0,r11
        0x08004654:    e8bd5ff0    ..._    POP      {r4-r12,lr}
        0x08004658:    f7ffbfac    ....    B.W      ecp_safe_invert_jac ; 0x80045b4
        0x0800465c:    e8bd9ff0    ....    POP      {r4-r12,pc}
    i.ecp_use_curve25519
    ecp_use_curve25519
        0x08004660:    b570        p.      PUSH     {r4-r6,lr}
        0x08004662:    4604        .F      MOV      r4,r0
        0x08004664:    a223        #.      ADR      r2,{pc}+0x90 ; 0x80046f4
        0x08004666:    2110        .!      MOVS     r1,#0x10
        0x08004668:    3010        .0      ADDS     r0,r0,#0x10
        0x0800466a:    f002f8f9    ....    BL       mbedtls_mpi_read_string ; 0x8006860
        0x0800466e:    0005        ..      MOVS     r5,r0
        0x08004670:    d134        4.      BNE      0x80046dc ; ecp_use_curve25519 + 124
        0x08004672:    2101        .!      MOVS     r1,#1
        0x08004674:    1d20         .      ADDS     r0,r4,#4
        0x08004676:    f001ffd1    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x0800467a:    0005        ..      MOVS     r5,r0
        0x0800467c:    d12e        ..      BNE      0x80046dc ; ecp_use_curve25519 + 124
        0x0800467e:    21ff        .!      MOVS     r1,#0xff
        0x08004680:    1d20         .      ADDS     r0,r4,#4
        0x08004682:    f002fa1f    ....    BL       mbedtls_mpi_shift_l ; 0x8006ac4
        0x08004686:    0005        ..      MOVS     r5,r0
        0x08004688:    d128        (.      BNE      0x80046dc ; ecp_use_curve25519 + 124
        0x0800468a:    2213        ."      MOVS     r2,#0x13
        0x0800468c:    1d21        !.      ADDS     r1,r4,#4
        0x0800468e:    1d20         .      ADDS     r0,r4,#4
        0x08004690:    f002fb1c    ....    BL       mbedtls_mpi_sub_int ; 0x8006ccc
        0x08004694:    0005        ..      MOVS     r5,r0
        0x08004696:    d121        !.      BNE      0x80046dc ; ecp_use_curve25519 + 124
        0x08004698:    1d20         .      ADDS     r0,r4,#4
        0x0800469a:    f001fb04    ....    BL       mbedtls_mpi_bitlen ; 0x8005ca6
        0x0800469e:    65a0        .e      STR      r0,[r4,#0x58]
        0x080046a0:    f104004c    ..L.    ADD      r0,r4,#0x4c
        0x080046a4:    a215        ..      ADR      r2,{pc}+0x58 ; 0x80046fc
        0x080046a6:    2110        .!      MOVS     r1,#0x10
        0x080046a8:    4606        .F      MOV      r6,r0
        0x080046aa:    f002f8d9    ....    BL       mbedtls_mpi_read_string ; 0x8006860
        0x080046ae:    0005        ..      MOVS     r5,r0
        0x080046b0:    d114        ..      BNE      0x80046dc ; ecp_use_curve25519 + 124
        0x080046b2:    2201        ."      MOVS     r2,#1
        0x080046b4:    21fc        .!      MOVS     r1,#0xfc
        0x080046b6:    4630        0F      MOV      r0,r6
        0x080046b8:    f002f9d9    ....    BL       mbedtls_mpi_set_bit ; 0x8006a6e
        0x080046bc:    0005        ..      MOVS     r5,r0
        0x080046be:    d10d        ..      BNE      0x80046dc ; ecp_use_curve25519 + 124
        0x080046c0:    2109        .!      MOVS     r1,#9
        0x080046c2:    f1040028    ..(.    ADD      r0,r4,#0x28
        0x080046c6:    f001ffa9    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x080046ca:    0005        ..      MOVS     r5,r0
        0x080046cc:    d106        ..      BNE      0x80046dc ; ecp_use_curve25519 + 124
        0x080046ce:    2101        .!      MOVS     r1,#1
        0x080046d0:    f1040040    ..@.    ADD      r0,r4,#0x40
        0x080046d4:    f001ffa2    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x080046d8:    0005        ..      MOVS     r5,r0
        0x080046da:    d004        ..      BEQ      0x80046e6 ; ecp_use_curve25519 + 134
        0x080046dc:    4620         F      MOV      r0,r4
        0x080046de:    f000fae3    ....    BL       mbedtls_ecp_group_free ; 0x8004ca8
        0x080046e2:    4628        (F      MOV      r0,r5
        0x080046e4:    bd70        p.      POP      {r4-r6,pc}
        0x080046e6:    f1040034    ..4.    ADD      r0,r4,#0x34
        0x080046ea:    f001fd7c    ..|.    BL       mbedtls_mpi_free ; 0x80061e6
        0x080046ee:    20fe        .       MOVS     r0,#0xfe
        0x080046f0:    65e0        .e      STR      r0,[r4,#0x5c]
        0x080046f2:    e7f6        ..      B        0x80046e2 ; ecp_use_curve25519 + 130
    $d
        0x080046f4:    42443130    01DB    DCD    1111765296
        0x080046f8:    00003234    42..    DCD    12852
        0x080046fc:    45443431    14DE    DCD    1162097713
        0x08004700:    45443946    F9DE    DCD    1162099014
        0x08004704:    37463241    A2F7    DCD    927347265
        0x08004708:    36444339    9CD6    DCD    910443321
        0x0800470c:    32313835    5812    DCD    842086453
        0x08004710:    41313336    631A    DCD    1093743414
        0x08004714:    35464335    5CF5    DCD    893797173
        0x08004718:    44453344    D3ED    DCD    1145385796
        0x0800471c:    00000000    ....    DCD    0
    $t
    i.ecp_use_curve448
    ecp_use_curve448
        0x08004720:    b5fe        ..      PUSH     {r1-r7,lr}
        0x08004722:    4604        .F      MOV      r4,r0
        0x08004724:    4668        hF      MOV      r0,sp
        0x08004726:    f001fe27    ..'.    BL       mbedtls_mpi_init ; 0x8006378
        0x0800472a:    a231        1.      ADR      r2,{pc}+0xc6 ; 0x80047f0
        0x0800472c:    2110        .!      MOVS     r1,#0x10
        0x0800472e:    f1040010    ....    ADD      r0,r4,#0x10
        0x08004732:    f002f895    ....    BL       mbedtls_mpi_read_string ; 0x8006860
        0x08004736:    0005        ..      MOVS     r5,r0
        0x08004738:    d150        P.      BNE      0x80047dc ; ecp_use_curve448 + 188
        0x0800473a:    2101        .!      MOVS     r1,#1
        0x0800473c:    1d20         .      ADDS     r0,r4,#4
        0x0800473e:    f001ff6d    ..m.    BL       mbedtls_mpi_lset ; 0x800661c
        0x08004742:    0005        ..      MOVS     r5,r0
        0x08004744:    d14a        J.      BNE      0x80047dc ; ecp_use_curve448 + 188
        0x08004746:    21e0        .!      MOVS     r1,#0xe0
        0x08004748:    1d20         .      ADDS     r0,r4,#4
        0x0800474a:    f002f9bb    ....    BL       mbedtls_mpi_shift_l ; 0x8006ac4
        0x0800474e:    0005        ..      MOVS     r5,r0
        0x08004750:    d144        D.      BNE      0x80047dc ; ecp_use_curve448 + 188
        0x08004752:    2201        ."      MOVS     r2,#1
        0x08004754:    1d21        !.      ADDS     r1,r4,#4
        0x08004756:    1d20         .      ADDS     r0,r4,#4
        0x08004758:    f002fab8    ....    BL       mbedtls_mpi_sub_int ; 0x8006ccc
        0x0800475c:    0005        ..      MOVS     r5,r0
        0x0800475e:    d13d        =.      BNE      0x80047dc ; ecp_use_curve448 + 188
        0x08004760:    21e0        .!      MOVS     r1,#0xe0
        0x08004762:    1d20         .      ADDS     r0,r4,#4
        0x08004764:    f002f9ae    ....    BL       mbedtls_mpi_shift_l ; 0x8006ac4
        0x08004768:    0005        ..      MOVS     r5,r0
        0x0800476a:    d137        7.      BNE      0x80047dc ; ecp_use_curve448 + 188
        0x0800476c:    2201        ."      MOVS     r2,#1
        0x0800476e:    1d21        !.      ADDS     r1,r4,#4
        0x08004770:    1d20         .      ADDS     r0,r4,#4
        0x08004772:    f002faab    ....    BL       mbedtls_mpi_sub_int ; 0x8006ccc
        0x08004776:    0005        ..      MOVS     r5,r0
        0x08004778:    d130        0.      BNE      0x80047dc ; ecp_use_curve448 + 188
        0x0800477a:    1d20         .      ADDS     r0,r4,#4
        0x0800477c:    f001fa93    ....    BL       mbedtls_mpi_bitlen ; 0x8005ca6
        0x08004780:    65a0        .e      STR      r0,[r4,#0x58]
        0x08004782:    2105        .!      MOVS     r1,#5
        0x08004784:    f1040028    ..(.    ADD      r0,r4,#0x28
        0x08004788:    f001ff48    ..H.    BL       mbedtls_mpi_lset ; 0x800661c
        0x0800478c:    0005        ..      MOVS     r5,r0
        0x0800478e:    d125        %.      BNE      0x80047dc ; ecp_use_curve448 + 188
        0x08004790:    2101        .!      MOVS     r1,#1
        0x08004792:    f1040040    ..@.    ADD      r0,r4,#0x40
        0x08004796:    f001ff41    ..A.    BL       mbedtls_mpi_lset ; 0x800661c
        0x0800479a:    0005        ..      MOVS     r5,r0
        0x0800479c:    d11e        ..      BNE      0x80047dc ; ecp_use_curve448 + 188
        0x0800479e:    f1040034    ..4.    ADD      r0,r4,#0x34
        0x080047a2:    f001fd20    .. .    BL       mbedtls_mpi_free ; 0x80061e6
        0x080047a6:    f104004c    ..L.    ADD      r0,r4,#0x4c
        0x080047aa:    2201        ."      MOVS     r2,#1
        0x080047ac:    f44f71df    O..q    MOV      r1,#0x1be
        0x080047b0:    4606        .F      MOV      r6,r0
        0x080047b2:    f002f95c    ..\.    BL       mbedtls_mpi_set_bit ; 0x8006a6e
        0x080047b6:    0005        ..      MOVS     r5,r0
        0x080047b8:    d110        ..      BNE      0x80047dc ; ecp_use_curve448 + 188
        0x080047ba:    a20f        ..      ADR      r2,{pc}+0x3e ; 0x80047f8
        0x080047bc:    2110        .!      MOVS     r1,#0x10
        0x080047be:    4668        hF      MOV      r0,sp
        0x080047c0:    f002f84e    ..N.    BL       mbedtls_mpi_read_string ; 0x8006860
        0x080047c4:    0005        ..      MOVS     r5,r0
        0x080047c6:    d109        ..      BNE      0x80047dc ; ecp_use_curve448 + 188
        0x080047c8:    4631        1F      MOV      r1,r6
        0x080047ca:    466a        jF      MOV      r2,sp
        0x080047cc:    4608        .F      MOV      r0,r1
        0x080047ce:    f002fa95    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x080047d2:    0005        ..      MOVS     r5,r0
        0x080047d4:    d102        ..      BNE      0x80047dc ; ecp_use_curve448 + 188
        0x080047d6:    f24010bf    @...    MOV      r0,#0x1bf
        0x080047da:    65e0        .e      STR      r0,[r4,#0x5c]
        0x080047dc:    4668        hF      MOV      r0,sp
        0x080047de:    f001fd02    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080047e2:    b115        ..      CBZ      r5,0x80047ea ; ecp_use_curve448 + 202
        0x080047e4:    4620         F      MOV      r0,r4
        0x080047e6:    f000fa5f    .._.    BL       mbedtls_ecp_group_free ; 0x8004ca8
        0x080047ea:    4628        (F      MOV      r0,r5
        0x080047ec:    bdfe        ..      POP      {r1-r7,pc}
    $d
        0x080047ee:    0000        ..      DCW    0
        0x080047f0:    41413839    98AA    DCD    1094793273
        0x080047f4:    00000000    ....    DCD    0
        0x080047f8:    35333338    8335    DCD    892547896
        0x080047fc:    36314344    DC16    DCD    909198148
        0x08004800:    31424233    3BB1    DCD    826425907
        0x08004804:    36423432    24B6    DCD    910308402
        0x08004808:    39323135    5129    DCD    959590709
        0x0800480c:    46363943    C96F    DCD    1177958723
        0x08004810:    33394544    DE93    DCD    859391300
        0x08004814:    44384433    3D8D    DCD    1144538163
        0x08004818:    41333237    723A    DCD    1093874231
        0x0800481c:    41413037    70AA    DCD    1094791223
        0x08004820:    37384344    DC87    DCD    926434116
        0x08004824:    44364433    3D6D    DCD    1144407091
        0x08004828:    37413435    54A7    DCD    927020085
        0x0800482c:    44304242    BB0D    DCD    1144013378
        0x08004830:    00000000    ....    DCD    0
    $t
    i.encrypt_g
    encrypt_g
        0x08004834:    b5f7        ..      PUSH     {r0-r2,r4-r7,lr}
        0x08004836:    0688        ..      LSLS     r0,r1,#26
        0x08004838:    0e04        ..      LSRS     r4,r0,#24
        0x0800483a:    f89d5000    ...P    LDRB     r5,[sp,#0]
        0x0800483e:    4617        .F      MOV      r7,r2
        0x08004840:    4621        !F      MOV      r1,r4
        0x08004842:    4628        (F      MOV      r0,r5
        0x08004844:    f000f84c    ..L.    BL       encrypt_sub_g ; 0x80048e0
        0x08004848:    f89d1001    ....    LDRB     r1,[sp,#1]
        0x0800484c:    463a        :F      MOV      r2,r7
        0x0800484e:    4048        H@      EORS     r0,r0,r1
        0x08004850:    b2c6        ..      UXTB     r6,r0
        0x08004852:    1c60        `.      ADDS     r0,r4,#1
        0x08004854:    b2c1        ..      UXTB     r1,r0
        0x08004856:    4630        0F      MOV      r0,r6
        0x08004858:    f000f842    ..B.    BL       encrypt_sub_g ; 0x80048e0
        0x0800485c:    4068        h@      EORS     r0,r0,r5
        0x0800485e:    b2c5        ..      UXTB     r5,r0
        0x08004860:    1ca0        ..      ADDS     r0,r4,#2
        0x08004862:    b2c1        ..      UXTB     r1,r0
        0x08004864:    463a        :F      MOV      r2,r7
        0x08004866:    4628        (F      MOV      r0,r5
        0x08004868:    f000f83a    ..:.    BL       encrypt_sub_g ; 0x80048e0
        0x0800486c:    4070        p@      EORS     r0,r0,r6
        0x0800486e:    b2c0        ..      UXTB     r0,r0
        0x08004870:    1ce4        ..      ADDS     r4,r4,#3
        0x08004872:    f88d0001    ....    STRB     r0,[sp,#1]
        0x08004876:    b2e1        ..      UXTB     r1,r4
        0x08004878:    463a        :F      MOV      r2,r7
        0x0800487a:    f000f831    ..1.    BL       encrypt_sub_g ; 0x80048e0
        0x0800487e:    4068        h@      EORS     r0,r0,r5
        0x08004880:    f88d0000    ....    STRB     r0,[sp,#0]
        0x08004884:    f8bd0000    ....    LDRH     r0,[sp,#0]
        0x08004888:    bdfe        ..      POP      {r1-r7,pc}
    i.encrypt_g_inv
    encrypt_g_inv
        0x0800488a:    b5f7        ..      PUSH     {r0-r2,r4-r7,lr}
        0x0800488c:    0688        ..      LSLS     r0,r1,#26
        0x0800488e:    0e04        ..      LSRS     r4,r0,#24
        0x08004890:    1ce0        ..      ADDS     r0,r4,#3
        0x08004892:    f89d5001    ...P    LDRB     r5,[sp,#1]
        0x08004896:    b2c1        ..      UXTB     r1,r0
        0x08004898:    4617        .F      MOV      r7,r2
        0x0800489a:    4628        (F      MOV      r0,r5
        0x0800489c:    f000f820    .. .    BL       encrypt_sub_g ; 0x80048e0
        0x080048a0:    f89d1000    ....    LDRB     r1,[sp,#0]
        0x080048a4:    463a        :F      MOV      r2,r7
        0x080048a6:    4048        H@      EORS     r0,r0,r1
        0x080048a8:    b2c6        ..      UXTB     r6,r0
        0x080048aa:    1ca0        ..      ADDS     r0,r4,#2
        0x080048ac:    b2c1        ..      UXTB     r1,r0
        0x080048ae:    4630        0F      MOV      r0,r6
        0x080048b0:    f000f816    ....    BL       encrypt_sub_g ; 0x80048e0
        0x080048b4:    4068        h@      EORS     r0,r0,r5
        0x080048b6:    b2c5        ..      UXTB     r5,r0
        0x080048b8:    1c60        `.      ADDS     r0,r4,#1
        0x080048ba:    b2c1        ..      UXTB     r1,r0
        0x080048bc:    463a        :F      MOV      r2,r7
        0x080048be:    4628        (F      MOV      r0,r5
        0x080048c0:    f000f80e    ....    BL       encrypt_sub_g ; 0x80048e0
        0x080048c4:    4070        p@      EORS     r0,r0,r6
        0x080048c6:    b2c0        ..      UXTB     r0,r0
        0x080048c8:    f88d0000    ....    STRB     r0,[sp,#0]
        0x080048cc:    463a        :F      MOV      r2,r7
        0x080048ce:    4621        !F      MOV      r1,r4
        0x080048d0:    f000f806    ....    BL       encrypt_sub_g ; 0x80048e0
        0x080048d4:    4068        h@      EORS     r0,r0,r5
        0x080048d6:    f88d0001    ....    STRB     r0,[sp,#1]
        0x080048da:    f8bd0000    ....    LDRH     r0,[sp,#0]
        0x080048de:    bdfe        ..      POP      {r1-r7,pc}
    i.encrypt_sub_g
    encrypt_sub_g
        0x080048e0:    f0010107    ....    AND      r1,r1,#7
        0x080048e4:    f1c10107    ....    RSB      r1,r1,#7
        0x080048e8:    5c51        Q\      LDRB     r1,[r2,r1]
        0x080048ea:    4041        A@      EORS     r1,r1,r0
        0x080048ec:    4801        .H      LDR      r0,[pc,#4] ; [0x80048f4] = 0x8008000
        0x080048ee:    5c40        @\      LDRB     r0,[r0,r1]
        0x080048f0:    4770        pG      BX       lr
    $d
        0x080048f2:    0000        ..      DCW    0
        0x080048f4:    08008000    ....    DCD    134250496
    $t
    i.fix_negative
    fix_negative
        0x080048f8:    b570        p.      PUSH     {r4-r6,lr}
        0x080048fa:    4613        .F      MOV      r3,r2
        0x080048fc:    4604        .F      MOV      r4,r0
        0x080048fe:    4248        HB      RSBS     r0,r1,#0
        0x08004900:    e9d32101    ...!    LDRD     r2,r1,[r3,#4]
        0x08004904:    f06f0503    o...    MVN      r5,#3
        0x08004908:    eb050282    ....    ADD      r2,r5,r2,LSL #2
        0x0800490c:    5088        .P      STR      r0,[r1,r2]
        0x0800490e:    4622        "F      MOV      r2,r4
        0x08004910:    4619        .F      MOV      r1,r3
        0x08004912:    4610        .F      MOV      r0,r2
        0x08004914:    f002f9a3    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08004918:    2800        .(      CMP      r0,#0
        0x0800491a:    d101        ..      BNE      0x8004920 ; fix_negative + 40
        0x0800491c:    1e41        A.      SUBS     r1,r0,#1
        0x0800491e:    6021        !`      STR      r1,[r4,#0]
        0x08004920:    bd70        p.      POP      {r4-r6,pc}
        0x08004922:    0000        ..      MOVS     r0,r0
    i.main
    main
        0x08004924:    b086        ..      SUB      sp,sp,#0x18
        0x08004926:    f7fcfafb    ....    BL       HAL_Init ; 0x8000f20
        0x0800492a:    f7fcfe83    ....    BL       SystemClock_Config ; 0x8001634
        0x0800492e:    2400        .$      MOVS     r4,#0
        0x08004930:    4821        !H      LDR      r0,[pc,#132] ; [0x80049b8] = 0x40021000
        0x08004932:    9400        ..      STR      r4,[sp,#0]
        0x08004934:    9401        ..      STR      r4,[sp,#4]
        0x08004936:    9402        ..      STR      r4,[sp,#8]
        0x08004938:    9403        ..      STR      r4,[sp,#0xc]
        0x0800493a:    6981        .i      LDR      r1,[r0,#0x18]
        0x0800493c:    f0410110    A...    ORR      r1,r1,#0x10
        0x08004940:    6181        .a      STR      r1,[r0,#0x18]
        0x08004942:    6981        .i      LDR      r1,[r0,#0x18]
        0x08004944:    f0010110    ....    AND      r1,r1,#0x10
        0x08004948:    9104        ..      STR      r1,[sp,#0x10]
        0x0800494a:    6981        .i      LDR      r1,[r0,#0x18]
        0x0800494c:    f0410104    A...    ORR      r1,r1,#4
        0x08004950:    6181        .a      STR      r1,[r0,#0x18]
        0x08004952:    6980        .i      LDR      r0,[r0,#0x18]
        0x08004954:    2201        ."      MOVS     r2,#1
        0x08004956:    f0000004    ....    AND      r0,r0,#4
        0x0800495a:    4e18        .N      LDR      r6,[pc,#96] ; [0x80049bc] = 0x40011000
        0x0800495c:    0355        U.      LSLS     r5,r2,#13
        0x0800495e:    9004        ..      STR      r0,[sp,#0x10]
        0x08004960:    4629        )F      MOV      r1,r5
        0x08004962:    4630        0F      MOV      r0,r6
        0x08004964:    f7fcfac8    ....    BL       HAL_GPIO_WritePin ; 0x8000ef8
        0x08004968:    2001        .       MOVS     r0,#1
        0x0800496a:    9500        ..      STR      r5,[sp,#0]
        0x0800496c:    e9cd0401    ....    STRD     r0,r4,[sp,#4]
        0x08004970:    2002        .       MOVS     r0,#2
        0x08004972:    9003        ..      STR      r0,[sp,#0xc]
        0x08004974:    4669        iF      MOV      r1,sp
        0x08004976:    4630        0F      MOV      r0,r6
        0x08004978:    f7fcf9c2    ....    BL       HAL_GPIO_Init ; 0x8000d00
        0x0800497c:    4911        .I      LDR      r1,[pc,#68] ; [0x80049c4] = 0x20000004
        0x0800497e:    4810        .H      LDR      r0,[pc,#64] ; [0x80049c0] = 0x40023000
        0x08004980:    6008        .`      STR      r0,[r1,#0]
        0x08004982:    4608        .F      MOV      r0,r1
        0x08004984:    f7fcf8ae    ....    BL       HAL_CRC_Init ; 0x8000ae4
        0x08004988:    b108        ..      CBZ      r0,0x800498e ; main + 106
        0x0800498a:    b672        r.      CPSID    i
        0x0800498c:    e7fe        ..      B        0x800498c ; main + 104
        0x0800498e:    480f        .H      LDR      r0,[pc,#60] ; [0x80049cc] = 0x20000070
        0x08004990:    490d        .I      LDR      r1,[pc,#52] ; [0x80049c8] = 0x40013800
        0x08004992:    6001        .`      STR      r1,[r0,#0]
        0x08004994:    f44f31e1    O..1    MOV      r1,#0x1c200
        0x08004998:    e9c01401    ....    STRD     r1,r4,[r0,#4]
        0x0800499c:    210c        .!      MOVS     r1,#0xc
        0x0800499e:    60c4        .`      STR      r4,[r0,#0xc]
        0x080049a0:    e9c04104    ...A    STRD     r4,r1,[r0,#0x10]
        0x080049a4:    6184        .a      STR      r4,[r0,#0x18]
        0x080049a6:    61c4        .a      STR      r4,[r0,#0x1c]
        0x080049a8:    f7fcfdda    ....    BL       HAL_UART_Init ; 0x8001560
        0x080049ac:    b108        ..      CBZ      r0,0x80049b2 ; main + 142
        0x080049ae:    b672        r.      CPSID    i
        0x080049b0:    e7fe        ..      B        0x80049b0 ; main + 140
        0x080049b2:    f7fdf979    ..y.    BL       advance_software_protect_samples ; 0x8001ca8
        0x080049b6:    e7fc        ..      B        0x80049b2 ; main + 142
    $d
        0x080049b8:    40021000    ...@    DCD    1073876992
        0x080049bc:    40011000    ...@    DCD    1073811456
        0x080049c0:    40023000    .0.@    DCD    1073885184
        0x080049c4:    20000004    ...     DCD    536870916
        0x080049c8:    40013800    .8.@    DCD    1073821696
        0x080049cc:    20000070    p..     DCD    536871024
    $t
    i.mbedtls_asn1_get_len
    mbedtls_asn1_get_len
        0x080049d0:    b5f0        ..      PUSH     {r4-r7,lr}
        0x080049d2:    6803        .h      LDR      r3,[r0,#0]
        0x080049d4:    f06f065f    o._.    MVN      r6,#0x5f
        0x080049d8:    1acc        ..      SUBS     r4,r1,r3
        0x080049da:    2c01        .,      CMP      r4,#1
        0x080049dc:    db43        C.      BLT      0x8004a66 ; mbedtls_asn1_get_len + 150
        0x080049de:    781d        .x      LDRB     r5,[r3,#0]
        0x080049e0:    062f        /.      LSLS     r7,r5,#24
        0x080049e2:    d404        ..      BMI      0x80049ee ; mbedtls_asn1_get_len + 30
        0x080049e4:    1c5c        \.      ADDS     r4,r3,#1
        0x080049e6:    6004        .`      STR      r4,[r0,#0]
        0x080049e8:    781b        .x      LDRB     r3,[r3,#0]
        0x080049ea:    6013        .`      STR      r3,[r2,#0]
        0x080049ec:    e036        6.      B        0x8004a5c ; mbedtls_asn1_get_len + 140
        0x080049ee:    f005057f    ....    AND      r5,r5,#0x7f
        0x080049f2:    2d01        .-      CMP      r5,#1
        0x080049f4:    d008        ..      BEQ      0x8004a08 ; mbedtls_asn1_get_len + 56
        0x080049f6:    2d02        .-      CMP      r5,#2
        0x080049f8:    d00d        ..      BEQ      0x8004a16 ; mbedtls_asn1_get_len + 70
        0x080049fa:    2d03        .-      CMP      r5,#3
        0x080049fc:    d014        ..      BEQ      0x8004a28 ; mbedtls_asn1_get_len + 88
        0x080049fe:    2d04        .-      CMP      r5,#4
        0x08004a00:    d01f        ..      BEQ      0x8004a42 ; mbedtls_asn1_get_len + 114
        0x08004a02:    f06f0063    o.c.    MVN      r0,#0x63
        0x08004a06:    bdf0        ..      POP      {r4-r7,pc}
        0x08004a08:    2c02        .,      CMP      r4,#2
        0x08004a0a:    db2c        ,.      BLT      0x8004a66 ; mbedtls_asn1_get_len + 150
        0x08004a0c:    785b        [x      LDRB     r3,[r3,#1]
        0x08004a0e:    6013        .`      STR      r3,[r2,#0]
        0x08004a10:    6803        .h      LDR      r3,[r0,#0]
        0x08004a12:    1c9b        ..      ADDS     r3,r3,#2
        0x08004a14:    e021        !.      B        0x8004a5a ; mbedtls_asn1_get_len + 138
        0x08004a16:    2c03        .,      CMP      r4,#3
        0x08004a18:    db25        %.      BLT      0x8004a66 ; mbedtls_asn1_get_len + 150
        0x08004a1a:    f8b33001    ...0    LDRH     r3,[r3,#1]
        0x08004a1e:    ba5b        [.      REV16    r3,r3
        0x08004a20:    6013        .`      STR      r3,[r2,#0]
        0x08004a22:    6803        .h      LDR      r3,[r0,#0]
        0x08004a24:    1cdb        ..      ADDS     r3,r3,#3
        0x08004a26:    e018        ..      B        0x8004a5a ; mbedtls_asn1_get_len + 138
        0x08004a28:    2c04        .,      CMP      r4,#4
        0x08004a2a:    db1c        ..      BLT      0x8004a66 ; mbedtls_asn1_get_len + 150
        0x08004a2c:    785c        \x      LDRB     r4,[r3,#1]
        0x08004a2e:    789d        .x      LDRB     r5,[r3,#2]
        0x08004a30:    0424        $.      LSLS     r4,r4,#16
        0x08004a32:    78db        .x      LDRB     r3,[r3,#3]
        0x08004a34:    ea442405    D..$    ORR      r4,r4,r5,LSL #8
        0x08004a38:    431c        .C      ORRS     r4,r4,r3
        0x08004a3a:    6014        .`      STR      r4,[r2,#0]
        0x08004a3c:    6803        .h      LDR      r3,[r0,#0]
        0x08004a3e:    1d1b        ..      ADDS     r3,r3,#4
        0x08004a40:    e00b        ..      B        0x8004a5a ; mbedtls_asn1_get_len + 138
        0x08004a42:    2c05        .,      CMP      r4,#5
        0x08004a44:    db0f        ..      BLT      0x8004a66 ; mbedtls_asn1_get_len + 150
        0x08004a46:    f8d34001    ...@    LDR      r4,[r3,#1]
        0x08004a4a:    791b        .y      LDRB     r3,[r3,#4]
        0x08004a4c:    ba24        $.      REV      r4,r4
        0x08004a4e:    f02404ff    $...    BIC      r4,r4,#0xff
        0x08004a52:    431c        .C      ORRS     r4,r4,r3
        0x08004a54:    6014        .`      STR      r4,[r2,#0]
        0x08004a56:    6803        .h      LDR      r3,[r0,#0]
        0x08004a58:    1d5b        [.      ADDS     r3,r3,#5
        0x08004a5a:    6003        .`      STR      r3,[r0,#0]
        0x08004a5c:    6800        .h      LDR      r0,[r0,#0]
        0x08004a5e:    6812        .h      LDR      r2,[r2,#0]
        0x08004a60:    1a08        ..      SUBS     r0,r1,r0
        0x08004a62:    4282        .B      CMP      r2,r0
        0x08004a64:    d901        ..      BLS      0x8004a6a ; mbedtls_asn1_get_len + 154
        0x08004a66:    4630        0F      MOV      r0,r6
        0x08004a68:    bdf0        ..      POP      {r4-r7,pc}
        0x08004a6a:    2000        .       MOVS     r0,#0
        0x08004a6c:    bdf0        ..      POP      {r4-r7,pc}
    i.mbedtls_asn1_get_mpi
    mbedtls_asn1_get_mpi
        0x08004a6e:    b538        8.      PUSH     {r3-r5,lr}
        0x08004a70:    4615        .F      MOV      r5,r2
        0x08004a72:    4604        .F      MOV      r4,r0
        0x08004a74:    2302        .#      MOVS     r3,#2
        0x08004a76:    466a        jF      MOV      r2,sp
        0x08004a78:    f000f80c    ....    BL       mbedtls_asn1_get_tag ; 0x8004a94
        0x08004a7c:    2800        .(      CMP      r0,#0
        0x08004a7e:    d108        ..      BNE      0x8004a92 ; mbedtls_asn1_get_mpi + 36
        0x08004a80:    6821        !h      LDR      r1,[r4,#0]
        0x08004a82:    4628        (F      MOV      r0,r5
        0x08004a84:    9a00        ..      LDR      r2,[sp,#0]
        0x08004a86:    f001fe84    ....    BL       mbedtls_mpi_read_binary ; 0x8006792
        0x08004a8a:    6821        !h      LDR      r1,[r4,#0]
        0x08004a8c:    9a00        ..      LDR      r2,[sp,#0]
        0x08004a8e:    4411        .D      ADD      r1,r1,r2
        0x08004a90:    6021        !`      STR      r1,[r4,#0]
        0x08004a92:    bd38        8.      POP      {r3-r5,pc}
    i.mbedtls_asn1_get_tag
    mbedtls_asn1_get_tag
        0x08004a94:    b430        0.      PUSH     {r4,r5}
        0x08004a96:    6804        .h      LDR      r4,[r0,#0]
        0x08004a98:    1b0d        ..      SUBS     r5,r1,r4
        0x08004a9a:    2d01        .-      CMP      r5,#1
        0x08004a9c:    da03        ..      BGE      0x8004aa6 ; mbedtls_asn1_get_tag + 18
        0x08004a9e:    f06f005f    o._.    MVN      r0,#0x5f
        0x08004aa2:    bc30        0.      POP      {r4,r5}
        0x08004aa4:    4770        pG      BX       lr
        0x08004aa6:    7825        %x      LDRB     r5,[r4,#0]
        0x08004aa8:    429d        .B      CMP      r5,r3
        0x08004aaa:    d002        ..      BEQ      0x8004ab2 ; mbedtls_asn1_get_tag + 30
        0x08004aac:    f06f0061    o.a.    MVN      r0,#0x61
        0x08004ab0:    e7f7        ..      B        0x8004aa2 ; mbedtls_asn1_get_tag + 14
        0x08004ab2:    1c64        d.      ADDS     r4,r4,#1
        0x08004ab4:    6004        .`      STR      r4,[r0,#0]
        0x08004ab6:    bc30        0.      POP      {r4,r5}
        0x08004ab8:    f7ffbf8a    ....    B.W      mbedtls_asn1_get_len ; 0x80049d0
    i.mbedtls_ecdsa_free
    mbedtls_ecdsa_free
        0x08004abc:    2800        .(      CMP      r0,#0
        0x08004abe:    d001        ..      BEQ      0x8004ac4 ; mbedtls_ecdsa_free + 8
        0x08004ac0:    f000ba8c    ....    B.W      mbedtls_ecp_keypair_free ; 0x8004fdc
        0x08004ac4:    4770        pG      BX       lr
    i.mbedtls_ecdsa_read_signature
    mbedtls_ecdsa_read_signature
        0x08004ac6:    b57c        |.      PUSH     {r2-r6,lr}
        0x08004ac8:    2500        .%      MOVS     r5,#0
        0x08004aca:    9c06        ..      LDR      r4,[sp,#0x18]
        0x08004acc:    e9cd4500    ...E    STRD     r4,r5,[sp,#0]
        0x08004ad0:    f000f802    ....    BL       mbedtls_ecdsa_read_signature_restartable ; 0x8004ad8
        0x08004ad4:    bd7c        |.      POP      {r2-r6,pc}
        0x08004ad6:    0000        ..      MOVS     r0,r0
    i.mbedtls_ecdsa_read_signature_restartable
    mbedtls_ecdsa_read_signature_restartable
        0x08004ad8:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x08004adc:    b08c        ..      SUB      sp,sp,#0x30
        0x08004ade:    4606        .F      MOV      r6,r0
        0x08004ae0:    e9dd0712    ....    LDRD     r0,r7,[sp,#0x48]
        0x08004ae4:    181d        ..      ADDS     r5,r3,r0
        0x08004ae6:    4690        .F      MOV      r8,r2
        0x08004ae8:    460c        .F      MOV      r4,r1
        0x08004aea:    a805        ..      ADD      r0,sp,#0x14
        0x08004aec:    9303        ..      STR      r3,[sp,#0xc]
        0x08004aee:    f001fc43    ..C.    BL       mbedtls_mpi_init ; 0x8006378
        0x08004af2:    a808        ..      ADD      r0,sp,#0x20
        0x08004af4:    f001fc40    ..@.    BL       mbedtls_mpi_init ; 0x8006378
        0x08004af8:    2330        0#      MOVS     r3,#0x30
        0x08004afa:    aa04        ..      ADD      r2,sp,#0x10
        0x08004afc:    4629        )F      MOV      r1,r5
        0x08004afe:    a803        ..      ADD      r0,sp,#0xc
        0x08004b00:    f7ffffc8    ....    BL       mbedtls_asn1_get_tag ; 0x8004a94
        0x08004b04:    b990        ..      CBNZ     r0,0x8004b2c ; mbedtls_ecdsa_read_signature_restartable + 84
        0x08004b06:    e9dd0103    ....    LDRD     r0,r1,[sp,#0xc]
        0x08004b0a:    4408        .D      ADD      r0,r0,r1
        0x08004b0c:    42a8        .B      CMP      r0,r5
        0x08004b0e:    d001        ..      BEQ      0x8004b14 ; mbedtls_ecdsa_read_signature_restartable + 60
        0x08004b10:    4c16        .L      LDR      r4,[pc,#88] ; [0x8004b6c] = 0xffffb01a
        0x08004b12:    e020         .      B        0x8004b56 ; mbedtls_ecdsa_read_signature_restartable + 126
        0x08004b14:    aa05        ..      ADD      r2,sp,#0x14
        0x08004b16:    4629        )F      MOV      r1,r5
        0x08004b18:    a803        ..      ADD      r0,sp,#0xc
        0x08004b1a:    f7ffffa8    ....    BL       mbedtls_asn1_get_mpi ; 0x8004a6e
        0x08004b1e:    b928        (.      CBNZ     r0,0x8004b2c ; mbedtls_ecdsa_read_signature_restartable + 84
        0x08004b20:    aa08        ..      ADD      r2,sp,#0x20
        0x08004b22:    4629        )F      MOV      r1,r5
        0x08004b24:    a803        ..      ADD      r0,sp,#0xc
        0x08004b26:    f7ffffa2    ....    BL       mbedtls_asn1_get_mpi ; 0x8004a6e
        0x08004b2a:    b110        ..      CBZ      r0,0x8004b32 ; mbedtls_ecdsa_read_signature_restartable + 90
        0x08004b2c:    f5a0449f    ...D    SUB      r4,r0,#0x4f80
        0x08004b30:    e011        ..      B        0x8004b56 ; mbedtls_ecdsa_read_signature_restartable + 126
        0x08004b32:    a808        ..      ADD      r0,sp,#0x20
        0x08004b34:    a905        ..      ADD      r1,sp,#0x14
        0x08004b36:    e9cd1000    ....    STRD     r1,r0,[sp,#0]
        0x08004b3a:    f1060388    ....    ADD      r3,r6,#0x88
        0x08004b3e:    4642        BF      MOV      r2,r8
        0x08004b40:    9702        ..      STR      r7,[sp,#8]
        0x08004b42:    4621        !F      MOV      r1,r4
        0x08004b44:    4630        0F      MOV      r0,r6
        0x08004b46:    f7fdf97d    ..}.    BL       ecdsa_verify_restartable ; 0x8001e44
        0x08004b4a:    0004        ..      MOVS     r4,r0
        0x08004b4c:    d103        ..      BNE      0x8004b56 ; mbedtls_ecdsa_read_signature_restartable + 126
        0x08004b4e:    9803        ..      LDR      r0,[sp,#0xc]
        0x08004b50:    42a8        .B      CMP      r0,r5
        0x08004b52:    d000        ..      BEQ      0x8004b56 ; mbedtls_ecdsa_read_signature_restartable + 126
        0x08004b54:    4c06        .L      LDR      r4,[pc,#24] ; [0x8004b70] = 0xffffb400
        0x08004b56:    a805        ..      ADD      r0,sp,#0x14
        0x08004b58:    f001fb45    ..E.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08004b5c:    a808        ..      ADD      r0,sp,#0x20
        0x08004b5e:    f001fb42    ..B.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08004b62:    b00c        ..      ADD      sp,sp,#0x30
        0x08004b64:    4620         F      MOV      r0,r4
        0x08004b66:    e8bd81f0    ....    POP      {r4-r8,pc}
    $d
        0x08004b6a:    0000        ..      DCW    0
        0x08004b6c:    ffffb01a    ....    DCD    4294946842
        0x08004b70:    ffffb400    ....    DCD    4294947840
    $t
    i.mbedtls_ecp_check_privkey
    mbedtls_ecp_check_privkey
        0x08004b74:    b570        p.      PUSH     {r4-r6,lr}
        0x08004b76:    460e        .F      MOV      r6,r1
        0x08004b78:    4604        .F      MOV      r4,r0
        0x08004b7a:    f000f88b    ....    BL       mbedtls_ecp_get_type ; 0x8004c94
        0x08004b7e:    4d1a        .M      LDR      r5,[pc,#104] ; [0x8004be8] = 0xffffb380
        0x08004b80:    2802        .(      CMP      r0,#2
        0x08004b82:    d006        ..      BEQ      0x8004b92 ; mbedtls_ecp_check_privkey + 30
        0x08004b84:    4620         F      MOV      r0,r4
        0x08004b86:    f000f885    ....    BL       mbedtls_ecp_get_type ; 0x8004c94
        0x08004b8a:    2801        .(      CMP      r0,#1
        0x08004b8c:    d01a        ..      BEQ      0x8004bc4 ; mbedtls_ecp_check_privkey + 80
        0x08004b8e:    4817        .H      LDR      r0,[pc,#92] ; [0x8004bec] = 0xffffb080
        0x08004b90:    bd70        p.      POP      {r4-r6,pc}
        0x08004b92:    2100        .!      MOVS     r1,#0
        0x08004b94:    4630        0F      MOV      r0,r6
        0x08004b96:    f001fbb7    ....    BL       mbedtls_mpi_get_bit ; 0x8006308
        0x08004b9a:    bb00        ..      CBNZ     r0,0x8004bde ; mbedtls_ecp_check_privkey + 106
        0x08004b9c:    2101        .!      MOVS     r1,#1
        0x08004b9e:    4630        0F      MOV      r0,r6
        0x08004ba0:    f001fbb2    ....    BL       mbedtls_mpi_get_bit ; 0x8006308
        0x08004ba4:    b9d8        ..      CBNZ     r0,0x8004bde ; mbedtls_ecp_check_privkey + 106
        0x08004ba6:    4630        0F      MOV      r0,r6
        0x08004ba8:    f001f87d    ..}.    BL       mbedtls_mpi_bitlen ; 0x8005ca6
        0x08004bac:    6de1        .m      LDR      r1,[r4,#0x5c]
        0x08004bae:    1e40        @.      SUBS     r0,r0,#1
        0x08004bb0:    4288        .B      CMP      r0,r1
        0x08004bb2:    d114        ..      BNE      0x8004bde ; mbedtls_ecp_check_privkey + 106
        0x08004bb4:    29fe        .)      CMP      r1,#0xfe
        0x08004bb6:    d114        ..      BNE      0x8004be2 ; mbedtls_ecp_check_privkey + 110
        0x08004bb8:    2102        .!      MOVS     r1,#2
        0x08004bba:    4630        0F      MOV      r0,r6
        0x08004bbc:    f001fba4    ....    BL       mbedtls_mpi_get_bit ; 0x8006308
        0x08004bc0:    b968        h.      CBNZ     r0,0x8004bde ; mbedtls_ecp_check_privkey + 106
        0x08004bc2:    e00e        ..      B        0x8004be2 ; mbedtls_ecp_check_privkey + 110
        0x08004bc4:    2101        .!      MOVS     r1,#1
        0x08004bc6:    4630        0F      MOV      r0,r6
        0x08004bc8:    f001f8be    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08004bcc:    2800        .(      CMP      r0,#0
        0x08004bce:    db06        ..      BLT      0x8004bde ; mbedtls_ecp_check_privkey + 106
        0x08004bd0:    f104014c    ..L.    ADD      r1,r4,#0x4c
        0x08004bd4:    4630        0F      MOV      r0,r6
        0x08004bd6:    f001f8cf    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08004bda:    2800        .(      CMP      r0,#0
        0x08004bdc:    db01        ..      BLT      0x8004be2 ; mbedtls_ecp_check_privkey + 110
        0x08004bde:    4628        (F      MOV      r0,r5
        0x08004be0:    bd70        p.      POP      {r4-r6,pc}
        0x08004be2:    2000        .       MOVS     r0,#0
        0x08004be4:    bd70        p.      POP      {r4-r6,pc}
    $d
        0x08004be6:    0000        ..      DCW    0
        0x08004be8:    ffffb380    ....    DCD    4294947712
        0x08004bec:    ffffb080    ....    DCD    4294946944
    $t
    i.mbedtls_ecp_check_pubkey
    mbedtls_ecp_check_pubkey
        0x08004bf0:    b570        p.      PUSH     {r4-r6,lr}
        0x08004bf2:    460c        .F      MOV      r4,r1
        0x08004bf4:    4606        .F      MOV      r6,r0
        0x08004bf6:    2101        .!      MOVS     r1,#1
        0x08004bf8:    f1040018    ....    ADD      r0,r4,#0x18
        0x08004bfc:    f001f8a4    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08004c00:    4d0f        .M      LDR      r5,[pc,#60] ; [0x8004c40] = 0xffffb380
        0x08004c02:    b998        ..      CBNZ     r0,0x8004c2c ; mbedtls_ecp_check_pubkey + 60
        0x08004c04:    4630        0F      MOV      r0,r6
        0x08004c06:    f000f845    ..E.    BL       mbedtls_ecp_get_type ; 0x8004c94
        0x08004c0a:    2802        .(      CMP      r0,#2
        0x08004c0c:    d006        ..      BEQ      0x8004c1c ; mbedtls_ecp_check_pubkey + 44
        0x08004c0e:    4630        0F      MOV      r0,r6
        0x08004c10:    f000f840    ..@.    BL       mbedtls_ecp_get_type ; 0x8004c94
        0x08004c14:    2801        .(      CMP      r0,#1
        0x08004c16:    d00d        ..      BEQ      0x8004c34 ; mbedtls_ecp_check_pubkey + 68
        0x08004c18:    480a        .H      LDR      r0,[pc,#40] ; [0x8004c44] = 0xffffb080
        0x08004c1a:    bd70        p.      POP      {r4-r6,pc}
        0x08004c1c:    4620         F      MOV      r0,r4
        0x08004c1e:    f002f818    ....    BL       mbedtls_mpi_size ; 0x8006c52
        0x08004c22:    6df1        .m      LDR      r1,[r6,#0x5c]
        0x08004c24:    1dc9        ..      ADDS     r1,r1,#7
        0x08004c26:    ebb00fd1    ....    CMP      r0,r1,LSR #3
        0x08004c2a:    d901        ..      BLS      0x8004c30 ; mbedtls_ecp_check_pubkey + 64
        0x08004c2c:    4628        (F      MOV      r0,r5
        0x08004c2e:    bd70        p.      POP      {r4-r6,pc}
        0x08004c30:    2000        .       MOVS     r0,#0
        0x08004c32:    bd70        p.      POP      {r4-r6,pc}
        0x08004c34:    4621        !F      MOV      r1,r4
        0x08004c36:    4630        0F      MOV      r0,r6
        0x08004c38:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x08004c3c:    f7fdbbf2    ....    B        ecp_check_pubkey_sw ; 0x8002424
    $d
        0x08004c40:    ffffb380    ....    DCD    4294947712
        0x08004c44:    ffffb080    ....    DCD    4294946944
    $t
    i.mbedtls_ecp_copy
    mbedtls_ecp_copy
        0x08004c48:    b570        p.      PUSH     {r4-r6,lr}
        0x08004c4a:    460c        .F      MOV      r4,r1
        0x08004c4c:    4605        .F      MOV      r5,r0
        0x08004c4e:    f001f8d9    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08004c52:    2800        .(      CMP      r0,#0
        0x08004c54:    d10f        ..      BNE      0x8004c76 ; mbedtls_ecp_copy + 46
        0x08004c56:    f104010c    ....    ADD      r1,r4,#0xc
        0x08004c5a:    f105000c    ....    ADD      r0,r5,#0xc
        0x08004c5e:    f001f8d1    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08004c62:    2800        .(      CMP      r0,#0
        0x08004c64:    d107        ..      BNE      0x8004c76 ; mbedtls_ecp_copy + 46
        0x08004c66:    f1040118    ....    ADD      r1,r4,#0x18
        0x08004c6a:    f1050018    ....    ADD      r0,r5,#0x18
        0x08004c6e:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x08004c72:    f001b8c7    ....    B.W      mbedtls_mpi_copy ; 0x8005e04
        0x08004c76:    bd70        p.      POP      {r4-r6,pc}
    i.mbedtls_ecp_curve_info_from_tls_id
    mbedtls_ecp_curve_info_from_tls_id
        0x08004c78:    4601        .F      MOV      r1,r0
        0x08004c7a:    4805        .H      LDR      r0,[pc,#20] ; [0x8004c90] = 0x800757c
        0x08004c7c:    e003        ..      B        0x8004c86 ; mbedtls_ecp_curve_info_from_tls_id + 14
        0x08004c7e:    8842        B.      LDRH     r2,[r0,#2]
        0x08004c80:    428a        .B      CMP      r2,r1
        0x08004c82:    d004        ..      BEQ      0x8004c8e ; mbedtls_ecp_curve_info_from_tls_id + 22
        0x08004c84:    300c        .0      ADDS     r0,r0,#0xc
        0x08004c86:    7802        .x      LDRB     r2,[r0,#0]
        0x08004c88:    2a00        .*      CMP      r2,#0
        0x08004c8a:    d1f8        ..      BNE      0x8004c7e ; mbedtls_ecp_curve_info_from_tls_id + 6
        0x08004c8c:    2000        .       MOVS     r0,#0
        0x08004c8e:    4770        pG      BX       lr
    $d
        0x08004c90:    0800757c    |u..    DCD    134247804
    $t
    i.mbedtls_ecp_get_type
    mbedtls_ecp_get_type
        0x08004c94:    6b01        .k      LDR      r1,[r0,#0x30]
        0x08004c96:    b119        ..      CBZ      r1,0x8004ca0 ; mbedtls_ecp_get_type + 12
        0x08004c98:    6bc0        .k      LDR      r0,[r0,#0x3c]
        0x08004c9a:    b118        ..      CBZ      r0,0x8004ca4 ; mbedtls_ecp_get_type + 16
        0x08004c9c:    2001        .       MOVS     r0,#1
        0x08004c9e:    4770        pG      BX       lr
        0x08004ca0:    2000        .       MOVS     r0,#0
        0x08004ca2:    4770        pG      BX       lr
        0x08004ca4:    2002        .       MOVS     r0,#2
        0x08004ca6:    4770        pG      BX       lr
    i.mbedtls_ecp_group_free
    mbedtls_ecp_group_free
        0x08004ca8:    b570        p.      PUSH     {r4-r6,lr}
        0x08004caa:    0004        ..      MOVS     r4,r0
        0x08004cac:    d02d        -.      BEQ      0x8004d0a ; mbedtls_ecp_group_free + 98
        0x08004cae:    6e20         n      LDR      r0,[r4,#0x60]
        0x08004cb0:    2801        .(      CMP      r0,#1
        0x08004cb2:    d012        ..      BEQ      0x8004cda ; mbedtls_ecp_group_free + 50
        0x08004cb4:    1d20         .      ADDS     r0,r4,#4
        0x08004cb6:    f001fa96    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08004cba:    f1040010    ....    ADD      r0,r4,#0x10
        0x08004cbe:    f001fa92    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08004cc2:    f104001c    ....    ADD      r0,r4,#0x1c
        0x08004cc6:    f001fa8e    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08004cca:    f1040028    ..(.    ADD      r0,r4,#0x28
        0x08004cce:    f000fa53    ..S.    BL       mbedtls_ecp_point_free ; 0x8005178
        0x08004cd2:    f104004c    ..L.    ADD      r0,r4,#0x4c
        0x08004cd6:    f001fa86    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08004cda:    6f60        `o      LDR      r0,[r4,#0x74]
        0x08004cdc:    b178        x.      CBZ      r0,0x8004cfe ; mbedtls_ecp_group_free + 86
        0x08004cde:    2500        .%      MOVS     r5,#0
        0x08004ce0:    e007        ..      B        0x8004cf2 ; mbedtls_ecp_group_free + 74
        0x08004ce2:    bf00        ..      NOP      
        0x08004ce4:    eb0501c5    ....    ADD      r1,r5,r5,LSL #3
        0x08004ce8:    eb000081    ....    ADD      r0,r0,r1,LSL #2
        0x08004cec:    f000fa44    ..D.    BL       mbedtls_ecp_point_free ; 0x8005178
        0x08004cf0:    1c6d        m.      ADDS     r5,r5,#1
        0x08004cf2:    6fa0        .o      LDR      r0,[r4,#0x78]
        0x08004cf4:    42a8        .B      CMP      r0,r5
        0x08004cf6:    6f60        `o      LDR      r0,[r4,#0x74]
        0x08004cf8:    d8f4        ..      BHI      0x8004ce4 ; mbedtls_ecp_group_free + 60
        0x08004cfa:    f7fbface    ....    BL       free ; 0x800029a
        0x08004cfe:    4620         F      MOV      r0,r4
        0x08004d00:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x08004d04:    217c        |!      MOVS     r1,#0x7c
        0x08004d06:    f002b821    ..!.    B.W      mbedtls_platform_zeroize ; 0x8006d4c
        0x08004d0a:    bd70        p.      POP      {r4-r6,pc}
    i.mbedtls_ecp_group_init
    mbedtls_ecp_group_init
        0x08004d0c:    b570        p.      PUSH     {r4-r6,lr}
        0x08004d0e:    4604        .F      MOV      r4,r0
        0x08004d10:    2500        .%      MOVS     r5,#0
        0x08004d12:    f8005b04    ...[    STRB     r5,[r0],#4
        0x08004d16:    f001fb2f    ../.    BL       mbedtls_mpi_init ; 0x8006378
        0x08004d1a:    f1040010    ....    ADD      r0,r4,#0x10
        0x08004d1e:    f001fb2b    ..+.    BL       mbedtls_mpi_init ; 0x8006378
        0x08004d22:    f104001c    ....    ADD      r0,r4,#0x1c
        0x08004d26:    f001fb27    ..'.    BL       mbedtls_mpi_init ; 0x8006378
        0x08004d2a:    f1040028    ..(.    ADD      r0,r4,#0x28
        0x08004d2e:    f000fa33    ..3.    BL       mbedtls_ecp_point_init ; 0x8005198
        0x08004d32:    f104004c    ..L.    ADD      r0,r4,#0x4c
        0x08004d36:    f001fb1f    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08004d3a:    65a5        .e      STR      r5,[r4,#0x58]
        0x08004d3c:    65e5        .e      STR      r5,[r4,#0x5c]
        0x08004d3e:    6625        %f      STR      r5,[r4,#0x60]
        0x08004d40:    6665        ef      STR      r5,[r4,#0x64]
        0x08004d42:    66a5        .f      STR      r5,[r4,#0x68]
        0x08004d44:    66e5        .f      STR      r5,[r4,#0x6c]
        0x08004d46:    6725        %g      STR      r5,[r4,#0x70]
        0x08004d48:    6765        eg      STR      r5,[r4,#0x74]
        0x08004d4a:    67a5        .g      STR      r5,[r4,#0x78]
        0x08004d4c:    bd70        p.      POP      {r4-r6,pc}
        0x08004d4e:    0000        ..      MOVS     r0,r0
    i.mbedtls_ecp_group_load
    mbedtls_ecp_group_load
        0x08004d50:    b5f0        ..      PUSH     {r4-r7,lr}
        0x08004d52:    b089        ..      SUB      sp,sp,#0x24
        0x08004d54:    460d        .F      MOV      r5,r1
        0x08004d56:    4604        .F      MOV      r4,r0
        0x08004d58:    f7ffffa6    ....    BL       mbedtls_ecp_group_free ; 0x8004ca8
        0x08004d5c:    2700        .'      MOVS     r7,#0
        0x08004d5e:    2004        .       MOVS     r0,#4
        0x08004d60:    2118        .!      MOVS     r1,#0x18
        0x08004d62:    231c        .#      MOVS     r3,#0x1c
        0x08004d64:    2220         "      MOVS     r2,#0x20
        0x08004d66:    2630        0&      MOVS     r6,#0x30
        0x08004d68:    7025        %p      STRB     r5,[r4,#0]
        0x08004d6a:    2d0e        .-      CMP      r5,#0xe
        0x08004d6c:    d270        p.      BCS      0x8004e50 ; mbedtls_ecp_group_load + 256
        0x08004d6e:    e8dff005    ....    TBB      [pc,r5]
    $d
        0x08004d72:    076f        o.      DCW    1903
        0x08004d74:    5a45311c    .1EZ    DCD    1514483996
        0x08004d78:    f3d9c6b2    ....    DCD    4091135666
        0x08004d7c:    fb9d8770    p...    DCD    4221405040
    $t
        0x08004d80:    4880        .H      LDR      r0,[pc,#512] ; [0x8004f84] = 0x8002e6f
        0x08004d82:    6660        `f      STR      r0,[r4,#0x64]
        0x08004d84:    4880        .H      LDR      r0,[pc,#512] ; [0x8004f88] = 0x8007684
        0x08004d86:    9108        ..      STR      r1,[sp,#0x20]
        0x08004d88:    e9cd1006    ....    STRD     r1,r0,[sp,#0x18]
        0x08004d8c:    f1a00218    ....    SUB      r2,r0,#0x18
        0x08004d90:    3830        08      SUBS     r0,r0,#0x30
        0x08004d92:    9205        ..      STR      r2,[sp,#0x14]
        0x08004d94:    3a30        0:      SUBS     r2,r2,#0x30
        0x08004d96:    e9cd1002    ....    STRD     r1,r0,[sp,#8]
        0x08004d9a:    e9cd7200    ...r    STRD     r7,r2,[sp,#0]
        0x08004d9e:    2300        .#      MOVS     r3,#0
        0x08004da0:    9104        ..      STR      r1,[sp,#0x10]
        0x08004da2:    2218        ."      MOVS     r2,#0x18
        0x08004da4:    f1a00130    ..0.    SUB      r1,r0,#0x30
        0x08004da8:    e0cf        ..      B        0x8004f4a ; mbedtls_ecp_group_load + 506
        0x08004daa:    4878        xH      LDR      r0,[pc,#480] ; [0x8004f8c] = 0x8002f0b
        0x08004dac:    6660        `f      STR      r0,[r4,#0x64]
        0x08004dae:    4876        vH      LDR      r0,[pc,#472] ; [0x8004f88] = 0x8007684
        0x08004db0:    9308        ..      STR      r3,[sp,#0x20]
        0x08004db2:    308c        .0      ADDS     r0,r0,#0x8c
        0x08004db4:    f1a0011c    ....    SUB      r1,r0,#0x1c
        0x08004db8:    e9cd3006    ...0    STRD     r3,r0,[sp,#0x18]
        0x08004dbc:    9105        ..      STR      r1,[sp,#0x14]
        0x08004dbe:    3838        88      SUBS     r0,r0,#0x38
        0x08004dc0:    3938        89      SUBS     r1,r1,#0x38
        0x08004dc2:    e9cd3002    ...0    STRD     r3,r0,[sp,#8]
        0x08004dc6:    e9cd7100    ...q    STRD     r7,r1,[sp,#0]
        0x08004dca:    9304        ..      STR      r3,[sp,#0x10]
        0x08004dcc:    2300        .#      MOVS     r3,#0
        0x08004dce:    2220         "      MOVS     r2,#0x20
        0x08004dd0:    3920         9      SUBS     r1,r1,#0x20
        0x08004dd2:    e0ba        ..      B        0x8004f4a ; mbedtls_ecp_group_load + 506
        0x08004dd4:    486e        nH      LDR      r0,[pc,#440] ; [0x8004f90] = 0x80031dd
        0x08004dd6:    6660        `f      STR      r0,[r4,#0x64]
        0x08004dd8:    486e        nH      LDR      r0,[pc,#440] ; [0x8004f94] = 0x80077ac
        0x08004dda:    9208        ..      STR      r2,[sp,#0x20]
        0x08004ddc:    f1a00120    .. .    SUB      r1,r0,#0x20
        0x08004de0:    e9cd2006    ...     STRD     r2,r0,[sp,#0x18]
        0x08004de4:    9105        ..      STR      r1,[sp,#0x14]
        0x08004de6:    3840        @8      SUBS     r0,r0,#0x40
        0x08004de8:    3940        @9      SUBS     r1,r1,#0x40
        0x08004dea:    e9cd2002    ...     STRD     r2,r0,[sp,#8]
        0x08004dee:    e9cd7100    ...q    STRD     r7,r1,[sp,#0]
        0x08004df2:    9204        ..      STR      r2,[sp,#0x10]
        0x08004df4:    2300        .#      MOVS     r3,#0
        0x08004df6:    2220         "      MOVS     r2,#0x20
        0x08004df8:    3920         9      SUBS     r1,r1,#0x20
        0x08004dfa:    e0a6        ..      B        0x8004f4a ; mbedtls_ecp_group_load + 506
        0x08004dfc:    4866        fH      LDR      r0,[pc,#408] ; [0x8004f98] = 0x8003629
        0x08004dfe:    6660        `f      STR      r0,[r4,#0x64]
        0x08004e00:    4864        dH      LDR      r0,[pc,#400] ; [0x8004f94] = 0x80077ac
        0x08004e02:    9608        ..      STR      r6,[sp,#0x20]
        0x08004e04:    30e0        .0      ADDS     r0,r0,#0xe0
        0x08004e06:    f1a00130    ..0.    SUB      r1,r0,#0x30
        0x08004e0a:    e9cd6006    ...`    STRD     r6,r0,[sp,#0x18]
        0x08004e0e:    9105        ..      STR      r1,[sp,#0x14]
        0x08004e10:    3860        `8      SUBS     r0,r0,#0x60
        0x08004e12:    3960        `9      SUBS     r1,r1,#0x60
        0x08004e14:    e9cd7100    ...q    STRD     r7,r1,[sp,#0]
        0x08004e18:    e9cd6002    ...`    STRD     r6,r0,[sp,#8]
        0x08004e1c:    2300        .#      MOVS     r3,#0
        0x08004e1e:    2230        0"      MOVS     r2,#0x30
        0x08004e20:    9604        ..      STR      r6,[sp,#0x10]
        0x08004e22:    3930        09      SUBS     r1,r1,#0x30
        0x08004e24:    e091        ..      B        0x8004f4a ; mbedtls_ecp_group_load + 506
        0x08004e26:    485d        ]H      LDR      r0,[pc,#372] ; [0x8004f9c] = 0x8003c59
        0x08004e28:    6660        `f      STR      r0,[r4,#0x64]
        0x08004e2a:    495d        ]I      LDR      r1,[pc,#372] ; [0x8004fa0] = 0x80079cc
        0x08004e2c:    2044        D       MOVS     r0,#0x44
        0x08004e2e:    f1a10244    ..D.    SUB      r2,r1,#0x44
        0x08004e32:    e9cd0106    ....    STRD     r0,r1,[sp,#0x18]
        0x08004e36:    9205        ..      STR      r2,[sp,#0x14]
        0x08004e38:    3a88        .:      SUBS     r2,r2,#0x88
        0x08004e3a:    e9cd7200    ...r    STRD     r7,r2,[sp,#0]
        0x08004e3e:    3988        .9      SUBS     r1,r1,#0x88
        0x08004e40:    9008        ..      STR      r0,[sp,#0x20]
        0x08004e42:    e9cd0102    ....    STRD     r0,r1,[sp,#8]
        0x08004e46:    2300        .#      MOVS     r3,#0
        0x08004e48:    9004        ..      STR      r0,[sp,#0x10]
        0x08004e4a:    4602        .F      MOV      r2,r0
        0x08004e4c:    3988        .9      SUBS     r1,r1,#0x88
        0x08004e4e:    e07c        |.      B        0x8004f4a ; mbedtls_ecp_group_load + 506
        0x08004e50:    e092        ..      B        0x8004f78 ; mbedtls_ecp_group_load + 552
        0x08004e52:    4a54        TJ      LDR      r2,[pc,#336] ; [0x8004fa4] = 0x8002091
        0x08004e54:    6662        bf      STR      r2,[r4,#0x64]
        0x08004e56:    4a52        RJ      LDR      r2,[pc,#328] ; [0x8004fa0] = 0x80079cc
        0x08004e58:    9108        ..      STR      r1,[sp,#0x20]
        0x08004e5a:    328c        .2      ADDS     r2,r2,#0x8c
        0x08004e5c:    e9cd1206    ....    STRD     r1,r2,[sp,#0x18]
        0x08004e60:    f1a20318    ....    SUB      r3,r2,#0x18
        0x08004e64:    3a30        0:      SUBS     r2,r2,#0x30
        0x08004e66:    9305        ..      STR      r3,[sp,#0x14]
        0x08004e68:    f5a26383    ...c    SUB      r3,r2,#0x418
        0x08004e6c:    e9cd0300    ....    STRD     r0,r3,[sp,#0]
        0x08004e70:    e9cd0202    ....    STRD     r0,r2,[sp,#8]
        0x08004e74:    1f1b        ..      SUBS     r3,r3,#4
        0x08004e76:    9104        ..      STR      r1,[sp,#0x10]
        0x08004e78:    2218        ."      MOVS     r2,#0x18
        0x08004e7a:    f2034104    ...A    ADD      r1,r3,#0x404
        0x08004e7e:    e064        d.      B        0x8004f4a ; mbedtls_ecp_group_load + 506
        0x08004e80:    4949        II      LDR      r1,[pc,#292] ; [0x8004fa8] = 0x80020a9
        0x08004e82:    6661        af      STR      r1,[r4,#0x64]
        0x08004e84:    4946        FI      LDR      r1,[pc,#280] ; [0x8004fa0] = 0x80079cc
        0x08004e86:    31f8        .1      ADDS     r1,r1,#0xf8
        0x08004e88:    e9cd1207    ....    STRD     r1,r2,[sp,#0x1c]
        0x08004e8c:    f1a1051c    ....    SUB      r5,r1,#0x1c
        0x08004e90:    e9cd5305    ...S    STRD     r5,r3,[sp,#0x14]
        0x08004e94:    3938        89      SUBS     r1,r1,#0x38
        0x08004e96:    ad02        ..      ADD      r5,sp,#8
        0x08004e98:    f2a14274    ..tB    SUB      r2,r1,#0x474
        0x08004e9c:    e885000b    ....    STM      r5,{r0,r1,r3}
        0x08004ea0:    e9cd0200    ....    STRD     r0,r2,[sp,#0]
        0x08004ea4:    1f13        ..      SUBS     r3,r2,#4
        0x08004ea6:    221c        ."      MOVS     r2,#0x1c
        0x08004ea8:    391c        .9      SUBS     r1,r1,#0x1c
        0x08004eaa:    e04e        N.      B        0x8004f4a ; mbedtls_ecp_group_load + 506
        0x08004eac:    493f        ?I      LDR      r1,[pc,#252] ; [0x8004fac] = 0x8003611
        0x08004eae:    6661        af      STR      r1,[r4,#0x64]
        0x08004eb0:    493f        ?I      LDR      r1,[pc,#252] ; [0x8004fb0] = 0x8007b44
        0x08004eb2:    ad02        ..      ADD      r5,sp,#8
        0x08004eb4:    e9cd2106    ...!    STRD     r2,r1,[sp,#0x18]
        0x08004eb8:    f1a10320    .. .    SUB      r3,r1,#0x20
        0x08004ebc:    9305        ..      STR      r3,[sp,#0x14]
        0x08004ebe:    3940        @9      SUBS     r1,r1,#0x40
        0x08004ec0:    9208        ..      STR      r2,[sp,#0x20]
        0x08004ec2:    e8850007    ....    STM      r5,{r0-r2}
        0x08004ec6:    f2a143e4    ...C    SUB      r3,r1,#0x4e4
        0x08004eca:    e9cd0300    ....    STRD     r0,r3,[sp,#0]
        0x08004ece:    1f1b        ..      SUBS     r3,r3,#4
        0x08004ed0:    2220         "      MOVS     r2,#0x20
        0x08004ed2:    3920         9      SUBS     r1,r1,#0x20
        0x08004ed4:    e039        9.      B        0x8004f4a ; mbedtls_ecp_group_load + 506
        0x08004ed6:    4836        6H      LDR      r0,[pc,#216] ; [0x8004fb0] = 0x8007b44
        0x08004ed8:    9208        ..      STR      r2,[sp,#0x20]
        0x08004eda:    30c0        .0      ADDS     r0,r0,#0xc0
        0x08004edc:    f1a00120    .. .    SUB      r1,r0,#0x20
        0x08004ee0:    e9cd2006    ...     STRD     r2,r0,[sp,#0x18]
        0x08004ee4:    9105        ..      STR      r1,[sp,#0x14]
        0x08004ee6:    3840        @8      SUBS     r0,r0,#0x40
        0x08004ee8:    3940        @9      SUBS     r1,r1,#0x40
        0x08004eea:    e9cd2002    ...     STRD     r2,r0,[sp,#8]
        0x08004eee:    e9cd2100    ...!    STRD     r2,r1,[sp,#0]
        0x08004ef2:    9204        ..      STR      r2,[sp,#0x10]
        0x08004ef4:    2220         "      MOVS     r2,#0x20
        0x08004ef6:    f1a00340    ..@.    SUB      r3,r0,#0x40
        0x08004efa:    3940        @9      SUBS     r1,r1,#0x40
        0x08004efc:    e025        %.      B        0x8004f4a ; mbedtls_ecp_group_load + 506
        0x08004efe:    482d        -H      LDR      r0,[pc,#180] ; [0x8004fb4] = 0x8007d14
        0x08004f00:    9608        ..      STR      r6,[sp,#0x20]
        0x08004f02:    f1a00130    ..0.    SUB      r1,r0,#0x30
        0x08004f06:    e9cd6006    ...`    STRD     r6,r0,[sp,#0x18]
        0x08004f0a:    9105        ..      STR      r1,[sp,#0x14]
        0x08004f0c:    3860        `8      SUBS     r0,r0,#0x60
        0x08004f0e:    3960        `9      SUBS     r1,r1,#0x60
        0x08004f10:    e9cd6100    ...a    STRD     r6,r1,[sp,#0]
        0x08004f14:    e9cd6002    ...`    STRD     r6,r0,[sp,#8]
        0x08004f18:    2230        0"      MOVS     r2,#0x30
        0x08004f1a:    f1a00360    ..`.    SUB      r3,r0,#0x60
        0x08004f1e:    9604        ..      STR      r6,[sp,#0x10]
        0x08004f20:    3960        `9      SUBS     r1,r1,#0x60
        0x08004f22:    e012        ..      B        0x8004f4a ; mbedtls_ecp_group_load + 506
        0x08004f24:    4924        $I      LDR      r1,[pc,#144] ; [0x8004fb8] = 0x8007e84
        0x08004f26:    2040        @       MOVS     r0,#0x40
        0x08004f28:    f1a10240    ..@.    SUB      r2,r1,#0x40
        0x08004f2c:    e9cd0106    ....    STRD     r0,r1,[sp,#0x18]
        0x08004f30:    9205        ..      STR      r2,[sp,#0x14]
        0x08004f32:    3a80        .:      SUBS     r2,r2,#0x80
        0x08004f34:    3980        .9      SUBS     r1,r1,#0x80
        0x08004f36:    e9cd0200    ....    STRD     r0,r2,[sp,#0]
        0x08004f3a:    9008        ..      STR      r0,[sp,#0x20]
        0x08004f3c:    e9cd0102    ....    STRD     r0,r1,[sp,#8]
        0x08004f40:    f1a10380    ....    SUB      r3,r1,#0x80
        0x08004f44:    9004        ..      STR      r0,[sp,#0x10]
        0x08004f46:    4602        .F      MOV      r2,r0
        0x08004f48:    39c0        .9      SUBS     r1,r1,#0xc0
        0x08004f4a:    4620         F      MOV      r0,r4
        0x08004f4c:    f7fdfeaa    ....    BL       ecp_group_load ; 0x8002ca4
        0x08004f50:    b009        ..      ADD      sp,sp,#0x24
        0x08004f52:    bdf0        ..      POP      {r4-r7,pc}
        0x08004f54:    e008        ..      B        0x8004f68 ; mbedtls_ecp_group_load + 536
        0x08004f56:    e7ff        ..      B        0x8004f58 ; mbedtls_ecp_group_load + 520
        0x08004f58:    4818        .H      LDR      r0,[pc,#96] ; [0x8004fbc] = 0x800314d
        0x08004f5a:    6660        `f      STR      r0,[r4,#0x64]
        0x08004f5c:    b009        ..      ADD      sp,sp,#0x24
        0x08004f5e:    4620         F      MOV      r0,r4
        0x08004f60:    e8bd40f0    ...@    POP      {r4-r7,lr}
        0x08004f64:    f7ffbb7c    ..|.    B        ecp_use_curve25519 ; 0x8004660
        0x08004f68:    4815        .H      LDR      r0,[pc,#84] ; [0x8004fc0] = 0x8003b89
        0x08004f6a:    6660        `f      STR      r0,[r4,#0x64]
        0x08004f6c:    b009        ..      ADD      sp,sp,#0x24
        0x08004f6e:    4620         F      MOV      r0,r4
        0x08004f70:    e8bd40f0    ...@    POP      {r4-r7,lr}
        0x08004f74:    f7ffbbd4    ....    B        ecp_use_curve448 ; 0x8004720
        0x08004f78:    4620         F      MOV      r0,r4
        0x08004f7a:    f7fffe95    ....    BL       mbedtls_ecp_group_free ; 0x8004ca8
        0x08004f7e:    4811        .H      LDR      r0,[pc,#68] ; [0x8004fc4] = 0xffffb180
        0x08004f80:    e7e6        ..      B        0x8004f50 ; mbedtls_ecp_group_load + 512
    $d
        0x08004f82:    0000        ..      DCW    0
        0x08004f84:    08002e6f    o...    DCD    134229615
        0x08004f88:    08007684    .v..    DCD    134248068
        0x08004f8c:    08002f0b    ./..    DCD    134229771
        0x08004f90:    080031dd    .1..    DCD    134230493
        0x08004f94:    080077ac    .w..    DCD    134248364
        0x08004f98:    08003629    )6..    DCD    134231593
        0x08004f9c:    08003c59    Y<..    DCD    134233177
        0x08004fa0:    080079cc    .y..    DCD    134248908
        0x08004fa4:    08002091    . ..    DCD    134226065
        0x08004fa8:    080020a9    . ..    DCD    134226089
        0x08004fac:    08003611    .6..    DCD    134231569
        0x08004fb0:    08007b44    D{..    DCD    134249284
        0x08004fb4:    08007d14    .}..    DCD    134249748
        0x08004fb8:    08007e84    .~..    DCD    134250116
        0x08004fbc:    0800314d    M1..    DCD    134230349
        0x08004fc0:    08003b89    .;..    DCD    134232969
        0x08004fc4:    ffffb180    ....    DCD    4294947200
    $t
    i.mbedtls_ecp_is_zero
    mbedtls_ecp_is_zero
        0x08004fc8:    b510        ..      PUSH     {r4,lr}
        0x08004fca:    2100        .!      MOVS     r1,#0
        0x08004fcc:    3018        .0      ADDS     r0,r0,#0x18
        0x08004fce:    f000febb    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08004fd2:    b108        ..      CBZ      r0,0x8004fd8 ; mbedtls_ecp_is_zero + 16
        0x08004fd4:    2000        .       MOVS     r0,#0
        0x08004fd6:    bd10        ..      POP      {r4,pc}
        0x08004fd8:    2001        .       MOVS     r0,#1
        0x08004fda:    bd10        ..      POP      {r4,pc}
    i.mbedtls_ecp_keypair_free
    mbedtls_ecp_keypair_free
        0x08004fdc:    b510        ..      PUSH     {r4,lr}
        0x08004fde:    0004        ..      MOVS     r4,r0
        0x08004fe0:    d00b        ..      BEQ      0x8004ffa ; mbedtls_ecp_keypair_free + 30
        0x08004fe2:    f7fffe61    ..a.    BL       mbedtls_ecp_group_free ; 0x8004ca8
        0x08004fe6:    f104007c    ..|.    ADD      r0,r4,#0x7c
        0x08004fea:    f001f8fc    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08004fee:    f1040088    ....    ADD      r0,r4,#0x88
        0x08004ff2:    e8bd4010    ...@    POP      {r4,lr}
        0x08004ff6:    f000b8bf    ....    B.W      mbedtls_ecp_point_free ; 0x8005178
        0x08004ffa:    bd10        ..      POP      {r4,pc}
    i.mbedtls_ecp_keypair_init
    mbedtls_ecp_keypair_init
        0x08004ffc:    b510        ..      PUSH     {r4,lr}
        0x08004ffe:    4604        .F      MOV      r4,r0
        0x08005000:    f7fffe84    ....    BL       mbedtls_ecp_group_init ; 0x8004d0c
        0x08005004:    f104007c    ..|.    ADD      r0,r4,#0x7c
        0x08005008:    f001f9b6    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x0800500c:    f1040088    ....    ADD      r0,r4,#0x88
        0x08005010:    e8bd4010    ...@    POP      {r4,lr}
        0x08005014:    f000b8c0    ....    B.W      mbedtls_ecp_point_init ; 0x8005198
    i.mbedtls_ecp_mul_restartable
    mbedtls_ecp_mul_restartable
        0x08005018:    e92d4ffe    -..O    PUSH     {r1-r11,lr}
        0x0800501c:    468a        .F      MOV      r10,r1
        0x0800501e:    e9dd650c    ...e    LDRD     r6,r5,[sp,#0x30]
        0x08005022:    4698        .F      MOV      r8,r3
        0x08005024:    4691        .F      MOV      r9,r2
        0x08005026:    4683        .F      MOV      r11,r0
        0x08005028:    4c17        .L      LDR      r4,[pc,#92] ; [0x8005088] = 0xffffb080
        0x0800502a:    4611        .F      MOV      r1,r2
        0x0800502c:    9f0e        ..      LDR      r7,[sp,#0x38]
        0x0800502e:    f7fffda1    ....    BL       mbedtls_ecp_check_privkey ; 0x8004b74
        0x08005032:    0002        ..      MOVS     r2,r0
        0x08005034:    d124        $.      BNE      0x8005080 ; mbedtls_ecp_mul_restartable + 104
        0x08005036:    4641        AF      MOV      r1,r8
        0x08005038:    4658        XF      MOV      r0,r11
        0x0800503a:    f7fffdd9    ....    BL       mbedtls_ecp_check_pubkey ; 0x8004bf0
        0x0800503e:    0002        ..      MOVS     r2,r0
        0x08005040:    d11e        ..      BNE      0x8005080 ; mbedtls_ecp_mul_restartable + 104
        0x08005042:    4622        "F      MOV      r2,r4
        0x08005044:    4658        XF      MOV      r0,r11
        0x08005046:    f7fffe25    ..%.    BL       mbedtls_ecp_get_type ; 0x8004c94
        0x0800504a:    2802        .(      CMP      r0,#2
        0x0800504c:    d109        ..      BNE      0x8005062 ; mbedtls_ecp_mul_restartable + 74
        0x0800504e:    e9cd6500    ...e    STRD     r6,r5,[sp,#0]
        0x08005052:    4643        CF      MOV      r3,r8
        0x08005054:    464a        JF      MOV      r2,r9
        0x08005056:    4651        QF      MOV      r1,r10
        0x08005058:    4658        XF      MOV      r0,r11
        0x0800505a:    f7feff66    ..f.    BL       ecp_mul_mxz ; 0x8003f2a
        0x0800505e:    0002        ..      MOVS     r2,r0
        0x08005060:    d10e        ..      BNE      0x8005080 ; mbedtls_ecp_mul_restartable + 104
        0x08005062:    4658        XF      MOV      r0,r11
        0x08005064:    f7fffe16    ....    BL       mbedtls_ecp_get_type ; 0x8004c94
        0x08005068:    2801        .(      CMP      r0,#1
        0x0800506a:    d109        ..      BNE      0x8005080 ; mbedtls_ecp_mul_restartable + 104
        0x0800506c:    e9cd6500    ...e    STRD     r6,r5,[sp,#0]
        0x08005070:    4643        CF      MOV      r3,r8
        0x08005072:    464a        JF      MOV      r2,r9
        0x08005074:    4651        QF      MOV      r1,r10
        0x08005076:    4658        XF      MOV      r0,r11
        0x08005078:    9702        ..      STR      r7,[sp,#8]
        0x0800507a:    f7fefe69    ..i.    BL       ecp_mul_comb ; 0x8003d50
        0x0800507e:    4602        .F      MOV      r2,r0
        0x08005080:    4610        .F      MOV      r0,r2
        0x08005082:    e8bd8ffe    ....    POP      {r1-r11,pc}
    $d
        0x08005086:    0000        ..      DCW    0
        0x08005088:    ffffb080    ....    DCD    4294946944
    $t
    i.mbedtls_ecp_mul_shortcuts
    mbedtls_ecp_mul_shortcuts
        0x0800508c:    e92d43fe    -..C    PUSH     {r1-r9,lr}
        0x08005090:    460d        .F      MOV      r5,r1
        0x08005092:    4606        .F      MOV      r6,r0
        0x08005094:    461f        .F      MOV      r7,r3
        0x08005096:    4690        .F      MOV      r8,r2
        0x08005098:    2101        .!      MOVS     r1,#1
        0x0800509a:    4610        .F      MOV      r0,r2
        0x0800509c:    9c0a        ..      LDR      r4,[sp,#0x28]
        0x0800509e:    f000fe53    ..S.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080050a2:    b180        ..      CBZ      r0,0x80050c6 ; mbedtls_ecp_mul_shortcuts + 58
        0x080050a4:    f04f31ff    O..1    MOV      r1,#0xffffffff
        0x080050a8:    4640        @F      MOV      r0,r8
        0x080050aa:    f000fe4d    ..M.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080050ae:    b178        x.      CBZ      r0,0x80050d0 ; mbedtls_ecp_mul_shortcuts + 68
        0x080050b0:    2000        .       MOVS     r0,#0
        0x080050b2:    9000        ..      STR      r0,[sp,#0]
        0x080050b4:    e9cd0401    ....    STRD     r0,r4,[sp,#4]
        0x080050b8:    463b        ;F      MOV      r3,r7
        0x080050ba:    4642        BF      MOV      r2,r8
        0x080050bc:    4629        )F      MOV      r1,r5
        0x080050be:    4630        0F      MOV      r0,r6
        0x080050c0:    f7ffffaa    ....    BL       mbedtls_ecp_mul_restartable ; 0x8005018
        0x080050c4:    e016        ..      B        0x80050f4 ; mbedtls_ecp_mul_shortcuts + 104
        0x080050c6:    4639        9F      MOV      r1,r7
        0x080050c8:    4628        (F      MOV      r0,r5
        0x080050ca:    f7fffdbd    ....    BL       mbedtls_ecp_copy ; 0x8004c48
        0x080050ce:    e011        ..      B        0x80050f4 ; mbedtls_ecp_mul_shortcuts + 104
        0x080050d0:    4639        9F      MOV      r1,r7
        0x080050d2:    4628        (F      MOV      r0,r5
        0x080050d4:    f7fffdb8    ....    BL       mbedtls_ecp_copy ; 0x8004c48
        0x080050d8:    0004        ..      MOVS     r4,r0
        0x080050da:    d10c        ..      BNE      0x80050f6 ; mbedtls_ecp_mul_shortcuts + 106
        0x080050dc:    f105000c    ....    ADD      r0,r5,#0xc
        0x080050e0:    2100        .!      MOVS     r1,#0
        0x080050e2:    4605        .F      MOV      r5,r0
        0x080050e4:    f000fe30    ..0.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080050e8:    b128        (.      CBZ      r0,0x80050f6 ; mbedtls_ecp_mul_shortcuts + 106
        0x080050ea:    462a        *F      MOV      r2,r5
        0x080050ec:    1d31        1.      ADDS     r1,r6,#4
        0x080050ee:    4610        .F      MOV      r0,r2
        0x080050f0:    f001fe04    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x080050f4:    4604        .F      MOV      r4,r0
        0x080050f6:    4620         F      MOV      r0,r4
        0x080050f8:    e8bd83fe    ....    POP      {r1-r9,pc}
    i.mbedtls_ecp_muladd_restartable
    mbedtls_ecp_muladd_restartable
        0x080050fc:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x08005100:    b08b        ..      SUB      sp,sp,#0x2c
        0x08005102:    461c        .F      MOV      r4,r3
        0x08005104:    e9dd9715    ....    LDRD     r9,r7,[sp,#0x54]
        0x08005108:    4690        .F      MOV      r8,r2
        0x0800510a:    4683        .F      MOV      r11,r0
        0x0800510c:    ae01        ..      ADD      r6,sp,#4
        0x0800510e:    460d        .F      MOV      r5,r1
        0x08005110:    f8dda050    ..P.    LDR      r10,[sp,#0x50]
        0x08005114:    f7fffdbe    ....    BL       mbedtls_ecp_get_type ; 0x8004c94
        0x08005118:    2801        .(      CMP      r0,#1
        0x0800511a:    d003        ..      BEQ      0x8005124 ; mbedtls_ecp_muladd_restartable + 40
        0x0800511c:    4815        .H      LDR      r0,[pc,#84] ; [0x8005174] = 0xffffb180
        0x0800511e:    b00b        ..      ADD      sp,sp,#0x2c
        0x08005120:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x08005124:    a801        ..      ADD      r0,sp,#4
        0x08005126:    f000f837    ..7.    BL       mbedtls_ecp_point_init ; 0x8005198
        0x0800512a:    4623        #F      MOV      r3,r4
        0x0800512c:    4642        BF      MOV      r2,r8
        0x0800512e:    4631        1F      MOV      r1,r6
        0x08005130:    4658        XF      MOV      r0,r11
        0x08005132:    9700        ..      STR      r7,[sp,#0]
        0x08005134:    f7ffffaa    ....    BL       mbedtls_ecp_mul_shortcuts ; 0x800508c
        0x08005138:    0004        ..      MOVS     r4,r0
        0x0800513a:    d115        ..      BNE      0x8005168 ; mbedtls_ecp_muladd_restartable + 108
        0x0800513c:    464b        KF      MOV      r3,r9
        0x0800513e:    4652        RF      MOV      r2,r10
        0x08005140:    4629        )F      MOV      r1,r5
        0x08005142:    4658        XF      MOV      r0,r11
        0x08005144:    9700        ..      STR      r7,[sp,#0]
        0x08005146:    f7ffffa1    ....    BL       mbedtls_ecp_mul_shortcuts ; 0x800508c
        0x0800514a:    0004        ..      MOVS     r4,r0
        0x0800514c:    d10c        ..      BNE      0x8005168 ; mbedtls_ecp_muladd_restartable + 108
        0x0800514e:    462b        +F      MOV      r3,r5
        0x08005150:    4632        2F      MOV      r2,r6
        0x08005152:    4619        .F      MOV      r1,r3
        0x08005154:    4658        XF      MOV      r0,r11
        0x08005156:    f7fcffb9    ....    BL       ecp_add_mixed ; 0x80020cc
        0x0800515a:    0004        ..      MOVS     r4,r0
        0x0800515c:    d104        ..      BNE      0x8005168 ; mbedtls_ecp_muladd_restartable + 108
        0x0800515e:    4629        )F      MOV      r1,r5
        0x08005160:    4658        XF      MOV      r0,r11
        0x08005162:    f7feff7e    ..~.    BL       ecp_normalize_jac ; 0x8004062
        0x08005166:    4604        .F      MOV      r4,r0
        0x08005168:    a801        ..      ADD      r0,sp,#4
        0x0800516a:    f000f805    ....    BL       mbedtls_ecp_point_free ; 0x8005178
        0x0800516e:    4620         F      MOV      r0,r4
        0x08005170:    e7d5        ..      B        0x800511e ; mbedtls_ecp_muladd_restartable + 34
    $d
        0x08005172:    0000        ..      DCW    0
        0x08005174:    ffffb180    ....    DCD    4294947200
    $t
    i.mbedtls_ecp_point_free
    mbedtls_ecp_point_free
        0x08005178:    b510        ..      PUSH     {r4,lr}
        0x0800517a:    0004        ..      MOVS     r4,r0
        0x0800517c:    d00b        ..      BEQ      0x8005196 ; mbedtls_ecp_point_free + 30
        0x0800517e:    f001f832    ..2.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08005182:    f104000c    ....    ADD      r0,r4,#0xc
        0x08005186:    f001f82e    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x0800518a:    f1040018    ....    ADD      r0,r4,#0x18
        0x0800518e:    e8bd4010    ...@    POP      {r4,lr}
        0x08005192:    f001b828    ..(.    B.W      mbedtls_mpi_free ; 0x80061e6
        0x08005196:    bd10        ..      POP      {r4,pc}
    i.mbedtls_ecp_point_init
    mbedtls_ecp_point_init
        0x08005198:    b510        ..      PUSH     {r4,lr}
        0x0800519a:    4604        .F      MOV      r4,r0
        0x0800519c:    f001f8ec    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x080051a0:    f104000c    ....    ADD      r0,r4,#0xc
        0x080051a4:    f001f8e8    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x080051a8:    f1040018    ....    ADD      r0,r4,#0x18
        0x080051ac:    e8bd4010    ...@    POP      {r4,lr}
        0x080051b0:    f001b8e2    ....    B.W      mbedtls_mpi_init ; 0x8006378
    i.mbedtls_ecp_point_read_binary
    mbedtls_ecp_point_read_binary
        0x080051b4:    e92d5ffc    -.._    PUSH     {r2-r12,lr}
        0x080051b8:    f8df90dc    ....    LDR      r9,[pc,#220] ; [0x8005298] = 0xffffb180
        0x080051bc:    f8dfa0dc    ....    LDR      r10,[pc,#220] ; [0x800529c] = 0xffffb080
        0x080051c0:    001e        ..      MOVS     r6,r3
        0x080051c2:    4617        .F      MOV      r7,r2
        0x080051c4:    460c        .F      MOV      r4,r1
        0x080051c6:    4680        .F      MOV      r8,r0
        0x080051c8:    46cb        .F      MOV      r11,r9
        0x080051ca:    d04a        J.      BEQ      0x8005262 ; mbedtls_ecp_point_read_binary + 174
        0x080051cc:    f1080004    ....    ADD      r0,r8,#4
        0x080051d0:    f001fd3f    ..?.    BL       mbedtls_mpi_size ; 0x8006c52
        0x080051d4:    4605        .F      MOV      r5,r0
        0x080051d6:    4640        @F      MOV      r0,r8
        0x080051d8:    f7fffd5c    ..\.    BL       mbedtls_ecp_get_type ; 0x8004c94
        0x080051dc:    4601        .F      MOV      r1,r0
        0x080051de:    f104000c    ....    ADD      r0,r4,#0xc
        0x080051e2:    9001        ..      STR      r0,[sp,#4]
        0x080051e4:    300c        .0      ADDS     r0,r0,#0xc
        0x080051e6:    9000        ..      STR      r0,[sp,#0]
        0x080051e8:    2902        .)      CMP      r1,#2
        0x080051ea:    d122        ".      BNE      0x8005232 ; mbedtls_ecp_point_read_binary + 126
        0x080051ec:    42b5        .B      CMP      r5,r6
        0x080051ee:    d138        8.      BNE      0x8005262 ; mbedtls_ecp_point_read_binary + 174
        0x080051f0:    462a        *F      MOV      r2,r5
        0x080051f2:    4639        9F      MOV      r1,r7
        0x080051f4:    4620         F      MOV      r0,r4
        0x080051f6:    f001fafd    ....    BL       mbedtls_mpi_read_binary_le ; 0x80067f4
        0x080051fa:    ea5f0b00    _...    MOVS     r11,r0
        0x080051fe:    d148        H.      BNE      0x8005292 ; mbedtls_ecp_point_read_binary + 222
        0x08005200:    9801        ..      LDR      r0,[sp,#4]
        0x08005202:    f000fff0    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08005206:    f8980000    ....    LDRB     r0,[r8,#0]
        0x0800520a:    2809        .(      CMP      r0,#9
        0x0800520c:    d10a        ..      BNE      0x8005224 ; mbedtls_ecp_point_read_binary + 112
        0x0800520e:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x08005212:    eb0001c5    ....    ADD      r1,r0,r5,LSL #3
        0x08005216:    2200        ."      MOVS     r2,#0
        0x08005218:    4620         F      MOV      r0,r4
        0x0800521a:    f001fc28    ..(.    BL       mbedtls_mpi_set_bit ; 0x8006a6e
        0x0800521e:    ea5f0b00    _...    MOVS     r11,r0
        0x08005222:    d136        6.      BNE      0x8005292 ; mbedtls_ecp_point_read_binary + 222
        0x08005224:    2101        .!      MOVS     r1,#1
        0x08005226:    9800        ..      LDR      r0,[sp,#0]
        0x08005228:    f001f9f8    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x0800522c:    ea5f0b00    _...    MOVS     r11,r0
        0x08005230:    d12f        /.      BNE      0x8005292 ; mbedtls_ecp_point_read_binary + 222
        0x08005232:    4640        @F      MOV      r0,r8
        0x08005234:    f7fffd2e    ....    BL       mbedtls_ecp_get_type ; 0x8004c94
        0x08005238:    2801        .(      CMP      r0,#1
        0x0800523a:    d12a        *.      BNE      0x8005292 ; mbedtls_ecp_point_read_binary + 222
        0x0800523c:    7838        8x      LDRB     r0,[r7,#0]
        0x0800523e:    b120         .      CBZ      r0,0x800524a ; mbedtls_ecp_point_read_binary + 150
        0x08005240:    2804        .(      CMP      r0,#4
        0x08005242:    d009        ..      BEQ      0x8005258 ; mbedtls_ecp_point_read_binary + 164
        0x08005244:    4648        HF      MOV      r0,r9
        0x08005246:    e8bd9ffc    ....    POP      {r2-r12,pc}
        0x0800524a:    2e01        ..      CMP      r6,#1
        0x0800524c:    d109        ..      BNE      0x8005262 ; mbedtls_ecp_point_read_binary + 174
        0x0800524e:    4620         F      MOV      r0,r4
        0x08005250:    e8bd5ffc    ..._    POP      {r2-r12,lr}
        0x08005254:    f000b824    ..$.    B.W      mbedtls_ecp_set_zero ; 0x80052a0
        0x08005258:    2001        .       MOVS     r0,#1
        0x0800525a:    eb000045    ..E.    ADD      r0,r0,r5,LSL #1
        0x0800525e:    42b0        .B      CMP      r0,r6
        0x08005260:    d001        ..      BEQ      0x8005266 ; mbedtls_ecp_point_read_binary + 178
        0x08005262:    4650        PF      MOV      r0,r10
        0x08005264:    e7ef        ..      B        0x8005246 ; mbedtls_ecp_point_read_binary + 146
        0x08005266:    462a        *F      MOV      r2,r5
        0x08005268:    1c79        y.      ADDS     r1,r7,#1
        0x0800526a:    4620         F      MOV      r0,r4
        0x0800526c:    f001fa91    ....    BL       mbedtls_mpi_read_binary ; 0x8006792
        0x08005270:    ea5f0b00    _...    MOVS     r11,r0
        0x08005274:    d10d        ..      BNE      0x8005292 ; mbedtls_ecp_point_read_binary + 222
        0x08005276:    1979        y.      ADDS     r1,r7,r5
        0x08005278:    462a        *F      MOV      r2,r5
        0x0800527a:    1c49        I.      ADDS     r1,r1,#1
        0x0800527c:    9801        ..      LDR      r0,[sp,#4]
        0x0800527e:    f001fa88    ....    BL       mbedtls_mpi_read_binary ; 0x8006792
        0x08005282:    ea5f0b00    _...    MOVS     r11,r0
        0x08005286:    d104        ..      BNE      0x8005292 ; mbedtls_ecp_point_read_binary + 222
        0x08005288:    2101        .!      MOVS     r1,#1
        0x0800528a:    9800        ..      LDR      r0,[sp,#0]
        0x0800528c:    f001f9c6    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x08005290:    4683        .F      MOV      r11,r0
        0x08005292:    4658        XF      MOV      r0,r11
        0x08005294:    e7d7        ..      B        0x8005246 ; mbedtls_ecp_point_read_binary + 146
    $d
        0x08005296:    0000        ..      DCW    0
        0x08005298:    ffffb180    ....    DCD    4294947200
        0x0800529c:    ffffb080    ....    DCD    4294946944
    $t
    i.mbedtls_ecp_set_zero
    mbedtls_ecp_set_zero
        0x080052a0:    b510        ..      PUSH     {r4,lr}
        0x080052a2:    4604        .F      MOV      r4,r0
        0x080052a4:    2101        .!      MOVS     r1,#1
        0x080052a6:    f001f9b9    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x080052aa:    2800        .(      CMP      r0,#0
        0x080052ac:    d10d        ..      BNE      0x80052ca ; mbedtls_ecp_set_zero + 42
        0x080052ae:    2101        .!      MOVS     r1,#1
        0x080052b0:    f104000c    ....    ADD      r0,r4,#0xc
        0x080052b4:    f001f9b2    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x080052b8:    2800        .(      CMP      r0,#0
        0x080052ba:    d106        ..      BNE      0x80052ca ; mbedtls_ecp_set_zero + 42
        0x080052bc:    f1040018    ....    ADD      r0,r4,#0x18
        0x080052c0:    e8bd4010    ...@    POP      {r4,lr}
        0x080052c4:    2100        .!      MOVS     r1,#0
        0x080052c6:    f001b9a9    ....    B.W      mbedtls_mpi_lset ; 0x800661c
        0x080052ca:    bd10        ..      POP      {r4,pc}
    i.mbedtls_ecp_tls_read_group
    mbedtls_ecp_tls_read_group
        0x080052cc:    b538        8.      PUSH     {r3-r5,lr}
        0x080052ce:    4604        .F      MOV      r4,r0
        0x080052d0:    4668        hF      MOV      r0,sp
        0x080052d2:    f000f809    ....    BL       mbedtls_ecp_tls_read_group_id ; 0x80052e8
        0x080052d6:    2800        .(      CMP      r0,#0
        0x080052d8:    d104        ..      BNE      0x80052e4 ; mbedtls_ecp_tls_read_group + 24
        0x080052da:    f89d1000    ....    LDRB     r1,[sp,#0]
        0x080052de:    4620         F      MOV      r0,r4
        0x080052e0:    f7fffd36    ..6.    BL       mbedtls_ecp_group_load ; 0x8004d50
        0x080052e4:    bd38        8.      POP      {r3-r5,pc}
        0x080052e6:    0000        ..      MOVS     r0,r0
    i.mbedtls_ecp_tls_read_group_id
    mbedtls_ecp_tls_read_group_id
        0x080052e8:    b530        0.      PUSH     {r4,r5,lr}
        0x080052ea:    4d10        .M      LDR      r5,[pc,#64] ; [0x800532c] = 0xffffb080
        0x080052ec:    4604        .F      MOV      r4,r0
        0x080052ee:    2a03        .*      CMP      r2,#3
        0x080052f0:    d305        ..      BCC      0x80052fe ; mbedtls_ecp_tls_read_group_id + 22
        0x080052f2:    6808        .h      LDR      r0,[r1,#0]
        0x080052f4:    1c43        C.      ADDS     r3,r0,#1
        0x080052f6:    600b        .`      STR      r3,[r1,#0]
        0x080052f8:    7800        .x      LDRB     r0,[r0,#0]
        0x080052fa:    2803        .(      CMP      r0,#3
        0x080052fc:    d001        ..      BEQ      0x8005302 ; mbedtls_ecp_tls_read_group_id + 26
        0x080052fe:    4628        (F      MOV      r0,r5
        0x08005300:    bd30        0.      POP      {r4,r5,pc}
        0x08005302:    1c5a        Z.      ADDS     r2,r3,#1
        0x08005304:    600a        .`      STR      r2,[r1,#0]
        0x08005306:    7818        .x      LDRB     r0,[r3,#0]
        0x08005308:    f64f73ff    O..s    MOV      r3,#0xffff
        0x0800530c:    ea032000    ...     AND      r0,r3,r0,LSL #8
        0x08005310:    1c53        S.      ADDS     r3,r2,#1
        0x08005312:    600b        .`      STR      r3,[r1,#0]
        0x08005314:    7811        .x      LDRB     r1,[r2,#0]
        0x08005316:    4308        .C      ORRS     r0,r0,r1
        0x08005318:    f7fffcae    ....    BL       mbedtls_ecp_curve_info_from_tls_id ; 0x8004c78
        0x0800531c:    b118        ..      CBZ      r0,0x8005326 ; mbedtls_ecp_tls_read_group_id + 62
        0x0800531e:    7800        .x      LDRB     r0,[r0,#0]
        0x08005320:    7020         p      STRB     r0,[r4,#0]
        0x08005322:    2000        .       MOVS     r0,#0
        0x08005324:    bd30        0.      POP      {r4,r5,pc}
        0x08005326:    4802        .H      LDR      r0,[pc,#8] ; [0x8005330] = 0xffffb180
        0x08005328:    bd30        0.      POP      {r4,r5,pc}
    $d
        0x0800532a:    0000        ..      DCW    0
        0x0800532c:    ffffb080    ....    DCD    4294946944
        0x08005330:    ffffb180    ....    DCD    4294947200
    $t
    i.mbedtls_internal_sha256_process
    mbedtls_internal_sha256_process
        0x08005334:    e92d4ff0    -..O    PUSH     {r4-r11,lr}
        0x08005338:    4686        .F      MOV      lr,r0
        0x0800533a:    b0c8        ..      SUB      sp,sp,#0x120
        0x0800533c:    f05f0000    _...    MOVS.W   r0,#0
        0x08005340:    eb0e0380    ....    ADD      r3,lr,r0,LSL #2
        0x08005344:    689b        .h      LDR      r3,[r3,#8]
        0x08005346:    f84d3020    M. 0    STR      r3,[sp,r0,LSL #2]
        0x0800534a:    1c40        @.      ADDS     r0,r0,#1
        0x0800534c:    2808        .(      CMP      r0,#8
        0x0800534e:    d3f7        ..      BCC      0x8005340 ; mbedtls_internal_sha256_process + 12
        0x08005350:    2000        .       MOVS     r0,#0
        0x08005352:    ac08        ..      ADD      r4,sp,#0x20
        0x08005354:    eb010280    ....    ADD      r2,r1,r0,LSL #2
        0x08005358:    6813        .h      LDR      r3,[r2,#0]
        0x0800535a:    78d2        .x      LDRB     r2,[r2,#3]
        0x0800535c:    ba1b        ..      REV      r3,r3
        0x0800535e:    f02303ff    #...    BIC      r3,r3,#0xff
        0x08005362:    4313        .C      ORRS     r3,r3,r2
        0x08005364:    f8443020    D. 0    STR      r3,[r4,r0,LSL #2]
        0x08005368:    1c40        @.      ADDS     r0,r0,#1
        0x0800536a:    2810        .(      CMP      r0,#0x10
        0x0800536c:    d3f2        ..      BCC      0x8005354 ; mbedtls_internal_sha256_process + 32
        0x0800536e:    4bff        .K      LDR      r3,[pc,#1020] ; [0x800576c] = 0x8007ec4
        0x08005370:    2000        .       MOVS     r0,#0
        0x08005372:    9904        ..      LDR      r1,[sp,#0x10]
        0x08005374:    9a04        ..      LDR      r2,[sp,#0x10]
        0x08005376:    ea4f11b1    O...    ROR      r1,r1,#6
        0x0800537a:    ea8121f2    ...!    EOR      r1,r1,r2,ROR #11
        0x0800537e:    ea816272    ..rb    EOR      r2,r1,r2,ROR #25
        0x08005382:    e9dd1505    ....    LDRD     r1,r5,[sp,#0x14]
        0x08005386:    4069        i@      EORS     r1,r1,r5
        0x08005388:    9d04        ..      LDR      r5,[sp,#0x10]
        0x0800538a:    9f00        ..      LDR      r7,[sp,#0]
        0x0800538c:    4029        )@      ANDS     r1,r1,r5
        0x0800538e:    9d06        ..      LDR      r5,[sp,#0x18]
        0x08005390:    f8ddc000    ....    LDR      r12,[sp,#0]
        0x08005394:    4069        i@      EORS     r1,r1,r5
        0x08005396:    440a        .D      ADD      r2,r2,r1
        0x08005398:    f8535020    S. P    LDR      r5,[r3,r0,LSL #2]
        0x0800539c:    9907        ..      LDR      r1,[sp,#0x1c]
        0x0800539e:    4429        )D      ADD      r1,r1,r5
        0x080053a0:    4411        .D      ADD      r1,r1,r2
        0x080053a2:    f8542020    T.      LDR      r2,[r4,r0,LSL #2]
        0x080053a6:    4411        .D      ADD      r1,r1,r2
        0x080053a8:    e9dd2500    ...%    LDRD     r2,r5,[sp,#0]
        0x080053ac:    402a        *@      ANDS     r2,r2,r5
        0x080053ae:    e9dd5600    ...V    LDRD     r5,r6,[sp,#0]
        0x080053b2:    4335        5C      ORRS     r5,r5,r6
        0x080053b4:    9e02        ..      LDR      r6,[sp,#8]
        0x080053b6:    4035        5@      ANDS     r5,r5,r6
        0x080053b8:    432a        *C      ORRS     r2,r2,r5
        0x080053ba:    9d00        ..      LDR      r5,[sp,#0]
        0x080053bc:    9e00        ..      LDR      r6,[sp,#0]
        0x080053be:    ea4f05b5    O...    ROR      r5,r5,#2
        0x080053c2:    ea853576    ..v5    EOR      r5,r5,r6,ROR #13
        0x080053c6:    ea8555b6    ...U    EOR      r5,r5,r6,ROR #22
        0x080053ca:    442a        *D      ADD      r2,r2,r5
        0x080053cc:    9d03        ..      LDR      r5,[sp,#0xc]
        0x080053ce:    440d        .D      ADD      r5,r5,r1
        0x080053d0:    4411        .D      ADD      r1,r1,r2
        0x080053d2:    9107        ..      STR      r1,[sp,#0x1c]
        0x080053d4:    ea4f11b5    O...    ROR      r1,r5,#6
        0x080053d8:    ea8121f5    ...!    EOR      r1,r1,r5,ROR #11
        0x080053dc:    9503        ..      STR      r5,[sp,#0xc]
        0x080053de:    ea816275    ..ub    EOR      r2,r1,r5,ROR #25
        0x080053e2:    e9dd1504    ....    LDRD     r1,r5,[sp,#0x10]
        0x080053e6:    4069        i@      EORS     r1,r1,r5
        0x080053e8:    9d03        ..      LDR      r5,[sp,#0xc]
        0x080053ea:    4029        )@      ANDS     r1,r1,r5
        0x080053ec:    9d05        ..      LDR      r5,[sp,#0x14]
        0x080053ee:    4069        i@      EORS     r1,r1,r5
        0x080053f0:    4411        .D      ADD      r1,r1,r2
        0x080053f2:    eb030280    ....    ADD      r2,r3,r0,LSL #2
        0x080053f6:    9d06        ..      LDR      r5,[sp,#0x18]
        0x080053f8:    6856        Vh      LDR      r6,[r2,#4]
        0x080053fa:    4435        5D      ADD      r5,r5,r6
        0x080053fc:    440d        .D      ADD      r5,r5,r1
        0x080053fe:    eb040180    ....    ADD      r1,r4,r0,LSL #2
        0x08005402:    684e        Nh      LDR      r6,[r1,#4]
        0x08005404:    4435        5D      ADD      r5,r5,r6
        0x08005406:    9e07        ..      LDR      r6,[sp,#0x1c]
        0x08005408:    403e        >@      ANDS     r6,r6,r7
        0x0800540a:    9f07        ..      LDR      r7,[sp,#0x1c]
        0x0800540c:    ea47070c    G...    ORR      r7,r7,r12
        0x08005410:    f8ddc004    ....    LDR      r12,[sp,#4]
        0x08005414:    ea07070c    ....    AND      r7,r7,r12
        0x08005418:    433e        >C      ORRS     r6,r6,r7
        0x0800541a:    9f07        ..      LDR      r7,[sp,#0x1c]
        0x0800541c:    f8ddc01c    ....    LDR      r12,[sp,#0x1c]
        0x08005420:    ea4f07b7    O...    ROR      r7,r7,#2
        0x08005424:    ea87377c    ..|7    EOR      r7,r7,r12,ROR #13
        0x08005428:    ea8757bc    ...W    EOR      r7,r7,r12,ROR #22
        0x0800542c:    443e        >D      ADD      r6,r6,r7
        0x0800542e:    9f02        ..      LDR      r7,[sp,#8]
        0x08005430:    442f        /D      ADD      r7,r7,r5
        0x08005432:    4435        5D      ADD      r5,r5,r6
        0x08005434:    9506        ..      STR      r5,[sp,#0x18]
        0x08005436:    9702        ..      STR      r7,[sp,#8]
        0x08005438:    ea4f15b7    O...    ROR      r5,r7,#6
        0x0800543c:    ea8525f7    ...%    EOR      r5,r5,r7,ROR #11
        0x08005440:    ea856677    ..wf    EOR      r6,r5,r7,ROR #25
        0x08005444:    e9dd5703    ...W    LDRD     r5,r7,[sp,#0xc]
        0x08005448:    407d        }@      EORS     r5,r5,r7
        0x0800544a:    9f02        ..      LDR      r7,[sp,#8]
        0x0800544c:    403d        =@      ANDS     r5,r5,r7
        0x0800544e:    9f04        ..      LDR      r7,[sp,#0x10]
        0x08005450:    407d        }@      EORS     r5,r5,r7
        0x08005452:    4435        5D      ADD      r5,r5,r6
        0x08005454:    9e05        ..      LDR      r6,[sp,#0x14]
        0x08005456:    6897        .h      LDR      r7,[r2,#8]
        0x08005458:    443e        >D      ADD      r6,r6,r7
        0x0800545a:    4435        5D      ADD      r5,r5,r6
        0x0800545c:    688e        .h      LDR      r6,[r1,#8]
        0x0800545e:    9f06        ..      LDR      r7,[sp,#0x18]
        0x08005460:    4435        5D      ADD      r5,r5,r6
        0x08005462:    9e06        ..      LDR      r6,[sp,#0x18]
        0x08005464:    ea47070c    G...    ORR      r7,r7,r12
        0x08005468:    ea06060c    ....    AND      r6,r6,r12
        0x0800546c:    f8ddc000    ....    LDR      r12,[sp,#0]
        0x08005470:    ea07070c    ....    AND      r7,r7,r12
        0x08005474:    433e        >C      ORRS     r6,r6,r7
        0x08005476:    9f06        ..      LDR      r7,[sp,#0x18]
        0x08005478:    f8ddc018    ....    LDR      r12,[sp,#0x18]
        0x0800547c:    ea4f07b7    O...    ROR      r7,r7,#2
        0x08005480:    ea87377c    ..|7    EOR      r7,r7,r12,ROR #13
        0x08005484:    ea8757bc    ...W    EOR      r7,r7,r12,ROR #22
        0x08005488:    443e        >D      ADD      r6,r6,r7
        0x0800548a:    9f01        ..      LDR      r7,[sp,#4]
        0x0800548c:    442f        /D      ADD      r7,r7,r5
        0x0800548e:    4435        5D      ADD      r5,r5,r6
        0x08005490:    9505        ..      STR      r5,[sp,#0x14]
        0x08005492:    ea4f15b7    O...    ROR      r5,r7,#6
        0x08005496:    ea8525f7    ...%    EOR      r5,r5,r7,ROR #11
        0x0800549a:    9701        ..      STR      r7,[sp,#4]
        0x0800549c:    ea856677    ..wf    EOR      r6,r5,r7,ROR #25
        0x080054a0:    e9dd5702    ...W    LDRD     r5,r7,[sp,#8]
        0x080054a4:    407d        }@      EORS     r5,r5,r7
        0x080054a6:    9f01        ..      LDR      r7,[sp,#4]
        0x080054a8:    403d        =@      ANDS     r5,r5,r7
        0x080054aa:    9f03        ..      LDR      r7,[sp,#0xc]
        0x080054ac:    407d        }@      EORS     r5,r5,r7
        0x080054ae:    4435        5D      ADD      r5,r5,r6
        0x080054b0:    9e04        ..      LDR      r6,[sp,#0x10]
        0x080054b2:    68d7        .h      LDR      r7,[r2,#0xc]
        0x080054b4:    443e        >D      ADD      r6,r6,r7
        0x080054b6:    4435        5D      ADD      r5,r5,r6
        0x080054b8:    68ce        .h      LDR      r6,[r1,#0xc]
        0x080054ba:    9f05        ..      LDR      r7,[sp,#0x14]
        0x080054bc:    4435        5D      ADD      r5,r5,r6
        0x080054be:    9e05        ..      LDR      r6,[sp,#0x14]
        0x080054c0:    ea47070c    G...    ORR      r7,r7,r12
        0x080054c4:    ea06060c    ....    AND      r6,r6,r12
        0x080054c8:    f8ddc01c    ....    LDR      r12,[sp,#0x1c]
        0x080054cc:    ea07070c    ....    AND      r7,r7,r12
        0x080054d0:    433e        >C      ORRS     r6,r6,r7
        0x080054d2:    9f05        ..      LDR      r7,[sp,#0x14]
        0x080054d4:    f8ddc014    ....    LDR      r12,[sp,#0x14]
        0x080054d8:    ea4f07b7    O...    ROR      r7,r7,#2
        0x080054dc:    ea87377c    ..|7    EOR      r7,r7,r12,ROR #13
        0x080054e0:    ea8757bc    ...W    EOR      r7,r7,r12,ROR #22
        0x080054e4:    443e        >D      ADD      r6,r6,r7
        0x080054e6:    9f00        ..      LDR      r7,[sp,#0]
        0x080054e8:    442f        /D      ADD      r7,r7,r5
        0x080054ea:    4435        5D      ADD      r5,r5,r6
        0x080054ec:    9504        ..      STR      r5,[sp,#0x10]
        0x080054ee:    ea4f15b7    O...    ROR      r5,r7,#6
        0x080054f2:    ea8525f7    ...%    EOR      r5,r5,r7,ROR #11
        0x080054f6:    9700        ..      STR      r7,[sp,#0]
        0x080054f8:    ea856677    ..wf    EOR      r6,r5,r7,ROR #25
        0x080054fc:    e9dd5701    ...W    LDRD     r5,r7,[sp,#4]
        0x08005500:    407d        }@      EORS     r5,r5,r7
        0x08005502:    9f00        ..      LDR      r7,[sp,#0]
        0x08005504:    403d        =@      ANDS     r5,r5,r7
        0x08005506:    9f02        ..      LDR      r7,[sp,#8]
        0x08005508:    407d        }@      EORS     r5,r5,r7
        0x0800550a:    4435        5D      ADD      r5,r5,r6
        0x0800550c:    9e03        ..      LDR      r6,[sp,#0xc]
        0x0800550e:    6917        .i      LDR      r7,[r2,#0x10]
        0x08005510:    443e        >D      ADD      r6,r6,r7
        0x08005512:    4435        5D      ADD      r5,r5,r6
        0x08005514:    690e        .i      LDR      r6,[r1,#0x10]
        0x08005516:    9f04        ..      LDR      r7,[sp,#0x10]
        0x08005518:    4435        5D      ADD      r5,r5,r6
        0x0800551a:    9e04        ..      LDR      r6,[sp,#0x10]
        0x0800551c:    ea47070c    G...    ORR      r7,r7,r12
        0x08005520:    ea06060c    ....    AND      r6,r6,r12
        0x08005524:    f8ddc018    ....    LDR      r12,[sp,#0x18]
        0x08005528:    ea07070c    ....    AND      r7,r7,r12
        0x0800552c:    433e        >C      ORRS     r6,r6,r7
        0x0800552e:    9f04        ..      LDR      r7,[sp,#0x10]
        0x08005530:    f8ddc010    ....    LDR      r12,[sp,#0x10]
        0x08005534:    ea4f07b7    O...    ROR      r7,r7,#2
        0x08005538:    ea87377c    ..|7    EOR      r7,r7,r12,ROR #13
        0x0800553c:    ea8757bc    ...W    EOR      r7,r7,r12,ROR #22
        0x08005540:    443e        >D      ADD      r6,r6,r7
        0x08005542:    9f07        ..      LDR      r7,[sp,#0x1c]
        0x08005544:    442f        /D      ADD      r7,r7,r5
        0x08005546:    4435        5D      ADD      r5,r5,r6
        0x08005548:    9503        ..      STR      r5,[sp,#0xc]
        0x0800554a:    ea4f15b7    O...    ROR      r5,r7,#6
        0x0800554e:    ea8525f7    ...%    EOR      r5,r5,r7,ROR #11
        0x08005552:    9707        ..      STR      r7,[sp,#0x1c]
        0x08005554:    ea856677    ..wf    EOR      r6,r5,r7,ROR #25
        0x08005558:    e9dd5700    ...W    LDRD     r5,r7,[sp,#0]
        0x0800555c:    407d        }@      EORS     r5,r5,r7
        0x0800555e:    9f07        ..      LDR      r7,[sp,#0x1c]
        0x08005560:    403d        =@      ANDS     r5,r5,r7
        0x08005562:    9f01        ..      LDR      r7,[sp,#4]
        0x08005564:    407d        }@      EORS     r5,r5,r7
        0x08005566:    4435        5D      ADD      r5,r5,r6
        0x08005568:    9e02        ..      LDR      r6,[sp,#8]
        0x0800556a:    6957        Wi      LDR      r7,[r2,#0x14]
        0x0800556c:    443e        >D      ADD      r6,r6,r7
        0x0800556e:    4435        5D      ADD      r5,r5,r6
        0x08005570:    694e        Ni      LDR      r6,[r1,#0x14]
        0x08005572:    9f03        ..      LDR      r7,[sp,#0xc]
        0x08005574:    4435        5D      ADD      r5,r5,r6
        0x08005576:    9e03        ..      LDR      r6,[sp,#0xc]
        0x08005578:    ea47070c    G...    ORR      r7,r7,r12
        0x0800557c:    ea06060c    ....    AND      r6,r6,r12
        0x08005580:    f8ddc014    ....    LDR      r12,[sp,#0x14]
        0x08005584:    ea07070c    ....    AND      r7,r7,r12
        0x08005588:    433e        >C      ORRS     r6,r6,r7
        0x0800558a:    9f03        ..      LDR      r7,[sp,#0xc]
        0x0800558c:    f8ddc00c    ....    LDR      r12,[sp,#0xc]
        0x08005590:    ea4f07b7    O...    ROR      r7,r7,#2
        0x08005594:    ea87377c    ..|7    EOR      r7,r7,r12,ROR #13
        0x08005598:    ea8757bc    ...W    EOR      r7,r7,r12,ROR #22
        0x0800559c:    443e        >D      ADD      r6,r6,r7
        0x0800559e:    9f06        ..      LDR      r7,[sp,#0x18]
        0x080055a0:    442f        /D      ADD      r7,r7,r5
        0x080055a2:    4435        5D      ADD      r5,r5,r6
        0x080055a4:    9502        ..      STR      r5,[sp,#8]
        0x080055a6:    ea4f15b7    O...    ROR      r5,r7,#6
        0x080055aa:    ea8525f7    ...%    EOR      r5,r5,r7,ROR #11
        0x080055ae:    ea856677    ..wf    EOR      r6,r5,r7,ROR #25
        0x080055b2:    9706        ..      STR      r7,[sp,#0x18]
        0x080055b4:    9f00        ..      LDR      r7,[sp,#0]
        0x080055b6:    9d07        ..      LDR      r5,[sp,#0x1c]
        0x080055b8:    407d        }@      EORS     r5,r5,r7
        0x080055ba:    9f06        ..      LDR      r7,[sp,#0x18]
        0x080055bc:    403d        =@      ANDS     r5,r5,r7
        0x080055be:    9f00        ..      LDR      r7,[sp,#0]
        0x080055c0:    407d        }@      EORS     r5,r5,r7
        0x080055c2:    4435        5D      ADD      r5,r5,r6
        0x080055c4:    9e01        ..      LDR      r6,[sp,#4]
        0x080055c6:    6997        .i      LDR      r7,[r2,#0x18]
        0x080055c8:    443e        >D      ADD      r6,r6,r7
        0x080055ca:    4435        5D      ADD      r5,r5,r6
        0x080055cc:    698e        .i      LDR      r6,[r1,#0x18]
        0x080055ce:    9f02        ..      LDR      r7,[sp,#8]
        0x080055d0:    4435        5D      ADD      r5,r5,r6
        0x080055d2:    9e02        ..      LDR      r6,[sp,#8]
        0x080055d4:    ea47070c    G...    ORR      r7,r7,r12
        0x080055d8:    ea06060c    ....    AND      r6,r6,r12
        0x080055dc:    f8ddc010    ....    LDR      r12,[sp,#0x10]
        0x080055e0:    3008        .0      ADDS     r0,r0,#8
        0x080055e2:    ea07070c    ....    AND      r7,r7,r12
        0x080055e6:    433e        >C      ORRS     r6,r6,r7
        0x080055e8:    9f02        ..      LDR      r7,[sp,#8]
        0x080055ea:    f8ddc008    ....    LDR      r12,[sp,#8]
        0x080055ee:    ea4f07b7    O...    ROR      r7,r7,#2
        0x080055f2:    ea87377c    ..|7    EOR      r7,r7,r12,ROR #13
        0x080055f6:    ea8757bc    ...W    EOR      r7,r7,r12,ROR #22
        0x080055fa:    443e        >D      ADD      r6,r6,r7
        0x080055fc:    9f05        ..      LDR      r7,[sp,#0x14]
        0x080055fe:    442f        /D      ADD      r7,r7,r5
        0x08005600:    4435        5D      ADD      r5,r5,r6
        0x08005602:    9501        ..      STR      r5,[sp,#4]
        0x08005604:    ea4f15b7    O...    ROR      r5,r7,#6
        0x08005608:    ea8525f7    ...%    EOR      r5,r5,r7,ROR #11
        0x0800560c:    9705        ..      STR      r7,[sp,#0x14]
        0x0800560e:    ea856677    ..wf    EOR      r6,r5,r7,ROR #25
        0x08005612:    e9dd5706    ...W    LDRD     r5,r7,[sp,#0x18]
        0x08005616:    407d        }@      EORS     r5,r5,r7
        0x08005618:    9f05        ..      LDR      r7,[sp,#0x14]
        0x0800561a:    69d2        .i      LDR      r2,[r2,#0x1c]
        0x0800561c:    403d        =@      ANDS     r5,r5,r7
        0x0800561e:    9f07        ..      LDR      r7,[sp,#0x1c]
        0x08005620:    69c9        .i      LDR      r1,[r1,#0x1c]
        0x08005622:    407d        }@      EORS     r5,r5,r7
        0x08005624:    4435        5D      ADD      r5,r5,r6
        0x08005626:    9e00        ..      LDR      r6,[sp,#0]
        0x08005628:    4432        2D      ADD      r2,r2,r6
        0x0800562a:    442a        *D      ADD      r2,r2,r5
        0x0800562c:    4411        .D      ADD      r1,r1,r2
        0x0800562e:    9a01        ..      LDR      r2,[sp,#4]
        0x08005630:    9d01        ..      LDR      r5,[sp,#4]
        0x08005632:    9e03        ..      LDR      r6,[sp,#0xc]
        0x08005634:    ea42020c    B...    ORR      r2,r2,r12
        0x08005638:    ea05050c    ....    AND      r5,r5,r12
        0x0800563c:    4032        2@      ANDS     r2,r2,r6
        0x0800563e:    4315        .C      ORRS     r5,r5,r2
        0x08005640:    9a01        ..      LDR      r2,[sp,#4]
        0x08005642:    9e01        ..      LDR      r6,[sp,#4]
        0x08005644:    ea4f02b2    O...    ROR      r2,r2,#2
        0x08005648:    ea823276    ..v2    EOR      r2,r2,r6,ROR #13
        0x0800564c:    ea8252b6    ...R    EOR      r2,r2,r6,ROR #22
        0x08005650:    442a        *D      ADD      r2,r2,r5
        0x08005652:    9d04        ..      LDR      r5,[sp,#0x10]
        0x08005654:    2810        .(      CMP      r0,#0x10
        0x08005656:    440d        .D      ADD      r5,r5,r1
        0x08005658:    4411        .D      ADD      r1,r1,r2
        0x0800565a:    9504        ..      STR      r5,[sp,#0x10]
        0x0800565c:    9100        ..      STR      r1,[sp,#0]
        0x0800565e:    f4ffae88    ....    BCC      0x8005372 ; mbedtls_internal_sha256_process + 62
        0x08005662:    2110        .!      MOVS     r1,#0x10
        0x08005664:    9804        ..      LDR      r0,[sp,#0x10]
        0x08005666:    9a04        ..      LDR      r2,[sp,#0x10]
        0x08005668:    ea4f10b0    O...    ROR      r0,r0,#6
        0x0800566c:    ea8020f2    ...     EOR      r0,r0,r2,ROR #11
        0x08005670:    ea806272    ..rb    EOR      r2,r0,r2,ROR #25
        0x08005674:    e9dd0305    ....    LDRD     r0,r3,[sp,#0x14]
        0x08005678:    4058        X@      EORS     r0,r0,r3
        0x0800567a:    9b04        ..      LDR      r3,[sp,#0x10]
        0x0800567c:    ae08        ..      ADD      r6,sp,#0x20
        0x0800567e:    4018        .@      ANDS     r0,r0,r3
        0x08005680:    9b06        ..      LDR      r3,[sp,#0x18]
        0x08005682:    4058        X@      EORS     r0,r0,r3
        0x08005684:    1813        ..      ADDS     r3,r2,r0
        0x08005686:    4a39        9J      LDR      r2,[pc,#228] ; [0x800576c] = 0x8007ec4
        0x08005688:    9807        ..      LDR      r0,[sp,#0x1c]
        0x0800568a:    f8524021    R.!@    LDR      r4,[r2,r1,LSL #2]
        0x0800568e:    eb020281    ....    ADD      r2,r2,r1,LSL #2
        0x08005692:    4420         D      ADD      r0,r0,r4
        0x08005694:    181c        ..      ADDS     r4,r3,r0
        0x08005696:    eb060081    ....    ADD      r0,r6,r1,LSL #2
        0x0800569a:    f850cc08    P...    LDR      r12,[r0,#-8]
        0x0800569e:    f8505c3c    P.<\    LDR      r5,[r0,#-0x3c]
        0x080056a2:    ea4f437c    O.|C    ROR      r3,r12,#17
        0x080056a6:    ea4f17f5    O...    ROR      r7,r5,#7
        0x080056aa:    ea8343fc    ...C    EOR      r3,r3,r12,ROR #19
        0x080056ae:    ea8747b5    ...G    EOR      r7,r7,r5,ROR #18
        0x080056b2:    ea83239c    ...#    EOR      r3,r3,r12,LSR #10
        0x080056b6:    ea8707d5    ....    EOR      r7,r7,r5,LSR #3
        0x080056ba:    443b        ;D      ADD      r3,r3,r7
        0x080056bc:    46e1        .F      MOV      r9,r12
        0x080056be:    f8507c1c    P..|    LDR      r7,[r0,#-0x1c]
        0x080056c2:    f850cd40    P.@.    LDR      r12,[r0,#-0x40]!
        0x080056c6:    4467        gD      ADD      r7,r7,r12
        0x080056c8:    443b        ;D      ADD      r3,r3,r7
        0x080056ca:    f8463021    F.!0    STR      r3,[r6,r1,LSL #2]
        0x080056ce:    e9dd6700    ...g    LDRD     r6,r7,[sp,#0]
        0x080056d2:    403e        >@      ANDS     r6,r6,r7
        0x080056d4:    e9dd7c00    ...|    LDRD     r7,r12,[sp,#0]
        0x080056d8:    ea47070c    G...    ORR      r7,r7,r12
        0x080056dc:    f8ddc008    ....    LDR      r12,[sp,#8]
        0x080056e0:    441c        .D      ADD      r4,r4,r3
        0x080056e2:    ea07070c    ....    AND      r7,r7,r12
        0x080056e6:    433e        >C      ORRS     r6,r6,r7
        0x080056e8:    9f00        ..      LDR      r7,[sp,#0]
        0x080056ea:    f8ddc000    ....    LDR      r12,[sp,#0]
        0x080056ee:    ea4f07b7    O...    ROR      r7,r7,#2
        0x080056f2:    ea87377c    ..|7    EOR      r7,r7,r12,ROR #13
        0x080056f6:    ea8757bc    ...W    EOR      r7,r7,r12,ROR #22
        0x080056fa:    443e        >D      ADD      r6,r6,r7
        0x080056fc:    9f03        ..      LDR      r7,[sp,#0xc]
        0x080056fe:    4427        'D      ADD      r7,r7,r4
        0x08005700:    4434        4D      ADD      r4,r4,r6
        0x08005702:    9407        ..      STR      r4,[sp,#0x1c]
        0x08005704:    ea4f14b7    O...    ROR      r4,r7,#6
        0x08005708:    ea8424f7    ...$    EOR      r4,r4,r7,ROR #11
        0x0800570c:    9703        ..      STR      r7,[sp,#0xc]
        0x0800570e:    ea846677    ..wf    EOR      r6,r4,r7,ROR #25
        0x08005712:    e9dd4704    ...G    LDRD     r4,r7,[sp,#0x10]
        0x08005716:    407c        |@      EORS     r4,r4,r7
        0x08005718:    9f03        ..      LDR      r7,[sp,#0xc]
        0x0800571a:    f8d0c03c    ..<.    LDR      r12,[r0,#0x3c]
        0x0800571e:    403c        <@      ANDS     r4,r4,r7
        0x08005720:    9f05        ..      LDR      r7,[sp,#0x14]
        0x08005722:    46e2        .F      MOV      r10,r12
        0x08005724:    407c        |@      EORS     r4,r4,r7
        0x08005726:    4434        4D      ADD      r4,r4,r6
        0x08005728:    9e06        ..      LDR      r6,[sp,#0x18]
        0x0800572a:    6857        Wh      LDR      r7,[r2,#4]
        0x0800572c:    443e        >D      ADD      r6,r6,r7
        0x0800572e:    4434        4D      ADD      r4,r4,r6
        0x08005730:    ea4f467c    O.|F    ROR      r6,r12,#17
        0x08005734:    ea8646fc    ...F    EOR      r6,r6,r12,ROR #19
        0x08005738:    ea86279c    ...'    EOR      r7,r6,r12,LSR #10
        0x0800573c:    6886        .h      LDR      r6,[r0,#8]
        0x0800573e:    ea4f1cf6    O...    ROR      r12,r6,#7
        0x08005742:    ea8c4cb6    ...L    EOR      r12,r12,r6,ROR #18
        0x08005746:    ea8c0cd6    ....    EOR      r12,r12,r6,LSR #3
        0x0800574a:    4467        gD      ADD      r7,r7,r12
        0x0800574c:    f8d0c028    ..(.    LDR      r12,[r0,#0x28]
        0x08005750:    4465        eD      ADD      r5,r5,r12
        0x08005752:    443d        =D      ADD      r5,r5,r7
        0x08005754:    6445        Ed      STR      r5,[r0,#0x44]
        0x08005756:    f8ddc000    ....    LDR      r12,[sp,#0]
        0x0800575a:    9f07        ..      LDR      r7,[sp,#0x1c]
        0x0800575c:    442c        ,D      ADD      r4,r4,r5
        0x0800575e:    ea07070c    ....    AND      r7,r7,r12
        0x08005762:    f8ddc01c    ....    LDR      r12,[sp,#0x1c]
        0x08005766:    f8dd8000    ....    LDR      r8,[sp,#0]
        0x0800576a:    e001        ..      B        0x8005770 ; mbedtls_internal_sha256_process + 1084
    $d
        0x0800576c:    08007ec4    .~..    DCD    134250180
    $t
        0x08005770:    ea4c0c08    L...    ORR      r12,r12,r8
        0x08005774:    f8dd8004    ....    LDR      r8,[sp,#4]
        0x08005778:    ea0c0c08    ....    AND      r12,r12,r8
        0x0800577c:    ea47070c    G...    ORR      r7,r7,r12
        0x08005780:    f8ddc01c    ....    LDR      r12,[sp,#0x1c]
        0x08005784:    f8dd801c    ....    LDR      r8,[sp,#0x1c]
        0x08005788:    ea4f0cbc    O...    ROR      r12,r12,#2
        0x0800578c:    ea8c3c78    ..x<    EOR      r12,r12,r8,ROR #13
        0x08005790:    ea8c5cb8    ...\    EOR      r12,r12,r8,ROR #22
        0x08005794:    4467        gD      ADD      r7,r7,r12
        0x08005796:    f8ddc008    ....    LDR      r12,[sp,#8]
        0x0800579a:    44a4        .D      ADD      r12,r12,r4
        0x0800579c:    443c        <D      ADD      r4,r4,r7
        0x0800579e:    9406        ..      STR      r4,[sp,#0x18]
        0x080057a0:    ea4f14bc    O...    ROR      r4,r12,#6
        0x080057a4:    ea8424fc    ...$    EOR      r4,r4,r12,ROR #11
        0x080057a8:    f8cdc008    ....    STR      r12,[sp,#8]
        0x080057ac:    ea84677c    ..|g    EOR      r7,r4,r12,ROR #25
        0x080057b0:    e9dd4c03    ...L    LDRD     r4,r12,[sp,#0xc]
        0x080057b4:    ea84040c    ....    EOR      r4,r4,r12
        0x080057b8:    f8ddc008    ....    LDR      r12,[sp,#8]
        0x080057bc:    ea04040c    ....    AND      r4,r4,r12
        0x080057c0:    f8ddc010    ....    LDR      r12,[sp,#0x10]
        0x080057c4:    ea84040c    ....    EOR      r4,r4,r12
        0x080057c8:    4427        'D      ADD      r7,r7,r4
        0x080057ca:    9c05        ..      LDR      r4,[sp,#0x14]
        0x080057cc:    f8d2c008    ....    LDR      r12,[r2,#8]
        0x080057d0:    4464        dD      ADD      r4,r4,r12
        0x080057d2:    4427        'D      ADD      r7,r7,r4
        0x080057d4:    ea4f4473    O.sD    ROR      r4,r3,#17
        0x080057d8:    ea8444f3    ...D    EOR      r4,r4,r3,ROR #19
        0x080057dc:    ea842c93    ...,    EOR      r12,r4,r3,LSR #10
        0x080057e0:    68c4        .h      LDR      r4,[r0,#0xc]
        0x080057e2:    ea4f18f4    O...    ROR      r8,r4,#7
        0x080057e6:    ea8848b4    ...H    EOR      r8,r8,r4,ROR #18
        0x080057ea:    ea8808d4    ....    EOR      r8,r8,r4,LSR #3
        0x080057ee:    44c4        .D      ADD      r12,r12,r8
        0x080057f0:    f8d0802c    ..,.    LDR      r8,[r0,#0x2c]
        0x080057f4:    4446        FD      ADD      r6,r6,r8
        0x080057f6:    4466        fD      ADD      r6,r6,r12
        0x080057f8:    eb070b06    ....    ADD      r11,r7,r6
        0x080057fc:    6486        .d      STR      r6,[r0,#0x48]
        0x080057fe:    e9dd7c06    ...|    LDRD     r7,r12,[sp,#0x18]
        0x08005802:    ea07070c    ....    AND      r7,r7,r12
        0x08005806:    e9ddc806    ....    LDRD     r12,r8,[sp,#0x18]
        0x0800580a:    ea4c0c08    L...    ORR      r12,r12,r8
        0x0800580e:    f8dd8000    ....    LDR      r8,[sp,#0]
        0x08005812:    ea0c0c08    ....    AND      r12,r12,r8
        0x08005816:    ea47070c    G...    ORR      r7,r7,r12
        0x0800581a:    f8ddc018    ....    LDR      r12,[sp,#0x18]
        0x0800581e:    f8dd8018    ....    LDR      r8,[sp,#0x18]
        0x08005822:    ea4f0cbc    O...    ROR      r12,r12,#2
        0x08005826:    ea8c3c78    ..x<    EOR      r12,r12,r8,ROR #13
        0x0800582a:    ea8c5cb8    ...\    EOR      r12,r12,r8,ROR #22
        0x0800582e:    f8dd8004    ....    LDR      r8,[sp,#4]
        0x08005832:    44bc        .D      ADD      r12,r12,r7
        0x08005834:    eb08070b    ....    ADD      r7,r8,r11
        0x08005838:    9701        ..      STR      r7,[sp,#4]
        0x0800583a:    eb0b070c    ....    ADD      r7,r11,r12
        0x0800583e:    9705        ..      STR      r7,[sp,#0x14]
        0x08005840:    9f01        ..      LDR      r7,[sp,#4]
        0x08005842:    f8ddc004    ....    LDR      r12,[sp,#4]
        0x08005846:    ea4f17b7    O...    ROR      r7,r7,#6
        0x0800584a:    ea8727fc    ...'    EOR      r7,r7,r12,ROR #11
        0x0800584e:    ea876c7c    ..|l    EOR      r12,r7,r12,ROR #25
        0x08005852:    e9dd7802    ...x    LDRD     r7,r8,[sp,#8]
        0x08005856:    ea870708    ....    EOR      r7,r7,r8
        0x0800585a:    f8dd8004    ....    LDR      r8,[sp,#4]
        0x0800585e:    ea070708    ....    AND      r7,r7,r8
        0x08005862:    f8dd800c    ....    LDR      r8,[sp,#0xc]
        0x08005866:    ea870708    ....    EOR      r7,r7,r8
        0x0800586a:    4467        gD      ADD      r7,r7,r12
        0x0800586c:    f8ddc010    ....    LDR      r12,[sp,#0x10]
        0x08005870:    f8d2800c    ....    LDR      r8,[r2,#0xc]
        0x08005874:    44c4        .D      ADD      r12,r12,r8
        0x08005876:    4467        gD      ADD      r7,r7,r12
        0x08005878:    ea4f4c75    O.uL    ROR      r12,r5,#17
        0x0800587c:    ea8c4cf5    ...L    EOR      r12,r12,r5,ROR #19
        0x08005880:    ea8c2c95    ...,    EOR      r12,r12,r5,LSR #10
        0x08005884:    6905        .i      LDR      r5,[r0,#0x10]
        0x08005886:    ea4f18f5    O...    ROR      r8,r5,#7
        0x0800588a:    ea8848b5    ...H    EOR      r8,r8,r5,ROR #18
        0x0800588e:    ea8808d5    ....    EOR      r8,r8,r5,LSR #3
        0x08005892:    44c4        .D      ADD      r12,r12,r8
        0x08005894:    f8d08030    ..0.    LDR      r8,[r0,#0x30]
        0x08005898:    4444        DD      ADD      r4,r4,r8
        0x0800589a:    4464        dD      ADD      r4,r4,r12
        0x0800589c:    eb070b04    ....    ADD      r11,r7,r4
        0x080058a0:    64c4        .d      STR      r4,[r0,#0x4c]
        0x080058a2:    e9dd7c05    ...|    LDRD     r7,r12,[sp,#0x14]
        0x080058a6:    ea07070c    ....    AND      r7,r7,r12
        0x080058aa:    e9ddc805    ....    LDRD     r12,r8,[sp,#0x14]
        0x080058ae:    ea4c0c08    L...    ORR      r12,r12,r8
        0x080058b2:    f8dd801c    ....    LDR      r8,[sp,#0x1c]
        0x080058b6:    ea0c0c08    ....    AND      r12,r12,r8
        0x080058ba:    ea47070c    G...    ORR      r7,r7,r12
        0x080058be:    f8ddc014    ....    LDR      r12,[sp,#0x14]
        0x080058c2:    f8dd8014    ....    LDR      r8,[sp,#0x14]
        0x080058c6:    ea4f0cbc    O...    ROR      r12,r12,#2
        0x080058ca:    ea8c3c78    ..x<    EOR      r12,r12,r8,ROR #13
        0x080058ce:    ea8c5cb8    ...\    EOR      r12,r12,r8,ROR #22
        0x080058d2:    f8dd8000    ....    LDR      r8,[sp,#0]
        0x080058d6:    44bc        .D      ADD      r12,r12,r7
        0x080058d8:    eb08070b    ....    ADD      r7,r8,r11
        0x080058dc:    9700        ..      STR      r7,[sp,#0]
        0x080058de:    eb0b070c    ....    ADD      r7,r11,r12
        0x080058e2:    9704        ..      STR      r7,[sp,#0x10]
        0x080058e4:    9f00        ..      LDR      r7,[sp,#0]
        0x080058e6:    f8ddc000    ....    LDR      r12,[sp,#0]
        0x080058ea:    ea4f17b7    O...    ROR      r7,r7,#6
        0x080058ee:    ea872cfc    ...,    EOR      r12,r7,r12,ROR #11
        0x080058f2:    9f00        ..      LDR      r7,[sp,#0]
        0x080058f4:    ea8c6c77    ..wl    EOR      r12,r12,r7,ROR #25
        0x080058f8:    e9dd7801    ...x    LDRD     r7,r8,[sp,#4]
        0x080058fc:    ea870708    ....    EOR      r7,r7,r8
        0x08005900:    f8dd8000    ....    LDR      r8,[sp,#0]
        0x08005904:    ea070708    ....    AND      r7,r7,r8
        0x08005908:    f8dd8008    ....    LDR      r8,[sp,#8]
        0x0800590c:    ea870708    ....    EOR      r7,r7,r8
        0x08005910:    4467        gD      ADD      r7,r7,r12
        0x08005912:    f8ddc00c    ....    LDR      r12,[sp,#0xc]
        0x08005916:    f8d28010    ....    LDR      r8,[r2,#0x10]
        0x0800591a:    44c4        .D      ADD      r12,r12,r8
        0x0800591c:    4467        gD      ADD      r7,r7,r12
        0x0800591e:    ea4f4c76    O.vL    ROR      r12,r6,#17
        0x08005922:    ea8c4cf6    ...L    EOR      r12,r12,r6,ROR #19
        0x08005926:    ea8c2c96    ...,    EOR      r12,r12,r6,LSR #10
        0x0800592a:    6946        Fi      LDR      r6,[r0,#0x14]
        0x0800592c:    ea4f18f6    O...    ROR      r8,r6,#7
        0x08005930:    ea8848b6    ...H    EOR      r8,r8,r6,ROR #18
        0x08005934:    ea8808d6    ....    EOR      r8,r8,r6,LSR #3
        0x08005938:    44c4        .D      ADD      r12,r12,r8
        0x0800593a:    f8d08034    ..4.    LDR      r8,[r0,#0x34]
        0x0800593e:    4445        ED      ADD      r5,r5,r8
        0x08005940:    4465        eD      ADD      r5,r5,r12
        0x08005942:    eb070b05    ....    ADD      r11,r7,r5
        0x08005946:    6505        .e      STR      r5,[r0,#0x50]
        0x08005948:    e9dd7c04    ...|    LDRD     r7,r12,[sp,#0x10]
        0x0800594c:    ea07070c    ....    AND      r7,r7,r12
        0x08005950:    e9ddc804    ....    LDRD     r12,r8,[sp,#0x10]
        0x08005954:    ea4c0c08    L...    ORR      r12,r12,r8
        0x08005958:    f8dd8018    ....    LDR      r8,[sp,#0x18]
        0x0800595c:    ea0c0c08    ....    AND      r12,r12,r8
        0x08005960:    ea47070c    G...    ORR      r7,r7,r12
        0x08005964:    f8ddc010    ....    LDR      r12,[sp,#0x10]
        0x08005968:    f8dd8010    ....    LDR      r8,[sp,#0x10]
        0x0800596c:    ea4f0cbc    O...    ROR      r12,r12,#2
        0x08005970:    ea8c3c78    ..x<    EOR      r12,r12,r8,ROR #13
        0x08005974:    ea8c5cb8    ...\    EOR      r12,r12,r8,ROR #22
        0x08005978:    44bc        .D      ADD      r12,r12,r7
        0x0800597a:    f8dd801c    ....    LDR      r8,[sp,#0x1c]
        0x0800597e:    444e        ND      ADD      r6,r6,r9
        0x08005980:    eb08070b    ....    ADD      r7,r8,r11
        0x08005984:    9707        ..      STR      r7,[sp,#0x1c]
        0x08005986:    eb0b070c    ....    ADD      r7,r11,r12
        0x0800598a:    9703        ..      STR      r7,[sp,#0xc]
        0x0800598c:    9f07        ..      LDR      r7,[sp,#0x1c]
        0x0800598e:    f8ddc01c    ....    LDR      r12,[sp,#0x1c]
        0x08005992:    ea4f17b7    O...    ROR      r7,r7,#6
        0x08005996:    ea8727fc    ...'    EOR      r7,r7,r12,ROR #11
        0x0800599a:    ea876c7c    ..|l    EOR      r12,r7,r12,ROR #25
        0x0800599e:    e9dd7800    ...x    LDRD     r7,r8,[sp,#0]
        0x080059a2:    ea870708    ....    EOR      r7,r7,r8
        0x080059a6:    f8dd801c    ....    LDR      r8,[sp,#0x1c]
        0x080059aa:    ea070708    ....    AND      r7,r7,r8
        0x080059ae:    f8dd8004    ....    LDR      r8,[sp,#4]
        0x080059b2:    ea870708    ....    EOR      r7,r7,r8
        0x080059b6:    4467        gD      ADD      r7,r7,r12
        0x080059b8:    f8ddc008    ....    LDR      r12,[sp,#8]
        0x080059bc:    f8d28014    ....    LDR      r8,[r2,#0x14]
        0x080059c0:    44c4        .D      ADD      r12,r12,r8
        0x080059c2:    4467        gD      ADD      r7,r7,r12
        0x080059c4:    ea4f4c74    O.tL    ROR      r12,r4,#17
        0x080059c8:    ea8c4cf4    ...L    EOR      r12,r12,r4,ROR #19
        0x080059cc:    ea8c2c94    ...,    EOR      r12,r12,r4,LSR #10
        0x080059d0:    6984        .i      LDR      r4,[r0,#0x18]
        0x080059d2:    ea4f18f4    O...    ROR      r8,r4,#7
        0x080059d6:    ea8848b4    ...H    EOR      r8,r8,r4,ROR #18
        0x080059da:    ea8808d4    ....    EOR      r8,r8,r4,LSR #3
        0x080059de:    44e0        .D      ADD      r8,r8,r12
        0x080059e0:    4446        FD      ADD      r6,r6,r8
        0x080059e2:    eb070906    ....    ADD      r9,r7,r6
        0x080059e6:    6546        Fe      STR      r6,[r0,#0x54]
        0x080059e8:    e9dd7c03    ...|    LDRD     r7,r12,[sp,#0xc]
        0x080059ec:    ea07070c    ....    AND      r7,r7,r12
        0x080059f0:    e9ddc803    ....    LDRD     r12,r8,[sp,#0xc]
        0x080059f4:    ea4c0c08    L...    ORR      r12,r12,r8
        0x080059f8:    f8dd8014    ....    LDR      r8,[sp,#0x14]
        0x080059fc:    ea0c0c08    ....    AND      r12,r12,r8
        0x08005a00:    ea47070c    G...    ORR      r7,r7,r12
        0x08005a04:    f8ddc00c    ....    LDR      r12,[sp,#0xc]
        0x08005a08:    f8dd800c    ....    LDR      r8,[sp,#0xc]
        0x08005a0c:    ea4f0cbc    O...    ROR      r12,r12,#2
        0x08005a10:    ea8c3c78    ..x<    EOR      r12,r12,r8,ROR #13
        0x08005a14:    ea8c5cb8    ...\    EOR      r12,r12,r8,ROR #22
        0x08005a18:    f8dd8018    ....    LDR      r8,[sp,#0x18]
        0x08005a1c:    44bc        .D      ADD      r12,r12,r7
        0x08005a1e:    eb080709    ....    ADD      r7,r8,r9
        0x08005a22:    9706        ..      STR      r7,[sp,#0x18]
        0x08005a24:    eb09070c    ....    ADD      r7,r9,r12
        0x08005a28:    9702        ..      STR      r7,[sp,#8]
        0x08005a2a:    9f06        ..      LDR      r7,[sp,#0x18]
        0x08005a2c:    f8ddc018    ....    LDR      r12,[sp,#0x18]
        0x08005a30:    ea4f17b7    O...    ROR      r7,r7,#6
        0x08005a34:    ea8727fc    ...'    EOR      r7,r7,r12,ROR #11
        0x08005a38:    ea876c7c    ..|l    EOR      r12,r7,r12,ROR #25
        0x08005a3c:    f8dd8000    ....    LDR      r8,[sp,#0]
        0x08005a40:    9f07        ..      LDR      r7,[sp,#0x1c]
        0x08005a42:    ea870708    ....    EOR      r7,r7,r8
        0x08005a46:    f8dd8018    ....    LDR      r8,[sp,#0x18]
        0x08005a4a:    ea070708    ....    AND      r7,r7,r8
        0x08005a4e:    f8dd8000    ....    LDR      r8,[sp,#0]
        0x08005a52:    ea870708    ....    EOR      r7,r7,r8
        0x08005a56:    4467        gD      ADD      r7,r7,r12
        0x08005a58:    f8ddc004    ....    LDR      r12,[sp,#4]
        0x08005a5c:    f8d28018    ....    LDR      r8,[r2,#0x18]
        0x08005a60:    44c4        .D      ADD      r12,r12,r8
        0x08005a62:    4467        gD      ADD      r7,r7,r12
        0x08005a64:    ea4f4c75    O.uL    ROR      r12,r5,#17
        0x08005a68:    ea8c4cf5    ...L    EOR      r12,r12,r5,ROR #19
        0x08005a6c:    ea8c2c95    ...,    EOR      r12,r12,r5,LSR #10
        0x08005a70:    69c5        .i      LDR      r5,[r0,#0x1c]
        0x08005a72:    ea4f18f5    O...    ROR      r8,r5,#7
        0x08005a76:    ea8848b5    ...H    EOR      r8,r8,r5,ROR #18
        0x08005a7a:    ea8808d5    ....    EOR      r8,r8,r5,LSR #3
        0x08005a7e:    44e0        .D      ADD      r8,r8,r12
        0x08005a80:    4454        TD      ADD      r4,r4,r10
        0x08005a82:    4444        DD      ADD      r4,r4,r8
        0x08005a84:    6584        .e      STR      r4,[r0,#0x58]
        0x08005a86:    443c        <D      ADD      r4,r4,r7
        0x08005a88:    e9dd7c02    ...|    LDRD     r7,r12,[sp,#8]
        0x08005a8c:    ea07070c    ....    AND      r7,r7,r12
        0x08005a90:    e9ddc802    ....    LDRD     r12,r8,[sp,#8]
        0x08005a94:    ea4c0c08    L...    ORR      r12,r12,r8
        0x08005a98:    f8dd8010    ....    LDR      r8,[sp,#0x10]
        0x08005a9c:    442b        +D      ADD      r3,r3,r5
        0x08005a9e:    ea0c0c08    ....    AND      r12,r12,r8
        0x08005aa2:    ea47070c    G...    ORR      r7,r7,r12
        0x08005aa6:    f8ddc008    ....    LDR      r12,[sp,#8]
        0x08005aaa:    f8dd8008    ....    LDR      r8,[sp,#8]
        0x08005aae:    ea4f0cbc    O...    ROR      r12,r12,#2
        0x08005ab2:    ea8c3c78    ..x<    EOR      r12,r12,r8,ROR #13
        0x08005ab6:    ea8c5cb8    ...\    EOR      r12,r12,r8,ROR #22
        0x08005aba:    4467        gD      ADD      r7,r7,r12
        0x08005abc:    f8ddc014    ....    LDR      r12,[sp,#0x14]
        0x08005ac0:    3108        .1      ADDS     r1,r1,#8
        0x08005ac2:    44a4        .D      ADD      r12,r12,r4
        0x08005ac4:    443c        <D      ADD      r4,r4,r7
        0x08005ac6:    9401        ..      STR      r4,[sp,#4]
        0x08005ac8:    ea4f14bc    O...    ROR      r4,r12,#6
        0x08005acc:    ea8424fc    ...$    EOR      r4,r4,r12,ROR #11
        0x08005ad0:    f8cdc014    ....    STR      r12,[sp,#0x14]
        0x08005ad4:    ea84677c    ..|g    EOR      r7,r4,r12,ROR #25
        0x08005ad8:    e9dd4c06    ...L    LDRD     r4,r12,[sp,#0x18]
        0x08005adc:    ea84040c    ....    EOR      r4,r4,r12
        0x08005ae0:    f8ddc014    ....    LDR      r12,[sp,#0x14]
        0x08005ae4:    69d2        .i      LDR      r2,[r2,#0x1c]
        0x08005ae6:    ea04040c    ....    AND      r4,r4,r12
        0x08005aea:    f8ddc01c    ....    LDR      r12,[sp,#0x1c]
        0x08005aee:    ea84040c    ....    EOR      r4,r4,r12
        0x08005af2:    443c        <D      ADD      r4,r4,r7
        0x08005af4:    9f00        ..      LDR      r7,[sp,#0]
        0x08005af6:    443a        :D      ADD      r2,r2,r7
        0x08005af8:    4422        "D      ADD      r2,r2,r4
        0x08005afa:    ea4f4476    O.vD    ROR      r4,r6,#17
        0x08005afe:    ea8444f6    ...D    EOR      r4,r4,r6,ROR #19
        0x08005b02:    ea842696    ...&    EOR      r6,r4,r6,LSR #10
        0x08005b06:    6a04        .j      LDR      r4,[r0,#0x20]
        0x08005b08:    ea4f17f4    O...    ROR      r7,r4,#7
        0x08005b0c:    ea8747b4    ...G    EOR      r7,r7,r4,ROR #18
        0x08005b10:    ea8704d4    ....    EOR      r4,r7,r4,LSR #3
        0x08005b14:    4434        4D      ADD      r4,r4,r6
        0x08005b16:    4423        #D      ADD      r3,r3,r4
        0x08005b18:    65c3        .e      STR      r3,[r0,#0x5c]
        0x08005b1a:    18d0        ..      ADDS     r0,r2,r3
        0x08005b1c:    e9dd2301    ...#    LDRD     r2,r3,[sp,#4]
        0x08005b20:    401a        .@      ANDS     r2,r2,r3
        0x08005b22:    e9dd3401    ...4    LDRD     r3,r4,[sp,#4]
        0x08005b26:    4323        #C      ORRS     r3,r3,r4
        0x08005b28:    9c03        ..      LDR      r4,[sp,#0xc]
        0x08005b2a:    4023        #@      ANDS     r3,r3,r4
        0x08005b2c:    431a        .C      ORRS     r2,r2,r3
        0x08005b2e:    9b01        ..      LDR      r3,[sp,#4]
        0x08005b30:    9c01        ..      LDR      r4,[sp,#4]
        0x08005b32:    ea4f03b3    O...    ROR      r3,r3,#2
        0x08005b36:    ea833374    ..t3    EOR      r3,r3,r4,ROR #13
        0x08005b3a:    ea8353b4    ...S    EOR      r3,r3,r4,ROR #22
        0x08005b3e:    441a        .D      ADD      r2,r2,r3
        0x08005b40:    9b04        ..      LDR      r3,[sp,#0x10]
        0x08005b42:    2940        @)      CMP      r1,#0x40
        0x08005b44:    4403        .D      ADD      r3,r3,r0
        0x08005b46:    4410        .D      ADD      r0,r0,r2
        0x08005b48:    9304        ..      STR      r3,[sp,#0x10]
        0x08005b4a:    9000        ..      STR      r0,[sp,#0]
        0x08005b4c:    f4ffad8a    ....    BCC      0x8005664 ; mbedtls_internal_sha256_process + 816
        0x08005b50:    2000        .       MOVS     r0,#0
        0x08005b52:    4669        iF      MOV      r1,sp
        0x08005b54:    eb0e0280    ....    ADD      r2,lr,r0,LSL #2
        0x08005b58:    f8514020    Q. @    LDR      r4,[r1,r0,LSL #2]
        0x08005b5c:    6893        .h      LDR      r3,[r2,#8]
        0x08005b5e:    1c40        @.      ADDS     r0,r0,#1
        0x08005b60:    4423        #D      ADD      r3,r3,r4
        0x08005b62:    6093        .`      STR      r3,[r2,#8]
        0x08005b64:    2808        .(      CMP      r0,#8
        0x08005b66:    d3f5        ..      BCC      0x8005b54 ; mbedtls_internal_sha256_process + 2080
        0x08005b68:    b048        H.      ADD      sp,sp,#0x120
        0x08005b6a:    2000        .       MOVS     r0,#0
        0x08005b6c:    e8bd8ff0    ....    POP      {r4-r11,pc}
    i.mbedtls_mpi_add_abs
    mbedtls_mpi_add_abs
        0x08005b70:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x08005b74:    4615        .F      MOV      r5,r2
        0x08005b76:    4604        .F      MOV      r4,r0
        0x08005b78:    42a8        .B      CMP      r0,r5
        0x08005b7a:    d101        ..      BNE      0x8005b80 ; mbedtls_mpi_add_abs + 16
        0x08005b7c:    460d        .F      MOV      r5,r1
        0x08005b7e:    4601        .F      MOV      r1,r0
        0x08005b80:    428c        .B      CMP      r4,r1
        0x08005b82:    d004        ..      BEQ      0x8005b8e ; mbedtls_mpi_add_abs + 30
        0x08005b84:    4620         F      MOV      r0,r4
        0x08005b86:    f000f93d    ..=.    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08005b8a:    0001        ..      MOVS     r1,r0
        0x08005b8c:    d148        H.      BNE      0x8005c20 ; mbedtls_mpi_add_abs + 176
        0x08005b8e:    2001        .       MOVS     r0,#1
        0x08005b90:    6020         `      STR      r0,[r4,#0]
        0x08005b92:    686e        nh      LDR      r6,[r5,#4]
        0x08005b94:    b146        F.      CBZ      r6,0x8005ba8 ; mbedtls_mpi_add_abs + 56
        0x08005b96:    1f41        A.      SUBS     r1,r0,#5
        0x08005b98:    f8d50008    ....    LDR.W    r0,[r5,#8]
        0x08005b9c:    eb010286    ....    ADD      r2,r1,r6,LSL #2
        0x08005ba0:    5882        .X      LDR      r2,[r0,r2]
        0x08005ba2:    b90a        ..      CBNZ     r2,0x8005ba8 ; mbedtls_mpi_add_abs + 56
        0x08005ba4:    1e76        v.      SUBS     r6,r6,#1
        0x08005ba6:    d1f9        ..      BNE      0x8005b9c ; mbedtls_mpi_add_abs + 44
        0x08005ba8:    4631        1F      MOV      r1,r6
        0x08005baa:    4620         F      MOV      r0,r4
        0x08005bac:    f000fbbc    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x08005bb0:    0001        ..      MOVS     r1,r0
        0x08005bb2:    d135        5.      BNE      0x8005c20 ; mbedtls_mpi_add_abs + 176
        0x08005bb4:    68aa        .h      LDR      r2,[r5,#8]
        0x08005bb6:    2700        .'      MOVS     r7,#0
        0x08005bb8:    463d        =F      MOV      r5,r7
        0x08005bba:    68a0        .h      LDR      r0,[r4,#8]
        0x08005bbc:    e015        ..      B        0x8005bea ; mbedtls_mpi_add_abs + 122
        0x08005bbe:    bf00        ..      NOP      
        0x08005bc0:    6803        .h      LDR      r3,[r0,#0]
        0x08005bc2:    f8d2c000    ....    LDR      r12,[r2,#0]
        0x08005bc6:    443b        ;D      ADD      r3,r3,r7
        0x08005bc8:    6003        .`      STR      r3,[r0,#0]
        0x08005bca:    42bb        .B      CMP      r3,r7
        0x08005bcc:    d201        ..      BCS      0x8005bd2 ; mbedtls_mpi_add_abs + 98
        0x08005bce:    2701        .'      MOVS     r7,#1
        0x08005bd0:    e000        ..      B        0x8005bd4 ; mbedtls_mpi_add_abs + 100
        0x08005bd2:    2700        .'      MOVS     r7,#0
        0x08005bd4:    4463        cD      ADD      r3,r3,r12
        0x08005bd6:    6003        .`      STR      r3,[r0,#0]
        0x08005bd8:    4563        cE      CMP      r3,r12
        0x08005bda:    d201        ..      BCS      0x8005be0 ; mbedtls_mpi_add_abs + 112
        0x08005bdc:    2301        .#      MOVS     r3,#1
        0x08005bde:    e000        ..      B        0x8005be2 ; mbedtls_mpi_add_abs + 114
        0x08005be0:    2300        .#      MOVS     r3,#0
        0x08005be2:    1d00        ..      ADDS     r0,r0,#4
        0x08005be4:    1d12        ..      ADDS     r2,r2,#4
        0x08005be6:    441f        .D      ADD      r7,r7,r3
        0x08005be8:    1c6d        m.      ADDS     r5,r5,#1
        0x08005bea:    42b5        .B      CMP      r5,r6
        0x08005bec:    d3e8        ..      BCC      0x8005bc0 ; mbedtls_mpi_add_abs + 80
        0x08005bee:    e015        ..      B        0x8005c1c ; mbedtls_mpi_add_abs + 172
        0x08005bf0:    6862        bh      LDR      r2,[r4,#4]
        0x08005bf2:    42aa        .B      CMP      r2,r5
        0x08005bf4:    d808        ..      BHI      0x8005c08 ; mbedtls_mpi_add_abs + 152
        0x08005bf6:    1c69        i.      ADDS     r1,r5,#1
        0x08005bf8:    4620         F      MOV      r0,r4
        0x08005bfa:    f000fb95    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x08005bfe:    0001        ..      MOVS     r1,r0
        0x08005c00:    d10e        ..      BNE      0x8005c20 ; mbedtls_mpi_add_abs + 176
        0x08005c02:    68a0        .h      LDR      r0,[r4,#8]
        0x08005c04:    eb000085    ....    ADD      r0,r0,r5,LSL #2
        0x08005c08:    6802        .h      LDR      r2,[r0,#0]
        0x08005c0a:    443a        :D      ADD      r2,r2,r7
        0x08005c0c:    6002        .`      STR      r2,[r0,#0]
        0x08005c0e:    42ba        .B      CMP      r2,r7
        0x08005c10:    d201        ..      BCS      0x8005c16 ; mbedtls_mpi_add_abs + 166
        0x08005c12:    2701        .'      MOVS     r7,#1
        0x08005c14:    e000        ..      B        0x8005c18 ; mbedtls_mpi_add_abs + 168
        0x08005c16:    2700        .'      MOVS     r7,#0
        0x08005c18:    1d00        ..      ADDS     r0,r0,#4
        0x08005c1a:    1c6d        m.      ADDS     r5,r5,#1
        0x08005c1c:    2f00        ./      CMP      r7,#0
        0x08005c1e:    d1e7        ..      BNE      0x8005bf0 ; mbedtls_mpi_add_abs + 128
        0x08005c20:    4608        .F      MOV      r0,r1
        0x08005c22:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x08005c26:    0000        ..      MOVS     r0,r0
    i.mbedtls_mpi_add_int
    mbedtls_mpi_add_int
        0x08005c28:    b51f        ..      PUSH     {r0-r4,lr}
        0x08005c2a:    2a00        .*      CMP      r2,#0
        0x08005c2c:    da02        ..      BGE      0x8005c34 ; mbedtls_mpi_add_int + 12
        0x08005c2e:    bf00        ..      NOP      
        0x08005c30:    f1c20200    ....    RSB      r2,r2,#0
        0x08005c34:    9203        ..      STR      r2,[sp,#0xc]
        0x08005c36:    da02        ..      BGE      0x8005c3e ; mbedtls_mpi_add_int + 22
        0x08005c38:    f04f32ff    O..2    MOV      r2,#0xffffffff
        0x08005c3c:    e001        ..      B        0x8005c42 ; mbedtls_mpi_add_int + 26
        0x08005c3e:    f04f0201    O...    MOV      r2,#1
        0x08005c42:    9200        ..      STR      r2,[sp,#0]
        0x08005c44:    f04f0201    O...    MOV      r2,#1
        0x08005c48:    9201        ..      STR      r2,[sp,#4]
        0x08005c4a:    aa03        ..      ADD      r2,sp,#0xc
        0x08005c4c:    9202        ..      STR      r2,[sp,#8]
        0x08005c4e:    466a        jF      MOV      r2,sp
        0x08005c50:    f000f802    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08005c54:    b004        ..      ADD      sp,sp,#0x10
        0x08005c56:    bd10        ..      POP      {r4,pc}
    i.mbedtls_mpi_add_mpi
    mbedtls_mpi_add_mpi
        0x08005c58:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x08005c5c:    4605        .F      MOV      r5,r0
        0x08005c5e:    680c        .h      LDR      r4,[r1,#0]
        0x08005c60:    6810        .h      LDR      r0,[r2,#0]
        0x08005c62:    4617        .F      MOV      r7,r2
        0x08005c64:    460e        .F      MOV      r6,r1
        0x08005c66:    4360        `C      MULS     r0,r4,r0
        0x08005c68:    d519        ..      BPL      0x8005c9e ; mbedtls_mpi_add_mpi + 70
        0x08005c6a:    4611        .F      MOV      r1,r2
        0x08005c6c:    4630        0F      MOV      r0,r6
        0x08005c6e:    f000f839    ..9.    BL       mbedtls_mpi_cmp_abs ; 0x8005ce4
        0x08005c72:    2800        .(      CMP      r0,#0
        0x08005c74:    db09        ..      BLT      0x8005c8a ; mbedtls_mpi_add_mpi + 50
        0x08005c76:    463a        :F      MOV      r2,r7
        0x08005c78:    4631        1F      MOV      r1,r6
        0x08005c7a:    4628        (F      MOV      r0,r5
        0x08005c7c:    f000ffef    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08005c80:    2800        .(      CMP      r0,#0
        0x08005c82:    d100        ..      BNE      0x8005c86 ; mbedtls_mpi_add_mpi + 46
        0x08005c84:    602c        ,`      STR      r4,[r5,#0]
        0x08005c86:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x08005c8a:    4632        2F      MOV      r2,r6
        0x08005c8c:    4639        9F      MOV      r1,r7
        0x08005c8e:    4628        (F      MOV      r0,r5
        0x08005c90:    f000ffe5    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08005c94:    2800        .(      CMP      r0,#0
        0x08005c96:    d1f6        ..      BNE      0x8005c86 ; mbedtls_mpi_add_mpi + 46
        0x08005c98:    4261        aB      RSBS     r1,r4,#0
        0x08005c9a:    6029        )`      STR      r1,[r5,#0]
        0x08005c9c:    e7f3        ..      B        0x8005c86 ; mbedtls_mpi_add_mpi + 46
        0x08005c9e:    4628        (F      MOV      r0,r5
        0x08005ca0:    f7ffff66    ..f.    BL       mbedtls_mpi_add_abs ; 0x8005b70
        0x08005ca4:    e7ec        ..      B        0x8005c80 ; mbedtls_mpi_add_mpi + 40
    i.mbedtls_mpi_bitlen
    mbedtls_mpi_bitlen
        0x08005ca6:    b510        ..      PUSH     {r4,lr}
        0x08005ca8:    6841        Ah      LDR      r1,[r0,#4]
        0x08005caa:    b131        1.      CBZ      r1,0x8005cba ; mbedtls_mpi_bitlen + 20
        0x08005cac:    1e49        I.      SUBS     r1,r1,#1
        0x08005cae:    d008        ..      BEQ      0x8005cc2 ; mbedtls_mpi_bitlen + 28
        0x08005cb0:    6882        .h      LDR      r2,[r0,#8]
        0x08005cb2:    f8523021    R.!0    LDR      r3,[r2,r1,LSL #2]
        0x08005cb6:    b923        #.      CBNZ     r3,0x8005cc2 ; mbedtls_mpi_bitlen + 28
        0x08005cb8:    e001        ..      B        0x8005cbe ; mbedtls_mpi_bitlen + 24
        0x08005cba:    2000        .       MOVS     r0,#0
        0x08005cbc:    bd10        ..      POP      {r4,pc}
        0x08005cbe:    1e49        I.      SUBS     r1,r1,#1
        0x08005cc0:    d1f7        ..      BNE      0x8005cb2 ; mbedtls_mpi_bitlen + 12
        0x08005cc2:    6880        .h      LDR      r0,[r0,#8]
        0x08005cc4:    f04f4200    O..B    MOV      r2,#0x80000000
        0x08005cc8:    f8503021    P.!0    LDR      r3,[r0,r1,LSL #2]
        0x08005ccc:    2000        .       MOVS     r0,#0
        0x08005cce:    4213        .B      TST      r3,r2
        0x08005cd0:    d103        ..      BNE      0x8005cda ; mbedtls_mpi_bitlen + 52
        0x08005cd2:    0852        R.      LSRS     r2,r2,#1
        0x08005cd4:    1c40        @.      ADDS     r0,r0,#1
        0x08005cd6:    2820         (      CMP      r0,#0x20
        0x08005cd8:    d3f9        ..      BCC      0x8005cce ; mbedtls_mpi_bitlen + 40
        0x08005cda:    f1c00020    .. .    RSB      r0,r0,#0x20
        0x08005cde:    eb001041    ..A.    ADD      r0,r0,r1,LSL #5
        0x08005ce2:    bd10        ..      POP      {r4,pc}
    i.mbedtls_mpi_cmp_abs
    mbedtls_mpi_cmp_abs
        0x08005ce4:    b570        p.      PUSH     {r4-r6,lr}
        0x08005ce6:    6842        Bh      LDR      r2,[r0,#4]
        0x08005ce8:    f06f0403    o...    MVN      r4,#3
        0x08005cec:    b132        2.      CBZ      r2,0x8005cfc ; mbedtls_mpi_cmp_abs + 24
        0x08005cee:    6883        .h      LDR      r3,[r0,#8]
        0x08005cf0:    eb040582    ....    ADD      r5,r4,r2,LSL #2
        0x08005cf4:    595d        ]Y      LDR      r5,[r3,r5]
        0x08005cf6:    b90d        ..      CBNZ     r5,0x8005cfc ; mbedtls_mpi_cmp_abs + 24
        0x08005cf8:    1e52        R.      SUBS     r2,r2,#1
        0x08005cfa:    d1f9        ..      BNE      0x8005cf0 ; mbedtls_mpi_cmp_abs + 12
        0x08005cfc:    684b        Kh      LDR      r3,[r1,#4]
        0x08005cfe:    b13b        ;.      CBZ      r3,0x8005d10 ; mbedtls_mpi_cmp_abs + 44
        0x08005d00:    f8d15008    ...P    LDR.W    r5,[r1,#8]
        0x08005d04:    eb040683    ....    ADD      r6,r4,r3,LSL #2
        0x08005d08:    59ae        .Y      LDR      r6,[r5,r6]
        0x08005d0a:    b90e        ..      CBNZ     r6,0x8005d10 ; mbedtls_mpi_cmp_abs + 44
        0x08005d0c:    1e5b        [.      SUBS     r3,r3,#1
        0x08005d0e:    d1f9        ..      BNE      0x8005d04 ; mbedtls_mpi_cmp_abs + 32
        0x08005d10:    ea520503    R...    ORRS     r5,r2,r3
        0x08005d14:    d016        ..      BEQ      0x8005d44 ; mbedtls_mpi_cmp_abs + 96
        0x08005d16:    429a        .B      CMP      r2,r3
        0x08005d18:    d80c        ..      BHI      0x8005d34 ; mbedtls_mpi_cmp_abs + 80
        0x08005d1a:    f04f35ff    O..5    MOV      r5,#0xffffffff
        0x08005d1e:    4293        .B      CMP      r3,r2
        0x08005d20:    d80c        ..      BHI      0x8005d3c ; mbedtls_mpi_cmp_abs + 88
        0x08005d22:    b17a        z.      CBZ      r2,0x8005d44 ; mbedtls_mpi_cmp_abs + 96
        0x08005d24:    6883        .h      LDR      r3,[r0,#8]
        0x08005d26:    6889        .h      LDR      r1,[r1,#8]
        0x08005d28:    eb040082    ....    ADD      r0,r4,r2,LSL #2
        0x08005d2c:    581e        .X      LDR      r6,[r3,r0]
        0x08005d2e:    5808        .X      LDR      r0,[r1,r0]
        0x08005d30:    4286        .B      CMP      r6,r0
        0x08005d32:    d902        ..      BLS      0x8005d3a ; mbedtls_mpi_cmp_abs + 86
        0x08005d34:    f04f0001    O...    MOV      r0,#1
        0x08005d38:    bd70        p.      POP      {r4-r6,pc}
        0x08005d3a:    d201        ..      BCS      0x8005d40 ; mbedtls_mpi_cmp_abs + 92
        0x08005d3c:    4628        (F      MOV      r0,r5
        0x08005d3e:    bd70        p.      POP      {r4-r6,pc}
        0x08005d40:    1e52        R.      SUBS     r2,r2,#1
        0x08005d42:    d1f1        ..      BNE      0x8005d28 ; mbedtls_mpi_cmp_abs + 68
        0x08005d44:    2000        .       MOVS     r0,#0
        0x08005d46:    bd70        p.      POP      {r4-r6,pc}
    i.mbedtls_mpi_cmp_int
    mbedtls_mpi_cmp_int
        0x08005d48:    b50f        ..      PUSH     {r0-r3,lr}
        0x08005d4a:    2900        .)      CMP      r1,#0
        0x08005d4c:    da02        ..      BGE      0x8005d54 ; mbedtls_mpi_cmp_int + 12
        0x08005d4e:    bf00        ..      NOP      
        0x08005d50:    f1c10100    ....    RSB      r1,r1,#0
        0x08005d54:    9103        ..      STR      r1,[sp,#0xc]
        0x08005d56:    da02        ..      BGE      0x8005d5e ; mbedtls_mpi_cmp_int + 22
        0x08005d58:    f04f31ff    O..1    MOV      r1,#0xffffffff
        0x08005d5c:    e001        ..      B        0x8005d62 ; mbedtls_mpi_cmp_int + 26
        0x08005d5e:    f04f0101    O...    MOV      r1,#1
        0x08005d62:    9100        ..      STR      r1,[sp,#0]
        0x08005d64:    f04f0101    O...    MOV      r1,#1
        0x08005d68:    9101        ..      STR      r1,[sp,#4]
        0x08005d6a:    a903        ..      ADD      r1,sp,#0xc
        0x08005d6c:    9102        ..      STR      r1,[sp,#8]
        0x08005d6e:    4669        iF      MOV      r1,sp
        0x08005d70:    f000f802    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08005d74:    b004        ..      ADD      sp,sp,#0x10
        0x08005d76:    bd00        ..      POP      {pc}
    i.mbedtls_mpi_cmp_mpi
    mbedtls_mpi_cmp_mpi
        0x08005d78:    b570        p.      PUSH     {r4-r6,lr}
        0x08005d7a:    6842        Bh      LDR      r2,[r0,#4]
        0x08005d7c:    f06f0403    o...    MVN      r4,#3
        0x08005d80:    b132        2.      CBZ      r2,0x8005d90 ; mbedtls_mpi_cmp_mpi + 24
        0x08005d82:    6883        .h      LDR      r3,[r0,#8]
        0x08005d84:    eb040582    ....    ADD      r5,r4,r2,LSL #2
        0x08005d88:    595d        ]Y      LDR      r5,[r3,r5]
        0x08005d8a:    b90d        ..      CBNZ     r5,0x8005d90 ; mbedtls_mpi_cmp_mpi + 24
        0x08005d8c:    1e52        R.      SUBS     r2,r2,#1
        0x08005d8e:    d1f9        ..      BNE      0x8005d84 ; mbedtls_mpi_cmp_mpi + 12
        0x08005d90:    684b        Kh      LDR      r3,[r1,#4]
        0x08005d92:    b13b        ;.      CBZ      r3,0x8005da4 ; mbedtls_mpi_cmp_mpi + 44
        0x08005d94:    f8d15008    ...P    LDR.W    r5,[r1,#8]
        0x08005d98:    eb040683    ....    ADD      r6,r4,r3,LSL #2
        0x08005d9c:    59ae        .Y      LDR      r6,[r5,r6]
        0x08005d9e:    b90e        ..      CBNZ     r6,0x8005da4 ; mbedtls_mpi_cmp_mpi + 44
        0x08005da0:    1e5b        [.      SUBS     r3,r3,#1
        0x08005da2:    d1f9        ..      BNE      0x8005d98 ; mbedtls_mpi_cmp_mpi + 32
        0x08005da4:    ea520503    R...    ORRS     r5,r2,r3
        0x08005da8:    d02a        *.      BEQ      0x8005e00 ; mbedtls_mpi_cmp_mpi + 136
        0x08005daa:    429a        .B      CMP      r2,r3
        0x08005dac:    d901        ..      BLS      0x8005db2 ; mbedtls_mpi_cmp_mpi + 58
        0x08005dae:    6800        .h      LDR      r0,[r0,#0]
        0x08005db0:    bd70        p.      POP      {r4-r6,pc}
        0x08005db2:    4293        .B      CMP      r3,r2
        0x08005db4:    d902        ..      BLS      0x8005dbc ; mbedtls_mpi_cmp_mpi + 68
        0x08005db6:    6808        .h      LDR      r0,[r1,#0]
        0x08005db8:    4240        @B      RSBS     r0,r0,#0
        0x08005dba:    bd70        p.      POP      {r4-r6,pc}
        0x08005dbc:    6803        .h      LDR      r3,[r0,#0]
        0x08005dbe:    2b00        .+      CMP      r3,#0
        0x08005dc0:    dd04        ..      BLE      0x8005dcc ; mbedtls_mpi_cmp_mpi + 84
        0x08005dc2:    680d        .h      LDR      r5,[r1,#0]
        0x08005dc4:    2d00        .-      CMP      r5,#0
        0x08005dc6:    da01        ..      BGE      0x8005dcc ; mbedtls_mpi_cmp_mpi + 84
        0x08005dc8:    2001        .       MOVS     r0,#1
        0x08005dca:    bd70        p.      POP      {r4-r6,pc}
        0x08005dcc:    680d        .h      LDR      r5,[r1,#0]
        0x08005dce:    2d00        .-      CMP      r5,#0
        0x08005dd0:    dd04        ..      BLE      0x8005ddc ; mbedtls_mpi_cmp_mpi + 100
        0x08005dd2:    2b00        .+      CMP      r3,#0
        0x08005dd4:    da02        ..      BGE      0x8005ddc ; mbedtls_mpi_cmp_mpi + 100
        0x08005dd6:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x08005dda:    bd70        p.      POP      {r4-r6,pc}
        0x08005ddc:    b182        ..      CBZ      r2,0x8005e00 ; mbedtls_mpi_cmp_mpi + 136
        0x08005dde:    6885        .h      LDR      r5,[r0,#8]
        0x08005de0:    f8d10008    ....    LDR.W    r0,[r1,#8]
        0x08005de4:    eb040182    ....    ADD      r1,r4,r2,LSL #2
        0x08005de8:    586e        nX      LDR      r6,[r5,r1]
        0x08005dea:    5841        AX      LDR      r1,[r0,r1]
        0x08005dec:    428e        .B      CMP      r6,r1
        0x08005dee:    d901        ..      BLS      0x8005df4 ; mbedtls_mpi_cmp_mpi + 124
        0x08005df0:    4618        .F      MOV      r0,r3
        0x08005df2:    bd70        p.      POP      {r4-r6,pc}
        0x08005df4:    d202        ..      BCS      0x8005dfc ; mbedtls_mpi_cmp_mpi + 132
        0x08005df6:    f1c30000    ....    RSB      r0,r3,#0
        0x08005dfa:    bd70        p.      POP      {r4-r6,pc}
        0x08005dfc:    1e52        R.      SUBS     r2,r2,#1
        0x08005dfe:    d1f1        ..      BNE      0x8005de4 ; mbedtls_mpi_cmp_mpi + 108
        0x08005e00:    2000        .       MOVS     r0,#0
        0x08005e02:    bd70        p.      POP      {r4-r6,pc}
    i.mbedtls_mpi_copy
    mbedtls_mpi_copy
        0x08005e04:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x08005e08:    460e        .F      MOV      r6,r1
        0x08005e0a:    2700        .'      MOVS     r7,#0
        0x08005e0c:    4605        .F      MOV      r5,r0
        0x08005e0e:    42b0        .B      CMP      r0,r6
        0x08005e10:    d102        ..      BNE      0x8005e18 ; mbedtls_mpi_copy + 20
        0x08005e12:    2000        .       MOVS     r0,#0
        0x08005e14:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x08005e18:    68b0        .h      LDR      r0,[r6,#8]
        0x08005e1a:    b108        ..      CBZ      r0,0x8005e20 ; mbedtls_mpi_copy + 28
        0x08005e1c:    6874        th      LDR      r4,[r6,#4]
        0x08005e1e:    e006        ..      B        0x8005e2e ; mbedtls_mpi_copy + 42
        0x08005e20:    4628        (F      MOV      r0,r5
        0x08005e22:    f000f9e0    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08005e26:    e7f4        ..      B        0x8005e12 ; mbedtls_mpi_copy + 14
        0x08005e28:    f8501024    P.$.    LDR      r1,[r0,r4,LSL #2]
        0x08005e2c:    b909        ..      CBNZ     r1,0x8005e32 ; mbedtls_mpi_copy + 46
        0x08005e2e:    1e64        d.      SUBS     r4,r4,#1
        0x08005e30:    d1fa        ..      BNE      0x8005e28 ; mbedtls_mpi_copy + 36
        0x08005e32:    6830        0h      LDR      r0,[r6,#0]
        0x08005e34:    6028        (`      STR      r0,[r5,#0]
        0x08005e36:    6869        ih      LDR      r1,[r5,#4]
        0x08005e38:    1c64        d.      ADDS     r4,r4,#1
        0x08005e3a:    42a1        .B      CMP      r1,r4
        0x08005e3c:    d206        ..      BCS      0x8005e4c ; mbedtls_mpi_copy + 72
        0x08005e3e:    4621        !F      MOV      r1,r4
        0x08005e40:    4628        (F      MOV      r0,r5
        0x08005e42:    f000fa71    ..q.    BL       mbedtls_mpi_grow ; 0x8006328
        0x08005e46:    0007        ..      MOVS     r7,r0
        0x08005e48:    d10c        ..      BNE      0x8005e64 ; mbedtls_mpi_copy + 96
        0x08005e4a:    e006        ..      B        0x8005e5a ; mbedtls_mpi_copy + 86
        0x08005e4c:    68a8        .h      LDR      r0,[r5,#8]
        0x08005e4e:    1b09        ..      SUBS     r1,r1,r4
        0x08005e50:    eb000084    ....    ADD      r0,r0,r4,LSL #2
        0x08005e54:    0089        ..      LSLS     r1,r1,#2
        0x08005e56:    f7fafb81    ....    BL       __aeabi_memclr4 ; 0x800055c
        0x08005e5a:    00a2        ..      LSLS     r2,r4,#2
        0x08005e5c:    68b1        .h      LDR      r1,[r6,#8]
        0x08005e5e:    68a8        .h      LDR      r0,[r5,#8]
        0x08005e60:    f7fafb1d    ....    BL       __aeabi_memcpy4 ; 0x800049e
        0x08005e64:    4638        8F      MOV      r0,r7
        0x08005e66:    e7d5        ..      B        0x8005e14 ; mbedtls_mpi_copy + 16
    i.mbedtls_mpi_div_mpi
    mbedtls_mpi_div_mpi
        0x08005e68:    e92d4fff    -..O    PUSH     {r0-r11,lr}
        0x08005e6c:    b097        ..      SUB      sp,sp,#0x5c
        0x08005e6e:    468a        .F      MOV      r10,r1
        0x08005e70:    4683        .F      MOV      r11,r0
        0x08005e72:    4691        .F      MOV      r9,r2
        0x08005e74:    2100        .!      MOVS     r1,#0
        0x08005e76:    981a        ..      LDR      r0,[sp,#0x68]
        0x08005e78:    f7ffff66    ..f.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08005e7c:    b1e8        ..      CBZ      r0,0x8005eba ; mbedtls_mpi_div_mpi + 82
        0x08005e7e:    a804        ..      ADD      r0,sp,#0x10
        0x08005e80:    f000fa7a    ..z.    BL       mbedtls_mpi_init ; 0x8006378
        0x08005e84:    a807        ..      ADD      r0,sp,#0x1c
        0x08005e86:    f000fa77    ..w.    BL       mbedtls_mpi_init ; 0x8006378
        0x08005e8a:    a80a        ..      ADD      r0,sp,#0x28
        0x08005e8c:    f000fa74    ..t.    BL       mbedtls_mpi_init ; 0x8006378
        0x08005e90:    a80d        ..      ADD      r0,sp,#0x34
        0x08005e92:    f000fa71    ..q.    BL       mbedtls_mpi_init ; 0x8006378
        0x08005e96:    a810        ..      ADD      r0,sp,#0x40
        0x08005e98:    f000fa6e    ..n.    BL       mbedtls_mpi_init ; 0x8006378
        0x08005e9c:    4648        HF      MOV      r0,r9
        0x08005e9e:    991a        ..      LDR      r1,[sp,#0x68]
        0x08005ea0:    f7ffff20    .. .    BL       mbedtls_mpi_cmp_abs ; 0x8005ce4
        0x08005ea4:    2800        .(      CMP      r0,#0
        0x08005ea6:    da17        ..      BGE      0x8005ed8 ; mbedtls_mpi_div_mpi + 112
        0x08005ea8:    f1bb0000    ....    SUBS     r0,r11,#0
        0x08005eac:    d00a        ..      BEQ      0x8005ec4 ; mbedtls_mpi_div_mpi + 92
        0x08005eae:    2100        .!      MOVS     r1,#0
        0x08005eb0:    f000fbb4    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x08005eb4:    0004        ..      MOVS     r4,r0
        0x08005eb6:    d179        y.      BNE      0x8005fac ; mbedtls_mpi_div_mpi + 324
        0x08005eb8:    e004        ..      B        0x8005ec4 ; mbedtls_mpi_div_mpi + 92
        0x08005eba:    f06f000b    o...    MVN      r0,#0xb
        0x08005ebe:    b01b        ..      ADD      sp,sp,#0x6c
        0x08005ec0:    e8bd8ff0    ....    POP      {r4-r11,pc}
        0x08005ec4:    f1ba0000    ....    SUBS     r0,r10,#0
        0x08005ec8:    d004        ..      BEQ      0x8005ed4 ; mbedtls_mpi_div_mpi + 108
        0x08005eca:    4649        IF      MOV      r1,r9
        0x08005ecc:    f7ffff9a    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08005ed0:    0004        ..      MOVS     r4,r0
        0x08005ed2:    d1f0        ..      BNE      0x8005eb6 ; mbedtls_mpi_div_mpi + 78
        0x08005ed4:    2000        .       MOVS     r0,#0
        0x08005ed6:    e7f2        ..      B        0x8005ebe ; mbedtls_mpi_div_mpi + 86
        0x08005ed8:    4649        IF      MOV      r1,r9
        0x08005eda:    a804        ..      ADD      r0,sp,#0x10
        0x08005edc:    f7ffff92    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08005ee0:    0004        ..      MOVS     r4,r0
        0x08005ee2:    d1e8        ..      BNE      0x8005eb6 ; mbedtls_mpi_div_mpi + 78
        0x08005ee4:    a807        ..      ADD      r0,sp,#0x1c
        0x08005ee6:    991a        ..      LDR      r1,[sp,#0x68]
        0x08005ee8:    f7ffff8c    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08005eec:    0004        ..      MOVS     r4,r0
        0x08005eee:    d1e2        ..      BNE      0x8005eb6 ; mbedtls_mpi_div_mpi + 78
        0x08005ef0:    2001        .       MOVS     r0,#1
        0x08005ef2:    9007        ..      STR      r0,[sp,#0x1c]
        0x08005ef4:    9004        ..      STR      r0,[sp,#0x10]
        0x08005ef6:    f8d91004    ....    LDR      r1,[r9,#4]
        0x08005efa:    a80a        ..      ADD      r0,sp,#0x28
        0x08005efc:    1c89        ..      ADDS     r1,r1,#2
        0x08005efe:    f000fa13    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x08005f02:    0004        ..      MOVS     r4,r0
        0x08005f04:    d1d7        ..      BNE      0x8005eb6 ; mbedtls_mpi_div_mpi + 78
        0x08005f06:    2100        .!      MOVS     r1,#0
        0x08005f08:    a80a        ..      ADD      r0,sp,#0x28
        0x08005f0a:    f000fb87    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x08005f0e:    0004        ..      MOVS     r4,r0
        0x08005f10:    d1d1        ..      BNE      0x8005eb6 ; mbedtls_mpi_div_mpi + 78
        0x08005f12:    2102        .!      MOVS     r1,#2
        0x08005f14:    a80d        ..      ADD      r0,sp,#0x34
        0x08005f16:    f000fa07    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x08005f1a:    0004        ..      MOVS     r4,r0
        0x08005f1c:    d1cb        ..      BNE      0x8005eb6 ; mbedtls_mpi_div_mpi + 78
        0x08005f1e:    2103        .!      MOVS     r1,#3
        0x08005f20:    a810        ..      ADD      r0,sp,#0x40
        0x08005f22:    f000fa01    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x08005f26:    0004        ..      MOVS     r4,r0
        0x08005f28:    d1c5        ..      BNE      0x8005eb6 ; mbedtls_mpi_div_mpi + 78
        0x08005f2a:    a807        ..      ADD      r0,sp,#0x1c
        0x08005f2c:    f7fffebb    ....    BL       mbedtls_mpi_bitlen ; 0x8005ca6
        0x08005f30:    f000001f    ....    AND      r0,r0,#0x1f
        0x08005f34:    281f        .(      CMP      r0,#0x1f
        0x08005f36:    d20f        ..      BCS      0x8005f58 ; mbedtls_mpi_div_mpi + 240
        0x08005f38:    f1c0001f    ....    RSB      r0,r0,#0x1f
        0x08005f3c:    4601        .F      MOV      r1,r0
        0x08005f3e:    9015        ..      STR      r0,[sp,#0x54]
        0x08005f40:    a804        ..      ADD      r0,sp,#0x10
        0x08005f42:    f000fdbf    ....    BL       mbedtls_mpi_shift_l ; 0x8006ac4
        0x08005f46:    0004        ..      MOVS     r4,r0
        0x08005f48:    d1b5        ..      BNE      0x8005eb6 ; mbedtls_mpi_div_mpi + 78
        0x08005f4a:    a807        ..      ADD      r0,sp,#0x1c
        0x08005f4c:    9915        ..      LDR      r1,[sp,#0x54]
        0x08005f4e:    f000fdb9    ....    BL       mbedtls_mpi_shift_l ; 0x8006ac4
        0x08005f52:    0004        ..      MOVS     r4,r0
        0x08005f54:    d1af        ..      BNE      0x8005eb6 ; mbedtls_mpi_div_mpi + 78
        0x08005f56:    e001        ..      B        0x8005f5c ; mbedtls_mpi_div_mpi + 244
        0x08005f58:    2000        .       MOVS     r0,#0
        0x08005f5a:    9015        ..      STR      r0,[sp,#0x54]
        0x08005f5c:    9d05        ..      LDR      r5,[sp,#0x14]
        0x08005f5e:    9e08        ..      LDR      r6,[sp,#0x20]
        0x08005f60:    1e6d        m.      SUBS     r5,r5,#1
        0x08005f62:    1e76        v.      SUBS     r6,r6,#1
        0x08005f64:    1baf        ..      SUBS     r7,r5,r6
        0x08005f66:    0179        y.      LSLS     r1,r7,#5
        0x08005f68:    4688        .F      MOV      r8,r1
        0x08005f6a:    a807        ..      ADD      r0,sp,#0x1c
        0x08005f6c:    f000fdaa    ....    BL       mbedtls_mpi_shift_l ; 0x8006ac4
        0x08005f70:    e00b        ..      B        0x8005f8a ; mbedtls_mpi_div_mpi + 290
        0x08005f72:    980c        ..      LDR      r0,[sp,#0x30]
        0x08005f74:    990c        ..      LDR      r1,[sp,#0x30]
        0x08005f76:    aa07        ..      ADD      r2,sp,#0x1c
        0x08005f78:    f8500027    P.'.    LDR      r0,[r0,r7,LSL #2]
        0x08005f7c:    1c40        @.      ADDS     r0,r0,#1
        0x08005f7e:    f8410027    A.'.    STR      r0,[r1,r7,LSL #2]
        0x08005f82:    a904        ..      ADD      r1,sp,#0x10
        0x08005f84:    4608        .F      MOV      r0,r1
        0x08005f86:    f000feb9    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x08005f8a:    0004        ..      MOVS     r4,r0
        0x08005f8c:    d193        ..      BNE      0x8005eb6 ; mbedtls_mpi_div_mpi + 78
        0x08005f8e:    a907        ..      ADD      r1,sp,#0x1c
        0x08005f90:    a804        ..      ADD      r0,sp,#0x10
        0x08005f92:    f7fffef1    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08005f96:    2800        .(      CMP      r0,#0
        0x08005f98:    daeb        ..      BGE      0x8005f72 ; mbedtls_mpi_div_mpi + 266
        0x08005f9a:    4641        AF      MOV      r1,r8
        0x08005f9c:    a807        ..      ADD      r0,sp,#0x1c
        0x08005f9e:    f000fde1    ....    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x08005fa2:    0004        ..      MOVS     r4,r0
        0x08005fa4:    d187        ..      BNE      0x8005eb6 ; mbedtls_mpi_div_mpi + 78
        0x08005fa6:    f06f0803    o...    MVN      r8,#3
        0x08005faa:    e0ad        ..      B        0x8006108 ; mbedtls_mpi_div_mpi + 672
        0x08005fac:    e0b6        ..      B        0x800611c ; mbedtls_mpi_div_mpi + 692
        0x08005fae:    9806        ..      LDR      r0,[sp,#0x18]
        0x08005fb0:    f8501025    P.%.    LDR      r1,[r0,r5,LSL #2]
        0x08005fb4:    9809        ..      LDR      r0,[sp,#0x24]
        0x08005fb6:    f8502026    P.&     LDR      r2,[r0,r6,LSL #2]
        0x08005fba:    4291        .B      CMP      r1,r2
        0x08005fbc:    d307        ..      BCC      0x8005fce ; mbedtls_mpi_div_mpi + 358
        0x08005fbe:    1ba8        ..      SUBS     r0,r5,r6
        0x08005fc0:    9b0c        ..      LDR      r3,[sp,#0x30]
        0x08005fc2:    eb080080    ....    ADD      r0,r8,r0,LSL #2
        0x08005fc6:    f04f31ff    O..1    MOV      r1,#0xffffffff
        0x08005fca:    5019        .P      STR      r1,[r3,r0]
        0x08005fcc:    e015        ..      B        0x8005ffa ; mbedtls_mpi_div_mpi + 402
        0x08005fce:    9b06        ..      LDR      r3,[sp,#0x18]
        0x08005fd0:    eb080085    ....    ADD      r0,r8,r5,LSL #2
        0x08005fd4:    5818        .X      LDR      r0,[r3,r0]
        0x08005fd6:    b14a        J.      CBZ      r2,0x8005fec ; mbedtls_mpi_div_mpi + 388
        0x08005fd8:    4291        .B      CMP      r1,r2
        0x08005fda:    d207        ..      BCS      0x8005fec ; mbedtls_mpi_div_mpi + 388
        0x08005fdc:    2300        .#      MOVS     r3,#0
        0x08005fde:    f7faf983    ....    BL       __aeabi_uldivmod ; 0x80002e8
        0x08005fe2:    2200        ."      MOVS     r2,#0
        0x08005fe4:    f1d033ff    ...3    RSBS     r3,r0,#0xffffffff
        0x08005fe8:    418a        .A      SBCS     r2,r2,r1
        0x08005fea:    d201        ..      BCS      0x8005ff0 ; mbedtls_mpi_div_mpi + 392
        0x08005fec:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x08005ff0:    1bab        ..      SUBS     r3,r5,r6
        0x08005ff2:    9a0c        ..      LDR      r2,[sp,#0x30]
        0x08005ff4:    eb080183    ....    ADD      r1,r8,r3,LSL #2
        0x08005ff8:    5050        PP      STR      r0,[r2,r1]
        0x08005ffa:    1ba9        ..      SUBS     r1,r5,r6
        0x08005ffc:    9a0c        ..      LDR      r2,[sp,#0x30]
        0x08005ffe:    eb080781    ....    ADD      r7,r8,r1,LSL #2
        0x08006002:    9114        ..      STR      r1,[sp,#0x50]
        0x08006004:    59d1        .Y      LDR      r1,[r2,r7]
        0x08006006:    1c49        I.      ADDS     r1,r1,#1
        0x08006008:    51d1        .Q      STR      r1,[r2,r7]
        0x0800600a:    980c        ..      LDR      r0,[sp,#0x30]
        0x0800600c:    990c        ..      LDR      r1,[sp,#0x30]
        0x0800600e:    59c0        .Y      LDR      r0,[r0,r7]
        0x08006010:    1e40        @.      SUBS     r0,r0,#1
        0x08006012:    51c8        .Q      STR      r0,[r1,r7]
        0x08006014:    2100        .!      MOVS     r1,#0
        0x08006016:    a80d        ..      ADD      r0,sp,#0x34
        0x08006018:    f000fb00    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x0800601c:    0004        ..      MOVS     r4,r0
        0x0800601e:    d17d        }.      BNE      0x800611c ; mbedtls_mpi_div_mpi + 692
        0x08006020:    b19e        ..      CBZ      r6,0x800604a ; mbedtls_mpi_div_mpi + 482
        0x08006022:    9909        ..      LDR      r1,[sp,#0x24]
        0x08006024:    eb080086    ....    ADD      r0,r8,r6,LSL #2
        0x08006028:    5808        .X      LDR      r0,[r1,r0]
        0x0800602a:    990f        ..      LDR      r1,[sp,#0x3c]
        0x0800602c:    6008        .`      STR      r0,[r1,#0]
        0x0800602e:    9809        ..      LDR      r0,[sp,#0x24]
        0x08006030:    f8501026    P.&.    LDR      r1,[r0,r6,LSL #2]
        0x08006034:    980f        ..      LDR      r0,[sp,#0x3c]
        0x08006036:    6041        A`      STR      r1,[r0,#4]
        0x08006038:    980c        ..      LDR      r0,[sp,#0x30]
        0x0800603a:    a90d        ..      ADD      r1,sp,#0x34
        0x0800603c:    59c2        .Y      LDR      r2,[r0,r7]
        0x0800603e:    4608        .F      MOV      r0,r1
        0x08006040:    f000fb3a    ..:.    BL       mbedtls_mpi_mul_int ; 0x80066b8
        0x08006044:    0004        ..      MOVS     r4,r0
        0x08006046:    d169        i.      BNE      0x800611c ; mbedtls_mpi_div_mpi + 692
        0x08006048:    e001        ..      B        0x800604e ; mbedtls_mpi_div_mpi + 486
        0x0800604a:    2000        .       MOVS     r0,#0
        0x0800604c:    e7ed        ..      B        0x800602a ; mbedtls_mpi_div_mpi + 450
        0x0800604e:    2100        .!      MOVS     r1,#0
        0x08006050:    a810        ..      ADD      r0,sp,#0x40
        0x08006052:    f000fae3    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x08006056:    0004        ..      MOVS     r4,r0
        0x08006058:    d160        `.      BNE      0x800611c ; mbedtls_mpi_div_mpi + 692
        0x0800605a:    2d02        .-      CMP      r5,#2
        0x0800605c:    d200        ..      BCS      0x8006060 ; mbedtls_mpi_div_mpi + 504
        0x0800605e:    e005        ..      B        0x800606c ; mbedtls_mpi_div_mpi + 516
        0x08006060:    f06f0107    o...    MVN      r1,#7
        0x08006064:    9806        ..      LDR      r0,[sp,#0x18]
        0x08006066:    eb010185    ....    ADD      r1,r1,r5,LSL #2
        0x0800606a:    5840        @X      LDR      r0,[r0,r1]
        0x0800606c:    9912        ..      LDR      r1,[sp,#0x48]
        0x0800606e:    6008        .`      STR      r0,[r1,#0]
        0x08006070:    b1cd        ..      CBZ      r5,0x80060a6 ; mbedtls_mpi_div_mpi + 574
        0x08006072:    9906        ..      LDR      r1,[sp,#0x18]
        0x08006074:    eb080085    ....    ADD      r0,r8,r5,LSL #2
        0x08006078:    5808        .X      LDR      r0,[r1,r0]
        0x0800607a:    9912        ..      LDR      r1,[sp,#0x48]
        0x0800607c:    6048        H`      STR      r0,[r1,#4]
        0x0800607e:    9806        ..      LDR      r0,[sp,#0x18]
        0x08006080:    9912        ..      LDR      r1,[sp,#0x48]
        0x08006082:    f8500025    P.%.    LDR      r0,[r0,r5,LSL #2]
        0x08006086:    6088        .`      STR      r0,[r1,#8]
        0x08006088:    a910        ..      ADD      r1,sp,#0x40
        0x0800608a:    a80d        ..      ADD      r0,sp,#0x34
        0x0800608c:    f7fffe74    ..t.    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08006090:    2800        .(      CMP      r0,#0
        0x08006092:    dcba        ..      BGT      0x800600a ; mbedtls_mpi_div_mpi + 418
        0x08006094:    980c        ..      LDR      r0,[sp,#0x30]
        0x08006096:    a907        ..      ADD      r1,sp,#0x1c
        0x08006098:    59c2        .Y      LDR      r2,[r0,r7]
        0x0800609a:    a80d        ..      ADD      r0,sp,#0x34
        0x0800609c:    f000fb0c    ....    BL       mbedtls_mpi_mul_int ; 0x80066b8
        0x080060a0:    0004        ..      MOVS     r4,r0
        0x080060a2:    d15f        _.      BNE      0x8006164 ; mbedtls_mpi_div_mpi + 764
        0x080060a4:    e001        ..      B        0x80060aa ; mbedtls_mpi_div_mpi + 578
        0x080060a6:    2000        .       MOVS     r0,#0
        0x080060a8:    e7e7        ..      B        0x800607a ; mbedtls_mpi_div_mpi + 530
        0x080060aa:    9814        ..      LDR      r0,[sp,#0x50]
        0x080060ac:    0141        A.      LSLS     r1,r0,#5
        0x080060ae:    3920         9      SUBS     r1,r1,#0x20
        0x080060b0:    a80d        ..      ADD      r0,sp,#0x34
        0x080060b2:    9100        ..      STR      r1,[sp,#0]
        0x080060b4:    f000fd06    ....    BL       mbedtls_mpi_shift_l ; 0x8006ac4
        0x080060b8:    0004        ..      MOVS     r4,r0
        0x080060ba:    d153        S.      BNE      0x8006164 ; mbedtls_mpi_div_mpi + 764
        0x080060bc:    a904        ..      ADD      r1,sp,#0x10
        0x080060be:    aa0d        ..      ADD      r2,sp,#0x34
        0x080060c0:    4608        .F      MOV      r0,r1
        0x080060c2:    f000fe1b    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x080060c6:    0004        ..      MOVS     r4,r0
        0x080060c8:    d14c        L.      BNE      0x8006164 ; mbedtls_mpi_div_mpi + 764
        0x080060ca:    2100        .!      MOVS     r1,#0
        0x080060cc:    a804        ..      ADD      r0,sp,#0x10
        0x080060ce:    f7fffe3b    ..;.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080060d2:    2800        .(      CMP      r0,#0
        0x080060d4:    da17        ..      BGE      0x8006106 ; mbedtls_mpi_div_mpi + 670
        0x080060d6:    a907        ..      ADD      r1,sp,#0x1c
        0x080060d8:    a80d        ..      ADD      r0,sp,#0x34
        0x080060da:    f7fffe93    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x080060de:    0004        ..      MOVS     r4,r0
        0x080060e0:    d140        @.      BNE      0x8006164 ; mbedtls_mpi_div_mpi + 764
        0x080060e2:    a80d        ..      ADD      r0,sp,#0x34
        0x080060e4:    9900        ..      LDR      r1,[sp,#0]
        0x080060e6:    f000fced    ....    BL       mbedtls_mpi_shift_l ; 0x8006ac4
        0x080060ea:    0004        ..      MOVS     r4,r0
        0x080060ec:    d13a        :.      BNE      0x8006164 ; mbedtls_mpi_div_mpi + 764
        0x080060ee:    a904        ..      ADD      r1,sp,#0x10
        0x080060f0:    aa0d        ..      ADD      r2,sp,#0x34
        0x080060f2:    4608        .F      MOV      r0,r1
        0x080060f4:    f7fffdb0    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x080060f8:    0004        ..      MOVS     r4,r0
        0x080060fa:    d133        3.      BNE      0x8006164 ; mbedtls_mpi_div_mpi + 764
        0x080060fc:    980c        ..      LDR      r0,[sp,#0x30]
        0x080060fe:    990c        ..      LDR      r1,[sp,#0x30]
        0x08006100:    59c0        .Y      LDR      r0,[r0,r7]
        0x08006102:    1e40        @.      SUBS     r0,r0,#1
        0x08006104:    51c8        .Q      STR      r0,[r1,r7]
        0x08006106:    1e6d        m.      SUBS     r5,r5,#1
        0x08006108:    42b5        .B      CMP      r5,r6
        0x0800610a:    f63faf50    ?.P.    BHI      0x8005fae ; mbedtls_mpi_div_mpi + 326
        0x0800610e:    f1bb0000    ....    SUBS     r0,r11,#0
        0x08006112:    d00d        ..      BEQ      0x8006130 ; mbedtls_mpi_div_mpi + 712
        0x08006114:    a90a        ..      ADD      r1,sp,#0x28
        0x08006116:    f7fffe75    ..u.    BL       mbedtls_mpi_copy ; 0x8005e04
        0x0800611a:    e000        ..      B        0x800611e ; mbedtls_mpi_div_mpi + 694
        0x0800611c:    e022        ".      B        0x8006164 ; mbedtls_mpi_div_mpi + 764
        0x0800611e:    0004        ..      MOVS     r4,r0
        0x08006120:    d120         .      BNE      0x8006164 ; mbedtls_mpi_div_mpi + 764
        0x08006122:    991a        ..      LDR      r1,[sp,#0x68]
        0x08006124:    f8d90000    ....    LDR      r0,[r9,#0]
        0x08006128:    6809        .h      LDR      r1,[r1,#0]
        0x0800612a:    4348        HC      MULS     r0,r1,r0
        0x0800612c:    f8cb0000    ....    STR      r0,[r11,#0]
        0x08006130:    f1ba0f00    ....    CMP      r10,#0
        0x08006134:    d016        ..      BEQ      0x8006164 ; mbedtls_mpi_div_mpi + 764
        0x08006136:    a804        ..      ADD      r0,sp,#0x10
        0x08006138:    9915        ..      LDR      r1,[sp,#0x54]
        0x0800613a:    f000fd13    ....    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x0800613e:    0004        ..      MOVS     r4,r0
        0x08006140:    d110        ..      BNE      0x8006164 ; mbedtls_mpi_div_mpi + 764
        0x08006142:    f8d90000    ....    LDR      r0,[r9,#0]
        0x08006146:    9004        ..      STR      r0,[sp,#0x10]
        0x08006148:    a904        ..      ADD      r1,sp,#0x10
        0x0800614a:    4650        PF      MOV      r0,r10
        0x0800614c:    f7fffe5a    ..Z.    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08006150:    0004        ..      MOVS     r4,r0
        0x08006152:    d107        ..      BNE      0x8006164 ; mbedtls_mpi_div_mpi + 764
        0x08006154:    2100        .!      MOVS     r1,#0
        0x08006156:    4650        PF      MOV      r0,r10
        0x08006158:    f7fffdf6    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x0800615c:    b910        ..      CBNZ     r0,0x8006164 ; mbedtls_mpi_div_mpi + 764
        0x0800615e:    2001        .       MOVS     r0,#1
        0x08006160:    f8ca0000    ....    STR      r0,[r10,#0]
        0x08006164:    a804        ..      ADD      r0,sp,#0x10
        0x08006166:    f000f83e    ..>.    BL       mbedtls_mpi_free ; 0x80061e6
        0x0800616a:    a807        ..      ADD      r0,sp,#0x1c
        0x0800616c:    f000f83b    ..;.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08006170:    a80a        ..      ADD      r0,sp,#0x28
        0x08006172:    f000f838    ..8.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08006176:    a80d        ..      ADD      r0,sp,#0x34
        0x08006178:    f000f835    ..5.    BL       mbedtls_mpi_free ; 0x80061e6
        0x0800617c:    a810        ..      ADD      r0,sp,#0x40
        0x0800617e:    f000f832    ..2.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08006182:    4620         F      MOV      r0,r4
        0x08006184:    e69b        ..      B        0x8005ebe ; mbedtls_mpi_div_mpi + 86
    i.mbedtls_mpi_fill_random
    mbedtls_mpi_fill_random
        0x08006186:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x0800618a:    4606        .F      MOV      r6,r0
        0x0800618c:    469a        .F      MOV      r10,r3
        0x0800618e:    4691        .F      MOV      r9,r2
        0x08006190:    460c        .F      MOV      r4,r1
        0x08006192:    0788        ..      LSLS     r0,r1,#30
        0x08006194:    d000        ..      BEQ      0x8006198 ; mbedtls_mpi_fill_random + 18
        0x08006196:    2001        .       MOVS     r0,#1
        0x08006198:    eb000594    ....    ADD      r5,r0,r4,LSR #2
        0x0800619c:    6870        ph      LDR      r0,[r6,#4]
        0x0800619e:    ebc40885    ....    RSB      r8,r4,r5,LSL #2
        0x080061a2:    42a8        .B      CMP      r0,r5
        0x080061a4:    d00b        ..      BEQ      0x80061be ; mbedtls_mpi_fill_random + 56
        0x080061a6:    4630        0F      MOV      r0,r6
        0x080061a8:    f000f81d    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080061ac:    4630        0F      MOV      r0,r6
        0x080061ae:    f000f8e3    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x080061b2:    4629        )F      MOV      r1,r5
        0x080061b4:    4630        0F      MOV      r0,r6
        0x080061b6:    f000f8b7    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x080061ba:    0007        ..      MOVS     r7,r0
        0x080061bc:    d110        ..      BNE      0x80061e0 ; mbedtls_mpi_fill_random + 90
        0x080061be:    2100        .!      MOVS     r1,#0
        0x080061c0:    4630        0F      MOV      r0,r6
        0x080061c2:    f000fa2b    ..+.    BL       mbedtls_mpi_lset ; 0x800661c
        0x080061c6:    0007        ..      MOVS     r7,r0
        0x080061c8:    d10a        ..      BNE      0x80061e0 ; mbedtls_mpi_fill_random + 90
        0x080061ca:    68b0        .h      LDR      r0,[r6,#8]
        0x080061cc:    4622        "F      MOV      r2,r4
        0x080061ce:    eb000108    ....    ADD      r1,r0,r8
        0x080061d2:    4650        PF      MOV      r0,r10
        0x080061d4:    464b        KF      MOV      r3,r9
        0x080061d6:    4798        .G      BLX      r3
        0x080061d8:    4629        )F      MOV      r1,r5
        0x080061da:    68b0        .h      LDR      r0,[r6,#8]
        0x080061dc:    f000ff0e    ....    BL       mpi_bigendian_to_host ; 0x8006ffc
        0x080061e0:    4638        8F      MOV      r0,r7
        0x080061e2:    e8bd87f0    ....    POP      {r4-r10,pc}
    i.mbedtls_mpi_free
    mbedtls_mpi_free
        0x080061e6:    b510        ..      PUSH     {r4,lr}
        0x080061e8:    0004        ..      MOVS     r4,r0
        0x080061ea:    d00c        ..      BEQ      0x8006206 ; mbedtls_mpi_free + 32
        0x080061ec:    68a0        .h      LDR      r0,[r4,#8]
        0x080061ee:    b128        (.      CBZ      r0,0x80061fc ; mbedtls_mpi_free + 22
        0x080061f0:    6861        ah      LDR      r1,[r4,#4]
        0x080061f2:    f7fbff02    ....    BL       mbedtls_mpi_zeroize ; 0x8001ffa
        0x080061f6:    68a0        .h      LDR      r0,[r4,#8]
        0x080061f8:    f7faf84f    ..O.    BL       free ; 0x800029a
        0x080061fc:    2001        .       MOVS     r0,#1
        0x080061fe:    6020         `      STR      r0,[r4,#0]
        0x08006200:    2000        .       MOVS     r0,#0
        0x08006202:    6060        ``      STR      r0,[r4,#4]
        0x08006204:    60a0        .`      STR      r0,[r4,#8]
        0x08006206:    bd10        ..      POP      {r4,pc}
    i.mbedtls_mpi_gcd
    mbedtls_mpi_gcd
        0x08006208:    b570        p.      PUSH     {r4-r6,lr}
        0x0800620a:    b08a        ..      SUB      sp,sp,#0x28
        0x0800620c:    4615        .F      MOV      r5,r2
        0x0800620e:    4606        .F      MOV      r6,r0
        0x08006210:    460a        .F      MOV      r2,r1
        0x08006212:    a806        ..      ADD      r0,sp,#0x18
        0x08006214:    f000f8b0    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08006218:    a803        ..      ADD      r0,sp,#0xc
        0x0800621a:    f000f8ad    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x0800621e:    4668        hF      MOV      r0,sp
        0x08006220:    f000f8aa    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x08006224:    4611        .F      MOV      r1,r2
        0x08006226:    a803        ..      ADD      r0,sp,#0xc
        0x08006228:    f7fffdec    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x0800622c:    0004        ..      MOVS     r4,r0
        0x0800622e:    d15f        _.      BNE      0x80062f0 ; mbedtls_mpi_gcd + 232
        0x08006230:    4629        )F      MOV      r1,r5
        0x08006232:    4668        hF      MOV      r0,sp
        0x08006234:    f7fffde6    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08006238:    0004        ..      MOVS     r4,r0
        0x0800623a:    d159        Y.      BNE      0x80062f0 ; mbedtls_mpi_gcd + 232
        0x0800623c:    a803        ..      ADD      r0,sp,#0xc
        0x0800623e:    f000f9d5    ....    BL       mbedtls_mpi_lsb ; 0x80065ec
        0x08006242:    4605        .F      MOV      r5,r0
        0x08006244:    4668        hF      MOV      r0,sp
        0x08006246:    f000f9d1    ....    BL       mbedtls_mpi_lsb ; 0x80065ec
        0x0800624a:    42a8        .B      CMP      r0,r5
        0x0800624c:    d200        ..      BCS      0x8006250 ; mbedtls_mpi_gcd + 72
        0x0800624e:    4605        .F      MOV      r5,r0
        0x08006250:    4629        )F      MOV      r1,r5
        0x08006252:    a803        ..      ADD      r0,sp,#0xc
        0x08006254:    f000fc86    ....    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x08006258:    0004        ..      MOVS     r4,r0
        0x0800625a:    d149        I.      BNE      0x80062f0 ; mbedtls_mpi_gcd + 232
        0x0800625c:    4629        )F      MOV      r1,r5
        0x0800625e:    4668        hF      MOV      r0,sp
        0x08006260:    f000fc80    ....    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x08006264:    0004        ..      MOVS     r4,r0
        0x08006266:    d143        C.      BNE      0x80062f0 ; mbedtls_mpi_gcd + 232
        0x08006268:    2001        .       MOVS     r0,#1
        0x0800626a:    9000        ..      STR      r0,[sp,#0]
        0x0800626c:    9003        ..      STR      r0,[sp,#0xc]
        0x0800626e:    e02e        ..      B        0x80062ce ; mbedtls_mpi_gcd + 198
        0x08006270:    a803        ..      ADD      r0,sp,#0xc
        0x08006272:    f000f9bb    ....    BL       mbedtls_mpi_lsb ; 0x80065ec
        0x08006276:    4601        .F      MOV      r1,r0
        0x08006278:    a803        ..      ADD      r0,sp,#0xc
        0x0800627a:    f000fc73    ..s.    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x0800627e:    0004        ..      MOVS     r4,r0
        0x08006280:    d136        6.      BNE      0x80062f0 ; mbedtls_mpi_gcd + 232
        0x08006282:    4668        hF      MOV      r0,sp
        0x08006284:    f000f9b2    ....    BL       mbedtls_mpi_lsb ; 0x80065ec
        0x08006288:    4601        .F      MOV      r1,r0
        0x0800628a:    4668        hF      MOV      r0,sp
        0x0800628c:    f000fc6a    ..j.    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x08006290:    0004        ..      MOVS     r4,r0
        0x08006292:    d12d        -.      BNE      0x80062f0 ; mbedtls_mpi_gcd + 232
        0x08006294:    4669        iF      MOV      r1,sp
        0x08006296:    a803        ..      ADD      r0,sp,#0xc
        0x08006298:    f7fffd6e    ..n.    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x0800629c:    2800        .(      CMP      r0,#0
        0x0800629e:    db09        ..      BLT      0x80062b4 ; mbedtls_mpi_gcd + 172
        0x080062a0:    a903        ..      ADD      r1,sp,#0xc
        0x080062a2:    466a        jF      MOV      r2,sp
        0x080062a4:    4608        .F      MOV      r0,r1
        0x080062a6:    f000fcda    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x080062aa:    0004        ..      MOVS     r4,r0
        0x080062ac:    d120         .      BNE      0x80062f0 ; mbedtls_mpi_gcd + 232
        0x080062ae:    2101        .!      MOVS     r1,#1
        0x080062b0:    a803        ..      ADD      r0,sp,#0xc
        0x080062b2:    e008        ..      B        0x80062c6 ; mbedtls_mpi_gcd + 190
        0x080062b4:    4669        iF      MOV      r1,sp
        0x080062b6:    aa03        ..      ADD      r2,sp,#0xc
        0x080062b8:    4608        .F      MOV      r0,r1
        0x080062ba:    f000fcd0    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x080062be:    0004        ..      MOVS     r4,r0
        0x080062c0:    d116        ..      BNE      0x80062f0 ; mbedtls_mpi_gcd + 232
        0x080062c2:    2101        .!      MOVS     r1,#1
        0x080062c4:    4668        hF      MOV      r0,sp
        0x080062c6:    f000fc4d    ..M.    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x080062ca:    0004        ..      MOVS     r4,r0
        0x080062cc:    d110        ..      BNE      0x80062f0 ; mbedtls_mpi_gcd + 232
        0x080062ce:    2100        .!      MOVS     r1,#0
        0x080062d0:    a803        ..      ADD      r0,sp,#0xc
        0x080062d2:    f7fffd39    ..9.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080062d6:    2800        .(      CMP      r0,#0
        0x080062d8:    d1ca        ..      BNE      0x8006270 ; mbedtls_mpi_gcd + 104
        0x080062da:    4629        )F      MOV      r1,r5
        0x080062dc:    4668        hF      MOV      r0,sp
        0x080062de:    f000fbf1    ....    BL       mbedtls_mpi_shift_l ; 0x8006ac4
        0x080062e2:    0004        ..      MOVS     r4,r0
        0x080062e4:    d104        ..      BNE      0x80062f0 ; mbedtls_mpi_gcd + 232
        0x080062e6:    4669        iF      MOV      r1,sp
        0x080062e8:    4630        0F      MOV      r0,r6
        0x080062ea:    f7fffd8b    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x080062ee:    4604        .F      MOV      r4,r0
        0x080062f0:    a806        ..      ADD      r0,sp,#0x18
        0x080062f2:    f7ffff78    ..x.    BL       mbedtls_mpi_free ; 0x80061e6
        0x080062f6:    a803        ..      ADD      r0,sp,#0xc
        0x080062f8:    f7ffff75    ..u.    BL       mbedtls_mpi_free ; 0x80061e6
        0x080062fc:    4668        hF      MOV      r0,sp
        0x080062fe:    f7ffff72    ..r.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08006302:    b00a        ..      ADD      sp,sp,#0x28
        0x08006304:    4620         F      MOV      r0,r4
        0x08006306:    bd70        p.      POP      {r4-r6,pc}
    i.mbedtls_mpi_get_bit
    mbedtls_mpi_get_bit
        0x08006308:    6842        Bh      LDR      r2,[r0,#4]
        0x0800630a:    ebb11f42    ..B.    CMP      r1,r2,LSL #5
        0x0800630e:    d301        ..      BCC      0x8006314 ; mbedtls_mpi_get_bit + 12
        0x08006310:    2000        .       MOVS     r0,#0
        0x08006312:    4770        pG      BX       lr
        0x08006314:    6880        .h      LDR      r0,[r0,#8]
        0x08006316:    094a        J.      LSRS     r2,r1,#5
        0x08006318:    f001011f    ....    AND      r1,r1,#0x1f
        0x0800631c:    f8500022    P.".    LDR      r0,[r0,r2,LSL #2]
        0x08006320:    40c8        .@      LSRS     r0,r0,r1
        0x08006322:    f0000001    ....    AND      r0,r0,#1
        0x08006326:    4770        pG      BX       lr
    i.mbedtls_mpi_grow
    mbedtls_mpi_grow
        0x08006328:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0800632c:    4604        .F      MOV      r4,r0
        0x0800632e:    f2427010    B..p    MOV      r0,#0x2710
        0x08006332:    460d        .F      MOV      r5,r1
        0x08006334:    f06f070f    o...    MVN      r7,#0xf
        0x08006338:    4281        .B      CMP      r1,r0
        0x0800633a:    d81b        ..      BHI      0x8006374 ; mbedtls_mpi_grow + 76
        0x0800633c:    6860        `h      LDR      r0,[r4,#4]
        0x0800633e:    42a8        .B      CMP      r0,r5
        0x08006340:    d215        ..      BCS      0x800636e ; mbedtls_mpi_grow + 70
        0x08006342:    2104        .!      MOVS     r1,#4
        0x08006344:    4628        (F      MOV      r0,r5
        0x08006346:    f7f9ff65    ..e.    BL       calloc ; 0x8000214
        0x0800634a:    0006        ..      MOVS     r6,r0
        0x0800634c:    d012        ..      BEQ      0x8006374 ; mbedtls_mpi_grow + 76
        0x0800634e:    68a1        .h      LDR      r1,[r4,#8]
        0x08006350:    b159        Y.      CBZ      r1,0x800636a ; mbedtls_mpi_grow + 66
        0x08006352:    6860        `h      LDR      r0,[r4,#4]
        0x08006354:    0082        ..      LSLS     r2,r0,#2
        0x08006356:    4630        0F      MOV      r0,r6
        0x08006358:    f7faf8a1    ....    BL       __aeabi_memcpy4 ; 0x800049e
        0x0800635c:    e9d41001    ....    LDRD     r1,r0,[r4,#4]
        0x08006360:    f7fbfe4b    ..K.    BL       mbedtls_mpi_zeroize ; 0x8001ffa
        0x08006364:    68a0        .h      LDR      r0,[r4,#8]
        0x08006366:    f7f9ff98    ....    BL       free ; 0x800029a
        0x0800636a:    e9c45601    ...V    STRD     r5,r6,[r4,#4]
        0x0800636e:    2000        .       MOVS     r0,#0
        0x08006370:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x08006374:    4638        8F      MOV      r0,r7
        0x08006376:    e7fb        ..      B        0x8006370 ; mbedtls_mpi_grow + 72
    i.mbedtls_mpi_init
    mbedtls_mpi_init
        0x08006378:    2101        .!      MOVS     r1,#1
        0x0800637a:    6001        .`      STR      r1,[r0,#0]
        0x0800637c:    2100        .!      MOVS     r1,#0
        0x0800637e:    6041        A`      STR      r1,[r0,#4]
        0x08006380:    6081        .`      STR      r1,[r0,#8]
        0x08006382:    4770        pG      BX       lr
    i.mbedtls_mpi_inv_mod
    mbedtls_mpi_inv_mod
        0x08006384:    b5f0        ..      PUSH     {r4-r7,lr}
        0x08006386:    460e        .F      MOV      r6,r1
        0x08006388:    4607        .F      MOV      r7,r0
        0x0800638a:    b09b        ..      SUB      sp,sp,#0x6c
        0x0800638c:    4615        .F      MOV      r5,r2
        0x0800638e:    2101        .!      MOVS     r1,#1
        0x08006390:    4610        .F      MOV      r0,r2
        0x08006392:    f7fffcd9    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08006396:    2800        .(      CMP      r0,#0
        0x08006398:    dc03        ..      BGT      0x80063a2 ; mbedtls_mpi_inv_mod + 30
        0x0800639a:    f06f0003    o...    MVN      r0,#3
        0x0800639e:    b01b        ..      ADD      sp,sp,#0x6c
        0x080063a0:    bdf0        ..      POP      {r4-r7,pc}
        0x080063a2:    a812        ..      ADD      r0,sp,#0x48
        0x080063a4:    f7ffffe8    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x080063a8:    a803        ..      ADD      r0,sp,#0xc
        0x080063aa:    f7ffffe5    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x080063ae:    a806        ..      ADD      r0,sp,#0x18
        0x080063b0:    f7ffffe2    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x080063b4:    a809        ..      ADD      r0,sp,#0x24
        0x080063b6:    f7ffffdf    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x080063ba:    a818        ..      ADD      r0,sp,#0x60
        0x080063bc:    f7ffffdc    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x080063c0:    a815        ..      ADD      r0,sp,#0x54
        0x080063c2:    f7ffffd9    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x080063c6:    a80f        ..      ADD      r0,sp,#0x3c
        0x080063c8:    f7ffffd6    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x080063cc:    4668        hF      MOV      r0,sp
        0x080063ce:    f7ffffd3    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x080063d2:    a80c        ..      ADD      r0,sp,#0x30
        0x080063d4:    f7ffffd0    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x080063d8:    462a        *F      MOV      r2,r5
        0x080063da:    4631        1F      MOV      r1,r6
        0x080063dc:    a818        ..      ADD      r0,sp,#0x60
        0x080063de:    f7ffff13    ....    BL       mbedtls_mpi_gcd ; 0x8006208
        0x080063e2:    0004        ..      MOVS     r4,r0
        0x080063e4:    d106        ..      BNE      0x80063f4 ; mbedtls_mpi_inv_mod + 112
        0x080063e6:    2101        .!      MOVS     r1,#1
        0x080063e8:    a818        ..      ADD      r0,sp,#0x60
        0x080063ea:    f7fffcad    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x080063ee:    b110        ..      CBZ      r0,0x80063f6 ; mbedtls_mpi_inv_mod + 114
        0x080063f0:    f06f040d    o...    MVN      r4,#0xd
        0x080063f4:    e0dd        ..      B        0x80065b2 ; mbedtls_mpi_inv_mod + 558
        0x080063f6:    462a        *F      MOV      r2,r5
        0x080063f8:    4631        1F      MOV      r1,r6
        0x080063fa:    a812        ..      ADD      r0,sp,#0x48
        0x080063fc:    f000f92b    ..+.    BL       mbedtls_mpi_mod_mpi ; 0x8006656
        0x08006400:    0004        ..      MOVS     r4,r0
        0x08006402:    d1f7        ..      BNE      0x80063f4 ; mbedtls_mpi_inv_mod + 112
        0x08006404:    a912        ..      ADD      r1,sp,#0x48
        0x08006406:    a803        ..      ADD      r0,sp,#0xc
        0x08006408:    f7fffcfc    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x0800640c:    0004        ..      MOVS     r4,r0
        0x0800640e:    d1f1        ..      BNE      0x80063f4 ; mbedtls_mpi_inv_mod + 112
        0x08006410:    4629        )F      MOV      r1,r5
        0x08006412:    a815        ..      ADD      r0,sp,#0x54
        0x08006414:    f7fffcf6    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08006418:    0004        ..      MOVS     r4,r0
        0x0800641a:    d1eb        ..      BNE      0x80063f4 ; mbedtls_mpi_inv_mod + 112
        0x0800641c:    4629        )F      MOV      r1,r5
        0x0800641e:    a80f        ..      ADD      r0,sp,#0x3c
        0x08006420:    f7fffcf0    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08006424:    0004        ..      MOVS     r4,r0
        0x08006426:    d1e5        ..      BNE      0x80063f4 ; mbedtls_mpi_inv_mod + 112
        0x08006428:    2101        .!      MOVS     r1,#1
        0x0800642a:    a806        ..      ADD      r0,sp,#0x18
        0x0800642c:    f000f8f6    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x08006430:    0004        ..      MOVS     r4,r0
        0x08006432:    d1df        ..      BNE      0x80063f4 ; mbedtls_mpi_inv_mod + 112
        0x08006434:    2100        .!      MOVS     r1,#0
        0x08006436:    a809        ..      ADD      r0,sp,#0x24
        0x08006438:    f000f8f0    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x0800643c:    0004        ..      MOVS     r4,r0
        0x0800643e:    d1d9        ..      BNE      0x80063f4 ; mbedtls_mpi_inv_mod + 112
        0x08006440:    2100        .!      MOVS     r1,#0
        0x08006442:    4668        hF      MOV      r0,sp
        0x08006444:    f000f8ea    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x08006448:    0004        ..      MOVS     r4,r0
        0x0800644a:    d1d3        ..      BNE      0x80063f4 ; mbedtls_mpi_inv_mod + 112
        0x0800644c:    2101        .!      MOVS     r1,#1
        0x0800644e:    a80c        ..      ADD      r0,sp,#0x30
        0x08006450:    f000f8e4    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x08006454:    e025        %.      B        0x80064a2 ; mbedtls_mpi_inv_mod + 286
        0x08006456:    2101        .!      MOVS     r1,#1
        0x08006458:    a803        ..      ADD      r0,sp,#0xc
        0x0800645a:    f000fb83    ....    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x0800645e:    0004        ..      MOVS     r4,r0
        0x08006460:    d17e        ~.      BNE      0x8006560 ; mbedtls_mpi_inv_mod + 476
        0x08006462:    9808        ..      LDR      r0,[sp,#0x20]
        0x08006464:    7800        .x      LDRB     r0,[r0,#0]
        0x08006466:    07c0        ..      LSLS     r0,r0,#31
        0x08006468:    d103        ..      BNE      0x8006472 ; mbedtls_mpi_inv_mod + 238
        0x0800646a:    980b        ..      LDR      r0,[sp,#0x2c]
        0x0800646c:    7800        .x      LDRB     r0,[r0,#0]
        0x0800646e:    07c0        ..      LSLS     r0,r0,#31
        0x08006470:    d00d        ..      BEQ      0x800648e ; mbedtls_mpi_inv_mod + 266
        0x08006472:    a906        ..      ADD      r1,sp,#0x18
        0x08006474:    aa15        ..      ADD      r2,sp,#0x54
        0x08006476:    4608        .F      MOV      r0,r1
        0x08006478:    f7fffbee    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x0800647c:    0004        ..      MOVS     r4,r0
        0x0800647e:    d16f        o.      BNE      0x8006560 ; mbedtls_mpi_inv_mod + 476
        0x08006480:    a909        ..      ADD      r1,sp,#0x24
        0x08006482:    aa12        ..      ADD      r2,sp,#0x48
        0x08006484:    4608        .F      MOV      r0,r1
        0x08006486:    f000fc39    ..9.    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x0800648a:    0004        ..      MOVS     r4,r0
        0x0800648c:    d168        h.      BNE      0x8006560 ; mbedtls_mpi_inv_mod + 476
        0x0800648e:    2101        .!      MOVS     r1,#1
        0x08006490:    a806        ..      ADD      r0,sp,#0x18
        0x08006492:    f000fb67    ..g.    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x08006496:    0004        ..      MOVS     r4,r0
        0x08006498:    d162        b.      BNE      0x8006560 ; mbedtls_mpi_inv_mod + 476
        0x0800649a:    2101        .!      MOVS     r1,#1
        0x0800649c:    a809        ..      ADD      r0,sp,#0x24
        0x0800649e:    f000fb61    ..a.    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x080064a2:    0004        ..      MOVS     r4,r0
        0x080064a4:    d15c        \.      BNE      0x8006560 ; mbedtls_mpi_inv_mod + 476
        0x080064a6:    9805        ..      LDR      r0,[sp,#0x14]
        0x080064a8:    7800        .x      LDRB     r0,[r0,#0]
        0x080064aa:    07c0        ..      LSLS     r0,r0,#31
        0x080064ac:    d0d3        ..      BEQ      0x8006456 ; mbedtls_mpi_inv_mod + 210
        0x080064ae:    e027        '.      B        0x8006500 ; mbedtls_mpi_inv_mod + 380
        0x080064b0:    2101        .!      MOVS     r1,#1
        0x080064b2:    a80f        ..      ADD      r0,sp,#0x3c
        0x080064b4:    f000fb56    ..V.    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x080064b8:    0004        ..      MOVS     r4,r0
        0x080064ba:    d17a        z.      BNE      0x80065b2 ; mbedtls_mpi_inv_mod + 558
        0x080064bc:    9802        ..      LDR      r0,[sp,#8]
        0x080064be:    7800        .x      LDRB     r0,[r0,#0]
        0x080064c0:    07c0        ..      LSLS     r0,r0,#31
        0x080064c2:    d103        ..      BNE      0x80064cc ; mbedtls_mpi_inv_mod + 328
        0x080064c4:    980e        ..      LDR      r0,[sp,#0x38]
        0x080064c6:    7800        .x      LDRB     r0,[r0,#0]
        0x080064c8:    07c0        ..      LSLS     r0,r0,#31
        0x080064ca:    d00d        ..      BEQ      0x80064e8 ; mbedtls_mpi_inv_mod + 356
        0x080064cc:    4669        iF      MOV      r1,sp
        0x080064ce:    aa15        ..      ADD      r2,sp,#0x54
        0x080064d0:    4608        .F      MOV      r0,r1
        0x080064d2:    f7fffbc1    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x080064d6:    0004        ..      MOVS     r4,r0
        0x080064d8:    d16b        k.      BNE      0x80065b2 ; mbedtls_mpi_inv_mod + 558
        0x080064da:    a90c        ..      ADD      r1,sp,#0x30
        0x080064dc:    aa12        ..      ADD      r2,sp,#0x48
        0x080064de:    4608        .F      MOV      r0,r1
        0x080064e0:    f000fc0c    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x080064e4:    0004        ..      MOVS     r4,r0
        0x080064e6:    d164        d.      BNE      0x80065b2 ; mbedtls_mpi_inv_mod + 558
        0x080064e8:    2101        .!      MOVS     r1,#1
        0x080064ea:    4668        hF      MOV      r0,sp
        0x080064ec:    f000fb3a    ..:.    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x080064f0:    0004        ..      MOVS     r4,r0
        0x080064f2:    d15e        ^.      BNE      0x80065b2 ; mbedtls_mpi_inv_mod + 558
        0x080064f4:    2101        .!      MOVS     r1,#1
        0x080064f6:    a80c        ..      ADD      r0,sp,#0x30
        0x080064f8:    f000fb34    ..4.    BL       mbedtls_mpi_shift_r ; 0x8006b64
        0x080064fc:    0004        ..      MOVS     r4,r0
        0x080064fe:    d158        X.      BNE      0x80065b2 ; mbedtls_mpi_inv_mod + 558
        0x08006500:    9811        ..      LDR      r0,[sp,#0x44]
        0x08006502:    7800        .x      LDRB     r0,[r0,#0]
        0x08006504:    07c0        ..      LSLS     r0,r0,#31
        0x08006506:    d0d3        ..      BEQ      0x80064b0 ; mbedtls_mpi_inv_mod + 300
        0x08006508:    a90f        ..      ADD      r1,sp,#0x3c
        0x0800650a:    a803        ..      ADD      r0,sp,#0xc
        0x0800650c:    f7fffc34    ..4.    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x08006510:    2800        .(      CMP      r0,#0
        0x08006512:    db10        ..      BLT      0x8006536 ; mbedtls_mpi_inv_mod + 434
        0x08006514:    a903        ..      ADD      r1,sp,#0xc
        0x08006516:    aa0f        ..      ADD      r2,sp,#0x3c
        0x08006518:    4608        .F      MOV      r0,r1
        0x0800651a:    f000fbef    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x0800651e:    0004        ..      MOVS     r4,r0
        0x08006520:    d147        G.      BNE      0x80065b2 ; mbedtls_mpi_inv_mod + 558
        0x08006522:    a906        ..      ADD      r1,sp,#0x18
        0x08006524:    466a        jF      MOV      r2,sp
        0x08006526:    4608        .F      MOV      r0,r1
        0x08006528:    f000fbe8    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x0800652c:    0004        ..      MOVS     r4,r0
        0x0800652e:    d140        @.      BNE      0x80065b2 ; mbedtls_mpi_inv_mod + 558
        0x08006530:    aa0c        ..      ADD      r2,sp,#0x30
        0x08006532:    a909        ..      ADD      r1,sp,#0x24
        0x08006534:    e00f        ..      B        0x8006556 ; mbedtls_mpi_inv_mod + 466
        0x08006536:    a90f        ..      ADD      r1,sp,#0x3c
        0x08006538:    aa03        ..      ADD      r2,sp,#0xc
        0x0800653a:    4608        .F      MOV      r0,r1
        0x0800653c:    f000fbde    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x08006540:    0004        ..      MOVS     r4,r0
        0x08006542:    d136        6.      BNE      0x80065b2 ; mbedtls_mpi_inv_mod + 558
        0x08006544:    4669        iF      MOV      r1,sp
        0x08006546:    aa06        ..      ADD      r2,sp,#0x18
        0x08006548:    4608        .F      MOV      r0,r1
        0x0800654a:    f000fbd7    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x0800654e:    0004        ..      MOVS     r4,r0
        0x08006550:    d12f        /.      BNE      0x80065b2 ; mbedtls_mpi_inv_mod + 558
        0x08006552:    aa09        ..      ADD      r2,sp,#0x24
        0x08006554:    a90c        ..      ADD      r1,sp,#0x30
        0x08006556:    4608        .F      MOV      r0,r1
        0x08006558:    f000fbd0    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x0800655c:    0004        ..      MOVS     r4,r0
        0x0800655e:    e000        ..      B        0x8006562 ; mbedtls_mpi_inv_mod + 478
        0x08006560:    e027        '.      B        0x80065b2 ; mbedtls_mpi_inv_mod + 558
        0x08006562:    d126        &.      BNE      0x80065b2 ; mbedtls_mpi_inv_mod + 558
        0x08006564:    2100        .!      MOVS     r1,#0
        0x08006566:    a803        ..      ADD      r0,sp,#0xc
        0x08006568:    f7fffbee    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x0800656c:    2800        .(      CMP      r0,#0
        0x0800656e:    d19a        ..      BNE      0x80064a6 ; mbedtls_mpi_inv_mod + 290
        0x08006570:    e006        ..      B        0x8006580 ; mbedtls_mpi_inv_mod + 508
        0x08006572:    4669        iF      MOV      r1,sp
        0x08006574:    462a        *F      MOV      r2,r5
        0x08006576:    4608        .F      MOV      r0,r1
        0x08006578:    f7fffb6e    ..n.    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x0800657c:    0004        ..      MOVS     r4,r0
        0x0800657e:    d118        ..      BNE      0x80065b2 ; mbedtls_mpi_inv_mod + 558
        0x08006580:    2100        .!      MOVS     r1,#0
        0x08006582:    4668        hF      MOV      r0,sp
        0x08006584:    f7fffbe0    ....    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08006588:    2800        .(      CMP      r0,#0
        0x0800658a:    dbf2        ..      BLT      0x8006572 ; mbedtls_mpi_inv_mod + 494
        0x0800658c:    e006        ..      B        0x800659c ; mbedtls_mpi_inv_mod + 536
        0x0800658e:    4669        iF      MOV      r1,sp
        0x08006590:    462a        *F      MOV      r2,r5
        0x08006592:    4608        .F      MOV      r0,r1
        0x08006594:    f000fbb2    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x08006598:    0004        ..      MOVS     r4,r0
        0x0800659a:    d10a        ..      BNE      0x80065b2 ; mbedtls_mpi_inv_mod + 558
        0x0800659c:    4629        )F      MOV      r1,r5
        0x0800659e:    4668        hF      MOV      r0,sp
        0x080065a0:    f7fffbea    ....    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x080065a4:    2800        .(      CMP      r0,#0
        0x080065a6:    daf2        ..      BGE      0x800658e ; mbedtls_mpi_inv_mod + 522
        0x080065a8:    4669        iF      MOV      r1,sp
        0x080065aa:    4638        8F      MOV      r0,r7
        0x080065ac:    f7fffc2a    ..*.    BL       mbedtls_mpi_copy ; 0x8005e04
        0x080065b0:    4604        .F      MOV      r4,r0
        0x080065b2:    a812        ..      ADD      r0,sp,#0x48
        0x080065b4:    f7fffe17    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080065b8:    a803        ..      ADD      r0,sp,#0xc
        0x080065ba:    f7fffe14    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080065be:    a806        ..      ADD      r0,sp,#0x18
        0x080065c0:    f7fffe11    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080065c4:    a809        ..      ADD      r0,sp,#0x24
        0x080065c6:    f7fffe0e    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080065ca:    a818        ..      ADD      r0,sp,#0x60
        0x080065cc:    f7fffe0b    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080065d0:    a815        ..      ADD      r0,sp,#0x54
        0x080065d2:    f7fffe08    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080065d6:    a80f        ..      ADD      r0,sp,#0x3c
        0x080065d8:    f7fffe05    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080065dc:    4668        hF      MOV      r0,sp
        0x080065de:    f7fffe02    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080065e2:    a80c        ..      ADD      r0,sp,#0x30
        0x080065e4:    f7fffdff    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080065e8:    4620         F      MOV      r0,r4
        0x080065ea:    e6d8        ..      B        0x800639e ; mbedtls_mpi_inv_mod + 26
    i.mbedtls_mpi_lsb
    mbedtls_mpi_lsb
        0x080065ec:    b570        p.      PUSH     {r4-r6,lr}
        0x080065ee:    4603        .F      MOV      r3,r0
        0x080065f0:    2000        .       MOVS     r0,#0
        0x080065f2:    4602        .F      MOV      r2,r0
        0x080065f4:    685c        \h      LDR      r4,[r3,#4]
        0x080065f6:    e00c        ..      B        0x8006612 ; mbedtls_mpi_lsb + 38
        0x080065f8:    689d        .h      LDR      r5,[r3,#8]
        0x080065fa:    2100        .!      MOVS     r1,#0
        0x080065fc:    f8555022    U."P    LDR      r5,[r5,r2,LSL #2]
        0x08006600:    fa25f601    %...    LSR      r6,r5,r1
        0x08006604:    07f6        ..      LSLS     r6,r6,#31
        0x08006606:    d107        ..      BNE      0x8006618 ; mbedtls_mpi_lsb + 44
        0x08006608:    1c40        @.      ADDS     r0,r0,#1
        0x0800660a:    1c49        I.      ADDS     r1,r1,#1
        0x0800660c:    2920         )      CMP      r1,#0x20
        0x0800660e:    d3f7        ..      BCC      0x8006600 ; mbedtls_mpi_lsb + 20
        0x08006610:    1c52        R.      ADDS     r2,r2,#1
        0x08006612:    4294        .B      CMP      r4,r2
        0x08006614:    d8f0        ..      BHI      0x80065f8 ; mbedtls_mpi_lsb + 12
        0x08006616:    2000        .       MOVS     r0,#0
        0x08006618:    bd70        p.      POP      {r4-r6,pc}
        0x0800661a:    0000        ..      MOVS     r0,r0
    i.mbedtls_mpi_lset
    mbedtls_mpi_lset
        0x0800661c:    b570        p.      PUSH     {r4-r6,lr}
        0x0800661e:    460d        .F      MOV      r5,r1
        0x08006620:    4604        .F      MOV      r4,r0
        0x08006622:    2101        .!      MOVS     r1,#1
        0x08006624:    f7fffe80    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x08006628:    0006        ..      MOVS     r6,r0
        0x0800662a:    d112        ..      BNE      0x8006652 ; mbedtls_mpi_lset + 54
        0x0800662c:    6860        `h      LDR      r0,[r4,#4]
        0x0800662e:    0081        ..      LSLS     r1,r0,#2
        0x08006630:    68a0        .h      LDR      r0,[r4,#8]
        0x08006632:    f7f9ff93    ....    BL       __aeabi_memclr4 ; 0x800055c
        0x08006636:    2d00        .-      CMP      r5,#0
        0x08006638:    da02        ..      BGE      0x8006640 ; mbedtls_mpi_lset + 36
        0x0800663a:    bf00        ..      NOP      
        0x0800663c:    f1c50500    ....    RSB      r5,r5,#0
        0x08006640:    68a0        .h      LDR      r0,[r4,#8]
        0x08006642:    6005        .`      STR      r5,[r0,#0]
        0x08006644:    da02        ..      BGE      0x800664c ; mbedtls_mpi_lset + 48
        0x08006646:    f04f30ff    O..0    MOV      r0,#0xffffffff
        0x0800664a:    e001        ..      B        0x8006650 ; mbedtls_mpi_lset + 52
        0x0800664c:    f04f0001    O...    MOV      r0,#1
        0x08006650:    6020         `      STR      r0,[r4,#0]
        0x08006652:    4630        0F      MOV      r0,r6
        0x08006654:    bd70        p.      POP      {r4-r6,pc}
    i.mbedtls_mpi_mod_mpi
    mbedtls_mpi_mod_mpi
        0x08006656:    b570        p.      PUSH     {r4-r6,lr}
        0x08006658:    460c        .F      MOV      r4,r1
        0x0800665a:    4606        .F      MOV      r6,r0
        0x0800665c:    4615        .F      MOV      r5,r2
        0x0800665e:    2100        .!      MOVS     r1,#0
        0x08006660:    4610        .F      MOV      r0,r2
        0x08006662:    f7fffb71    ..q.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08006666:    2800        .(      CMP      r0,#0
        0x08006668:    da02        ..      BGE      0x8006670 ; mbedtls_mpi_mod_mpi + 26
        0x0800666a:    f06f0009    o...    MVN      r0,#9
        0x0800666e:    bd70        p.      POP      {r4-r6,pc}
        0x08006670:    462b        +F      MOV      r3,r5
        0x08006672:    4622        "F      MOV      r2,r4
        0x08006674:    4631        1F      MOV      r1,r6
        0x08006676:    2000        .       MOVS     r0,#0
        0x08006678:    f7fffbf6    ....    BL       mbedtls_mpi_div_mpi ; 0x8005e68
        0x0800667c:    e004        ..      B        0x8006688 ; mbedtls_mpi_mod_mpi + 50
        0x0800667e:    4631        1F      MOV      r1,r6
        0x08006680:    462a        *F      MOV      r2,r5
        0x08006682:    4608        .F      MOV      r0,r1
        0x08006684:    f7fffae8    ....    BL       mbedtls_mpi_add_mpi ; 0x8005c58
        0x08006688:    0004        ..      MOVS     r4,r0
        0x0800668a:    d113        ..      BNE      0x80066b4 ; mbedtls_mpi_mod_mpi + 94
        0x0800668c:    2100        .!      MOVS     r1,#0
        0x0800668e:    4630        0F      MOV      r0,r6
        0x08006690:    f7fffb5a    ..Z.    BL       mbedtls_mpi_cmp_int ; 0x8005d48
        0x08006694:    2800        .(      CMP      r0,#0
        0x08006696:    dbf2        ..      BLT      0x800667e ; mbedtls_mpi_mod_mpi + 40
        0x08006698:    e006        ..      B        0x80066a8 ; mbedtls_mpi_mod_mpi + 82
        0x0800669a:    4631        1F      MOV      r1,r6
        0x0800669c:    462a        *F      MOV      r2,r5
        0x0800669e:    4608        .F      MOV      r0,r1
        0x080066a0:    f000fb2c    ..,.    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x080066a4:    0004        ..      MOVS     r4,r0
        0x080066a6:    d105        ..      BNE      0x80066b4 ; mbedtls_mpi_mod_mpi + 94
        0x080066a8:    4629        )F      MOV      r1,r5
        0x080066aa:    4630        0F      MOV      r0,r6
        0x080066ac:    f7fffb64    ..d.    BL       mbedtls_mpi_cmp_mpi ; 0x8005d78
        0x080066b0:    2800        .(      CMP      r0,#0
        0x080066b2:    daf2        ..      BGE      0x800669a ; mbedtls_mpi_mod_mpi + 68
        0x080066b4:    4620         F      MOV      r0,r4
        0x080066b6:    bd70        p.      POP      {r4-r6,pc}
    i.mbedtls_mpi_mul_int
    mbedtls_mpi_mul_int
        0x080066b8:    b51f        ..      PUSH     {r0-r4,lr}
        0x080066ba:    2301        .#      MOVS     r3,#1
        0x080066bc:    9300        ..      STR      r3,[sp,#0]
        0x080066be:    9301        ..      STR      r3,[sp,#4]
        0x080066c0:    ab03        ..      ADD      r3,sp,#0xc
        0x080066c2:    e9cd3202    ...2    STRD     r3,r2,[sp,#8]
        0x080066c6:    466a        jF      MOV      r2,sp
        0x080066c8:    f000f802    ....    BL       mbedtls_mpi_mul_mpi ; 0x80066d0
        0x080066cc:    b004        ..      ADD      sp,sp,#0x10
        0x080066ce:    bd10        ..      POP      {r4,pc}
    i.mbedtls_mpi_mul_mpi
    mbedtls_mpi_mul_mpi
        0x080066d0:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x080066d4:    b086        ..      SUB      sp,sp,#0x18
        0x080066d6:    4680        .F      MOV      r8,r0
        0x080066d8:    4616        .F      MOV      r6,r2
        0x080066da:    460f        .F      MOV      r7,r1
        0x080066dc:    4668        hF      MOV      r0,sp
        0x080066de:    f7fffe4b    ..K.    BL       mbedtls_mpi_init ; 0x8006378
        0x080066e2:    a803        ..      ADD      r0,sp,#0xc
        0x080066e4:    f7fffe48    ..H.    BL       mbedtls_mpi_init ; 0x8006378
        0x080066e8:    45b8        .E      CMP      r8,r7
        0x080066ea:    d107        ..      BNE      0x80066fc ; mbedtls_mpi_mul_mpi + 44
        0x080066ec:    4639        9F      MOV      r1,r7
        0x080066ee:    4668        hF      MOV      r0,sp
        0x080066f0:    f7fffb88    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x080066f4:    ea5f0900    _...    MOVS     r9,r0
        0x080066f8:    d141        A.      BNE      0x800677e ; mbedtls_mpi_mul_mpi + 174
        0x080066fa:    466f        oF      MOV      r7,sp
        0x080066fc:    45b0        .E      CMP      r8,r6
        0x080066fe:    d107        ..      BNE      0x8006710 ; mbedtls_mpi_mul_mpi + 64
        0x08006700:    4631        1F      MOV      r1,r6
        0x08006702:    a803        ..      ADD      r0,sp,#0xc
        0x08006704:    f7fffb7e    ..~.    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08006708:    ea5f0900    _...    MOVS     r9,r0
        0x0800670c:    d137        7.      BNE      0x800677e ; mbedtls_mpi_mul_mpi + 174
        0x0800670e:    ae03        ..      ADD      r6,sp,#0xc
        0x08006710:    687d        }h      LDR      r5,[r7,#4]
        0x08006712:    f06f0a03    o...    MVN      r10,#3
        0x08006716:    b13d        =.      CBZ      r5,0x8006728 ; mbedtls_mpi_mul_mpi + 88
        0x08006718:    68b9        .h      LDR      r1,[r7,#8]
        0x0800671a:    4650        PF      MOV      r0,r10
        0x0800671c:    eb000285    ....    ADD      r2,r0,r5,LSL #2
        0x08006720:    588a        .X      LDR      r2,[r1,r2]
        0x08006722:    b90a        ..      CBNZ     r2,0x8006728 ; mbedtls_mpi_mul_mpi + 88
        0x08006724:    1e6d        m.      SUBS     r5,r5,#1
        0x08006726:    d1f9        ..      BNE      0x800671c ; mbedtls_mpi_mul_mpi + 76
        0x08006728:    6874        th      LDR      r4,[r6,#4]
        0x0800672a:    b13c        <.      CBZ      r4,0x800673c ; mbedtls_mpi_mul_mpi + 108
        0x0800672c:    68b1        .h      LDR      r1,[r6,#8]
        0x0800672e:    4650        PF      MOV      r0,r10
        0x08006730:    eb000284    ....    ADD      r2,r0,r4,LSL #2
        0x08006734:    588a        .X      LDR      r2,[r1,r2]
        0x08006736:    b90a        ..      CBNZ     r2,0x800673c ; mbedtls_mpi_mul_mpi + 108
        0x08006738:    1e64        d.      SUBS     r4,r4,#1
        0x0800673a:    d1f9        ..      BNE      0x8006730 ; mbedtls_mpi_mul_mpi + 96
        0x0800673c:    1929        ).      ADDS     r1,r5,r4
        0x0800673e:    4640        @F      MOV      r0,r8
        0x08006740:    f7fffdf2    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x08006744:    ea5f0900    _...    MOVS     r9,r0
        0x08006748:    d119        ..      BNE      0x800677e ; mbedtls_mpi_mul_mpi + 174
        0x0800674a:    2100        .!      MOVS     r1,#0
        0x0800674c:    4640        @F      MOV      r0,r8
        0x0800674e:    f7ffff65    ..e.    BL       mbedtls_mpi_lset ; 0x800661c
        0x08006752:    ea5f0900    _...    MOVS     r9,r0
        0x08006756:    d112        ..      BNE      0x800677e ; mbedtls_mpi_mul_mpi + 174
        0x08006758:    b164        d.      CBZ      r4,0x8006774 ; mbedtls_mpi_mul_mpi + 164
        0x0800675a:    68b1        .h      LDR      r1,[r6,#8]
        0x0800675c:    eb0a0084    ....    ADD      r0,r10,r4,LSL #2
        0x08006760:    580b        .X      LDR      r3,[r1,r0]
        0x08006762:    f8d81008    ....    LDR      r1,[r8,#8]
        0x08006766:    180a        ..      ADDS     r2,r1,r0
        0x08006768:    4628        (F      MOV      r0,r5
        0x0800676a:    68b9        .h      LDR      r1,[r7,#8]
        0x0800676c:    f000fc76    ..v.    BL       mpi_mul_hlp ; 0x800705c
        0x08006770:    1e64        d.      SUBS     r4,r4,#1
        0x08006772:    e7f1        ..      B        0x8006758 ; mbedtls_mpi_mul_mpi + 136
        0x08006774:    6838        8h      LDR      r0,[r7,#0]
        0x08006776:    6831        1h      LDR      r1,[r6,#0]
        0x08006778:    4348        HC      MULS     r0,r1,r0
        0x0800677a:    f8c80000    ....    STR      r0,[r8,#0]
        0x0800677e:    a803        ..      ADD      r0,sp,#0xc
        0x08006780:    f7fffd31    ..1.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08006784:    4668        hF      MOV      r0,sp
        0x08006786:    f7fffd2e    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x0800678a:    b006        ..      ADD      sp,sp,#0x18
        0x0800678c:    4648        HF      MOV      r0,r9
        0x0800678e:    e8bd87f0    ....    POP      {r4-r10,pc}
    i.mbedtls_mpi_read_binary
    mbedtls_mpi_read_binary
        0x08006792:    e92d47f0    -..G    PUSH     {r4-r10,lr}
        0x08006796:    4606        .F      MOV      r6,r0
        0x08006798:    4615        .F      MOV      r5,r2
        0x0800679a:    4689        .F      MOV      r9,r1
        0x0800679c:    0790        ..      LSLS     r0,r2,#30
        0x0800679e:    d000        ..      BEQ      0x80067a2 ; mbedtls_mpi_read_binary + 16
        0x080067a0:    2001        .       MOVS     r0,#1
        0x080067a2:    eb000495    ....    ADD      r4,r0,r5,LSR #2
        0x080067a6:    6870        ph      LDR      r0,[r6,#4]
        0x080067a8:    ebc50884    ....    RSB      r8,r5,r4,LSL #2
        0x080067ac:    42a0        .B      CMP      r0,r4
        0x080067ae:    d00b        ..      BEQ      0x80067c8 ; mbedtls_mpi_read_binary + 54
        0x080067b0:    4630        0F      MOV      r0,r6
        0x080067b2:    f7fffd18    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x080067b6:    4630        0F      MOV      r0,r6
        0x080067b8:    f7fffdde    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x080067bc:    4621        !F      MOV      r1,r4
        0x080067be:    4630        0F      MOV      r0,r6
        0x080067c0:    f7fffdb2    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x080067c4:    0007        ..      MOVS     r7,r0
        0x080067c6:    d112        ..      BNE      0x80067ee ; mbedtls_mpi_read_binary + 92
        0x080067c8:    2100        .!      MOVS     r1,#0
        0x080067ca:    4630        0F      MOV      r0,r6
        0x080067cc:    f7ffff26    ..&.    BL       mbedtls_mpi_lset ; 0x800661c
        0x080067d0:    0007        ..      MOVS     r7,r0
        0x080067d2:    d10c        ..      BNE      0x80067ee ; mbedtls_mpi_read_binary + 92
        0x080067d4:    f1b90f00    ....    CMP      r9,#0
        0x080067d8:    d009        ..      BEQ      0x80067ee ; mbedtls_mpi_read_binary + 92
        0x080067da:    68b0        .h      LDR      r0,[r6,#8]
        0x080067dc:    462a        *F      MOV      r2,r5
        0x080067de:    4440        @D      ADD      r0,r0,r8
        0x080067e0:    4649        IF      MOV      r1,r9
        0x080067e2:    f7f9fe17    ....    BL       __aeabi_memcpy ; 0x8000414
        0x080067e6:    4621        !F      MOV      r1,r4
        0x080067e8:    68b0        .h      LDR      r0,[r6,#8]
        0x080067ea:    f000fc07    ....    BL       mpi_bigendian_to_host ; 0x8006ffc
        0x080067ee:    4638        8F      MOV      r0,r7
        0x080067f0:    e8bd87f0    ....    POP      {r4-r10,pc}
    i.mbedtls_mpi_read_binary_le
    mbedtls_mpi_read_binary_le
        0x080067f4:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x080067f8:    4605        .F      MOV      r5,r0
        0x080067fa:    4614        .F      MOV      r4,r2
        0x080067fc:    460e        .F      MOV      r6,r1
        0x080067fe:    0790        ..      LSLS     r0,r2,#30
        0x08006800:    d000        ..      BEQ      0x8006804 ; mbedtls_mpi_read_binary_le + 16
        0x08006802:    2001        .       MOVS     r0,#1
        0x08006804:    eb000794    ....    ADD      r7,r0,r4,LSR #2
        0x08006808:    6868        hh      LDR      r0,[r5,#4]
        0x0800680a:    42b8        .B      CMP      r0,r7
        0x0800680c:    d00b        ..      BEQ      0x8006826 ; mbedtls_mpi_read_binary_le + 50
        0x0800680e:    4628        (F      MOV      r0,r5
        0x08006810:    f7fffce9    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08006814:    4628        (F      MOV      r0,r5
        0x08006816:    f7fffdaf    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x0800681a:    4639        9F      MOV      r1,r7
        0x0800681c:    4628        (F      MOV      r0,r5
        0x0800681e:    f7fffd83    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x08006822:    2800        .(      CMP      r0,#0
        0x08006824:    d11a        ..      BNE      0x800685c ; mbedtls_mpi_read_binary_le + 104
        0x08006826:    2100        .!      MOVS     r1,#0
        0x08006828:    4628        (F      MOV      r0,r5
        0x0800682a:    f7fffef7    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x0800682e:    2800        .(      CMP      r0,#0
        0x08006830:    d114        ..      BNE      0x800685c ; mbedtls_mpi_read_binary_le + 104
        0x08006832:    2300        .#      MOVS     r3,#0
        0x08006834:    e010        ..      B        0x8006858 ; mbedtls_mpi_read_binary_le + 100
        0x08006836:    bf00        ..      NOP      
        0x08006838:    68aa        .h      LDR      r2,[r5,#8]
        0x0800683a:    f0230103    #...    BIC      r1,r3,#3
        0x0800683e:    f816c003    ....    LDRB     r12,[r6,r3]
        0x08006842:    ea4f7e83    O..~    LSL      lr,r3,#30
        0x08006846:    ea4f6ede    O..n    LSR      lr,lr,#27
        0x0800684a:    5857        WX      LDR      r7,[r2,r1]
        0x0800684c:    fa0cfc0e    ....    LSL      r12,r12,lr
        0x08006850:    ea47070c    G...    ORR      r7,r7,r12
        0x08006854:    5057        WP      STR      r7,[r2,r1]
        0x08006856:    1c5b        [.      ADDS     r3,r3,#1
        0x08006858:    42a3        .B      CMP      r3,r4
        0x0800685a:    d3ed        ..      BCC      0x8006838 ; mbedtls_mpi_read_binary_le + 68
        0x0800685c:    e8bd81f0    ....    POP      {r4-r8,pc}
    i.mbedtls_mpi_read_string
    mbedtls_mpi_read_string
        0x08006860:    e92d47ff    -..G    PUSH     {r0-r10,lr}
        0x08006864:    4680        .F      MOV      r8,r0
        0x08006866:    1e88        ..      SUBS     r0,r1,#2
        0x08006868:    4616        .F      MOV      r6,r2
        0x0800686a:    4689        .F      MOV      r9,r1
        0x0800686c:    f06f0403    o...    MVN      r4,#3
        0x08006870:    280f        .(      CMP      r0,#0xf
        0x08006872:    d215        ..      BCS      0x80068a0 ; mbedtls_mpi_read_string + 64
        0x08006874:    4668        hF      MOV      r0,sp
        0x08006876:    f7fffd7f    ....    BL       mbedtls_mpi_init ; 0x8006378
        0x0800687a:    4630        0F      MOV      r0,r6
        0x0800687c:    f7f9fdab    ....    BL       strlen ; 0x80003d6
        0x08006880:    4605        .F      MOV      r5,r0
        0x08006882:    f04f3aff    O..:    MOV      r10,#0xffffffff
        0x08006886:    f1b90f10    ....    CMP      r9,#0x10
        0x0800688a:    d006        ..      BEQ      0x800689a ; mbedtls_mpi_read_string + 58
        0x0800688c:    2100        .!      MOVS     r1,#0
        0x0800688e:    4640        @F      MOV      r0,r8
        0x08006890:    f7fffec4    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x08006894:    0004        ..      MOVS     r4,r0
        0x08006896:    d16b        k.      BNE      0x8006970 ; mbedtls_mpi_read_string + 272
        0x08006898:    e03e        >.      B        0x8006918 ; mbedtls_mpi_read_string + 184
        0x0800689a:    f1b54f80    ...O    CMP      r5,#0x40000000
        0x0800689e:    d303        ..      BCC      0x80068a8 ; mbedtls_mpi_read_string + 72
        0x080068a0:    b004        ..      ADD      sp,sp,#0x10
        0x080068a2:    4620         F      MOV      r0,r4
        0x080068a4:    e8bd87f0    ....    POP      {r4-r10,pc}
        0x080068a8:    0768        h.      LSLS     r0,r5,#29
        0x080068aa:    d000        ..      BEQ      0x80068ae ; mbedtls_mpi_read_string + 78
        0x080068ac:    2001        .       MOVS     r0,#1
        0x080068ae:    f3c501da    ....    UBFX     r1,r5,#3,#27
        0x080068b2:    4401        .D      ADD      r1,r1,r0
        0x080068b4:    4640        @F      MOV      r0,r8
        0x080068b6:    f7fffd37    ..7.    BL       mbedtls_mpi_grow ; 0x8006328
        0x080068ba:    0004        ..      MOVS     r4,r0
        0x080068bc:    d158        X.      BNE      0x8006970 ; mbedtls_mpi_read_string + 272
        0x080068be:    2100        .!      MOVS     r1,#0
        0x080068c0:    4640        @F      MOV      r0,r8
        0x080068c2:    f7fffeab    ....    BL       mbedtls_mpi_lset ; 0x800661c
        0x080068c6:    0004        ..      MOVS     r4,r0
        0x080068c8:    d152        R.      BNE      0x8006970 ; mbedtls_mpi_read_string + 272
        0x080068ca:    2700        .'      MOVS     r7,#0
        0x080068cc:    e021        !.      B        0x8006912 ; mbedtls_mpi_read_string + 178
        0x080068ce:    2d01        .-      CMP      r5,#1
        0x080068d0:    d102        ..      BNE      0x80068d8 ; mbedtls_mpi_read_string + 120
        0x080068d2:    7830        0x      LDRB     r0,[r6,#0]
        0x080068d4:    282d        -(      CMP      r0,#0x2d
        0x080068d6:    d009        ..      BEQ      0x80068ec ; mbedtls_mpi_read_string + 140
        0x080068d8:    1970        p.      ADDS     r0,r6,r5
        0x080068da:    4649        IF      MOV      r1,r9
        0x080068dc:    f8102c01    ...,    LDRB     r2,[r0,#-1]
        0x080068e0:    a803        ..      ADD      r0,sp,#0xc
        0x080068e2:    f000fba0    ....    BL       mpi_get_digit ; 0x8007026
        0x080068e6:    0004        ..      MOVS     r4,r0
        0x080068e8:    d142        B.      BNE      0x8006970 ; mbedtls_mpi_read_string + 272
        0x080068ea:    e002        ..      B        0x80068f2 ; mbedtls_mpi_read_string + 146
        0x080068ec:    f8c8a000    ....    STR      r10,[r8,#0]
        0x080068f0:    e03e        >.      B        0x8006970 ; mbedtls_mpi_read_string + 272
        0x080068f2:    08f9        ..      LSRS     r1,r7,#3
        0x080068f4:    077b        {.      LSLS     r3,r7,#29
        0x080068f6:    f8d80008    ....    LDR      r0,[r8,#8]
        0x080068fa:    ea4f6cd3    O..l    LSR      r12,r3,#27
        0x080068fe:    9b03        ..      LDR      r3,[sp,#0xc]
        0x08006900:    f8502021    P.!     LDR      r2,[r0,r1,LSL #2]
        0x08006904:    fa03f30c    ....    LSL      r3,r3,r12
        0x08006908:    431a        .C      ORRS     r2,r2,r3
        0x0800690a:    1e6d        m.      SUBS     r5,r5,#1
        0x0800690c:    f8402021    @.!     STR      r2,[r0,r1,LSL #2]
        0x08006910:    1c7f        ..      ADDS     r7,r7,#1
        0x08006912:    2d00        .-      CMP      r5,#0
        0x08006914:    d1db        ..      BNE      0x80068ce ; mbedtls_mpi_read_string + 110
        0x08006916:    e02b        +.      B        0x8006970 ; mbedtls_mpi_read_string + 272
        0x08006918:    2700        .'      MOVS     r7,#0
        0x0800691a:    2d00        .-      CMP      r5,#0
        0x0800691c:    d801        ..      BHI      0x8006922 ; mbedtls_mpi_read_string + 194
        0x0800691e:    e027        '.      B        0x8006970 ; mbedtls_mpi_read_string + 272
        0x08006920:    b917        ..      CBNZ     r7,0x8006928 ; mbedtls_mpi_read_string + 200
        0x08006922:    7830        0x      LDRB     r0,[r6,#0]
        0x08006924:    282d        -(      CMP      r0,#0x2d
        0x08006926:    d007        ..      BEQ      0x8006938 ; mbedtls_mpi_read_string + 216
        0x08006928:    5df2        .]      LDRB     r2,[r6,r7]
        0x0800692a:    4649        IF      MOV      r1,r9
        0x0800692c:    a803        ..      ADD      r0,sp,#0xc
        0x0800692e:    f000fb7a    ..z.    BL       mpi_get_digit ; 0x8007026
        0x08006932:    0004        ..      MOVS     r4,r0
        0x08006934:    d11c        ..      BNE      0x8006970 ; mbedtls_mpi_read_string + 272
        0x08006936:    e002        ..      B        0x800693e ; mbedtls_mpi_read_string + 222
        0x08006938:    f8c8a000    ....    STR      r10,[r8,#0]
        0x0800693c:    e015        ..      B        0x800696a ; mbedtls_mpi_read_string + 266
        0x0800693e:    464a        JF      MOV      r2,r9
        0x08006940:    4641        AF      MOV      r1,r8
        0x08006942:    4668        hF      MOV      r0,sp
        0x08006944:    f7fffeb8    ....    BL       mbedtls_mpi_mul_int ; 0x80066b8
        0x08006948:    0004        ..      MOVS     r4,r0
        0x0800694a:    d111        ..      BNE      0x8006970 ; mbedtls_mpi_read_string + 272
        0x0800694c:    f8d80000    ....    LDR      r0,[r8,#0]
        0x08006950:    9a03        ..      LDR      r2,[sp,#0xc]
        0x08006952:    2801        .(      CMP      r0,#1
        0x08006954:    4669        iF      MOV      r1,sp
        0x08006956:    4640        @F      MOV      r0,r8
        0x08006958:    d004        ..      BEQ      0x8006964 ; mbedtls_mpi_read_string + 260
        0x0800695a:    f000f9b7    ....    BL       mbedtls_mpi_sub_int ; 0x8006ccc
        0x0800695e:    0004        ..      MOVS     r4,r0
        0x08006960:    d106        ..      BNE      0x8006970 ; mbedtls_mpi_read_string + 272
        0x08006962:    e002        ..      B        0x800696a ; mbedtls_mpi_read_string + 266
        0x08006964:    f7fff960    ..`.    BL       mbedtls_mpi_add_int ; 0x8005c28
        0x08006968:    e7f9        ..      B        0x800695e ; mbedtls_mpi_read_string + 254
        0x0800696a:    1c7f        ..      ADDS     r7,r7,#1
        0x0800696c:    42af        .B      CMP      r7,r5
        0x0800696e:    d3d7        ..      BCC      0x8006920 ; mbedtls_mpi_read_string + 192
        0x08006970:    4668        hF      MOV      r0,sp
        0x08006972:    f7fffc38    ..8.    BL       mbedtls_mpi_free ; 0x80061e6
        0x08006976:    e793        ..      B        0x80068a0 ; mbedtls_mpi_read_string + 64
    i.mbedtls_mpi_safe_cond_assign
    mbedtls_mpi_safe_cond_assign
        0x08006978:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x0800697c:    4604        .F      MOV      r4,r0
        0x0800697e:    4250        PB      RSBS     r0,r2,#0
        0x08006980:    b2c0        ..      UXTB     r0,r0
        0x08006982:    4310        .C      ORRS     r0,r0,r2
        0x08006984:    460d        .F      MOV      r5,r1
        0x08006986:    09c6        ..      LSRS     r6,r0,#7
        0x08006988:    6849        Ih      LDR      r1,[r1,#4]
        0x0800698a:    4620         F      MOV      r0,r4
        0x0800698c:    f7fffccc    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x08006990:    0001        ..      MOVS     r1,r0
        0x08006992:    d124        $.      BNE      0x80069de ; mbedtls_mpi_safe_cond_assign + 102
        0x08006994:    6822        "h      LDR      r2,[r4,#0]
        0x08006996:    f1c60001    ....    RSB      r0,r6,#1
        0x0800699a:    682b        +h      LDR      r3,[r5,#0]
        0x0800699c:    4342        BC      MULS     r2,r0,r2
        0x0800699e:    fb032206    ..."    MLA      r2,r3,r6,r2
        0x080069a2:    6022        "`      STR      r2,[r4,#0]
        0x080069a4:    2200        ."      MOVS     r2,#0
        0x080069a6:    e00c        ..      B        0x80069c2 ; mbedtls_mpi_safe_cond_assign + 74
        0x080069a8:    68a3        .h      LDR      r3,[r4,#8]
        0x080069aa:    f8d5c008    ....    LDR      r12,[r5,#8]
        0x080069ae:    f8537022    S."p    LDR      r7,[r3,r2,LSL #2]
        0x080069b2:    f85cc022    \.".    LDR      r12,[r12,r2,LSL #2]
        0x080069b6:    4347        GC      MULS     r7,r0,r7
        0x080069b8:    fb0c7706    ...w    MLA      r7,r12,r6,r7
        0x080069bc:    f8437022    C."p    STR      r7,[r3,r2,LSL #2]
        0x080069c0:    1c52        R.      ADDS     r2,r2,#1
        0x080069c2:    686b        kh      LDR      r3,[r5,#4]
        0x080069c4:    4293        .B      CMP      r3,r2
        0x080069c6:    d8ef        ..      BHI      0x80069a8 ; mbedtls_mpi_safe_cond_assign + 48
        0x080069c8:    e006        ..      B        0x80069d8 ; mbedtls_mpi_safe_cond_assign + 96
        0x080069ca:    68a3        .h      LDR      r3,[r4,#8]
        0x080069cc:    f8535022    S."P    LDR      r5,[r3,r2,LSL #2]
        0x080069d0:    4345        EC      MULS     r5,r0,r5
        0x080069d2:    f8435022    C."P    STR      r5,[r3,r2,LSL #2]
        0x080069d6:    1c52        R.      ADDS     r2,r2,#1
        0x080069d8:    6863        ch      LDR      r3,[r4,#4]
        0x080069da:    4293        .B      CMP      r3,r2
        0x080069dc:    d8f5        ..      BHI      0x80069ca ; mbedtls_mpi_safe_cond_assign + 82
        0x080069de:    4608        .F      MOV      r0,r1
        0x080069e0:    e8bd81f0    ....    POP      {r4-r8,pc}
    i.mbedtls_mpi_safe_cond_swap
    mbedtls_mpi_safe_cond_swap
        0x080069e4:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x080069e8:    460c        .F      MOV      r4,r1
        0x080069ea:    4605        .F      MOV      r5,r0
        0x080069ec:    42a0        .B      CMP      r0,r4
        0x080069ee:    d102        ..      BNE      0x80069f6 ; mbedtls_mpi_safe_cond_swap + 18
        0x080069f0:    2000        .       MOVS     r0,#0
        0x080069f2:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x080069f6:    4250        PB      RSBS     r0,r2,#0
        0x080069f8:    b2c0        ..      UXTB     r0,r0
        0x080069fa:    4310        .C      ORRS     r0,r0,r2
        0x080069fc:    09c6        ..      LSRS     r6,r0,#7
        0x080069fe:    4628        (F      MOV      r0,r5
        0x08006a00:    6861        ah      LDR      r1,[r4,#4]
        0x08006a02:    f7fffc91    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x08006a06:    0003        ..      MOVS     r3,r0
        0x08006a08:    d12f        /.      BNE      0x8006a6a ; mbedtls_mpi_safe_cond_swap + 134
        0x08006a0a:    4620         F      MOV      r0,r4
        0x08006a0c:    6869        ih      LDR      r1,[r5,#4]
        0x08006a0e:    f7fffc8b    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x08006a12:    0003        ..      MOVS     r3,r0
        0x08006a14:    d129        ).      BNE      0x8006a6a ; mbedtls_mpi_safe_cond_swap + 134
        0x08006a16:    6828        (h      LDR      r0,[r5,#0]
        0x08006a18:    f1c60101    ....    RSB      r1,r6,#1
        0x08006a1c:    6827        'h      LDR      r7,[r4,#0]
        0x08006a1e:    fb00f201    ....    MUL      r2,r0,r1
        0x08006a22:    fb072206    ..."    MLA      r2,r7,r6,r2
        0x08006a26:    602a        *`      STR      r2,[r5,#0]
        0x08006a28:    6822        "h      LDR      r2,[r4,#0]
        0x08006a2a:    434a        JC      MULS     r2,r1,r2
        0x08006a2c:    fb002006    ...     MLA      r0,r0,r6,r2
        0x08006a30:    6020         `      STR      r0,[r4,#0]
        0x08006a32:    2000        .       MOVS     r0,#0
        0x08006a34:    e016        ..      B        0x8006a64 ; mbedtls_mpi_safe_cond_swap + 128
        0x08006a36:    68af        .h      LDR      r7,[r5,#8]
        0x08006a38:    f8d4e008    ....    LDR      lr,[r4,#8]
        0x08006a3c:    f8572020    W.      LDR      r2,[r7,r0,LSL #2]
        0x08006a40:    f85ee020    ^. .    LDR      lr,[lr,r0,LSL #2]
        0x08006a44:    fb02fc01    ....    MUL      r12,r2,r1
        0x08006a48:    fb0ecc06    ....    MLA      r12,lr,r6,r12
        0x08006a4c:    f847c020    G. .    STR      r12,[r7,r0,LSL #2]
        0x08006a50:    68a7        .h      LDR      r7,[r4,#8]
        0x08006a52:    f857c020    W. .    LDR      r12,[r7,r0,LSL #2]
        0x08006a56:    fb0cfc01    ....    MUL      r12,r12,r1
        0x08006a5a:    fb02c206    ....    MLA      r2,r2,r6,r12
        0x08006a5e:    f8472020    G.      STR      r2,[r7,r0,LSL #2]
        0x08006a62:    1c40        @.      ADDS     r0,r0,#1
        0x08006a64:    686a        jh      LDR      r2,[r5,#4]
        0x08006a66:    4282        .B      CMP      r2,r0
        0x08006a68:    d8e5        ..      BHI      0x8006a36 ; mbedtls_mpi_safe_cond_swap + 82
        0x08006a6a:    4618        .F      MOV      r0,r3
        0x08006a6c:    e7c1        ..      B        0x80069f2 ; mbedtls_mpi_safe_cond_swap + 14
    i.mbedtls_mpi_set_bit
    mbedtls_mpi_set_bit
        0x08006a6e:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x08006a72:    4606        .F      MOV      r6,r0
        0x08006a74:    0015        ..      MOVS     r5,r2
        0x08006a76:    f04f0000    O...    MOV      r0,#0
        0x08006a7a:    ea4f1451    O.Q.    LSR      r4,r1,#5
        0x08006a7e:    f001071f    ....    AND      r7,r1,#0x1f
        0x08006a82:    d004        ..      BEQ      0x8006a8e ; mbedtls_mpi_set_bit + 32
        0x08006a84:    2d01        .-      CMP      r5,#1
        0x08006a86:    d002        ..      BEQ      0x8006a8e ; mbedtls_mpi_set_bit + 32
        0x08006a88:    1f00        ..      SUBS     r0,r0,#4
        0x08006a8a:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x08006a8e:    6872        rh      LDR      r2,[r6,#4]
        0x08006a90:    ebb11f42    ..B.    CMP      r1,r2,LSL #5
        0x08006a94:    d306        ..      BCC      0x8006aa4 ; mbedtls_mpi_set_bit + 54
        0x08006a96:    b19d        ..      CBZ      r5,0x8006ac0 ; mbedtls_mpi_set_bit + 82
        0x08006a98:    1c61        a.      ADDS     r1,r4,#1
        0x08006a9a:    4630        0F      MOV      r0,r6
        0x08006a9c:    f7fffc44    ..D.    BL       mbedtls_mpi_grow ; 0x8006328
        0x08006aa0:    2800        .(      CMP      r0,#0
        0x08006aa2:    d1f2        ..      BNE      0x8006a8a ; mbedtls_mpi_set_bit + 28
        0x08006aa4:    68b2        .h      LDR      r2,[r6,#8]
        0x08006aa6:    2301        .#      MOVS     r3,#1
        0x08006aa8:    40bb        .@      LSLS     r3,r3,r7
        0x08006aaa:    f8521024    R.$.    LDR      r1,[r2,r4,LSL #2]
        0x08006aae:    40bd        .@      LSLS     r5,r5,r7
        0x08006ab0:    4399        .C      BICS     r1,r1,r3
        0x08006ab2:    f8421024    B.$.    STR      r1,[r2,r4,LSL #2]
        0x08006ab6:    68b2        .h      LDR      r2,[r6,#8]
        0x08006ab8:    4329        )C      ORRS     r1,r1,r5
        0x08006aba:    f8421024    B.$.    STR      r1,[r2,r4,LSL #2]
        0x08006abe:    e7e4        ..      B        0x8006a8a ; mbedtls_mpi_set_bit + 28
        0x08006ac0:    2000        .       MOVS     r0,#0
        0x08006ac2:    e7e2        ..      B        0x8006a8a ; mbedtls_mpi_set_bit + 28
    i.mbedtls_mpi_shift_l
    mbedtls_mpi_shift_l
        0x08006ac4:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x08006ac8:    4688        .F      MOV      r8,r1
        0x08006aca:    4606        .F      MOV      r6,r0
        0x08006acc:    2500        .%      MOVS     r5,#0
        0x08006ace:    094c        L.      LSRS     r4,r1,#5
        0x08006ad0:    f001071f    ....    AND      r7,r1,#0x1f
        0x08006ad4:    f7fff8e7    ....    BL       mbedtls_mpi_bitlen ; 0x8005ca6
        0x08006ad8:    6871        qh      LDR      r1,[r6,#4]
        0x08006ada:    4440        @D      ADD      r0,r0,r8
        0x08006adc:    ebb01f41    ..A.    CMP      r0,r1,LSL #5
        0x08006ae0:    d909        ..      BLS      0x8006af6 ; mbedtls_mpi_shift_l + 50
        0x08006ae2:    06c1        ..      LSLS     r1,r0,#27
        0x08006ae4:    d000        ..      BEQ      0x8006ae8 ; mbedtls_mpi_shift_l + 36
        0x08006ae6:    2101        .!      MOVS     r1,#1
        0x08006ae8:    eb011150    ..P.    ADD      r1,r1,r0,LSR #5
        0x08006aec:    4630        0F      MOV      r0,r6
        0x08006aee:    f7fffc1b    ....    BL       mbedtls_mpi_grow ; 0x8006328
        0x08006af2:    0002        ..      MOVS     r2,r0
        0x08006af4:    d132        2.      BNE      0x8006b5c ; mbedtls_mpi_shift_l + 152
        0x08006af6:    2200        ."      MOVS     r2,#0
        0x08006af8:    b1d4        ..      CBZ      r4,0x8006b30 ; mbedtls_mpi_shift_l + 108
        0x08006afa:    1f11        ..      SUBS     r1,r2,#4
        0x08006afc:    6870        ph      LDR      r0,[r6,#4]
        0x08006afe:    e00b        ..      B        0x8006b18 ; mbedtls_mpi_shift_l + 84
        0x08006b00:    eba00c04    ....    SUB      r12,r0,r4
        0x08006b04:    68b3        .h      LDR      r3,[r6,#8]
        0x08006b06:    eb010c8c    ....    ADD      r12,r1,r12,LSL #2
        0x08006b0a:    eb010880    ....    ADD      r8,r1,r0,LSL #2
        0x08006b0e:    f853c00c    S...    LDR      r12,[r3,r12]
        0x08006b12:    f843c008    C...    STR      r12,[r3,r8]
        0x08006b16:    1e40        @.      SUBS     r0,r0,#1
        0x08006b18:    42a0        .B      CMP      r0,r4
        0x08006b1a:    d8f1        ..      BHI      0x8006b00 ; mbedtls_mpi_shift_l + 60
        0x08006b1c:    b140        @.      CBZ      r0,0x8006b30 ; mbedtls_mpi_shift_l + 108
        0x08006b1e:    2300        .#      MOVS     r3,#0
        0x08006b20:    f8d6c008    ....    LDR      r12,[r6,#8]
        0x08006b24:    eb010880    ....    ADD      r8,r1,r0,LSL #2
        0x08006b28:    1e40        @.      SUBS     r0,r0,#1
        0x08006b2a:    f84c3008    L..0    STR      r3,[r12,r8]
        0x08006b2e:    d1f7        ..      BNE      0x8006b20 ; mbedtls_mpi_shift_l + 92
        0x08006b30:    b1a7        ..      CBZ      r7,0x8006b5c ; mbedtls_mpi_shift_l + 152
        0x08006b32:    f1c70c20    .. .    RSB      r12,r7,#0x20
        0x08006b36:    e00e        ..      B        0x8006b56 ; mbedtls_mpi_shift_l + 146
        0x08006b38:    68b3        .h      LDR      r3,[r6,#8]
        0x08006b3a:    f8530024    S.$.    LDR      r0,[r3,r4,LSL #2]
        0x08006b3e:    4601        .F      MOV      r1,r0
        0x08006b40:    fa20f00c     ...    LSR      r0,r0,r12
        0x08006b44:    40b9        .@      LSLS     r1,r1,r7
        0x08006b46:    f8431024    C.$.    STR      r1,[r3,r4,LSL #2]
        0x08006b4a:    68b3        .h      LDR      r3,[r6,#8]
        0x08006b4c:    4329        )C      ORRS     r1,r1,r5
        0x08006b4e:    4605        .F      MOV      r5,r0
        0x08006b50:    f8431024    C.$.    STR      r1,[r3,r4,LSL #2]
        0x08006b54:    1c64        d.      ADDS     r4,r4,#1
        0x08006b56:    6870        ph      LDR      r0,[r6,#4]
        0x08006b58:    42a0        .B      CMP      r0,r4
        0x08006b5a:    d8ed        ..      BHI      0x8006b38 ; mbedtls_mpi_shift_l + 116
        0x08006b5c:    4610        .F      MOV      r0,r2
        0x08006b5e:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x08006b62:    0000        ..      MOVS     r0,r0
    i.mbedtls_mpi_shift_r
    mbedtls_mpi_shift_r
        0x08006b64:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x08006b68:    094a        J.      LSRS     r2,r1,#5
        0x08006b6a:    f001051f    ....    AND      r5,r1,#0x1f
        0x08006b6e:    6841        Ah      LDR      r1,[r0,#4]
        0x08006b70:    2300        .#      MOVS     r3,#0
        0x08006b72:    4291        .B      CMP      r1,r2
        0x08006b74:    d301        ..      BCC      0x8006b7a ; mbedtls_mpi_shift_r + 22
        0x08006b76:    d106        ..      BNE      0x8006b86 ; mbedtls_mpi_shift_r + 34
        0x08006b78:    b12d        -.      CBZ      r5,0x8006b86 ; mbedtls_mpi_shift_r + 34
        0x08006b7a:    e8bd41f0    ...A    POP      {r4-r8,lr}
        0x08006b7e:    f04f0100    O...    MOV      r1,#0
        0x08006b82:    f7ffbd4b    ..K.    B.W      mbedtls_mpi_lset ; 0x800661c
        0x08006b86:    b1aa        ..      CBZ      r2,0x8006bb4 ; mbedtls_mpi_shift_r + 80
        0x08006b88:    2100        .!      MOVS     r1,#0
        0x08006b8a:    e006        ..      B        0x8006b9a ; mbedtls_mpi_shift_r + 54
        0x08006b8c:    6884        .h      LDR      r4,[r0,#8]
        0x08006b8e:    188e        ..      ADDS     r6,r1,r2
        0x08006b90:    f8546026    T.&`    LDR      r6,[r4,r6,LSL #2]
        0x08006b94:    f8446021    D.!`    STR      r6,[r4,r1,LSL #2]
        0x08006b98:    1c49        I.      ADDS     r1,r1,#1
        0x08006b9a:    6844        Dh      LDR      r4,[r0,#4]
        0x08006b9c:    1aa4        ..      SUBS     r4,r4,r2
        0x08006b9e:    428c        .B      CMP      r4,r1
        0x08006ba0:    d8f4        ..      BHI      0x8006b8c ; mbedtls_mpi_shift_r + 40
        0x08006ba2:    2200        ."      MOVS     r2,#0
        0x08006ba4:    6844        Dh      LDR      r4,[r0,#4]
        0x08006ba6:    428c        .B      CMP      r4,r1
        0x08006ba8:    d904        ..      BLS      0x8006bb4 ; mbedtls_mpi_shift_r + 80
        0x08006baa:    6884        .h      LDR      r4,[r0,#8]
        0x08006bac:    f8442021    D.!     STR      r2,[r4,r1,LSL #2]
        0x08006bb0:    1c49        I.      ADDS     r1,r1,#1
        0x08006bb2:    e7f7        ..      B        0x8006ba4 ; mbedtls_mpi_shift_r + 64
        0x08006bb4:    b1a5        ..      CBZ      r5,0x8006be0 ; mbedtls_mpi_shift_r + 124
        0x08006bb6:    6844        Dh      LDR      r4,[r0,#4]
        0x08006bb8:    b194        ..      CBZ      r4,0x8006be0 ; mbedtls_mpi_shift_r + 124
        0x08006bba:    f06f0e03    o...    MVN      lr,#3
        0x08006bbe:    f1c50c20    .. .    RSB      r12,r5,#0x20
        0x08006bc2:    bf00        ..      NOP      
        0x08006bc4:    6887        .h      LDR      r7,[r0,#8]
        0x08006bc6:    eb0e0684    ....    ADD      r6,lr,r4,LSL #2
        0x08006bca:    59ba        .Y      LDR      r2,[r7,r6]
        0x08006bcc:    fa02f10c    ....    LSL      r1,r2,r12
        0x08006bd0:    40ea        .@      LSRS     r2,r2,r5
        0x08006bd2:    51ba        .Q      STR      r2,[r7,r6]
        0x08006bd4:    431a        .C      ORRS     r2,r2,r3
        0x08006bd6:    6887        .h      LDR      r7,[r0,#8]
        0x08006bd8:    460b        .F      MOV      r3,r1
        0x08006bda:    1e64        d.      SUBS     r4,r4,#1
        0x08006bdc:    51ba        .Q      STR      r2,[r7,r6]
        0x08006bde:    d1f1        ..      BNE      0x8006bc4 ; mbedtls_mpi_shift_r + 96
        0x08006be0:    2000        .       MOVS     r0,#0
        0x08006be2:    e8bd81f0    ....    POP      {r4-r8,pc}
    i.mbedtls_mpi_shrink
    mbedtls_mpi_shrink
        0x08006be6:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x08006bea:    4605        .F      MOV      r5,r0
        0x08006bec:    f2427010    B..p    MOV      r0,#0x2710
        0x08006bf0:    f06f060f    o...    MVN      r6,#0xf
        0x08006bf4:    4281        .B      CMP      r1,r0
        0x08006bf6:    d82a        *.      BHI      0x8006c4e ; mbedtls_mpi_shrink + 104
        0x08006bf8:    686c        lh      LDR      r4,[r5,#4]
        0x08006bfa:    428c        .B      CMP      r4,r1
        0x08006bfc:    d804        ..      BHI      0x8006c08 ; mbedtls_mpi_shrink + 34
        0x08006bfe:    4628        (F      MOV      r0,r5
        0x08006c00:    e8bd41f0    ...A    POP      {r4-r8,lr}
        0x08006c04:    f7ffbb90    ....    B        mbedtls_mpi_grow ; 0x8006328
        0x08006c08:    1e64        d.      SUBS     r4,r4,#1
        0x08006c0a:    d005        ..      BEQ      0x8006c18 ; mbedtls_mpi_shrink + 50
        0x08006c0c:    68a8        .h      LDR      r0,[r5,#8]
        0x08006c0e:    f8502024    P.$     LDR      r2,[r0,r4,LSL #2]
        0x08006c12:    b90a        ..      CBNZ     r2,0x8006c18 ; mbedtls_mpi_shrink + 50
        0x08006c14:    1e64        d.      SUBS     r4,r4,#1
        0x08006c16:    d1fa        ..      BNE      0x8006c0e ; mbedtls_mpi_shrink + 40
        0x08006c18:    1c64        d.      ADDS     r4,r4,#1
        0x08006c1a:    428c        .B      CMP      r4,r1
        0x08006c1c:    d200        ..      BCS      0x8006c20 ; mbedtls_mpi_shrink + 58
        0x08006c1e:    460c        .F      MOV      r4,r1
        0x08006c20:    2104        .!      MOVS     r1,#4
        0x08006c22:    4620         F      MOV      r0,r4
        0x08006c24:    f7f9faf6    ....    BL       calloc ; 0x8000214
        0x08006c28:    0007        ..      MOVS     r7,r0
        0x08006c2a:    d010        ..      BEQ      0x8006c4e ; mbedtls_mpi_shrink + 104
        0x08006c2c:    68a9        .h      LDR      r1,[r5,#8]
        0x08006c2e:    b149        I.      CBZ      r1,0x8006c44 ; mbedtls_mpi_shrink + 94
        0x08006c30:    00a2        ..      LSLS     r2,r4,#2
        0x08006c32:    f7f9fc34    ..4.    BL       __aeabi_memcpy4 ; 0x800049e
        0x08006c36:    e9d51001    ....    LDRD     r1,r0,[r5,#4]
        0x08006c3a:    f7fbf9de    ....    BL       mbedtls_mpi_zeroize ; 0x8001ffa
        0x08006c3e:    68a8        .h      LDR      r0,[r5,#8]
        0x08006c40:    f7f9fb2b    ..+.    BL       free ; 0x800029a
        0x08006c44:    e9c54701    ...G    STRD     r4,r7,[r5,#4]
        0x08006c48:    2000        .       MOVS     r0,#0
        0x08006c4a:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x08006c4e:    4630        0F      MOV      r0,r6
        0x08006c50:    e7fb        ..      B        0x8006c4a ; mbedtls_mpi_shrink + 100
    i.mbedtls_mpi_size
    mbedtls_mpi_size
        0x08006c52:    b500        ..      PUSH     {lr}
        0x08006c54:    f7fff827    ..'.    BL       mbedtls_mpi_bitlen ; 0x8005ca6
        0x08006c58:    1dc0        ..      ADDS     r0,r0,#7
        0x08006c5a:    08c0        ..      LSRS     r0,r0,#3
        0x08006c5c:    bd00        ..      POP      {pc}
    i.mbedtls_mpi_sub_abs
    mbedtls_mpi_sub_abs
        0x08006c5e:    b5fe        ..      PUSH     {r1-r7,lr}
        0x08006c60:    460f        .F      MOV      r7,r1
        0x08006c62:    4605        .F      MOV      r5,r0
        0x08006c64:    4614        .F      MOV      r4,r2
        0x08006c66:    4611        .F      MOV      r1,r2
        0x08006c68:    4638        8F      MOV      r0,r7
        0x08006c6a:    f7fff83b    ..;.    BL       mbedtls_mpi_cmp_abs ; 0x8005ce4
        0x08006c6e:    2800        .(      CMP      r0,#0
        0x08006c70:    da02        ..      BGE      0x8006c78 ; mbedtls_mpi_sub_abs + 26
        0x08006c72:    f06f0009    o...    MVN      r0,#9
        0x08006c76:    bdfe        ..      POP      {r1-r7,pc}
        0x08006c78:    4668        hF      MOV      r0,sp
        0x08006c7a:    f7fffb7d    ..}.    BL       mbedtls_mpi_init ; 0x8006378
        0x08006c7e:    42a5        .B      CMP      r5,r4
        0x08006c80:    d106        ..      BNE      0x8006c90 ; mbedtls_mpi_sub_abs + 50
        0x08006c82:    4621        !F      MOV      r1,r4
        0x08006c84:    4668        hF      MOV      r0,sp
        0x08006c86:    f7fff8bd    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08006c8a:    0006        ..      MOVS     r6,r0
        0x08006c8c:    d119        ..      BNE      0x8006cc2 ; mbedtls_mpi_sub_abs + 100
        0x08006c8e:    466c        lF      MOV      r4,sp
        0x08006c90:    42bd        .B      CMP      r5,r7
        0x08006c92:    d005        ..      BEQ      0x8006ca0 ; mbedtls_mpi_sub_abs + 66
        0x08006c94:    4639        9F      MOV      r1,r7
        0x08006c96:    4628        (F      MOV      r0,r5
        0x08006c98:    f7fff8b4    ....    BL       mbedtls_mpi_copy ; 0x8005e04
        0x08006c9c:    0006        ..      MOVS     r6,r0
        0x08006c9e:    d110        ..      BNE      0x8006cc2 ; mbedtls_mpi_sub_abs + 100
        0x08006ca0:    2001        .       MOVS     r0,#1
        0x08006ca2:    6028        (`      STR      r0,[r5,#0]
        0x08006ca4:    6860        `h      LDR      r0,[r4,#4]
        0x08006ca6:    2600        .&      MOVS     r6,#0
        0x08006ca8:    b138        8.      CBZ      r0,0x8006cba ; mbedtls_mpi_sub_abs + 92
        0x08006caa:    68a1        .h      LDR      r1,[r4,#8]
        0x08006cac:    1f32        2.      SUBS     r2,r6,#4
        0x08006cae:    eb020380    ....    ADD      r3,r2,r0,LSL #2
        0x08006cb2:    58cb        .X      LDR      r3,[r1,r3]
        0x08006cb4:    b90b        ..      CBNZ     r3,0x8006cba ; mbedtls_mpi_sub_abs + 92
        0x08006cb6:    1e40        @.      SUBS     r0,r0,#1
        0x08006cb8:    d1f9        ..      BNE      0x8006cae ; mbedtls_mpi_sub_abs + 80
        0x08006cba:    68aa        .h      LDR      r2,[r5,#8]
        0x08006cbc:    68a1        .h      LDR      r1,[r4,#8]
        0x08006cbe:    f000fb8e    ....    BL       mpi_sub_hlp ; 0x80073de
        0x08006cc2:    4668        hF      MOV      r0,sp
        0x08006cc4:    f7fffa8f    ....    BL       mbedtls_mpi_free ; 0x80061e6
        0x08006cc8:    4630        0F      MOV      r0,r6
        0x08006cca:    bdfe        ..      POP      {r1-r7,pc}
    i.mbedtls_mpi_sub_int
    mbedtls_mpi_sub_int
        0x08006ccc:    b51f        ..      PUSH     {r0-r4,lr}
        0x08006cce:    2a00        .*      CMP      r2,#0
        0x08006cd0:    da02        ..      BGE      0x8006cd8 ; mbedtls_mpi_sub_int + 12
        0x08006cd2:    bf00        ..      NOP      
        0x08006cd4:    f1c20200    ....    RSB      r2,r2,#0
        0x08006cd8:    9203        ..      STR      r2,[sp,#0xc]
        0x08006cda:    da02        ..      BGE      0x8006ce2 ; mbedtls_mpi_sub_int + 22
        0x08006cdc:    f04f32ff    O..2    MOV      r2,#0xffffffff
        0x08006ce0:    e001        ..      B        0x8006ce6 ; mbedtls_mpi_sub_int + 26
        0x08006ce2:    f04f0201    O...    MOV      r2,#1
        0x08006ce6:    9200        ..      STR      r2,[sp,#0]
        0x08006ce8:    f04f0201    O...    MOV      r2,#1
        0x08006cec:    9201        ..      STR      r2,[sp,#4]
        0x08006cee:    aa03        ..      ADD      r2,sp,#0xc
        0x08006cf0:    9202        ..      STR      r2,[sp,#8]
        0x08006cf2:    466a        jF      MOV      r2,sp
        0x08006cf4:    f000f802    ....    BL       mbedtls_mpi_sub_mpi ; 0x8006cfc
        0x08006cf8:    b004        ..      ADD      sp,sp,#0x10
        0x08006cfa:    bd10        ..      POP      {r4,pc}
    i.mbedtls_mpi_sub_mpi
    mbedtls_mpi_sub_mpi
        0x08006cfc:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x08006d00:    4605        .F      MOV      r5,r0
        0x08006d02:    680c        .h      LDR      r4,[r1,#0]
        0x08006d04:    6810        .h      LDR      r0,[r2,#0]
        0x08006d06:    4617        .F      MOV      r7,r2
        0x08006d08:    4360        `C      MULS     r0,r4,r0
        0x08006d0a:    460e        .F      MOV      r6,r1
        0x08006d0c:    2800        .(      CMP      r0,#0
        0x08006d0e:    dd19        ..      BLE      0x8006d44 ; mbedtls_mpi_sub_mpi + 72
        0x08006d10:    4611        .F      MOV      r1,r2
        0x08006d12:    4630        0F      MOV      r0,r6
        0x08006d14:    f7feffe6    ....    BL       mbedtls_mpi_cmp_abs ; 0x8005ce4
        0x08006d18:    2800        .(      CMP      r0,#0
        0x08006d1a:    db09        ..      BLT      0x8006d30 ; mbedtls_mpi_sub_mpi + 52
        0x08006d1c:    463a        :F      MOV      r2,r7
        0x08006d1e:    4631        1F      MOV      r1,r6
        0x08006d20:    4628        (F      MOV      r0,r5
        0x08006d22:    f7ffff9c    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08006d26:    2800        .(      CMP      r0,#0
        0x08006d28:    d100        ..      BNE      0x8006d2c ; mbedtls_mpi_sub_mpi + 48
        0x08006d2a:    602c        ,`      STR      r4,[r5,#0]
        0x08006d2c:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x08006d30:    4632        2F      MOV      r2,r6
        0x08006d32:    4639        9F      MOV      r1,r7
        0x08006d34:    4628        (F      MOV      r0,r5
        0x08006d36:    f7ffff92    ....    BL       mbedtls_mpi_sub_abs ; 0x8006c5e
        0x08006d3a:    2800        .(      CMP      r0,#0
        0x08006d3c:    d1f6        ..      BNE      0x8006d2c ; mbedtls_mpi_sub_mpi + 48
        0x08006d3e:    4261        aB      RSBS     r1,r4,#0
        0x08006d40:    6029        )`      STR      r1,[r5,#0]
        0x08006d42:    e7f3        ..      B        0x8006d2c ; mbedtls_mpi_sub_mpi + 48
        0x08006d44:    4628        (F      MOV      r0,r5
        0x08006d46:    f7feff13    ....    BL       mbedtls_mpi_add_abs ; 0x8005b70
        0x08006d4a:    e7ec        ..      B        0x8006d26 ; mbedtls_mpi_sub_mpi + 42
    i.mbedtls_platform_zeroize
    mbedtls_platform_zeroize
        0x08006d4c:    4b02        .K      LDR      r3,[pc,#8] ; [0x8006d58] = 0x2000003c
        0x08006d4e:    460a        .F      MOV      r2,r1
        0x08006d50:    2100        .!      MOVS     r1,#0
        0x08006d52:    681b        .h      LDR      r3,[r3,#0]
        0x08006d54:    4718        .G      BX       r3
    $d
        0x08006d56:    0000        ..      DCW    0
        0x08006d58:    2000003c    <..     DCD    536870972
    $t
    i.mbedtls_sha256_finish_ret
    mbedtls_sha256_finish_ret
        0x08006d5c:    b570        p.      PUSH     {r4-r6,lr}
        0x08006d5e:    4604        .F      MOV      r4,r0
        0x08006d60:    7800        .x      LDRB     r0,[r0,#0]
        0x08006d62:    460d        .F      MOV      r5,r1
        0x08006d64:    f000003f    ..?.    AND      r0,r0,#0x3f
        0x08006d68:    1822        ".      ADDS     r2,r4,r0
        0x08006d6a:    2180        .!      MOVS     r1,#0x80
        0x08006d6c:    1c40        @.      ADDS     r0,r0,#1
        0x08006d6e:    f8821028    ..(.    STRB     r1,[r2,#0x28]
        0x08006d72:    f1040628    ..(.    ADD      r6,r4,#0x28
        0x08006d76:    2838        8(      CMP      r0,#0x38
        0x08006d78:    d806        ..      BHI      0x8006d88 ; mbedtls_sha256_finish_ret + 44
        0x08006d7a:    f1c00138    ..8.    RSB      r1,r0,#0x38
        0x08006d7e:    4420         D      ADD      r0,r0,r4
        0x08006d80:    3028        (0      ADDS     r0,r0,#0x28
        0x08006d82:    f7f9fbc9    ....    BL       __aeabi_memclr ; 0x8000518
        0x08006d86:    e00f        ..      B        0x8006da8 ; mbedtls_sha256_finish_ret + 76
        0x08006d88:    f1c00140    ..@.    RSB      r1,r0,#0x40
        0x08006d8c:    4420         D      ADD      r0,r0,r4
        0x08006d8e:    3028        (0      ADDS     r0,r0,#0x28
        0x08006d90:    f7f9fbc2    ....    BL       __aeabi_memclr ; 0x8000518
        0x08006d94:    4631        1F      MOV      r1,r6
        0x08006d96:    4620         F      MOV      r0,r4
        0x08006d98:    f7fefacc    ....    BL       mbedtls_internal_sha256_process ; 0x8005334
        0x08006d9c:    2800        .(      CMP      r0,#0
        0x08006d9e:    d17f        ..      BNE      0x8006ea0 ; mbedtls_sha256_finish_ret + 324
        0x08006da0:    2138        8!      MOVS     r1,#0x38
        0x08006da2:    4630        0F      MOV      r0,r6
        0x08006da4:    f7f9fbda    ....    BL       __aeabi_memclr4 ; 0x800055c
        0x08006da8:    f8541b48    T.H.    LDR      r1,[r4],#0x48
        0x08006dac:    0f48        H.      LSRS     r0,r1,#29
        0x08006dae:    f8542c44    T.D,    LDR      r2,[r4,#-0x44]
        0x08006db2:    00c9        ..      LSLS     r1,r1,#3
        0x08006db4:    ea4000c2    @...    ORR      r0,r0,r2,LSL #3
        0x08006db8:    0e02        ..      LSRS     r2,r0,#24
        0x08006dba:    7622        "v      STRB     r2,[r4,#0x18]
        0x08006dbc:    0c02        ..      LSRS     r2,r0,#16
        0x08006dbe:    7662        bv      STRB     r2,[r4,#0x19]
        0x08006dc0:    0a02        ..      LSRS     r2,r0,#8
        0x08006dc2:    76a2        .v      STRB     r2,[r4,#0x1a]
        0x08006dc4:    76e0        .v      STRB     r0,[r4,#0x1b]
        0x08006dc6:    0e08        ..      LSRS     r0,r1,#24
        0x08006dc8:    7720         w      STRB     r0,[r4,#0x1c]
        0x08006dca:    0c08        ..      LSRS     r0,r1,#16
        0x08006dcc:    7760        `w      STRB     r0,[r4,#0x1d]
        0x08006dce:    0a08        ..      LSRS     r0,r1,#8
        0x08006dd0:    77a0        .w      STRB     r0,[r4,#0x1e]
        0x08006dd2:    77e1        .w      STRB     r1,[r4,#0x1f]
        0x08006dd4:    3c48        H<      SUBS     r4,r4,#0x48
        0x08006dd6:    4631        1F      MOV      r1,r6
        0x08006dd8:    4620         F      MOV      r0,r4
        0x08006dda:    f7fefaab    ....    BL       mbedtls_internal_sha256_process ; 0x8005334
        0x08006dde:    2800        .(      CMP      r0,#0
        0x08006de0:    d15e        ^.      BNE      0x8006ea0 ; mbedtls_sha256_finish_ret + 324
        0x08006de2:    68a0        .h      LDR      r0,[r4,#8]
        0x08006de4:    0e00        ..      LSRS     r0,r0,#24
        0x08006de6:    7028        (p      STRB     r0,[r5,#0]
        0x08006de8:    68a0        .h      LDR      r0,[r4,#8]
        0x08006dea:    0c00        ..      LSRS     r0,r0,#16
        0x08006dec:    7068        hp      STRB     r0,[r5,#1]
        0x08006dee:    8920         .      LDRH     r0,[r4,#8]
        0x08006df0:    0a00        ..      LSRS     r0,r0,#8
        0x08006df2:    70a8        .p      STRB     r0,[r5,#2]
        0x08006df4:    7a20         z      LDRB     r0,[r4,#8]
        0x08006df6:    70e8        .p      STRB     r0,[r5,#3]
        0x08006df8:    68e0        .h      LDR      r0,[r4,#0xc]
        0x08006dfa:    0e00        ..      LSRS     r0,r0,#24
        0x08006dfc:    7128        (q      STRB     r0,[r5,#4]
        0x08006dfe:    68e0        .h      LDR      r0,[r4,#0xc]
        0x08006e00:    0c00        ..      LSRS     r0,r0,#16
        0x08006e02:    7168        hq      STRB     r0,[r5,#5]
        0x08006e04:    89a0        ..      LDRH     r0,[r4,#0xc]
        0x08006e06:    0a00        ..      LSRS     r0,r0,#8
        0x08006e08:    71a8        .q      STRB     r0,[r5,#6]
        0x08006e0a:    7b20         {      LDRB     r0,[r4,#0xc]
        0x08006e0c:    71e8        .q      STRB     r0,[r5,#7]
        0x08006e0e:    6920         i      LDR      r0,[r4,#0x10]
        0x08006e10:    0e00        ..      LSRS     r0,r0,#24
        0x08006e12:    7228        (r      STRB     r0,[r5,#8]
        0x08006e14:    6920         i      LDR      r0,[r4,#0x10]
        0x08006e16:    0c00        ..      LSRS     r0,r0,#16
        0x08006e18:    7268        hr      STRB     r0,[r5,#9]
        0x08006e1a:    8a20         .      LDRH     r0,[r4,#0x10]
        0x08006e1c:    0a00        ..      LSRS     r0,r0,#8
        0x08006e1e:    72a8        .r      STRB     r0,[r5,#0xa]
        0x08006e20:    7c20         |      LDRB     r0,[r4,#0x10]
        0x08006e22:    72e8        .r      STRB     r0,[r5,#0xb]
        0x08006e24:    6960        `i      LDR      r0,[r4,#0x14]
        0x08006e26:    0e00        ..      LSRS     r0,r0,#24
        0x08006e28:    7328        (s      STRB     r0,[r5,#0xc]
        0x08006e2a:    6960        `i      LDR      r0,[r4,#0x14]
        0x08006e2c:    0c00        ..      LSRS     r0,r0,#16
        0x08006e2e:    7368        hs      STRB     r0,[r5,#0xd]
        0x08006e30:    8aa0        ..      LDRH     r0,[r4,#0x14]
        0x08006e32:    0a00        ..      LSRS     r0,r0,#8
        0x08006e34:    73a8        .s      STRB     r0,[r5,#0xe]
        0x08006e36:    7d20         }      LDRB     r0,[r4,#0x14]
        0x08006e38:    73e8        .s      STRB     r0,[r5,#0xf]
        0x08006e3a:    69a0        .i      LDR      r0,[r4,#0x18]
        0x08006e3c:    0e00        ..      LSRS     r0,r0,#24
        0x08006e3e:    7428        (t      STRB     r0,[r5,#0x10]
        0x08006e40:    69a0        .i      LDR      r0,[r4,#0x18]
        0x08006e42:    0c00        ..      LSRS     r0,r0,#16
        0x08006e44:    7468        ht      STRB     r0,[r5,#0x11]
        0x08006e46:    8b20         .      LDRH     r0,[r4,#0x18]
        0x08006e48:    0a00        ..      LSRS     r0,r0,#8
        0x08006e4a:    74a8        .t      STRB     r0,[r5,#0x12]
        0x08006e4c:    7e20         ~      LDRB     r0,[r4,#0x18]
        0x08006e4e:    74e8        .t      STRB     r0,[r5,#0x13]
        0x08006e50:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x08006e52:    0e00        ..      LSRS     r0,r0,#24
        0x08006e54:    7528        (u      STRB     r0,[r5,#0x14]
        0x08006e56:    69e0        .i      LDR      r0,[r4,#0x1c]
        0x08006e58:    0c00        ..      LSRS     r0,r0,#16
        0x08006e5a:    7568        hu      STRB     r0,[r5,#0x15]
        0x08006e5c:    8ba0        ..      LDRH     r0,[r4,#0x1c]
        0x08006e5e:    0a00        ..      LSRS     r0,r0,#8
        0x08006e60:    75a8        .u      STRB     r0,[r5,#0x16]
        0x08006e62:    7f20         .      LDRB     r0,[r4,#0x1c]
        0x08006e64:    75e8        .u      STRB     r0,[r5,#0x17]
        0x08006e66:    6a20         j      LDR      r0,[r4,#0x20]
        0x08006e68:    0e00        ..      LSRS     r0,r0,#24
        0x08006e6a:    7628        (v      STRB     r0,[r5,#0x18]
        0x08006e6c:    6a20         j      LDR      r0,[r4,#0x20]
        0x08006e6e:    0c00        ..      LSRS     r0,r0,#16
        0x08006e70:    7668        hv      STRB     r0,[r5,#0x19]
        0x08006e72:    8c20         .      LDRH     r0,[r4,#0x20]
        0x08006e74:    0a00        ..      LSRS     r0,r0,#8
        0x08006e76:    76a8        .v      STRB     r0,[r5,#0x1a]
        0x08006e78:    f8940020    .. .    LDRB     r0,[r4,#0x20]
        0x08006e7c:    76e8        .v      STRB     r0,[r5,#0x1b]
        0x08006e7e:    6ea0        .n      LDR      r0,[r4,#0x68]
        0x08006e80:    b958        X.      CBNZ     r0,0x8006e9a ; mbedtls_sha256_finish_ret + 318
        0x08006e82:    6a60        `j      LDR      r0,[r4,#0x24]
        0x08006e84:    0e00        ..      LSRS     r0,r0,#24
        0x08006e86:    7728        (w      STRB     r0,[r5,#0x1c]
        0x08006e88:    6a60        `j      LDR      r0,[r4,#0x24]
        0x08006e8a:    0c00        ..      LSRS     r0,r0,#16
        0x08006e8c:    7768        hw      STRB     r0,[r5,#0x1d]
        0x08006e8e:    8ca0        ..      LDRH     r0,[r4,#0x24]
        0x08006e90:    0a00        ..      LSRS     r0,r0,#8
        0x08006e92:    77a8        .w      STRB     r0,[r5,#0x1e]
        0x08006e94:    f8940024    ..$.    LDRB     r0,[r4,#0x24]
        0x08006e98:    77e8        .w      STRB     r0,[r5,#0x1f]
        0x08006e9a:    e000        ..      B        0x8006e9e ; mbedtls_sha256_finish_ret + 322
        0x08006e9c:    e000        ..      B        0x8006ea0 ; mbedtls_sha256_finish_ret + 324
        0x08006e9e:    2000        .       MOVS     r0,#0
        0x08006ea0:    bd70        p.      POP      {r4-r6,pc}
    i.mbedtls_sha256_free
    mbedtls_sha256_free
        0x08006ea2:    2800        .(      CMP      r0,#0
        0x08006ea4:    d002        ..      BEQ      0x8006eac ; mbedtls_sha256_free + 10
        0x08006ea6:    216c        l!      MOVS     r1,#0x6c
        0x08006ea8:    f7ffbf50    ..P.    B.W      mbedtls_platform_zeroize ; 0x8006d4c
        0x08006eac:    4770        pG      BX       lr
    i.mbedtls_sha256_init
    mbedtls_sha256_init
        0x08006eae:    216c        l!      MOVS     r1,#0x6c
        0x08006eb0:    f7f9bb54    ..T.    B        __aeabi_memclr4 ; 0x800055c
    i.mbedtls_sha256_ret
    mbedtls_sha256_ret
        0x08006eb4:    b5f0        ..      PUSH     {r4-r7,lr}
        0x08006eb6:    b09b        ..      SUB      sp,sp,#0x6c
        0x08006eb8:    4607        .F      MOV      r7,r0
        0x08006eba:    461c        .F      MOV      r4,r3
        0x08006ebc:    4615        .F      MOV      r5,r2
        0x08006ebe:    460e        .F      MOV      r6,r1
        0x08006ec0:    4668        hF      MOV      r0,sp
        0x08006ec2:    f7fffff4    ....    BL       mbedtls_sha256_init ; 0x8006eae
        0x08006ec6:    4621        !F      MOV      r1,r4
        0x08006ec8:    4668        hF      MOV      r0,sp
        0x08006eca:    f000f815    ....    BL       mbedtls_sha256_starts_ret ; 0x8006ef8
        0x08006ece:    0004        ..      MOVS     r4,r0
        0x08006ed0:    d10b        ..      BNE      0x8006eea ; mbedtls_sha256_ret + 54
        0x08006ed2:    4632        2F      MOV      r2,r6
        0x08006ed4:    4639        9F      MOV      r1,r7
        0x08006ed6:    4668        hF      MOV      r0,sp
        0x08006ed8:    f000f856    ..V.    BL       mbedtls_sha256_update_ret ; 0x8006f88
        0x08006edc:    0004        ..      MOVS     r4,r0
        0x08006ede:    d104        ..      BNE      0x8006eea ; mbedtls_sha256_ret + 54
        0x08006ee0:    4629        )F      MOV      r1,r5
        0x08006ee2:    4668        hF      MOV      r0,sp
        0x08006ee4:    f7ffff3a    ..:.    BL       mbedtls_sha256_finish_ret ; 0x8006d5c
        0x08006ee8:    4604        .F      MOV      r4,r0
        0x08006eea:    4668        hF      MOV      r0,sp
        0x08006eec:    f7ffffd9    ....    BL       mbedtls_sha256_free ; 0x8006ea2
        0x08006ef0:    b01b        ..      ADD      sp,sp,#0x6c
        0x08006ef2:    4620         F      MOV      r0,r4
        0x08006ef4:    bdf0        ..      POP      {r4-r7,pc}
        0x08006ef6:    0000        ..      MOVS     r0,r0
    i.mbedtls_sha256_starts_ret
    mbedtls_sha256_starts_ret
        0x08006ef8:    2200        ."      MOVS     r2,#0
        0x08006efa:    6002        .`      STR      r2,[r0,#0]
        0x08006efc:    6042        B`      STR      r2,[r0,#4]
        0x08006efe:    b191        ..      CBZ      r1,0x8006f26 ; mbedtls_sha256_starts_ret + 46
        0x08006f00:    4a11        .J      LDR      r2,[pc,#68] ; [0x8006f48] = 0xc1059ed8
        0x08006f02:    6082        .`      STR      r2,[r0,#8]
        0x08006f04:    4a11        .J      LDR      r2,[pc,#68] ; [0x8006f4c] = 0x367cd507
        0x08006f06:    60c2        .`      STR      r2,[r0,#0xc]
        0x08006f08:    4a11        .J      LDR      r2,[pc,#68] ; [0x8006f50] = 0x3070dd17
        0x08006f0a:    6102        .a      STR      r2,[r0,#0x10]
        0x08006f0c:    4a11        .J      LDR      r2,[pc,#68] ; [0x8006f54] = 0xf70e5939
        0x08006f0e:    6142        Ba      STR      r2,[r0,#0x14]
        0x08006f10:    4a11        .J      LDR      r2,[pc,#68] ; [0x8006f58] = 0xffc00b31
        0x08006f12:    6182        .a      STR      r2,[r0,#0x18]
        0x08006f14:    4a11        .J      LDR      r2,[pc,#68] ; [0x8006f5c] = 0x68581511
        0x08006f16:    61c2        .a      STR      r2,[r0,#0x1c]
        0x08006f18:    4a11        .J      LDR      r2,[pc,#68] ; [0x8006f60] = 0x64f98fa7
        0x08006f1a:    6202        .b      STR      r2,[r0,#0x20]
        0x08006f1c:    4a11        .J      LDR      r2,[pc,#68] ; [0x8006f64] = 0xbefa4fa4
        0x08006f1e:    6242        Bb      STR      r2,[r0,#0x24]
        0x08006f20:    6681        .f      STR      r1,[r0,#0x68]
        0x08006f22:    2000        .       MOVS     r0,#0
        0x08006f24:    4770        pG      BX       lr
        0x08006f26:    4a10        .J      LDR      r2,[pc,#64] ; [0x8006f68] = 0x6a09e667
        0x08006f28:    6082        .`      STR      r2,[r0,#8]
        0x08006f2a:    4a10        .J      LDR      r2,[pc,#64] ; [0x8006f6c] = 0xbb67ae85
        0x08006f2c:    60c2        .`      STR      r2,[r0,#0xc]
        0x08006f2e:    4a10        .J      LDR      r2,[pc,#64] ; [0x8006f70] = 0x3c6ef372
        0x08006f30:    6102        .a      STR      r2,[r0,#0x10]
        0x08006f32:    4a10        .J      LDR      r2,[pc,#64] ; [0x8006f74] = 0xa54ff53a
        0x08006f34:    6142        Ba      STR      r2,[r0,#0x14]
        0x08006f36:    4a10        .J      LDR      r2,[pc,#64] ; [0x8006f78] = 0x510e527f
        0x08006f38:    6182        .a      STR      r2,[r0,#0x18]
        0x08006f3a:    4a10        .J      LDR      r2,[pc,#64] ; [0x8006f7c] = 0x9b05688c
        0x08006f3c:    61c2        .a      STR      r2,[r0,#0x1c]
        0x08006f3e:    4a10        .J      LDR      r2,[pc,#64] ; [0x8006f80] = 0x1f83d9ab
        0x08006f40:    6202        .b      STR      r2,[r0,#0x20]
        0x08006f42:    4a10        .J      LDR      r2,[pc,#64] ; [0x8006f84] = 0x5be0cd19
        0x08006f44:    e7eb        ..      B        0x8006f1e ; mbedtls_sha256_starts_ret + 38
    $d
        0x08006f46:    0000        ..      DCW    0
        0x08006f48:    c1059ed8    ....    DCD    3238371032
        0x08006f4c:    367cd507    ..|6    DCD    914150663
        0x08006f50:    3070dd17    ..p0    DCD    812702999
        0x08006f54:    f70e5939    9Y..    DCD    4144912697
        0x08006f58:    ffc00b31    1...    DCD    4290775857
        0x08006f5c:    68581511    ..Xh    DCD    1750603025
        0x08006f60:    64f98fa7    ...d    DCD    1694076839
        0x08006f64:    befa4fa4    .O..    DCD    3204075428
        0x08006f68:    6a09e667    g..j    DCD    1779033703
        0x08006f6c:    bb67ae85    ..g.    DCD    3144134277
        0x08006f70:    3c6ef372    r.n<    DCD    1013904242
        0x08006f74:    a54ff53a    :.O.    DCD    2773480762
        0x08006f78:    510e527f    .R.Q    DCD    1359893119
        0x08006f7c:    9b05688c    .h..    DCD    2600822924
        0x08006f80:    1f83d9ab    ....    DCD    528734635
        0x08006f84:    5be0cd19    ...[    DCD    1541459225
    $t
    i.mbedtls_sha256_update_ret
    mbedtls_sha256_update_ret
        0x08006f88:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x08006f8c:    0014        ..      MOVS     r4,r2
        0x08006f8e:    4605        .F      MOV      r5,r0
        0x08006f90:    4688        .F      MOV      r8,r1
        0x08006f92:    d030        0.      BEQ      0x8006ff6 ; mbedtls_sha256_update_ret + 110
        0x08006f94:    6828        (h      LDR      r0,[r5,#0]
        0x08006f96:    f000063f    ..?.    AND      r6,r0,#0x3f
        0x08006f9a:    4420         D      ADD      r0,r0,r4
        0x08006f9c:    f1c60740    ..@.    RSB      r7,r6,#0x40
        0x08006fa0:    6028        (`      STR      r0,[r5,#0]
        0x08006fa2:    42a0        .B      CMP      r0,r4
        0x08006fa4:    d202        ..      BCS      0x8006fac ; mbedtls_sha256_update_ret + 36
        0x08006fa6:    6868        hh      LDR      r0,[r5,#4]
        0x08006fa8:    1c40        @.      ADDS     r0,r0,#1
        0x08006faa:    6068        h`      STR      r0,[r5,#4]
        0x08006fac:    b1d6        ..      CBZ      r6,0x8006fe4 ; mbedtls_sha256_update_ret + 92
        0x08006fae:    42bc        .B      CMP      r4,r7
        0x08006fb0:    d318        ..      BCC      0x8006fe4 ; mbedtls_sha256_update_ret + 92
        0x08006fb2:    19a8        ..      ADDS     r0,r5,r6
        0x08006fb4:    463a        :F      MOV      r2,r7
        0x08006fb6:    3028        (0      ADDS     r0,r0,#0x28
        0x08006fb8:    f7f9fa2c    ..,.    BL       __aeabi_memcpy ; 0x8000414
        0x08006fbc:    f1050128    ..(.    ADD      r1,r5,#0x28
        0x08006fc0:    4628        (F      MOV      r0,r5
        0x08006fc2:    f7fef9b7    ....    BL       mbedtls_internal_sha256_process ; 0x8005334
        0x08006fc6:    2800        .(      CMP      r0,#0
        0x08006fc8:    d116        ..      BNE      0x8006ff8 ; mbedtls_sha256_update_ret + 112
        0x08006fca:    1be4        ..      SUBS     r4,r4,r7
        0x08006fcc:    44b8        .D      ADD      r8,r8,r7
        0x08006fce:    2600        .&      MOVS     r6,#0
        0x08006fd0:    e008        ..      B        0x8006fe4 ; mbedtls_sha256_update_ret + 92
        0x08006fd2:    4641        AF      MOV      r1,r8
        0x08006fd4:    4628        (F      MOV      r0,r5
        0x08006fd6:    f7fef9ad    ....    BL       mbedtls_internal_sha256_process ; 0x8005334
        0x08006fda:    2800        .(      CMP      r0,#0
        0x08006fdc:    d10c        ..      BNE      0x8006ff8 ; mbedtls_sha256_update_ret + 112
        0x08006fde:    f1080840    ..@.    ADD      r8,r8,#0x40
        0x08006fe2:    3c40        @<      SUBS     r4,r4,#0x40
        0x08006fe4:    2c40        @,      CMP      r4,#0x40
        0x08006fe6:    d2f4        ..      BCS      0x8006fd2 ; mbedtls_sha256_update_ret + 74
        0x08006fe8:    b12c        ,.      CBZ      r4,0x8006ff6 ; mbedtls_sha256_update_ret + 110
        0x08006fea:    19a8        ..      ADDS     r0,r5,r6
        0x08006fec:    4622        "F      MOV      r2,r4
        0x08006fee:    4641        AF      MOV      r1,r8
        0x08006ff0:    3028        (0      ADDS     r0,r0,#0x28
        0x08006ff2:    f7f9fa0f    ....    BL       __aeabi_memcpy ; 0x8000414
        0x08006ff6:    2000        .       MOVS     r0,#0
        0x08006ff8:    e8bd81f0    ....    POP      {r4-r8,pc}
    i.mpi_bigendian_to_host
    mpi_bigendian_to_host
        0x08006ffc:    b570        p.      PUSH     {r4-r6,lr}
        0x08006ffe:    2900        .)      CMP      r1,#0
        0x08007000:    d010        ..      BEQ      0x8007024 ; mpi_bigendian_to_host + 40
        0x08007002:    eb000581    ....    ADD      r5,r0,r1,LSL #2
        0x08007006:    4604        .F      MOV      r4,r0
        0x08007008:    1f2d        -.      SUBS     r5,r5,#4
        0x0800700a:    e009        ..      B        0x8007020 ; mpi_bigendian_to_host + 36
        0x0800700c:    6820         h      LDR      r0,[r4,#0]
        0x0800700e:    f000fa0c    ....    BL       mpi_uint_bigendian_to_host ; 0x800742a
        0x08007012:    4606        .F      MOV      r6,r0
        0x08007014:    6828        (h      LDR      r0,[r5,#0]
        0x08007016:    f000fa08    ....    BL       mpi_uint_bigendian_to_host ; 0x800742a
        0x0800701a:    c401        ..      STM      r4!,{r0}
        0x0800701c:    f8456904    E..i    STR      r6,[r5],#-4
        0x08007020:    42ac        .B      CMP      r4,r5
        0x08007022:    d9f3        ..      BLS      0x800700c ; mpi_bigendian_to_host + 16
        0x08007024:    bd70        p.      POP      {r4-r6,pc}
    i.mpi_get_digit
    mpi_get_digit
        0x08007026:    23ff        .#      MOVS     r3,#0xff
        0x08007028:    6003        .`      STR      r3,[r0,#0]
        0x0800702a:    f1a20330    ..0.    SUB      r3,r2,#0x30
        0x0800702e:    2b09        .+      CMP      r3,#9
        0x08007030:    d800        ..      BHI      0x8007034 ; mpi_get_digit + 14
        0x08007032:    6003        .`      STR      r3,[r0,#0]
        0x08007034:    f1a20341    ..A.    SUB      r3,r2,#0x41
        0x08007038:    2b05        .+      CMP      r3,#5
        0x0800703a:    d801        ..      BHI      0x8007040 ; mpi_get_digit + 26
        0x0800703c:    330a        .3      ADDS     r3,r3,#0xa
        0x0800703e:    6003        .`      STR      r3,[r0,#0]
        0x08007040:    f1a20361    ..a.    SUB      r3,r2,#0x61
        0x08007044:    2b05        .+      CMP      r3,#5
        0x08007046:    d801        ..      BHI      0x800704c ; mpi_get_digit + 38
        0x08007048:    3a57        W:      SUBS     r2,r2,#0x57
        0x0800704a:    6002        .`      STR      r2,[r0,#0]
        0x0800704c:    6800        .h      LDR      r0,[r0,#0]
        0x0800704e:    4288        .B      CMP      r0,r1
        0x08007050:    d302        ..      BCC      0x8007058 ; mpi_get_digit + 50
        0x08007052:    f06f0005    o...    MVN      r0,#5
        0x08007056:    4770        pG      BX       lr
        0x08007058:    2000        .       MOVS     r0,#0
        0x0800705a:    4770        pG      BX       lr
    i.mpi_mul_hlp
    mpi_mul_hlp
        0x0800705c:    b5f0        ..      PUSH     {r4-r7,lr}
        0x0800705e:    2400        .$      MOVS     r4,#0
        0x08007060:    e110        ..      B        0x8007284 ; mpi_mul_hlp + 552
        0x08007062:    c920         .      LDM      r1!,{r5}
        0x08007064:    fba56503    ...e    UMULL    r6,r5,r5,r3
        0x08007068:    1936        6.      ADDS     r6,r6,r4
        0x0800706a:    d301        ..      BCC      0x8007070 ; mpi_mul_hlp + 20
        0x0800706c:    2401        .$      MOVS     r4,#1
        0x0800706e:    e000        ..      B        0x8007072 ; mpi_mul_hlp + 22
        0x08007070:    2400        .$      MOVS     r4,#0
        0x08007072:    6817        .h      LDR      r7,[r2,#0]
        0x08007074:    4425        %D      ADD      r5,r5,r4
        0x08007076:    19bc        ..      ADDS     r4,r7,r6
        0x08007078:    d301        ..      BCC      0x800707e ; mpi_mul_hlp + 34
        0x0800707a:    2601        .&      MOVS     r6,#1
        0x0800707c:    e000        ..      B        0x8007080 ; mpi_mul_hlp + 36
        0x0800707e:    2600        .&      MOVS     r6,#0
        0x08007080:    c210        ..      STM      r2!,{r4}
        0x08007082:    c910        ..      LDM      r1!,{r4}
        0x08007084:    442e        .D      ADD      r6,r6,r5
        0x08007086:    fba44503    ...E    UMULL    r4,r5,r4,r3
        0x0800708a:    19a4        ..      ADDS     r4,r4,r6
        0x0800708c:    d301        ..      BCC      0x8007092 ; mpi_mul_hlp + 54
        0x0800708e:    2601        .&      MOVS     r6,#1
        0x08007090:    e000        ..      B        0x8007094 ; mpi_mul_hlp + 56
        0x08007092:    2600        .&      MOVS     r6,#0
        0x08007094:    442e        .D      ADD      r6,r6,r5
        0x08007096:    6815        .h      LDR      r5,[r2,#0]
        0x08007098:    192c        ,.      ADDS     r4,r5,r4
        0x0800709a:    d301        ..      BCC      0x80070a0 ; mpi_mul_hlp + 68
        0x0800709c:    2501        .%      MOVS     r5,#1
        0x0800709e:    e000        ..      B        0x80070a2 ; mpi_mul_hlp + 70
        0x080070a0:    2500        .%      MOVS     r5,#0
        0x080070a2:    c210        ..      STM      r2!,{r4}
        0x080070a4:    c910        ..      LDM      r1!,{r4}
        0x080070a6:    442e        .D      ADD      r6,r6,r5
        0x080070a8:    fba44503    ...E    UMULL    r4,r5,r4,r3
        0x080070ac:    19a4        ..      ADDS     r4,r4,r6
        0x080070ae:    d301        ..      BCC      0x80070b4 ; mpi_mul_hlp + 88
        0x080070b0:    2601        .&      MOVS     r6,#1
        0x080070b2:    e000        ..      B        0x80070b6 ; mpi_mul_hlp + 90
        0x080070b4:    2600        .&      MOVS     r6,#0
        0x080070b6:    4435        5D      ADD      r5,r5,r6
        0x080070b8:    6816        .h      LDR      r6,[r2,#0]
        0x080070ba:    1934        4.      ADDS     r4,r6,r4
        0x080070bc:    d301        ..      BCC      0x80070c2 ; mpi_mul_hlp + 102
        0x080070be:    2601        .&      MOVS     r6,#1
        0x080070c0:    e000        ..      B        0x80070c4 ; mpi_mul_hlp + 104
        0x080070c2:    2600        .&      MOVS     r6,#0
        0x080070c4:    c210        ..      STM      r2!,{r4}
        0x080070c6:    c910        ..      LDM      r1!,{r4}
        0x080070c8:    442e        .D      ADD      r6,r6,r5
        0x080070ca:    fba45403    ...T    UMULL    r5,r4,r4,r3
        0x080070ce:    19ad        ..      ADDS     r5,r5,r6
        0x080070d0:    d301        ..      BCC      0x80070d6 ; mpi_mul_hlp + 122
        0x080070d2:    2601        .&      MOVS     r6,#1
        0x080070d4:    e000        ..      B        0x80070d8 ; mpi_mul_hlp + 124
        0x080070d6:    2600        .&      MOVS     r6,#0
        0x080070d8:    6817        .h      LDR      r7,[r2,#0]
        0x080070da:    4426        &D      ADD      r6,r6,r4
        0x080070dc:    197c        |.      ADDS     r4,r7,r5
        0x080070de:    d301        ..      BCC      0x80070e4 ; mpi_mul_hlp + 136
        0x080070e0:    2501        .%      MOVS     r5,#1
        0x080070e2:    e000        ..      B        0x80070e6 ; mpi_mul_hlp + 138
        0x080070e4:    2500        .%      MOVS     r5,#0
        0x080070e6:    c210        ..      STM      r2!,{r4}
        0x080070e8:    c910        ..      LDM      r1!,{r4}
        0x080070ea:    442e        .D      ADD      r6,r6,r5
        0x080070ec:    fba44503    ...E    UMULL    r4,r5,r4,r3
        0x080070f0:    19a4        ..      ADDS     r4,r4,r6
        0x080070f2:    d301        ..      BCC      0x80070f8 ; mpi_mul_hlp + 156
        0x080070f4:    2601        .&      MOVS     r6,#1
        0x080070f6:    e000        ..      B        0x80070fa ; mpi_mul_hlp + 158
        0x080070f8:    2600        .&      MOVS     r6,#0
        0x080070fa:    442e        .D      ADD      r6,r6,r5
        0x080070fc:    6815        .h      LDR      r5,[r2,#0]
        0x080070fe:    192c        ,.      ADDS     r4,r5,r4
        0x08007100:    d301        ..      BCC      0x8007106 ; mpi_mul_hlp + 170
        0x08007102:    2501        .%      MOVS     r5,#1
        0x08007104:    e000        ..      B        0x8007108 ; mpi_mul_hlp + 172
        0x08007106:    2500        .%      MOVS     r5,#0
        0x08007108:    c210        ..      STM      r2!,{r4}
        0x0800710a:    c910        ..      LDM      r1!,{r4}
        0x0800710c:    442e        .D      ADD      r6,r6,r5
        0x0800710e:    fba44503    ...E    UMULL    r4,r5,r4,r3
        0x08007112:    19a4        ..      ADDS     r4,r4,r6
        0x08007114:    d301        ..      BCC      0x800711a ; mpi_mul_hlp + 190
        0x08007116:    2601        .&      MOVS     r6,#1
        0x08007118:    e000        ..      B        0x800711c ; mpi_mul_hlp + 192
        0x0800711a:    2600        .&      MOVS     r6,#0
        0x0800711c:    442e        .D      ADD      r6,r6,r5
        0x0800711e:    6815        .h      LDR      r5,[r2,#0]
        0x08007120:    192c        ,.      ADDS     r4,r5,r4
        0x08007122:    d301        ..      BCC      0x8007128 ; mpi_mul_hlp + 204
        0x08007124:    2501        .%      MOVS     r5,#1
        0x08007126:    e000        ..      B        0x800712a ; mpi_mul_hlp + 206
        0x08007128:    2500        .%      MOVS     r5,#0
        0x0800712a:    c210        ..      STM      r2!,{r4}
        0x0800712c:    c910        ..      LDM      r1!,{r4}
        0x0800712e:    442e        .D      ADD      r6,r6,r5
        0x08007130:    fba44503    ...E    UMULL    r4,r5,r4,r3
        0x08007134:    19a4        ..      ADDS     r4,r4,r6
        0x08007136:    d301        ..      BCC      0x800713c ; mpi_mul_hlp + 224
        0x08007138:    2601        .&      MOVS     r6,#1
        0x0800713a:    e000        ..      B        0x800713e ; mpi_mul_hlp + 226
        0x0800713c:    2600        .&      MOVS     r6,#0
        0x0800713e:    442e        .D      ADD      r6,r6,r5
        0x08007140:    6815        .h      LDR      r5,[r2,#0]
        0x08007142:    192c        ,.      ADDS     r4,r5,r4
        0x08007144:    d301        ..      BCC      0x800714a ; mpi_mul_hlp + 238
        0x08007146:    2501        .%      MOVS     r5,#1
        0x08007148:    e000        ..      B        0x800714c ; mpi_mul_hlp + 240
        0x0800714a:    2500        .%      MOVS     r5,#0
        0x0800714c:    c210        ..      STM      r2!,{r4}
        0x0800714e:    c910        ..      LDM      r1!,{r4}
        0x08007150:    442e        .D      ADD      r6,r6,r5
        0x08007152:    fba44503    ...E    UMULL    r4,r5,r4,r3
        0x08007156:    19a4        ..      ADDS     r4,r4,r6
        0x08007158:    d301        ..      BCC      0x800715e ; mpi_mul_hlp + 258
        0x0800715a:    2601        .&      MOVS     r6,#1
        0x0800715c:    e000        ..      B        0x8007160 ; mpi_mul_hlp + 260
        0x0800715e:    2600        .&      MOVS     r6,#0
        0x08007160:    442e        .D      ADD      r6,r6,r5
        0x08007162:    6815        .h      LDR      r5,[r2,#0]
        0x08007164:    192c        ,.      ADDS     r4,r5,r4
        0x08007166:    d301        ..      BCC      0x800716c ; mpi_mul_hlp + 272
        0x08007168:    2501        .%      MOVS     r5,#1
        0x0800716a:    e000        ..      B        0x800716e ; mpi_mul_hlp + 274
        0x0800716c:    2500        .%      MOVS     r5,#0
        0x0800716e:    c210        ..      STM      r2!,{r4}
        0x08007170:    c910        ..      LDM      r1!,{r4}
        0x08007172:    442e        .D      ADD      r6,r6,r5
        0x08007174:    fba45403    ...T    UMULL    r5,r4,r4,r3
        0x08007178:    19ad        ..      ADDS     r5,r5,r6
        0x0800717a:    d301        ..      BCC      0x8007180 ; mpi_mul_hlp + 292
        0x0800717c:    2601        .&      MOVS     r6,#1
        0x0800717e:    e000        ..      B        0x8007182 ; mpi_mul_hlp + 294
        0x08007180:    2600        .&      MOVS     r6,#0
        0x08007182:    1937        7.      ADDS     r7,r6,r4
        0x08007184:    6816        .h      LDR      r6,[r2,#0]
        0x08007186:    1974        t.      ADDS     r4,r6,r5
        0x08007188:    d301        ..      BCC      0x800718e ; mpi_mul_hlp + 306
        0x0800718a:    2501        .%      MOVS     r5,#1
        0x0800718c:    e000        ..      B        0x8007190 ; mpi_mul_hlp + 308
        0x0800718e:    2500        .%      MOVS     r5,#0
        0x08007190:    c210        ..      STM      r2!,{r4}
        0x08007192:    c910        ..      LDM      r1!,{r4}
        0x08007194:    19ee        ..      ADDS     r6,r5,r7
        0x08007196:    fba45403    ...T    UMULL    r5,r4,r4,r3
        0x0800719a:    19ad        ..      ADDS     r5,r5,r6
        0x0800719c:    d301        ..      BCC      0x80071a2 ; mpi_mul_hlp + 326
        0x0800719e:    2601        .&      MOVS     r6,#1
        0x080071a0:    e000        ..      B        0x80071a4 ; mpi_mul_hlp + 328
        0x080071a2:    2600        .&      MOVS     r6,#0
        0x080071a4:    1937        7.      ADDS     r7,r6,r4
        0x080071a6:    6816        .h      LDR      r6,[r2,#0]
        0x080071a8:    1974        t.      ADDS     r4,r6,r5
        0x080071aa:    d301        ..      BCC      0x80071b0 ; mpi_mul_hlp + 340
        0x080071ac:    2501        .%      MOVS     r5,#1
        0x080071ae:    e000        ..      B        0x80071b2 ; mpi_mul_hlp + 342
        0x080071b0:    2500        .%      MOVS     r5,#0
        0x080071b2:    c210        ..      STM      r2!,{r4}
        0x080071b4:    c910        ..      LDM      r1!,{r4}
        0x080071b6:    19ee        ..      ADDS     r6,r5,r7
        0x080071b8:    fba44503    ...E    UMULL    r4,r5,r4,r3
        0x080071bc:    19a4        ..      ADDS     r4,r4,r6
        0x080071be:    d301        ..      BCC      0x80071c4 ; mpi_mul_hlp + 360
        0x080071c0:    2601        .&      MOVS     r6,#1
        0x080071c2:    e000        ..      B        0x80071c6 ; mpi_mul_hlp + 362
        0x080071c4:    2600        .&      MOVS     r6,#0
        0x080071c6:    442e        .D      ADD      r6,r6,r5
        0x080071c8:    6815        .h      LDR      r5,[r2,#0]
        0x080071ca:    192c        ,.      ADDS     r4,r5,r4
        0x080071cc:    d301        ..      BCC      0x80071d2 ; mpi_mul_hlp + 374
        0x080071ce:    2501        .%      MOVS     r5,#1
        0x080071d0:    e000        ..      B        0x80071d4 ; mpi_mul_hlp + 376
        0x080071d2:    2500        .%      MOVS     r5,#0
        0x080071d4:    c210        ..      STM      r2!,{r4}
        0x080071d6:    c910        ..      LDM      r1!,{r4}
        0x080071d8:    442e        .D      ADD      r6,r6,r5
        0x080071da:    fba44503    ...E    UMULL    r4,r5,r4,r3
        0x080071de:    19a4        ..      ADDS     r4,r4,r6
        0x080071e0:    d301        ..      BCC      0x80071e6 ; mpi_mul_hlp + 394
        0x080071e2:    2601        .&      MOVS     r6,#1
        0x080071e4:    e000        ..      B        0x80071e8 ; mpi_mul_hlp + 396
        0x080071e6:    2600        .&      MOVS     r6,#0
        0x080071e8:    442e        .D      ADD      r6,r6,r5
        0x080071ea:    6815        .h      LDR      r5,[r2,#0]
        0x080071ec:    192c        ,.      ADDS     r4,r5,r4
        0x080071ee:    d301        ..      BCC      0x80071f4 ; mpi_mul_hlp + 408
        0x080071f0:    2501        .%      MOVS     r5,#1
        0x080071f2:    e000        ..      B        0x80071f6 ; mpi_mul_hlp + 410
        0x080071f4:    2500        .%      MOVS     r5,#0
        0x080071f6:    c210        ..      STM      r2!,{r4}
        0x080071f8:    c910        ..      LDM      r1!,{r4}
        0x080071fa:    442e        .D      ADD      r6,r6,r5
        0x080071fc:    fba45403    ...T    UMULL    r5,r4,r4,r3
        0x08007200:    19ad        ..      ADDS     r5,r5,r6
        0x08007202:    d301        ..      BCC      0x8007208 ; mpi_mul_hlp + 428
        0x08007204:    2601        .&      MOVS     r6,#1
        0x08007206:    e000        ..      B        0x800720a ; mpi_mul_hlp + 430
        0x08007208:    2600        .&      MOVS     r6,#0
        0x0800720a:    1937        7.      ADDS     r7,r6,r4
        0x0800720c:    6816        .h      LDR      r6,[r2,#0]
        0x0800720e:    1974        t.      ADDS     r4,r6,r5
        0x08007210:    d301        ..      BCC      0x8007216 ; mpi_mul_hlp + 442
        0x08007212:    2501        .%      MOVS     r5,#1
        0x08007214:    e000        ..      B        0x8007218 ; mpi_mul_hlp + 444
        0x08007216:    2500        .%      MOVS     r5,#0
        0x08007218:    c210        ..      STM      r2!,{r4}
        0x0800721a:    c910        ..      LDM      r1!,{r4}
        0x0800721c:    19ee        ..      ADDS     r6,r5,r7
        0x0800721e:    fba44503    ...E    UMULL    r4,r5,r4,r3
        0x08007222:    19a4        ..      ADDS     r4,r4,r6
        0x08007224:    d301        ..      BCC      0x800722a ; mpi_mul_hlp + 462
        0x08007226:    2601        .&      MOVS     r6,#1
        0x08007228:    e000        ..      B        0x800722c ; mpi_mul_hlp + 464
        0x0800722a:    2600        .&      MOVS     r6,#0
        0x0800722c:    4435        5D      ADD      r5,r5,r6
        0x0800722e:    6816        .h      LDR      r6,[r2,#0]
        0x08007230:    1934        4.      ADDS     r4,r6,r4
        0x08007232:    d301        ..      BCC      0x8007238 ; mpi_mul_hlp + 476
        0x08007234:    2601        .&      MOVS     r6,#1
        0x08007236:    e000        ..      B        0x800723a ; mpi_mul_hlp + 478
        0x08007238:    2600        .&      MOVS     r6,#0
        0x0800723a:    c210        ..      STM      r2!,{r4}
        0x0800723c:    c910        ..      LDM      r1!,{r4}
        0x0800723e:    442e        .D      ADD      r6,r6,r5
        0x08007240:    fba45403    ...T    UMULL    r5,r4,r4,r3
        0x08007244:    19ad        ..      ADDS     r5,r5,r6
        0x08007246:    d301        ..      BCC      0x800724c ; mpi_mul_hlp + 496
        0x08007248:    2601        .&      MOVS     r6,#1
        0x0800724a:    e000        ..      B        0x800724e ; mpi_mul_hlp + 498
        0x0800724c:    2600        .&      MOVS     r6,#0
        0x0800724e:    6817        .h      LDR      r7,[r2,#0]
        0x08007250:    4426        &D      ADD      r6,r6,r4
        0x08007252:    197c        |.      ADDS     r4,r7,r5
        0x08007254:    d301        ..      BCC      0x800725a ; mpi_mul_hlp + 510
        0x08007256:    2501        .%      MOVS     r5,#1
        0x08007258:    e000        ..      B        0x800725c ; mpi_mul_hlp + 512
        0x0800725a:    2500        .%      MOVS     r5,#0
        0x0800725c:    c210        ..      STM      r2!,{r4}
        0x0800725e:    c910        ..      LDM      r1!,{r4}
        0x08007260:    442e        .D      ADD      r6,r6,r5
        0x08007262:    fba44503    ...E    UMULL    r4,r5,r4,r3
        0x08007266:    19a4        ..      ADDS     r4,r4,r6
        0x08007268:    d301        ..      BCC      0x800726e ; mpi_mul_hlp + 530
        0x0800726a:    2601        .&      MOVS     r6,#1
        0x0800726c:    e000        ..      B        0x8007270 ; mpi_mul_hlp + 532
        0x0800726e:    2600        .&      MOVS     r6,#0
        0x08007270:    1977        w.      ADDS     r7,r6,r5
        0x08007272:    6816        .h      LDR      r6,[r2,#0]
        0x08007274:    1935        5.      ADDS     r5,r6,r4
        0x08007276:    d301        ..      BCC      0x800727c ; mpi_mul_hlp + 544
        0x08007278:    2401        .$      MOVS     r4,#1
        0x0800727a:    e000        ..      B        0x800727e ; mpi_mul_hlp + 546
        0x0800727c:    2400        .$      MOVS     r4,#0
        0x0800727e:    c220         .      STM      r2!,{r5}
        0x08007280:    443c        <D      ADD      r4,r4,r7
        0x08007282:    3810        .8      SUBS     r0,r0,#0x10
        0x08007284:    2810        .(      CMP      r0,#0x10
        0x08007286:    f4bfaeec    ....    BCS      0x8007062 ; mpi_mul_hlp + 6
        0x0800728a:    e088        ..      B        0x800739e ; mpi_mul_hlp + 834
        0x0800728c:    c920         .      LDM      r1!,{r5}
        0x0800728e:    fba56503    ...e    UMULL    r6,r5,r5,r3
        0x08007292:    1936        6.      ADDS     r6,r6,r4
        0x08007294:    d301        ..      BCC      0x800729a ; mpi_mul_hlp + 574
        0x08007296:    2401        .$      MOVS     r4,#1
        0x08007298:    e000        ..      B        0x800729c ; mpi_mul_hlp + 576
        0x0800729a:    2400        .$      MOVS     r4,#0
        0x0800729c:    1967        g.      ADDS     r7,r4,r5
        0x0800729e:    6815        .h      LDR      r5,[r2,#0]
        0x080072a0:    19ac        ..      ADDS     r4,r5,r6
        0x080072a2:    d301        ..      BCC      0x80072a8 ; mpi_mul_hlp + 588
        0x080072a4:    2501        .%      MOVS     r5,#1
        0x080072a6:    e000        ..      B        0x80072aa ; mpi_mul_hlp + 590
        0x080072a8:    2500        .%      MOVS     r5,#0
        0x080072aa:    c210        ..      STM      r2!,{r4}
        0x080072ac:    c910        ..      LDM      r1!,{r4}
        0x080072ae:    19ee        ..      ADDS     r6,r5,r7
        0x080072b0:    fba44503    ...E    UMULL    r4,r5,r4,r3
        0x080072b4:    19a4        ..      ADDS     r4,r4,r6
        0x080072b6:    d301        ..      BCC      0x80072bc ; mpi_mul_hlp + 608
        0x080072b8:    2601        .&      MOVS     r6,#1
        0x080072ba:    e000        ..      B        0x80072be ; mpi_mul_hlp + 610
        0x080072bc:    2600        .&      MOVS     r6,#0
        0x080072be:    442e        .D      ADD      r6,r6,r5
        0x080072c0:    6815        .h      LDR      r5,[r2,#0]
        0x080072c2:    192c        ,.      ADDS     r4,r5,r4
        0x080072c4:    d301        ..      BCC      0x80072ca ; mpi_mul_hlp + 622
        0x080072c6:    2501        .%      MOVS     r5,#1
        0x080072c8:    e000        ..      B        0x80072cc ; mpi_mul_hlp + 624
        0x080072ca:    2500        .%      MOVS     r5,#0
        0x080072cc:    c210        ..      STM      r2!,{r4}
        0x080072ce:    c910        ..      LDM      r1!,{r4}
        0x080072d0:    442e        .D      ADD      r6,r6,r5
        0x080072d2:    fba44503    ...E    UMULL    r4,r5,r4,r3
        0x080072d6:    19a4        ..      ADDS     r4,r4,r6
        0x080072d8:    d301        ..      BCC      0x80072de ; mpi_mul_hlp + 642
        0x080072da:    2601        .&      MOVS     r6,#1
        0x080072dc:    e000        ..      B        0x80072e0 ; mpi_mul_hlp + 644
        0x080072de:    2600        .&      MOVS     r6,#0
        0x080072e0:    442e        .D      ADD      r6,r6,r5
        0x080072e2:    6815        .h      LDR      r5,[r2,#0]
        0x080072e4:    192c        ,.      ADDS     r4,r5,r4
        0x080072e6:    d301        ..      BCC      0x80072ec ; mpi_mul_hlp + 656
        0x080072e8:    2501        .%      MOVS     r5,#1
        0x080072ea:    e000        ..      B        0x80072ee ; mpi_mul_hlp + 658
        0x080072ec:    2500        .%      MOVS     r5,#0
        0x080072ee:    c210        ..      STM      r2!,{r4}
        0x080072f0:    c910        ..      LDM      r1!,{r4}
        0x080072f2:    442e        .D      ADD      r6,r6,r5
        0x080072f4:    fba44503    ...E    UMULL    r4,r5,r4,r3
        0x080072f8:    19a4        ..      ADDS     r4,r4,r6
        0x080072fa:    d301        ..      BCC      0x8007300 ; mpi_mul_hlp + 676
        0x080072fc:    2601        .&      MOVS     r6,#1
        0x080072fe:    e000        ..      B        0x8007302 ; mpi_mul_hlp + 678
        0x08007300:    2600        .&      MOVS     r6,#0
        0x08007302:    442e        .D      ADD      r6,r6,r5
        0x08007304:    6815        .h      LDR      r5,[r2,#0]
        0x08007306:    192c        ,.      ADDS     r4,r5,r4
        0x08007308:    d301        ..      BCC      0x800730e ; mpi_mul_hlp + 690
        0x0800730a:    2501        .%      MOVS     r5,#1
        0x0800730c:    e000        ..      B        0x8007310 ; mpi_mul_hlp + 692
        0x0800730e:    2500        .%      MOVS     r5,#0
        0x08007310:    c210        ..      STM      r2!,{r4}
        0x08007312:    c910        ..      LDM      r1!,{r4}
        0x08007314:    442e        .D      ADD      r6,r6,r5
        0x08007316:    fba45403    ...T    UMULL    r5,r4,r4,r3
        0x0800731a:    19ad        ..      ADDS     r5,r5,r6
        0x0800731c:    d301        ..      BCC      0x8007322 ; mpi_mul_hlp + 710
        0x0800731e:    2601        .&      MOVS     r6,#1
        0x08007320:    e000        ..      B        0x8007324 ; mpi_mul_hlp + 712
        0x08007322:    2600        .&      MOVS     r6,#0
        0x08007324:    1937        7.      ADDS     r7,r6,r4
        0x08007326:    6816        .h      LDR      r6,[r2,#0]
        0x08007328:    1974        t.      ADDS     r4,r6,r5
        0x0800732a:    d301        ..      BCC      0x8007330 ; mpi_mul_hlp + 724
        0x0800732c:    2501        .%      MOVS     r5,#1
        0x0800732e:    e000        ..      B        0x8007332 ; mpi_mul_hlp + 726
        0x08007330:    2500        .%      MOVS     r5,#0
        0x08007332:    c210        ..      STM      r2!,{r4}
        0x08007334:    c910        ..      LDM      r1!,{r4}
        0x08007336:    19ee        ..      ADDS     r6,r5,r7
        0x08007338:    fba45403    ...T    UMULL    r5,r4,r4,r3
        0x0800733c:    19ad        ..      ADDS     r5,r5,r6
        0x0800733e:    d301        ..      BCC      0x8007344 ; mpi_mul_hlp + 744
        0x08007340:    2601        .&      MOVS     r6,#1
        0x08007342:    e000        ..      B        0x8007346 ; mpi_mul_hlp + 746
        0x08007344:    2600        .&      MOVS     r6,#0
        0x08007346:    1937        7.      ADDS     r7,r6,r4
        0x08007348:    6816        .h      LDR      r6,[r2,#0]
        0x0800734a:    1974        t.      ADDS     r4,r6,r5
        0x0800734c:    d301        ..      BCC      0x8007352 ; mpi_mul_hlp + 758
        0x0800734e:    2501        .%      MOVS     r5,#1
        0x08007350:    e000        ..      B        0x8007354 ; mpi_mul_hlp + 760
        0x08007352:    2500        .%      MOVS     r5,#0
        0x08007354:    c210        ..      STM      r2!,{r4}
        0x08007356:    c910        ..      LDM      r1!,{r4}
        0x08007358:    19ee        ..      ADDS     r6,r5,r7
        0x0800735a:    fba45403    ...T    UMULL    r5,r4,r4,r3
        0x0800735e:    19ad        ..      ADDS     r5,r5,r6
        0x08007360:    d301        ..      BCC      0x8007366 ; mpi_mul_hlp + 778
        0x08007362:    2601        .&      MOVS     r6,#1
        0x08007364:    e000        ..      B        0x8007368 ; mpi_mul_hlp + 780
        0x08007366:    2600        .&      MOVS     r6,#0
        0x08007368:    1937        7.      ADDS     r7,r6,r4
        0x0800736a:    6816        .h      LDR      r6,[r2,#0]
        0x0800736c:    1974        t.      ADDS     r4,r6,r5
        0x0800736e:    d301        ..      BCC      0x8007374 ; mpi_mul_hlp + 792
        0x08007370:    2501        .%      MOVS     r5,#1
        0x08007372:    e000        ..      B        0x8007376 ; mpi_mul_hlp + 794
        0x08007374:    2500        .%      MOVS     r5,#0
        0x08007376:    c210        ..      STM      r2!,{r4}
        0x08007378:    c910        ..      LDM      r1!,{r4}
        0x0800737a:    19ee        ..      ADDS     r6,r5,r7
        0x0800737c:    fba44503    ...E    UMULL    r4,r5,r4,r3
        0x08007380:    19a4        ..      ADDS     r4,r4,r6
        0x08007382:    d301        ..      BCC      0x8007388 ; mpi_mul_hlp + 812
        0x08007384:    2601        .&      MOVS     r6,#1
        0x08007386:    e000        ..      B        0x800738a ; mpi_mul_hlp + 814
        0x08007388:    2600        .&      MOVS     r6,#0
        0x0800738a:    1977        w.      ADDS     r7,r6,r5
        0x0800738c:    6816        .h      LDR      r6,[r2,#0]
        0x0800738e:    1935        5.      ADDS     r5,r6,r4
        0x08007390:    d301        ..      BCC      0x8007396 ; mpi_mul_hlp + 826
        0x08007392:    2401        .$      MOVS     r4,#1
        0x08007394:    e000        ..      B        0x8007398 ; mpi_mul_hlp + 828
        0x08007396:    2400        .$      MOVS     r4,#0
        0x08007398:    c220         .      STM      r2!,{r5}
        0x0800739a:    443c        <D      ADD      r4,r4,r7
        0x0800739c:    3808        .8      SUBS     r0,r0,#8
        0x0800739e:    2808        .(      CMP      r0,#8
        0x080073a0:    f4bfaf74    ..t.    BCS      0x800728c ; mpi_mul_hlp + 560
        0x080073a4:    b190        ..      CBZ      r0,0x80073cc ; mpi_mul_hlp + 880
        0x080073a6:    c920         .      LDM      r1!,{r5}
        0x080073a8:    fba56503    ...e    UMULL    r6,r5,r5,r3
        0x080073ac:    1936        6.      ADDS     r6,r6,r4
        0x080073ae:    d301        ..      BCC      0x80073b4 ; mpi_mul_hlp + 856
        0x080073b0:    2401        .$      MOVS     r4,#1
        0x080073b2:    e000        ..      B        0x80073b6 ; mpi_mul_hlp + 858
        0x080073b4:    2400        .$      MOVS     r4,#0
        0x080073b6:    1967        g.      ADDS     r7,r4,r5
        0x080073b8:    6814        .h      LDR      r4,[r2,#0]
        0x080073ba:    19a5        ..      ADDS     r5,r4,r6
        0x080073bc:    d301        ..      BCC      0x80073c2 ; mpi_mul_hlp + 870
        0x080073be:    2401        .$      MOVS     r4,#1
        0x080073c0:    e000        ..      B        0x80073c4 ; mpi_mul_hlp + 872
        0x080073c2:    2400        .$      MOVS     r4,#0
        0x080073c4:    c220         .      STM      r2!,{r5}
        0x080073c6:    443c        <D      ADD      r4,r4,r7
        0x080073c8:    1e40        @.      SUBS     r0,r0,#1
        0x080073ca:    e7eb        ..      B        0x80073a4 ; mpi_mul_hlp + 840
        0x080073cc:    6810        .h      LDR      r0,[r2,#0]
        0x080073ce:    4420         D      ADD      r0,r0,r4
        0x080073d0:    6010        .`      STR      r0,[r2,#0]
        0x080073d2:    42a0        .B      CMP      r0,r4
        0x080073d4:    d202        ..      BCS      0x80073dc ; mpi_mul_hlp + 896
        0x080073d6:    2401        .$      MOVS     r4,#1
        0x080073d8:    1d12        ..      ADDS     r2,r2,#4
        0x080073da:    e7f7        ..      B        0x80073cc ; mpi_mul_hlp + 880
        0x080073dc:    bdf0        ..      POP      {r4-r7,pc}
    i.mpi_sub_hlp
    mpi_sub_hlp
        0x080073de:    b5f0        ..      PUSH     {r4-r7,lr}
        0x080073e0:    2300        .#      MOVS     r3,#0
        0x080073e2:    461c        .F      MOV      r4,r3
        0x080073e4:    e012        ..      B        0x800740c ; mpi_sub_hlp + 46
        0x080073e6:    6815        .h      LDR      r5,[r2,#0]
        0x080073e8:    429d        .B      CMP      r5,r3
        0x080073ea:    d201        ..      BCS      0x80073f0 ; mpi_sub_hlp + 18
        0x080073ec:    2601        .&      MOVS     r6,#1
        0x080073ee:    e000        ..      B        0x80073f2 ; mpi_sub_hlp + 20
        0x080073f0:    2600        .&      MOVS     r6,#0
        0x080073f2:    1aed        ..      SUBS     r5,r5,r3
        0x080073f4:    6015        .`      STR      r5,[r2,#0]
        0x080073f6:    680f        .h      LDR      r7,[r1,#0]
        0x080073f8:    42bd        .B      CMP      r5,r7
        0x080073fa:    d201        ..      BCS      0x8007400 ; mpi_sub_hlp + 34
        0x080073fc:    2301        .#      MOVS     r3,#1
        0x080073fe:    e000        ..      B        0x8007402 ; mpi_sub_hlp + 36
        0x08007400:    2300        .#      MOVS     r3,#0
        0x08007402:    1bed        ..      SUBS     r5,r5,r7
        0x08007404:    c220         .      STM      r2!,{r5}
        0x08007406:    1d09        ..      ADDS     r1,r1,#4
        0x08007408:    4433        3D      ADD      r3,r3,r6
        0x0800740a:    1c64        d.      ADDS     r4,r4,#1
        0x0800740c:    4284        .B      CMP      r4,r0
        0x0800740e:    d3ea        ..      BCC      0x80073e6 ; mpi_sub_hlp + 8
        0x08007410:    e008        ..      B        0x8007424 ; mpi_sub_hlp + 70
        0x08007412:    6810        .h      LDR      r0,[r2,#0]
        0x08007414:    4298        .B      CMP      r0,r3
        0x08007416:    d201        ..      BCS      0x800741c ; mpi_sub_hlp + 62
        0x08007418:    2101        .!      MOVS     r1,#1
        0x0800741a:    e000        ..      B        0x800741e ; mpi_sub_hlp + 64
        0x0800741c:    2100        .!      MOVS     r1,#0
        0x0800741e:    1ac0        ..      SUBS     r0,r0,r3
        0x08007420:    c201        ..      STM      r2!,{r0}
        0x08007422:    460b        .F      MOV      r3,r1
        0x08007424:    2b00        .+      CMP      r3,#0
        0x08007426:    d1f4        ..      BNE      0x8007412 ; mpi_sub_hlp + 52
        0x08007428:    bdf0        ..      POP      {r4-r7,pc}
    i.mpi_uint_bigendian_to_host
    mpi_uint_bigendian_to_host
        0x0800742a:    4602        .F      MOV      r2,r0
        0x0800742c:    b510        ..      PUSH     {r4,lr}
        0x0800742e:    2000        .       MOVS     r0,#0
        0x08007430:    4601        .F      MOV      r1,r0
        0x08007432:    f1c10403    ....    RSB      r4,r1,#3
        0x08007436:    b2d3        ..      UXTB     r3,r2
        0x08007438:    00e4        ..      LSLS     r4,r4,#3
        0x0800743a:    40a3        .@      LSLS     r3,r3,r4
        0x0800743c:    1c49        I.      ADDS     r1,r1,#1
        0x0800743e:    4318        .C      ORRS     r0,r0,r3
        0x08007440:    b2c9        ..      UXTB     r1,r1
        0x08007442:    0a12        ..      LSRS     r2,r2,#8
        0x08007444:    2904        .)      CMP      r1,#4
        0x08007446:    d3f4        ..      BCC      0x8007432 ; mpi_uint_bigendian_to_host + 8
        0x08007448:    bd10        ..      POP      {r4,pc}
    i.reflect
    reflect
        0x0800744a:    b570        p.      PUSH     {r4-r6,lr}
        0x0800744c:    4603        .F      MOV      r3,r0
        0x0800744e:    2000        .       MOVS     r0,#0
        0x08007450:    4602        .F      MOV      r2,r0
        0x08007452:    2501        .%      MOVS     r5,#1
        0x08007454:    e009        ..      B        0x800746a ; reflect + 32
        0x08007456:    07dc        ..      LSLS     r4,r3,#31
        0x08007458:    d004        ..      BEQ      0x8007464 ; reflect + 26
        0x0800745a:    1a8e        ..      SUBS     r6,r1,r2
        0x0800745c:    1e76        v.      SUBS     r6,r6,#1
        0x0800745e:    fa05f406    ....    LSL      r4,r5,r6
        0x08007462:    4320         C      ORRS     r0,r0,r4
        0x08007464:    085b        [.      LSRS     r3,r3,#1
        0x08007466:    1c52        R.      ADDS     r2,r2,#1
        0x08007468:    b2d2        ..      UXTB     r2,r2
        0x0800746a:    428a        .B      CMP      r2,r1
        0x0800746c:    d3f3        ..      BCC      0x8007456 ; reflect + 12
        0x0800746e:    bd70        p.      POP      {r4-r6,pc}
    i.sissdk_ecdsa_load_group
    sissdk_ecdsa_load_group
        0x08007470:    b508        ..      PUSH     {r3,lr}
        0x08007472:    4905        .I      LDR      r1,[pc,#20] ; [0x8007488] = 0x2000001c
        0x08007474:    9100        ..      STR      r1,[sp,#0]
        0x08007476:    2203        ."      MOVS     r2,#3
        0x08007478:    4669        iF      MOV      r1,sp
        0x0800747a:    f7fdff27    ..'.    BL       mbedtls_ecp_tls_read_group ; 0x80052cc
        0x0800747e:    b108        ..      CBZ      r0,0x8007484 ; sissdk_ecdsa_load_group + 20
        0x08007480:    2000        .       MOVS     r0,#0
        0x08007482:    bd08        ..      POP      {r3,pc}
        0x08007484:    2001        .       MOVS     r0,#1
        0x08007486:    bd08        ..      POP      {r3,pc}
    $d
        0x08007488:    2000001c    ...     DCD    536870940
    $t
    i.sissdk_ecdsa_load_publickey
    sissdk_ecdsa_load_publickey
        0x0800748c:    b570        p.      PUSH     {r4-r6,lr}
        0x0800748e:    4605        .F      MOV      r5,r0
        0x08007490:    460c        .F      MOV      r4,r1
        0x08007492:    4608        .F      MOV      r0,r1
        0x08007494:    f7ffffec    ....    BL       sissdk_ecdsa_load_group ; 0x8007470
        0x08007498:    2800        .(      CMP      r0,#0
        0x0800749a:    d008        ..      BEQ      0x80074ae ; sissdk_ecdsa_load_publickey + 34
        0x0800749c:    2331        1#      MOVS     r3,#0x31
        0x0800749e:    462a        *F      MOV      r2,r5
        0x080074a0:    f1040188    ....    ADD      r1,r4,#0x88
        0x080074a4:    4620         F      MOV      r0,r4
        0x080074a6:    f7fdfe85    ....    BL       mbedtls_ecp_point_read_binary ; 0x80051b4
        0x080074aa:    b108        ..      CBZ      r0,0x80074b0 ; sissdk_ecdsa_load_publickey + 36
        0x080074ac:    2000        .       MOVS     r0,#0
        0x080074ae:    bd70        p.      POP      {r4-r6,pc}
        0x080074b0:    2001        .       MOVS     r0,#1
        0x080074b2:    bd70        p.      POP      {r4-r6,pc}
    i.sissdk_ecdsa_sha256
    sissdk_ecdsa_sha256
        0x080074b4:    b510        ..      PUSH     {r4,lr}
        0x080074b6:    2800        .(      CMP      r0,#0
        0x080074b8:    d005        ..      BEQ      0x80074c6 ; sissdk_ecdsa_sha256 + 18
        0x080074ba:    2300        .#      MOVS     r3,#0
        0x080074bc:    4a06        .J      LDR      r2,[pc,#24] ; [0x80074d8] = 0x200000d8
        0x080074be:    f7fffcf9    ....    BL       mbedtls_sha256_ret ; 0x8006eb4
        0x080074c2:    b108        ..      CBZ      r0,0x80074c8 ; sissdk_ecdsa_sha256 + 20
        0x080074c4:    2000        .       MOVS     r0,#0
        0x080074c6:    bd10        ..      POP      {r4,pc}
        0x080074c8:    2220         "      MOVS     r2,#0x20
        0x080074ca:    4903        .I      LDR      r1,[pc,#12] ; [0x80074d8] = 0x200000d8
        0x080074cc:    a003        ..      ADR      r0,{pc}+0x10 ; 0x80074dc
        0x080074ce:    f000f843    ..C.    BL       util_dump_buf ; 0x8007558
        0x080074d2:    4801        .H      LDR      r0,[pc,#4] ; [0x80074d8] = 0x200000d8
        0x080074d4:    bd10        ..      POP      {r4,pc}
    $d
        0x080074d6:    0000        ..      DCW    0
        0x080074d8:    200000d8    ...     DCD    536871128
        0x080074dc:    5d6b6f5b    [ok]    DCD    1567321947
        0x080074e0:    6148203a    : Ha    DCD    1632116794
        0x080074e4:    3d206873    sh =    DCD    1025534067
        0x080074e8:    00000020     ...    DCD    32
    $t
    i.sissdk_ecdsa_verify
    sissdk_ecdsa_verify
        0x080074ec:    b570        p.      PUSH     {r4-r6,lr}
        0x080074ee:    461c        .F      MOV      r4,r3
        0x080074f0:    460b        .F      MOV      r3,r1
        0x080074f2:    4606        .F      MOV      r6,r0
        0x080074f4:    b0ac        ..      SUB      sp,sp,#0xb0
        0x080074f6:    4611        .F      MOV      r1,r2
        0x080074f8:    4618        .F      MOV      r0,r3
        0x080074fa:    f7ffffdb    ....    BL       sissdk_ecdsa_sha256 ; 0x80074b4
        0x080074fe:    0005        ..      MOVS     r5,r0
        0x08007500:    d013        ..      BEQ      0x800752a ; sissdk_ecdsa_verify + 62
        0x08007502:    a801        ..      ADD      r0,sp,#4
        0x08007504:    f7fafd77    ..w.    BL       mbedtls_ecdsa_init ; 0x8001ff6
        0x08007508:    a901        ..      ADD      r1,sp,#4
        0x0800750a:    4630        0F      MOV      r0,r6
        0x0800750c:    f7ffffbe    ....    BL       sissdk_ecdsa_load_publickey ; 0x800748c
        0x08007510:    b140        @.      CBZ      r0,0x8007524 ; sissdk_ecdsa_verify + 56
        0x08007512:    8820         .      LDRH     r0,[r4,#0]
        0x08007514:    9000        ..      STR      r0,[sp,#0]
        0x08007516:    1ca3        ..      ADDS     r3,r4,#2
        0x08007518:    2220         "      MOVS     r2,#0x20
        0x0800751a:    4629        )F      MOV      r1,r5
        0x0800751c:    a801        ..      ADD      r0,sp,#4
        0x0800751e:    f7fdfad2    ....    BL       mbedtls_ecdsa_read_signature ; 0x8004ac6
        0x08007522:    b128        (.      CBZ      r0,0x8007530 ; sissdk_ecdsa_verify + 68
        0x08007524:    a801        ..      ADD      r0,sp,#4
        0x08007526:    f7fdfac9    ....    BL       mbedtls_ecdsa_free ; 0x8004abc
        0x0800752a:    2000        .       MOVS     r0,#0
        0x0800752c:    b02c        ,.      ADD      sp,sp,#0xb0
        0x0800752e:    bd70        p.      POP      {r4-r6,pc}
        0x08007530:    a801        ..      ADD      r0,sp,#4
        0x08007532:    f7fdfac3    ....    BL       mbedtls_ecdsa_free ; 0x8004abc
        0x08007536:    2001        .       MOVS     r0,#1
        0x08007538:    e7f8        ..      B        0x800752c ; sissdk_ecdsa_verify + 64
    i.sub32
    sub32
        0x0800753a:    b510        ..      PUSH     {r4,lr}
        0x0800753c:    6804        .h      LDR      r4,[r0,#0]
        0x0800753e:    f9923000    ...0    LDRSB    r3,[r2,#0]
        0x08007542:    428c        .B      CMP      r4,r1
        0x08007544:    d201        ..      BCS      0x800754a ; sub32 + 16
        0x08007546:    2401        .$      MOVS     r4,#1
        0x08007548:    e000        ..      B        0x800754c ; sub32 + 18
        0x0800754a:    2400        .$      MOVS     r4,#0
        0x0800754c:    1b1b        ..      SUBS     r3,r3,r4
        0x0800754e:    7013        .p      STRB     r3,[r2,#0]
        0x08007550:    6802        .h      LDR      r2,[r0,#0]
        0x08007552:    1a51        Q.      SUBS     r1,r2,r1
        0x08007554:    6001        .`      STR      r1,[r0,#0]
        0x08007556:    bd10        ..      POP      {r4,pc}
    i.util_dump_buf
    util_dump_buf
        0x08007558:    2000        .       MOVS     r0,#0
        0x0800755a:    e000        ..      B        0x800755e ; util_dump_buf + 6
        0x0800755c:    1c40        @.      ADDS     r0,r0,#1
        0x0800755e:    4290        .B      CMP      r0,r2
        0x08007560:    d3fc        ..      BCC      0x800755c ; util_dump_buf + 4
        0x08007562:    4770        pG      BX       lr
    $d.realdata
    .constdata
    AHBPrescTable
        0x08007564:    00000000    ....    DCD    0
        0x08007568:    00000000    ....    DCD    0
        0x0800756c:    04030201    ....    DCD    67305985
        0x08007570:    09080706    ....    DCD    151521030
    .constdata
    APBPrescTable
        0x08007574:    00000000    ....    DCD    0
        0x08007578:    04030201    ....    DCD    67305985
    .constdata
    ecp_supported_curves
        0x0800757c:    00190005    ....    DCD    1638405
        0x08007580:    00000209    ....    DCD    521
        0x08007584:    08008178    x...    DCD    134250872
        0x08007588:    001c0008    ....    DCD    1835016
        0x0800758c:    00000200    ....    DCD    512
        0x08007590:    08008184    ....    DCD    134250884
        0x08007594:    00180004    ....    DCD    1572868
        0x08007598:    00000180    ....    DCD    384
        0x0800759c:    080081bc    ....    DCD    134250940
        0x080075a0:    001b0007    ....    DCD    1769479
        0x080075a4:    00000180    ....    DCD    384
        0x080075a8:    080081ac    ....    DCD    134250924
        0x080075ac:    00170003    ....    DCD    1507331
        0x080075b0:    00000100    ....    DCD    256
        0x080075b4:    080081d8    ....    DCD    134250968
        0x080075b8:    0016000c    ....    DCD    1441804
        0x080075bc:    00000100    ....    DCD    256
        0x080075c0:    0800816c    l...    DCD    134250860
        0x080075c4:    001a0006    ....    DCD    1703942
        0x080075c8:    00000100    ....    DCD    256
        0x080075cc:    080081c8    ....    DCD    134250952
        0x080075d0:    00150002    ....    DCD    1376258
        0x080075d4:    000000e0    ....    DCD    224
        0x080075d8:    080081a0    ....    DCD    134250912
        0x080075dc:    0014000b    ....    DCD    1310731
        0x080075e0:    000000e0    ....    DCD    224
        0x080075e4:    08008160    `...    DCD    134250848
        0x080075e8:    00130001    ....    DCD    1245185
        0x080075ec:    000000c0    ....    DCD    192
        0x080075f0:    08008194    ....    DCD    134250900
        0x080075f4:    0012000a    ....    DCD    1179658
        0x080075f8:    000000c0    ....    DCD    192
        0x080075fc:    08008154    T...    DCD    134250836
        0x08007600:    00000000    ....    DCD    0
        0x08007604:    00000000    ....    DCD    0
        0x08007608:    00000000    ....    DCD    0
    .constdata
    secp192k1_a
        0x0800760c:    00000000    ....    DCD    0
    secp192k1_b
        0x08007610:    00000003    ....    DCD    3
    secp224k1_a
        0x08007614:    00000000    ....    DCD    0
    secp224k1_b
        0x08007618:    00000005    ....    DCD    5
    secp256k1_a
        0x0800761c:    00000000    ....    DCD    0
    secp256k1_b
        0x08007620:    00000007    ....    DCD    7
    secp192r1_p
        0x08007624:    ffffffff    ....    DCD    4294967295
        0x08007628:    ffffffff    ....    DCD    4294967295
        0x0800762c:    fffffffe    ....    DCD    4294967294
        0x08007630:    ffffffff    ....    DCD    4294967295
        0x08007634:    ffffffff    ....    DCD    4294967295
        0x08007638:    ffffffff    ....    DCD    4294967295
    secp192r1_b
        0x0800763c:    c146b9b1    ..F.    DCD    3242637745
        0x08007640:    feb8deec    ....    DCD    4273528556
        0x08007644:    72243049    I0$r    DCD    1914974281
        0x08007648:    0fa7e9ab    ....    DCD    262662571
        0x0800764c:    e59c80e7    ....    DCD    3852239079
        0x08007650:    64210519    ..!d    DCD    1679885593
    secp192r1_gx
        0x08007654:    82ff1012    ....    DCD    2197753874
        0x08007658:    f4ff0afd    ....    DCD    4110355197
        0x0800765c:    43a18800    ...C    DCD    1134659584
        0x08007660:    7cbf20eb    . .|    DCD    2092900587
        0x08007664:    b03090f6    ..0.    DCD    2955972854
        0x08007668:    188da80e    ....    DCD    411936782
    secp192r1_gy
        0x0800766c:    1e794811    .Hy.    DCD    511264785
        0x08007670:    73f977a1    .w.s    DCD    1945728929
        0x08007674:    6b24cdd5    ..$k    DCD    1797574101
        0x08007678:    631011ed    ...c    DCD    1661997549
        0x0800767c:    ffc8da78    x...    DCD    4291353208
        0x08007680:    07192b95    .+..    DCD    119090069
    secp192r1_n
        0x08007684:    b4d22831    1(..    DCD    3033671729
        0x08007688:    146bc9b1    ..k.    DCD    342608305
        0x0800768c:    99def836    6...    DCD    2581526582
        0x08007690:    ffffffff    ....    DCD    4294967295
        0x08007694:    ffffffff    ....    DCD    4294967295
        0x08007698:    ffffffff    ....    DCD    4294967295
    secp224r1_p
        0x0800769c:    00000001    ....    DCD    1
        0x080076a0:    00000000    ....    DCD    0
        0x080076a4:    00000000    ....    DCD    0
        0x080076a8:    ffffffff    ....    DCD    4294967295
        0x080076ac:    ffffffff    ....    DCD    4294967295
        0x080076b0:    ffffffff    ....    DCD    4294967295
        0x080076b4:    ffffffff    ....    DCD    4294967295
        0x080076b8:    00000000    ....    DCD    0
    secp224r1_b
        0x080076bc:    2355ffb4    ..U#    DCD    592838580
        0x080076c0:    270b3943    C9.'    DCD    655046979
        0x080076c4:    d7bfd8ba    ....    DCD    3619674298
        0x080076c8:    5044b0b7    ..DP    DCD    1346678967
        0x080076cc:    f5413256    V2A.    DCD    4114690646
        0x080076d0:    0c04b3ab    ....    DCD    201634731
        0x080076d4:    b4050a85    ....    DCD    3020229253
    secp224r1_gx
        0x080076d8:    115c1d21    !.\.    DCD    291249441
        0x080076dc:    343280d6    ..24    DCD    875725014
        0x080076e0:    56c21122    "..V    DCD    1455558946
        0x080076e4:    4a03c1d3    ...J    DCD    1241760211
        0x080076e8:    321390b9    ...2    DCD    840143033
        0x080076ec:    6bb4bf7f    ...k    DCD    1807007615
        0x080076f0:    b70e0cbd    ....    DCD    3071151293
    secp224r1_gy
        0x080076f4:    85007e34    4~..    DCD    2231402036
        0x080076f8:    44d58199    ...D    DCD    1154843033
        0x080076fc:    5a074764    dG.Z    DCD    1510426468
        0x08007700:    cd4375a0    .uC.    DCD    3443750304
        0x08007704:    4c22dfe6    .."L    DCD    1277353958
        0x08007708:    b5f723fb    .#..    DCD    3052872699
        0x0800770c:    bd376388    .c7.    DCD    3174523784
    secp224r1_n
        0x08007710:    5c5c2a3d    =*\\    DCD    1549543997
        0x08007714:    13dd2945    E)..    DCD    333261125
        0x08007718:    e0b8f03e    >...    DCD    3770216510
        0x0800771c:    ffff16a2    ....    DCD    4294907554
        0x08007720:    ffffffff    ....    DCD    4294967295
        0x08007724:    ffffffff    ....    DCD    4294967295
        0x08007728:    ffffffff    ....    DCD    4294967295
    secp256r1_p
        0x0800772c:    ffffffff    ....    DCD    4294967295
        0x08007730:    ffffffff    ....    DCD    4294967295
        0x08007734:    ffffffff    ....    DCD    4294967295
        0x08007738:    00000000    ....    DCD    0
        0x0800773c:    00000000    ....    DCD    0
        0x08007740:    00000000    ....    DCD    0
        0x08007744:    00000001    ....    DCD    1
        0x08007748:    ffffffff    ....    DCD    4294967295
    secp256r1_b
        0x0800774c:    27d2604b    K`.'    DCD    668098635
        0x08007750:    3bce3c3e    ><.;    DCD    1003371582
        0x08007754:    cc53b0f6    ..S.    DCD    3428036854
        0x08007758:    651d06b0    ...e    DCD    1696401072
        0x0800775c:    769886bc    ...v    DCD    1989707452
        0x08007760:    b3ebbd55    U...    DCD    3018571093
        0x08007764:    aa3a93e7    ..:.    DCD    2855965671
        0x08007768:    5ac635d8    .5.Z    DCD    1522939352
    secp256r1_gx
        0x0800776c:    d898c296    ....    DCD    3633889942
        0x08007770:    f4a13945    E9..    DCD    4104206661
        0x08007774:    2deb33a0    .3.-    DCD    770388896
        0x08007778:    77037d81    .}.w    DCD    1996717441
        0x0800777c:    63a440f2    .@.c    DCD    1671708914
        0x08007780:    f8bce6e5    ....    DCD    4173129445
        0x08007784:    e12c4247    GB,.    DCD    3777774151
        0x08007788:    6b17d1f2    ...k    DCD    1796723186
    secp256r1_gy
        0x0800778c:    37bf51f5    .Q.7    DCD    935285237
        0x08007790:    cbb64068    h@..    DCD    3417718888
        0x08007794:    6b315ece    .^1k    DCD    1798397646
        0x08007798:    2bce3357    W3.+    DCD    734933847
        0x0800779c:    7c0f9e16    ...|    DCD    2081398294
        0x080077a0:    8ee7eb4a    J...    DCD    2397563722
        0x080077a4:    fe1a7f9b    ....    DCD    4263149467
        0x080077a8:    4fe342e2    .B.O    DCD    1340293858
    secp256r1_n
        0x080077ac:    fc632551    Q%c.    DCD    4234356049
        0x080077b0:    f3b9cac2    ....    DCD    4089039554
        0x080077b4:    a7179e84    ....    DCD    2803342980
        0x080077b8:    bce6faad    ....    DCD    3169254061
        0x080077bc:    ffffffff    ....    DCD    4294967295
        0x080077c0:    ffffffff    ....    DCD    4294967295
        0x080077c4:    00000000    ....    DCD    0
        0x080077c8:    ffffffff    ....    DCD    4294967295
    secp384r1_p
        0x080077cc:    ffffffff    ....    DCD    4294967295
        0x080077d0:    00000000    ....    DCD    0
        0x080077d4:    00000000    ....    DCD    0
        0x080077d8:    ffffffff    ....    DCD    4294967295
        0x080077dc:    fffffffe    ....    DCD    4294967294
        0x080077e0:    ffffffff    ....    DCD    4294967295
        0x080077e4:    ffffffff    ....    DCD    4294967295
        0x080077e8:    ffffffff    ....    DCD    4294967295
        0x080077ec:    ffffffff    ....    DCD    4294967295
        0x080077f0:    ffffffff    ....    DCD    4294967295
        0x080077f4:    ffffffff    ....    DCD    4294967295
        0x080077f8:    ffffffff    ....    DCD    4294967295
    secp384r1_b
        0x080077fc:    d3ec2aef    .*..    DCD    3555470063
        0x08007800:    2a85c8ed    ...*    DCD    713410797
        0x08007804:    8a2ed19d    ....    DCD    2318324125
        0x08007808:    c656398d    .9V.    DCD    3327539597
        0x0800780c:    5013875a    Z..P    DCD    1343457114
        0x08007810:    0314088f    ....    DCD    51644559
        0x08007814:    fe814112    .A..    DCD    4269883666
        0x08007818:    181d9c6e    n...    DCD    404593774
        0x0800781c:    e3f82d19    .-..    DCD    3824692505
        0x08007820:    988e056b    k...    DCD    2559444331
        0x08007824:    e23ee7e4    ..>.    DCD    3795773412
        0x08007828:    b3312fa7    ./1.    DCD    3006345127
    secp384r1_gx
        0x0800782c:    72760ab7    ..vr    DCD    1920338615
        0x08007830:    3a545e38    8^T:    DCD    978607672
        0x08007834:    bf55296c    l)U.    DCD    3210029420
        0x08007838:    5502f25d    ]..U    DCD    1426256477
        0x0800783c:    82542a38    8*T.    DCD    2186553912
        0x08007840:    59f741e0    .A.Y    DCD    1509376480
        0x08007844:    8ba79b98    ....    DCD    2343017368
        0x08007848:    6e1d3b62    b;.n    DCD    1847409506
        0x0800784c:    f320ad74    t. .    DCD    4079005044
        0x08007850:    8eb1c71e    ....    DCD    2394015518
        0x08007854:    be8b0537    7...    DCD    3196781879
        0x08007858:    aa87ca22    "...    DCD    2861025826
    secp384r1_gy
        0x0800785c:    90ea0e5f    _...    DCD    2431258207
        0x08007860:    7a431d7c    |.Cz    DCD    2051218812
        0x08007864:    1d7e819d    ..~.    DCD    494829981
        0x08007868:    0a60b1ce    ..`.    DCD    174109134
        0x0800786c:    b5f0b8c0    ....    DCD    3052452032
        0x08007870:    e9da3113    .1..    DCD    3923390739
        0x08007874:    289a147c    |..(    DCD    681186428
        0x08007878:    f8f41dbd    ....    DCD    4176747965
        0x0800787c:    9292dc29    )...    DCD    2459098153
        0x08007880:    5d9e98bf    ...]    DCD    1570674879
        0x08007884:    96262c6f    o,&.    DCD    2519084143
        0x08007888:    3617de4a    J..6    DCD    907533898
    secp384r1_n
        0x0800788c:    ccc52973    s)..    DCD    3435473267
        0x08007890:    ecec196a    j...    DCD    3974895978
        0x08007894:    48b0a77a    z..H    DCD    1219536762
        0x08007898:    581a0db2    ...X    DCD    1478102450
        0x0800789c:    f4372ddf    .-7.    DCD    4097256927
        0x080078a0:    c7634d81    .Mc.    DCD    3345173889
        0x080078a4:    ffffffff    ....    DCD    4294967295
        0x080078a8:    ffffffff    ....    DCD    4294967295
        0x080078ac:    ffffffff    ....    DCD    4294967295
        0x080078b0:    ffffffff    ....    DCD    4294967295
        0x080078b4:    ffffffff    ....    DCD    4294967295
        0x080078b8:    ffffffff    ....    DCD    4294967295
    secp521r1_p
        0x080078bc:    ffffffff    ....    DCD    4294967295
        0x080078c0:    ffffffff    ....    DCD    4294967295
        0x080078c4:    ffffffff    ....    DCD    4294967295
        0x080078c8:    ffffffff    ....    DCD    4294967295
        0x080078cc:    ffffffff    ....    DCD    4294967295
        0x080078d0:    ffffffff    ....    DCD    4294967295
        0x080078d4:    ffffffff    ....    DCD    4294967295
        0x080078d8:    ffffffff    ....    DCD    4294967295
        0x080078dc:    ffffffff    ....    DCD    4294967295
        0x080078e0:    ffffffff    ....    DCD    4294967295
        0x080078e4:    ffffffff    ....    DCD    4294967295
        0x080078e8:    ffffffff    ....    DCD    4294967295
        0x080078ec:    ffffffff    ....    DCD    4294967295
        0x080078f0:    ffffffff    ....    DCD    4294967295
        0x080078f4:    ffffffff    ....    DCD    4294967295
        0x080078f8:    ffffffff    ....    DCD    4294967295
        0x080078fc:    000001ff    ....    DCD    511
    secp521r1_b
        0x08007900:    6b503f00    .?Pk    DCD    1800421120
        0x08007904:    ef451fd4    ..E.    DCD    4014284756
        0x08007908:    3d2c34f1    .4,=    DCD    1026307313
        0x0800790c:    3573df88    ..s5    DCD    896786312
        0x08007910:    3bb1bf07    ...;    DCD    1001504519
        0x08007914:    1652c0bd    ..R.    DCD    374522045
        0x08007918:    ec7e937b    {.~.    DCD    3967718267
        0x0800791c:    56193951    Q9.V    DCD    1444493649
        0x08007920:    8ef109e1    ....    DCD    2398161377
        0x08007924:    b8b48991    ....    DCD    3098839441
        0x08007928:    99b315f3    ....    DCD    2578650611
        0x0800792c:    a2da725b    [r..    DCD    2732225115
        0x08007930:    b68540ee    .@..    DCD    3062186222
        0x08007934:    929a21a0    .!..    DCD    2459574688
        0x08007938:    8e1c9a1f    ....    DCD    2384239135
        0x0800793c:    953eb961    a.>.    DCD    2503915873
        0x08007940:    00000051    Q...    DCD    81
    secp521r1_gx
        0x08007944:    c2e5bd66    f...    DCD    3269836134
        0x08007948:    f97e7e31    1~~.    DCD    4185816625
        0x0800794c:    856a429b    .Bj.    DCD    2238333595
        0x08007950:    3348b3c1    ..H3    DCD    860402625
        0x08007954:    a2ffa8de    ....    DCD    2734663902
        0x08007958:    fe1dc127    '...    DCD    4263362855
        0x0800795c:    efe75928    (Y..    DCD    4024916264
        0x08007960:    a14b5e77    w^K.    DCD    2706071159
        0x08007964:    6b4d3dba    .=Mk    DCD    1800224186
        0x08007968:    f828af60    `.(.    DCD    4163415904
        0x0800796c:    053fb521    !.?.    DCD    88061217
        0x08007970:    9c648139    9.d.    DCD    2623832377
        0x08007974:    2395b442    B..#    DCD    597013570
        0x08007978:    9e3ecb66    f.>.    DCD    2654915430
        0x0800797c:    0404e9cd    ....    DCD    67430861
        0x08007980:    858e06b7    ....    DCD    2240677559
        0x08007984:    000000c6    ....    DCD    198
    secp521r1_gy
        0x08007988:    9fd16650    Pf..    DCD    2681300560
        0x0800798c:    88be9476    v...    DCD    2294191222
        0x08007990:    a272c240    @.r.    DCD    2725429824
        0x08007994:    353c7086    .p<5    DCD    893153414
        0x08007998:    3fad0761    a..?    DCD    1068304225
        0x0800799c:    c550b901    ..P.    DCD    3310401793
        0x080079a0:    5ef42640    @&.^    DCD    1593058880
        0x080079a4:    97ee7299    .r..    DCD    2548986521
        0x080079a8:    273e662c    ,f>'    DCD    658400812
        0x080079ac:    17afbd17    ....    DCD    397393175
        0x080079b0:    579b4468    hD.W    DCD    1469793384
        0x080079b4:    98f54449    ID..    DCD    2566210633
        0x080079b8:    2c7d1bd9    ..},    DCD    746396633
        0x080079bc:    5c8a5fb4    ._.\    DCD    1552572340
        0x080079c0:    9a3bc004    ..;.    DCD    2587607044
        0x080079c4:    39296a78    xj)9    DCD    959015544
        0x080079c8:    00000118    ....    DCD    280
    secp521r1_n
        0x080079cc:    91386409    .d8.    DCD    2436391945
        0x080079d0:    bb6fb71e    ..o.    DCD    3144660766
        0x080079d4:    899c47ae    .G..    DCD    2308720558
        0x080079d8:    3bb5c9b8    ...;    DCD    1001769400
        0x080079dc:    f709a5d0    ....    DCD    4144604624
        0x080079e0:    7fcc0148    H...    DCD    2144076104
        0x080079e4:    bf2f966b    k./.    DCD    3207566955
        0x080079e8:    51868783    ...Q    DCD    1367771011
        0x080079ec:    fffffffa    ....    DCD    4294967290
        0x080079f0:    ffffffff    ....    DCD    4294967295
        0x080079f4:    ffffffff    ....    DCD    4294967295
        0x080079f8:    ffffffff    ....    DCD    4294967295
        0x080079fc:    ffffffff    ....    DCD    4294967295
        0x08007a00:    ffffffff    ....    DCD    4294967295
        0x08007a04:    ffffffff    ....    DCD    4294967295
        0x08007a08:    ffffffff    ....    DCD    4294967295
        0x08007a0c:    000001ff    ....    DCD    511
    secp192k1_p
        0x08007a10:    ffffee37    7...    DCD    4294962743
        0x08007a14:    fffffffe    ....    DCD    4294967294
        0x08007a18:    ffffffff    ....    DCD    4294967295
        0x08007a1c:    ffffffff    ....    DCD    4294967295
        0x08007a20:    ffffffff    ....    DCD    4294967295
        0x08007a24:    ffffffff    ....    DCD    4294967295
    secp192k1_gx
        0x08007a28:    eae06c7d    }l..    DCD    3940576381
        0x08007a2c:    1da5d1b1    ....    DCD    497406385
        0x08007a30:    80b7f434    4...    DCD    2159539252
        0x08007a34:    26b07d02    .}.&    DCD    649100546
        0x08007a38:    c057e9ae    ..W.    DCD    3226986926
        0x08007a3c:    db4ff10e    ..O.    DCD    3679449358
    secp192k1_gy
        0x08007a40:    d95e2f9d    ./^.    DCD    3646828445
        0x08007a44:    4082aa88    ...@    DCD    1082305160
        0x08007a48:    15be8634    4...    DCD    364807732
        0x08007a4c:    844163d0    .cA.    DCD    2218877904
        0x08007a50:    9c5628a7    .(V.    DCD    2622892199
        0x08007a54:    9b2f2f6d    m//.    DCD    2603560813
    secp192k1_n
        0x08007a58:    74defd8d    ...t    DCD    1960770957
        0x08007a5c:    0f69466a    jFi.    DCD    258557546
        0x08007a60:    26f2fc17    ...&    DCD    653458455
        0x08007a64:    fffffffe    ....    DCD    4294967294
        0x08007a68:    ffffffff    ....    DCD    4294967295
        0x08007a6c:    ffffffff    ....    DCD    4294967295
    secp224k1_p
        0x08007a70:    ffffe56d    m...    DCD    4294960493
        0x08007a74:    fffffffe    ....    DCD    4294967294
        0x08007a78:    ffffffff    ....    DCD    4294967295
        0x08007a7c:    ffffffff    ....    DCD    4294967295
        0x08007a80:    ffffffff    ....    DCD    4294967295
        0x08007a84:    ffffffff    ....    DCD    4294967295
        0x08007a88:    ffffffff    ....    DCD    4294967295
    secp224k1_gx
        0x08007a8c:    b6b7a45c    \...    DCD    3065488476
        0x08007a90:    0f7e650e    .e~.    DCD    259941646
        0x08007a94:    e47075a9    .up.    DCD    3832575401
        0x08007a98:    69a467e9    .g.i    DCD    1772382185
        0x08007a9c:    30fc28a1    .(.0    DCD    821831841
        0x08007aa0:    4df099df    ...M    DCD    1307613663
        0x08007aa4:    a1455b33    3[E.    DCD    2705677107
    secp224k1_gy
        0x08007aa8:    556d61a5    .amU    DCD    1433231781
        0x08007aac:    e2ca4bdb    .K..    DCD    3804908507
        0x08007ab0:    c0b0bd59    Y...    DCD    3232808281
        0x08007ab4:    f7e319f7    ....    DCD    4158855671
        0x08007ab8:    82cafbd6    ....    DCD    2194340822
        0x08007abc:    7fba3442    B4..    DCD    2142909506
        0x08007ac0:    7e089fed    ...~    DCD    2114494445
    secp224k1_n
        0x08007ac4:    769fb1f7    ...v    DCD    1990177271
        0x08007ac8:    caf0a971    q...    DCD    3404769649
        0x08007acc:    d2ec6184    .a..    DCD    3538706820
        0x08007ad0:    0001dce8    ....    DCD    122088
        0x08007ad4:    00000000    ....    DCD    0
        0x08007ad8:    00000000    ....    DCD    0
        0x08007adc:    00000000    ....    DCD    0
        0x08007ae0:    00000001    ....    DCD    1
    secp256k1_p
        0x08007ae4:    fffffc2f    /...    DCD    4294966319
        0x08007ae8:    fffffffe    ....    DCD    4294967294
        0x08007aec:    ffffffff    ....    DCD    4294967295
        0x08007af0:    ffffffff    ....    DCD    4294967295
        0x08007af4:    ffffffff    ....    DCD    4294967295
        0x08007af8:    ffffffff    ....    DCD    4294967295
        0x08007afc:    ffffffff    ....    DCD    4294967295
        0x08007b00:    ffffffff    ....    DCD    4294967295
    secp256k1_gx
        0x08007b04:    16f81798    ....    DCD    385357720
        0x08007b08:    59f2815b    [..Y    DCD    1509065051
        0x08007b0c:    2dce28d9    .(.-    DCD    768485593
        0x08007b10:    029bfcdb    ....    DCD    43777243
        0x08007b14:    ce870b07    ....    DCD    3464956679
        0x08007b18:    55a06295    .b.U    DCD    1436574357
        0x08007b1c:    f9dcbbac    ....    DCD    4191992748
        0x08007b20:    79be667e    ~f.y    DCD    2042521214
    secp256k1_gy
        0x08007b24:    fb10d4b8    ....    DCD    4212184248
        0x08007b28:    9c47d08f    ..G.    DCD    2621952143
        0x08007b2c:    a6855419    .T..    DCD    2793755673
        0x08007b30:    fd17b448    H...    DCD    4246189128
        0x08007b34:    0e1108a8    ....    DCD    235997352
        0x08007b38:    5da4fbfc    ...]    DCD    1571093500
        0x08007b3c:    26a3c465    e..&    DCD    648266853
        0x08007b40:    483ada77    w.:H    DCD    1211816567
    secp256k1_n
        0x08007b44:    d0364141    AA6.    DCD    3493216577
        0x08007b48:    bfd25e8c    .^..    DCD    3218235020
        0x08007b4c:    af48a03b    ;.H.    DCD    2940772411
        0x08007b50:    baaedce6    ....    DCD    3132021990
        0x08007b54:    fffffffe    ....    DCD    4294967294
        0x08007b58:    ffffffff    ....    DCD    4294967295
        0x08007b5c:    ffffffff    ....    DCD    4294967295
        0x08007b60:    ffffffff    ....    DCD    4294967295
    brainpoolP256r1_p
        0x08007b64:    1f6e5377    wSn.    DCD    527324023
        0x08007b68:    2013481d    .H.     DCD    538134557
        0x08007b6c:    d5262028    ( &.    DCD    3576045608
        0x08007b70:    6e3bf623    #.;n    DCD    1849423395
        0x08007b74:    9d838d72    r...    DCD    2642644338
        0x08007b78:    3e660a90    ..f>    DCD    1046874768
        0x08007b7c:    a1eea9bc    ....    DCD    2716772796
        0x08007b80:    a9fb57db    .W..    DCD    2851821531
    brainpoolP256r1_a
        0x08007b84:    f330b5d9    ..0.    DCD    4080055769
        0x08007b88:    e94a4b44    DKJ.    DCD    3913960260
        0x08007b8c:    26dc5c6c    l\.&    DCD    651975788
        0x08007b90:    fb8055c1    .U..    DCD    4219491777
        0x08007b94:    417affe7    ..zA    DCD    1098579943
        0x08007b98:    eef67530    0u..    DCD    4009129264
        0x08007b9c:    fc2c3057    W0,.    DCD    4230754391
        0x08007ba0:    7d5a0975    u.Z}    DCD    2103052661
    brainpoolP256r1_b
        0x08007ba4:    ff8c07b6    ....    DCD    4287367094
        0x08007ba8:    6bccdc18    ...k    DCD    1808587800
        0x08007bac:    5cf7e1ce    ...\    DCD    1559749070
        0x08007bb0:    95841629    )...    DCD    2508461609
        0x08007bb4:    bbd77cbf    .|..    DCD    3151461567
        0x08007bb8:    f330b5d9    ..0.    DCD    4080055769
        0x08007bbc:    e94a4b44    DKJ.    DCD    3913960260
        0x08007bc0:    26dc5c6c    l\.&    DCD    651975788
    brainpoolP256r1_gx
        0x08007bc4:    9ace3262    b2..    DCD    2597204578
        0x08007bc8:    3a4453bd    .SD:    DCD    977556413
        0x08007bcc:    e3bd23c2    .#..    DCD    3820823490
        0x08007bd0:    b9de27e1    .'..    DCD    3118344161
        0x08007bd4:    fc81b7af    ....    DCD    4236359599
        0x08007bd8:    2c4b482f    /HK,    DCD    743131183
        0x08007bdc:    cb7e57cb    .W~.    DCD    3414054859
        0x08007be0:    8bd2aeb9    ....    DCD    2345840313
    brainpoolP256r1_gy
        0x08007be4:    2f046997    .i./    DCD    788818327
        0x08007be8:    5c1d54c7    .T.\    DCD    1545426119
        0x08007bec:    2ded8e54    T..-    DCD    770543188
        0x08007bf0:    c2774513    .Ew.    DCD    3262596371
        0x08007bf4:    14611dc9    ..a.    DCD    341908937
        0x08007bf8:    97f8461a    .F..    DCD    2549630490
        0x08007bfc:    c3dac4fd    ....    DCD    3285894397
        0x08007c00:    547ef835    5.~T    DCD    1417607221
    brainpoolP256r1_n
        0x08007c04:    974856a7    .VH.    DCD    2538100391
        0x08007c08:    901e0e82    ....    DCD    2417888898
        0x08007c0c:    b561a6f7    ..a.    DCD    3043075831
        0x08007c10:    8c397aa3    .z9.    DCD    2352577187
        0x08007c14:    9d838d71    q...    DCD    2642644337
        0x08007c18:    3e660a90    ..f>    DCD    1046874768
        0x08007c1c:    a1eea9bc    ....    DCD    2716772796
        0x08007c20:    a9fb57db    .W..    DCD    2851821531
    brainpoolP384r1_p
        0x08007c24:    3107ec53    S..1    DCD    822602835
        0x08007c28:    87470013    ..G.    DCD    2269577235
        0x08007c2c:    901d1a71    q...    DCD    2417826417
        0x08007c30:    acd3a729    )...    DCD    2899552041
        0x08007c34:    7fb71123    #...    DCD    2142703907
        0x08007c38:    12b1da19    ....    DCD    313645593
        0x08007c3c:    ed5456b4    .VT.    DCD    3981727412
        0x08007c40:    152f7109    .q/.    DCD    355430665
        0x08007c44:    50e641df    .A.P    DCD    1357267423
        0x08007c48:    0f5d6f7e    ~o].    DCD    257781630
        0x08007c4c:    a3386d28    (m8.    DCD    2738384168
        0x08007c50:    8cb91e82    ....    DCD    2360942210
    brainpoolP384r1_a
        0x08007c54:    22ce2826    &(."    DCD    583936038
        0x08007c58:    04a8c7dd    ....    DCD    78170077
        0x08007c5c:    503ad4eb    ..:P    DCD    1346032875
        0x08007c60:    8aa5814a    J...    DCD    2326102346
        0x08007c64:    ba91f90f    ....    DCD    3130128655
        0x08007c68:    139165ef    .e..    DCD    328295919
        0x08007c6c:    4fb22787    .'.O    DCD    1337075591
        0x08007c70:    c2bea28e    ....    DCD    3267273358
        0x08007c74:    ce05afa0    ....    DCD    3456479136
        0x08007c78:    3c72080a    ..r<    DCD    1014106122
        0x08007c7c:    3d8c150c    ...=    DCD    1032590604
        0x08007c80:    7bc382c6    ...{    DCD    2076410566
    brainpoolP384r1_b
        0x08007c84:    fa504c11    .LP.    DCD    4199566353
        0x08007c88:    3ab78696    ...:    DCD    985106070
        0x08007c8c:    95dbc994    ....    DCD    2514209172
        0x08007c90:    7cb43902    .9.|    DCD    2092185858
        0x08007c94:    3eeb62d5    .b.>    DCD    1055613653
        0x08007c98:    2e880ea5    ....    DCD    780668581
        0x08007c9c:    07dcd2a6    ....    DCD    131912358
        0x08007ca0:    2fb77de1    .}./    DCD    800554465
        0x08007ca4:    16f0447c    |D..    DCD    384844924
        0x08007ca8:    8b39b554    T.9.    DCD    2335814996
        0x08007cac:    22ce2826    &(."    DCD    583936038
        0x08007cb0:    04a8c7dd    ....    DCD    78170077
    brainpoolP384r1_gx
        0x08007cb4:    47d4af1e    ...G    DCD    1205120798
        0x08007cb8:    ef87b2e2    ....    DCD    4018647778
        0x08007cbc:    36d646aa    .F.6    DCD    920012458
        0x08007cc0:    e826e034    4.&.    DCD    3894861876
        0x08007cc4:    0cbd10e8    ....    DCD    213717224
        0x08007cc8:    db7fcafe    ....    DCD    3682585342
        0x08007ccc:    7ef14fe3    .O.~    DCD    2129743843
        0x08007cd0:    8847a3e7    ..G.    DCD    2286396391
        0x08007cd4:    b7c13f6b    k?..    DCD    3082895211
        0x08007cd8:    a2a63a81    .:..    DCD    2728802945
        0x08007cdc:    68cf45ff    .E.h    DCD    1758414335
        0x08007ce0:    1d1c64f0    .d..    DCD    488400112
    brainpoolP384r1_gy
        0x08007ce4:    263c5315    .S<&    DCD    641487637
        0x08007ce8:    42820341    A..B    DCD    1115816769
        0x08007cec:    77918111    ...w    DCD    2006024465
        0x08007cf0:    0e464621    !FF.    DCD    239486497
        0x08007cf4:    f9912928    ()..    DCD    4187040040
        0x08007cf8:    e19c054f    O...    DCD    3785098575
        0x08007cfc:    feec5864    dX..    DCD    4276901988
        0x08007d00:    62b70b29    )..b    DCD    1656163113
        0x08007d04:    95cfd552    R...    DCD    2513425746
        0x08007d08:    5cb1eb8e    ...\    DCD    1555164046
        0x08007d0c:    20f9c2a4    ...     DCD    553239204
        0x08007d10:    8abe1d75    u...    DCD    2327715189
    brainpoolP384r1_n
        0x08007d14:    e9046565    ee..    DCD    3909379429
        0x08007d18:    3b883202    .2.;    DCD    998781442
        0x08007d1c:    6b7fc310    ...k    DCD    1803535120
        0x08007d20:    cf3ab6af    ..:.    DCD    3476731567
        0x08007d24:    ac0425a7    .%..    DCD    2885952935
        0x08007d28:    1f166e6c    ln..    DCD    521563756
        0x08007d2c:    ed5456b3    .VT.    DCD    3981727411
        0x08007d30:    152f7109    .q/.    DCD    355430665
        0x08007d34:    50e641df    .A.P    DCD    1357267423
        0x08007d38:    0f5d6f7e    ~o].    DCD    257781630
        0x08007d3c:    a3386d28    (m8.    DCD    2738384168
        0x08007d40:    8cb91e82    ....    DCD    2360942210
    brainpoolP512r1_p
        0x08007d44:    583a48f3    .H:X    DCD    1480214771
        0x08007d48:    28aa6056    V`.(    DCD    682254422
        0x08007d4c:    2d82c685    ...-    DCD    763545221
        0x08007d50:    2881ff2f    /..(    DCD    679608111
        0x08007d54:    e6a380e6    ....    DCD    3869475046
        0x08007d58:    aecda12a    *...    DCD    2932711722
        0x08007d5c:    9bc66842    Bh..    DCD    2613471298
        0x08007d60:    7d4d9b00    ..M}    DCD    2102237952
        0x08007d64:    70330871    q.3p    DCD    1882392689
        0x08007d68:    d6639cca    ..c.    DCD    3596852426
        0x08007d6c:    b3c9d20e    ....    DCD    3016348174
        0x08007d70:    cb308db3    ..0.    DCD    3408956851
        0x08007d74:    33c9fc07    ...3    DCD    868875271
        0x08007d78:    3fd4e6ae    ...?    DCD    1070917294
        0x08007d7c:    dbe9c48b    ....    DCD    3689530507
        0x08007d80:    aadd9db8    ....    DCD    2866650552
    brainpoolP512r1_a
        0x08007d84:    77fc94ca    ...w    DCD    2013041866
        0x08007d88:    e7c1ac4d    M...    DCD    3888229453
        0x08007d8c:    2bf2c7b9    ...+    DCD    737331129
        0x08007d90:    7f1117a7    ....    DCD    2131826599
        0x08007d94:    8b9ac8b5    ....    DCD    2342176949
        0x08007d98:    0a2ef1c9    ....    DCD    170848713
        0x08007d9c:    a8253aa1    .:%.    DCD    2821012129
        0x08007da0:    2ded5d5a    Z].-    DCD    770530650
        0x08007da4:    ea9863bc    .c..    DCD    3935855548
        0x08007da8:    a83441ca    .A4.    DCD    2821997002
        0x08007dac:    3df91610    ...=    DCD    1039734288
        0x08007db0:    94cbdd8d    ....    DCD    2496388493
        0x08007db4:    ac234cc5    .L#.    DCD    2887994565
        0x08007db8:    e2327145    Eq2.    DCD    3794956613
        0x08007dbc:    8b603b89    .;`.    DCD    2338339721
        0x08007dc0:    7830a331    1.0x    DCD    2016453425
    brainpoolP512r1_b
        0x08007dc4:    8016f723    #...    DCD    2148988707
        0x08007dc8:    2809bd63    c..(    DCD    671726947
        0x08007dcc:    5ebae5dd    ...^    DCD    1589306845
        0x08007dd0:    984050b7    .P@.    DCD    2554351799
        0x08007dd4:    dc083e67    g>..    DCD    3691527783
        0x08007dd8:    77fc94ca    ...w    DCD    2013041866
        0x08007ddc:    e7c1ac4d    M...    DCD    3888229453
        0x08007de0:    2bf2c7b9    ...+    DCD    737331129
        0x08007de4:    7f1117a7    ....    DCD    2131826599
        0x08007de8:    8b9ac8b5    ....    DCD    2342176949
        0x08007dec:    0a2ef1c9    ....    DCD    170848713
        0x08007df0:    a8253aa1    .:%.    DCD    2821012129
        0x08007df4:    2ded5d5a    Z].-    DCD    770530650
        0x08007df8:    ea9863bc    .c..    DCD    3935855548
        0x08007dfc:    a83441ca    .A4.    DCD    2821997002
        0x08007e00:    3df91610    ...=    DCD    1039734288
    brainpoolP512r1_gx
        0x08007e04:    bcb9f822    "...    DCD    3166304290
        0x08007e08:    8b352209    ."5.    DCD    2335515145
        0x08007e0c:    406a5e68    h^j@    DCD    1080712808
        0x08007e10:    7c6d5047    GPm|    DCD    2087538759
        0x08007e14:    93b97d5f    _}..    DCD    2478407007
        0x08007e18:    50d1687b    {h.P    DCD    1355901051
        0x08007e1c:    e2d0d48d    ....    DCD    3805336717
        0x08007e20:    ff3b1f78    x.;.    DCD    4282064760
        0x08007e24:    f4d0098e    ....    DCD    4107274638
        0x08007e28:    b43b62ee    .b;.    DCD    3023790830
        0x08007e2c:    b5d916c1    ....    DCD    3050903233
        0x08007e30:    85ed9f70    p...    DCD    2246942576
        0x08007e34:    9c4c6a93    .jL.    DCD    2622253715
        0x08007e38:    5a21322e    .2!Z    DCD    1512124974
        0x08007e3c:    d82ed964    d...    DCD    3626948964
        0x08007e40:    81aee4bd    ....    DCD    2175722685
    brainpoolP512r1_gy
        0x08007e44:    3ad80892    ...:    DCD    987236498
        0x08007e48:    78cd1e0f    ...x    DCD    2026708495
        0x08007e4c:    a8f05406    .T..    DCD    2834322438
        0x08007e50:    d1ca2b2f    /+..    DCD    3519687471
        0x08007e54:    8a2763ae    .c'.    DCD    2317837230
        0x08007e58:    5bca4bd8    .K.[    DCD    1539984344
        0x08007e5c:    4a5f485e    ^H_J    DCD    1247758430
        0x08007e60:    b2dcde49    I...    DCD    3000819273
        0x08007e64:    881f8111    ....    DCD    2283766033
        0x08007e68:    a000c55b    [...    DCD    2684405083
        0x08007e6c:    24a57b1a    .{.$    DCD    614824730
        0x08007e70:    f209f700    ....    DCD    4060739328
        0x08007e74:    cf7822fd    ."x.    DCD    3480756989
        0x08007e78:    c0eabfa9    ....    DCD    3236609961
        0x08007e7c:    566332ec    .2cV    DCD    1449341676
        0x08007e80:    7dde385d    ]8.}    DCD    2111715421
    brainpoolP512r1_n
        0x08007e84:    9ca90069    i...    DCD    2628321385
        0x08007e88:    b5879682    ....    DCD    3045561986
        0x08007e8c:    085ddadd    ..].    DCD    140368605
        0x08007e90:    1db1d381    ....    DCD    498193281
        0x08007e94:    7fac1047    G...    DCD    2141982791
        0x08007e98:    41866119    .a.A    DCD    1099325721
        0x08007e9c:    4ca92619    .&.L    DCD    1286153753
        0x08007ea0:    553e5c41    A\>U    DCD    1430150209
        0x08007ea4:    70330870    p.3p    DCD    1882392688
        0x08007ea8:    d6639cca    ..c.    DCD    3596852426
        0x08007eac:    b3c9d20e    ....    DCD    3016348174
        0x08007eb0:    cb308db3    ..0.    DCD    3408956851
        0x08007eb4:    33c9fc07    ...3    DCD    868875271
        0x08007eb8:    3fd4e6ae    ...?    DCD    1070917294
        0x08007ebc:    dbe9c48b    ....    DCD    3689530507
        0x08007ec0:    aadd9db8    ....    DCD    2866650552
    .constdata
    K
        0x08007ec4:    428a2f98    ./.B    DCD    1116352408
        0x08007ec8:    71374491    .D7q    DCD    1899447441
        0x08007ecc:    b5c0fbcf    ....    DCD    3049323471
        0x08007ed0:    e9b5dba5    ....    DCD    3921009573
        0x08007ed4:    3956c25b    [.V9    DCD    961987163
        0x08007ed8:    59f111f1    ...Y    DCD    1508970993
        0x08007edc:    923f82a4    ..?.    DCD    2453635748
        0x08007ee0:    ab1c5ed5    .^..    DCD    2870763221
        0x08007ee4:    d807aa98    ....    DCD    3624381080
        0x08007ee8:    12835b01    .[..    DCD    310598401
        0x08007eec:    243185be    ..1$    DCD    607225278
        0x08007ef0:    550c7dc3    .}.U    DCD    1426881987
        0x08007ef4:    72be5d74    t].r    DCD    1925078388
        0x08007ef8:    80deb1fe    ....    DCD    2162078206
        0x08007efc:    9bdc06a7    ....    DCD    2614888103
        0x08007f00:    c19bf174    t...    DCD    3248222580
        0x08007f04:    e49b69c1    .i..    DCD    3835390401
        0x08007f08:    efbe4786    .G..    DCD    4022224774
        0x08007f0c:    0fc19dc6    ....    DCD    264347078
        0x08007f10:    240ca1cc    ...$    DCD    604807628
        0x08007f14:    2de92c6f    o,.-    DCD    770255983
        0x08007f18:    4a7484aa    ..tJ    DCD    1249150122
        0x08007f1c:    5cb0a9dc    ...\    DCD    1555081692
        0x08007f20:    76f988da    ...v    DCD    1996064986
        0x08007f24:    983e5152    RQ>.    DCD    2554220882
        0x08007f28:    a831c66d    m.1.    DCD    2821834349
        0x08007f2c:    b00327c8    .'..    DCD    2952996808
        0x08007f30:    bf597fc7    ..Y.    DCD    3210313671
        0x08007f34:    c6e00bf3    ....    DCD    3336571891
        0x08007f38:    d5a79147    G...    DCD    3584528711
        0x08007f3c:    06ca6351    Qc..    DCD    113926993
        0x08007f40:    14292967    g)).    DCD    338241895
        0x08007f44:    27b70a85    ...'    DCD    666307205
        0x08007f48:    2e1b2138    8!..    DCD    773529912
        0x08007f4c:    4d2c6dfc    .m,M    DCD    1294757372
        0x08007f50:    53380d13    ..8S    DCD    1396182291
        0x08007f54:    650a7354    Ts.e    DCD    1695183700
        0x08007f58:    766a0abb    ..jv    DCD    1986661051
        0x08007f5c:    81c2c92e    ....    DCD    2177026350
        0x08007f60:    92722c85    .,r.    DCD    2456956037
        0x08007f64:    a2bfe8a1    ....    DCD    2730485921
        0x08007f68:    a81a664b    Kf..    DCD    2820302411
        0x08007f6c:    c24b8b70    p.K.    DCD    3259730800
        0x08007f70:    c76c51a3    .Ql.    DCD    3345764771
        0x08007f74:    d192e819    ....    DCD    3516065817
        0x08007f78:    d6990624    $...    DCD    3600352804
        0x08007f7c:    f40e3585    .5..    DCD    4094571909
        0x08007f80:    106aa070    p.j.    DCD    275423344
        0x08007f84:    19a4c116    ....    DCD    430227734
        0x08007f88:    1e376c08    .l7.    DCD    506948616
        0x08007f8c:    2748774c    LwH'    DCD    659060556
        0x08007f90:    34b0bcb5    ...4    DCD    883997877
        0x08007f94:    391c0cb3    ...9    DCD    958139571
        0x08007f98:    4ed8aa4a    J..N    DCD    1322822218
        0x08007f9c:    5b9cca4f    O..[    DCD    1537002063
        0x08007fa0:    682e6ff3    .o.h    DCD    1747873779
        0x08007fa4:    748f82ee    ...t    DCD    1955562222
        0x08007fa8:    78a5636f    oc.x    DCD    2024104815
        0x08007fac:    84c87814    .x..    DCD    2227730452
        0x08007fb0:    8cc70208    ....    DCD    2361852424
        0x08007fb4:    90befffa    ....    DCD    2428436474
        0x08007fb8:    a4506ceb    .lP.    DCD    2756734187
        0x08007fbc:    bef9a3f7    ....    DCD    3204031479
        0x08007fc0:    c67178f2    .xq.    DCD    3329325298
    .constdata
    m_flash_verify_skip_items
        0x08007fc4:    08007fdc    ....    DCD    134250460
        0x08007fc8:    00000024    $...    DCD    36
        0x08007fcc:    08002000    . ..    DCD    134225920
        0x08007fd0:    0000008d    ....    DCD    141
        0x08007fd4:    08001000    ....    DCD    134221824
        0x08007fd8:    00000004    ....    DCD    4
    .constdata
    m_flash_verify
        0x08007fdc:    9bdd2188    .!..    DCD    2614960520
        0x08007fe0:    acd8961b    ....    DCD    2899875355
        0x08007fe4:    00000003    ....    DCD    3
        0x08007fe8:    08007fc4    ....    DCD    134250436
        0x08007fec:    ffffffff    ....    DCD    4294967295
        0x08007ff0:    00000000    ....    DCD    0
        0x08007ff4:    ffffffff    ....    DCD    4294967295
        0x08007ff8:    31447c82    .|D1    DCD    826571906
        0x08007ffc:    39ad0967    g..9    DCD    967641447
    .constdata
    m_ptable
        0x08008000:    c29320a6    . ..    DCD    3264422054
        0x08008004:    0c4cc1b8    ..L.    DCD    206356920
        0x08008008:    be730bf3    ..s.    DCD    3195210739
        0x0800800c:    e19d7744    Dw..    DCD    3785193284
        0x08008010:    c376caee    ..v.    DCD    3279342318
        0x08008014:    cbb7ed24    $...    DCD    3417828644
        0x08008018:    ce4639ff    .9F.    DCD    3460708863
        0x0800801c:    3e5786cd    ..W>    DCD    1045923533
        0x08008020:    c6bb855b    [...    DCD    3334178139
        0x08008024:    4915f2c8    ...I    DCD    1226175176
        0x08008028:    70d4a1bc    ...p    DCD    1892983228
        0x0800802c:    651433db    .3.e    DCD    1695822811
        0x08008030:    7d96561a    .V.}    DCD    2107004442
        0x08008034:    606659c9    .Yf`    DCD    1617320393
        0x08008038:    0faed51d    ....    DCD    263116061
        0x0800803c:    400637f4    .7.@    DCD    1074149364
        0x08008040:    fdf788e7    ....    DCD    4260858087
        0x08008044:    8992e474    t...    DCD    2308105332
        0x08008048:    cca9d311    ....    DCD    3433681681
        0x0800804c:    19944584    .E..    DCD    429147524
        0x08008050:    dc1ca0f5    ....    DCD    3692863733
        0x08008054:    36f6874d    M..6    DCD    922126157
        0x08008058:    62070d64    d..b    DCD    1644629348
        0x0800805c:    bd4ed150    P.N.    DCD    3176059216
        0x08008060:    126c99dd    ..l.    DCD    309107165
        0x08008064:    b6d98b01    ....    DCD    3067710209
        0x08008068:    912138ef    .8!.    DCD    2434873583
        0x0800806c:    7b0afc98    ...{    DCD    2064317592
        0x08008070:    b56eb034    4.n.    DCD    3043930164
        0x08008074:    c02d2ad7    .*-.    DCD    3224185559
        0x08008078:    00a51bb9    ....    DCD    10820537
        0x0800807c:    aaac7f7e    ~...    DCD    2863431550
        0x08008080:    9ec4c75e    ^...    DCD    2663696222
        0x08008084:    482eb3fb    ...H    DCD    1211020283
        0x08008088:    956a2fe0    ./j.    DCD    2506764256
        0x0800808c:    3f3cba30    0.<?    DCD    1060944432
        0x08008090:    619bfee5    ...a    DCD    1637613285
        0x08008094:    6f68f8cf    ..ho    DCD    1869150415
        0x08008098:    3510e31f    ...5    DCD    890299167
        0x0800809c:    821e908c    ....    DCD    2183041164
        0x080080a0:    038febd6    ....    DCD    59763670
        0x080080a4:    a48d4f5a    ZO..    DCD    2760724314
        0x080080a8:    539f5275    uR.S    DCD    1402950261
        0x080080ac:    e6267972    ry&.    DCD    3861281138
        0x080080b0:    298a0508    ...)    DCD    696911112
        0x080080b4:    dab4b1df    ....    DCD    3669275103
        0x080080b8:    09e2973d    =...    DCD    165844797
        0x080080bc:    6bf02523    #%.k    DCD    1810900259
        0x080080c0:    c5804a67    gJ..    DCD    3313519207
        0x080080c4:    0e3a54ad    .T:.    DCD    238703789
        0x080080c8:    5869d28e    ..iX    DCD    1483330190
        0x080080cc:    4b2281f9    .."K    DCD    1260552697
        0x080080d0:    165faf63    c._.    DCD    375369571
        0x080080d4:    475dd002    ..]G    DCD    1197330434
        0x080080d8:    436d7813    .xmC    DCD    1131247635
        0x080080dc:    41ec9c28    (..A    DCD    1106025512
        0x080080e0:    5ca7712b    +q.\    DCD    1554477355
        0x080080e4:    2cf151de    .Q.,    DCD    754012638
        0x080080e8:    7ce89ab2    ...|    DCD    2095618738
        0x080080ec:    3b42a217    ..B;    DCD    994222615
        0x080080f0:    27bf5532    2U.'    DCD    666850610
        0x080080f4:    d8e9eafa    ....    DCD    3639208698
        0x080080f8:    a8310418    ..1.    DCD    2821784600
        0x080080fc:    7a83a3ab    ...z    DCD    2055447467
    .constdata
    m_ramcode
        0x08008100:    0230aead    ..0.    DCD    36744877
        0x08008104:    51e6d415    ...Q    DCD    1374082069
        0x08008108:    20017000    .p.     DCD    536965120
        0x0800810c:    00000000    ....    DCD    0
        0x08008110:    00000000    ....    DCD    0
        0x08008114:    ffffffff    ....    DCD    4294967295
        0x08008118:    dd91892c    ,...    DCD    3717302572
        0x0800811c:    cbeccbe6    ....    DCD    3421293542
    .constdata
    ECDSA_PUBLIC_KEY
        0x08008120:    37083704    .7.7    DCD    923285252
        0x08008124:    0f25df86    ..%.    DCD    254140294
        0x08008128:    d8921f8c    ....    DCD    3633454988
        0x0800812c:    38820e33    3..8    DCD    948047411
        0x08008130:    0927674a    Jg'.    DCD    153577290
        0x08008134:    1f7afeac    ..z.    DCD    528154284
        0x08008138:    a4490224    $.I.    DCD    2756248100
        0x0800813c:    ab67ed03    ..g.    DCD    2875714819
        0x08008140:    3761994a    J.a7    DCD    929143114
        0x08008144:    1eed7afe    .z..    DCD    518879998
        0x08008148:    0b1fe96c    l...    DCD    186640748
        0x0800814c:    1f0bcaec    ....    DCD    520866540
        0x08008150:    00000026    &...    DCD    38
    .conststring
        0x08008154:    70636573    secp    DCD    1885562227
        0x08008158:    6b323931    192k    DCD    1798453553
        0x0800815c:    00000031    1...    DCD    49
        0x08008160:    70636573    secp    DCD    1885562227
        0x08008164:    6b343232    224k    DCD    1798582834
        0x08008168:    00000031    1...    DCD    49
        0x0800816c:    70636573    secp    DCD    1885562227
        0x08008170:    6b363532    256k    DCD    1798714674
        0x08008174:    00000031    1...    DCD    49
        0x08008178:    70636573    secp    DCD    1885562227
        0x0800817c:    72313235    521r    DCD    1915826741
        0x08008180:    00000031    1...    DCD    49
        0x08008184:    69617262    brai    DCD    1767993954
        0x08008188:    6f6f706e    npoo    DCD    1869574254
        0x0800818c:    3135506c    lP51    DCD    825577580
        0x08008190:    00317232    2r1.    DCD    3240498
        0x08008194:    70636573    secp    DCD    1885562227
        0x08008198:    72323931    192r    DCD    1915894065
        0x0800819c:    00000031    1...    DCD    49
        0x080081a0:    70636573    secp    DCD    1885562227
        0x080081a4:    72343232    224r    DCD    1916023346
        0x080081a8:    00000031    1...    DCD    49
        0x080081ac:    69617262    brai    DCD    1767993954
        0x080081b0:    6f6f706e    npoo    DCD    1869574254
        0x080081b4:    3833506c    lP38    DCD    942887020
        0x080081b8:    00317234    4r1.    DCD    3240500
        0x080081bc:    70636573    secp    DCD    1885562227
        0x080081c0:    72343833    384r    DCD    1916024883
        0x080081c4:    00000031    1...    DCD    49
        0x080081c8:    69617262    brai    DCD    1767993954
        0x080081cc:    6f6f706e    npoo    DCD    1869574254
        0x080081d0:    3532506c    lP25    DCD    892489836
        0x080081d4:    00317236    6r1.    DCD    3240502
        0x080081d8:    70636573    secp    DCD    1885562227
        0x080081dc:    72363532    256r    DCD    1916155186
        0x080081e0:    00000031    1...    DCD    49
    Region$$Table$$Base
        0x080081e4:    08008204    ....    DCD    134251012
        0x080081e8:    20000000    ...     DCD    536870912
        0x080081ec:    00000070    p...    DCD    112
        0x080081f0:    0800016c    l...    DCD    134218092
        0x080081f4:    08008274    t...    DCD    134251124
        0x080081f8:    20000070    p..     DCD    536871024
        0x080081fc:    000025b0    .%..    DCD    9648
        0x08008200:    08000188    ....    DCD    134218120
    Region$$Table$$Limit

** Section #2 'RW_IRAM1' (SHT_PROGBITS) [SHF_ALLOC + SHF_WRITE]
    Size   : 112 bytes (alignment 8)
    Address: 0x20000000


** Section #3 'RW_IRAM1' (SHT_NOBITS) [SHF_ALLOC + SHF_WRITE]
    Size   : 9648 bytes (alignment 8)
    Address: 0x20000070


** Section #4 'ER_IROM2' (SHT_PROGBITS) [SHF_ALLOC + SHF_EXECINSTR]
    Size   : 2876 bytes (alignment 4)
    Address: 0x20017000

    $t
    .ARM.__at_0x20017000
    advance_software_protect_flash_verify
        0x20017000:    e92d41f0    -..A    PUSH     {r4-r8,lr}
        0x20017004:    f000f882    ....    BL       $Ven$TT$L$$advance_software_protect_flash_verify_init ; 0x2001710c
        0x20017008:    2800        .(      CMP      r0,#0
        0x2001700a:    d003        ..      BEQ      0x20017014 ; advance_software_protect_flash_verify + 20
        0x2001700c:    f000f883    ....    BL       $Ven$TT$L$$advance_software_protect_flash_verify_check ; 0x20017116
        0x20017010:    b110        ..      CBZ      r0,0x20017018 ; advance_software_protect_flash_verify + 24
        0x20017012:    2001        .       MOVS     r0,#1
        0x20017014:    e8bd81f0    ....    POP      {r4-r8,pc}
        0x20017018:    4c3b        ;L      LDR      r4,[pc,#236] ; [0x20017108] = 0x200000f8
        0x2001701a:    68e5        .h      LDR      r5,[r4,#0xc]
        0x2001701c:    68a0        .h      LDR      r0,[r4,#8]
        0x2001701e:    2801        .(      CMP      r0,#1
        0x20017020:    d930        0.      BLS      0x20017084 ; advance_software_protect_flash_verify + 132
        0x20017022:    2100        .!      MOVS     r1,#0
        0x20017024:    e018        ..      B        0x20017058 ; advance_software_protect_flash_verify + 88
        0x20017026:    2000        .       MOVS     r0,#0
        0x20017028:    e010        ..      B        0x2001704c ; advance_software_protect_flash_verify + 76
        0x2001702a:    bf00        ..      NOP      
        0x2001702c:    eb0502c0    ....    ADD      r2,r5,r0,LSL #3
        0x20017030:    f8553030    U.00    LDR      r3,[r5,r0,LSL #3]
        0x20017034:    6896        .h      LDR      r6,[r2,#8]
        0x20017036:    42b3        .B      CMP      r3,r6
        0x20017038:    d907        ..      BLS      0x2001704a ; advance_software_protect_flash_verify + 74
        0x2001703a:    f8d2c004    ....    LDR      r12,[r2,#4]
        0x2001703e:    68d7        .h      LDR      r7,[r2,#0xc]
        0x20017040:    f8c2c00c    ....    STR      r12,[r2,#0xc]
        0x20017044:    6016        .`      STR      r6,[r2,#0]
        0x20017046:    e9c27301    ...s    STRD     r7,r3,[r2,#4]
        0x2001704a:    1c40        @.      ADDS     r0,r0,#1
        0x2001704c:    68a2        .h      LDR      r2,[r4,#8]
        0x2001704e:    1a52        R.      SUBS     r2,r2,r1
        0x20017050:    1e52        R.      SUBS     r2,r2,#1
        0x20017052:    4282        .B      CMP      r2,r0
        0x20017054:    d8ea        ..      BHI      0x2001702c ; advance_software_protect_flash_verify + 44
        0x20017056:    1c49        I.      ADDS     r1,r1,#1
        0x20017058:    68a0        .h      LDR      r0,[r4,#8]
        0x2001705a:    1e40        @.      SUBS     r0,r0,#1
        0x2001705c:    4288        .B      CMP      r0,r1
        0x2001705e:    d8e2        ..      BHI      0x20017026 ; advance_software_protect_flash_verify + 38
        0x20017060:    68e1        .h      LDR      r1,[r4,#0xc]
        0x20017062:    2000        .       MOVS     r0,#0
        0x20017064:    e00a        ..      B        0x2001707c ; advance_software_protect_flash_verify + 124
        0x20017066:    bf00        ..      NOP      
        0x20017068:    eb0102c0    ....    ADD      r2,r1,r0,LSL #3
        0x2001706c:    f8513030    Q.00    LDR      r3,[r1,r0,LSL #3]
        0x20017070:    6855        Uh      LDR      r5,[r2,#4]
        0x20017072:    6892        .h      LDR      r2,[r2,#8]
        0x20017074:    442b        +D      ADD      r3,r3,r5
        0x20017076:    4293        .B      CMP      r3,r2
        0x20017078:    d819        ..      BHI      0x200170ae ; advance_software_protect_flash_verify + 174
        0x2001707a:    1c40        @.      ADDS     r0,r0,#1
        0x2001707c:    68a2        .h      LDR      r2,[r4,#8]
        0x2001707e:    1e52        R.      SUBS     r2,r2,#1
        0x20017080:    4282        .B      CMP      r2,r0
        0x20017082:    d8f1        ..      BHI      0x20017068 ; advance_software_protect_flash_verify + 104
        0x20017084:    68e0        .h      LDR      r0,[r4,#0xc]
        0x20017086:    68a1        .h      LDR      r1,[r4,#8]
        0x20017088:    b199        ..      CBZ      r1,0x200170b2 ; advance_software_protect_flash_verify + 178
        0x2001708a:    6801        .h      LDR      r1,[r0,#0]
        0x2001708c:    6922        "i      LDR      r2,[r4,#0x10]
        0x2001708e:    4291        .B      CMP      r1,r2
        0x20017090:    d30d        ..      BCC      0x200170ae ; advance_software_protect_flash_verify + 174
        0x20017092:    68a1        .h      LDR      r1,[r4,#8]
        0x20017094:    68a2        .h      LDR      r2,[r4,#8]
        0x20017096:    eb0001c1    ....    ADD      r1,r0,r1,LSL #3
        0x2001709a:    f8511c08    Q...    LDR      r1,[r1,#-8]
        0x2001709e:    eb0000c2    ....    ADD      r0,r0,r2,LSL #3
        0x200170a2:    f8500c04    P...    LDR      r0,[r0,#-4]
        0x200170a6:    4408        .D      ADD      r0,r0,r1
        0x200170a8:    6961        ai      LDR      r1,[r4,#0x14]
        0x200170aa:    4288        .B      CMP      r0,r1
        0x200170ac:    d901        ..      BLS      0x200170b2 ; advance_software_protect_flash_verify + 178
        0x200170ae:    2000        .       MOVS     r0,#0
        0x200170b0:    e7b0        ..      B        0x20017014 ; advance_software_protect_flash_verify + 20
        0x200170b2:    68a0        .h      LDR      r0,[r4,#8]
        0x200170b4:    b1d0        ..      CBZ      r0,0x200170ec ; advance_software_protect_flash_verify + 236
        0x200170b6:    68e5        .h      LDR      r5,[r4,#0xc]
        0x200170b8:    6921        !i      LDR      r1,[r4,#0x10]
        0x200170ba:    6828        (h      LDR      r0,[r5,#0]
        0x200170bc:    1a41        A.      SUBS     r1,r0,r1
        0x200170be:    6920         i      LDR      r0,[r4,#0x10]
        0x200170c0:    f000f82e    ....    BL       $Ven$TT$L$$crc32 ; 0x20017120
        0x200170c4:    2600        .&      MOVS     r6,#0
        0x200170c6:    e005        ..      B        0x200170d4 ; advance_software_protect_flash_verify + 212
        0x200170c8:    68aa        .h      LDR      r2,[r5,#8]
        0x200170ca:    1a52        R.      SUBS     r2,r2,r1
        0x200170cc:    f000f82d    ..-.    BL       $Ven$TT$L$$crc32_continue ; 0x2001712a
        0x200170d0:    3508        .5      ADDS     r5,r5,#8
        0x200170d2:    1c76        v.      ADDS     r6,r6,#1
        0x200170d4:    68a1        .h      LDR      r1,[r4,#8]
        0x200170d6:    1e49        I.      SUBS     r1,r1,#1
        0x200170d8:    42b1        .B      CMP      r1,r6
        0x200170da:    e9d51200    ....    LDRD     r1,r2,[r5,#0]
        0x200170de:    4411        .D      ADD      r1,r1,r2
        0x200170e0:    d8f2        ..      BHI      0x200170c8 ; advance_software_protect_flash_verify + 200
        0x200170e2:    6962        bi      LDR      r2,[r4,#0x14]
        0x200170e4:    1a52        R.      SUBS     r2,r2,r1
        0x200170e6:    f000f820    .. .    BL       $Ven$TT$L$$crc32_continue ; 0x2001712a
        0x200170ea:    e005        ..      B        0x200170f8 ; advance_software_protect_flash_verify + 248
        0x200170ec:    6960        `i      LDR      r0,[r4,#0x14]
        0x200170ee:    6921        !i      LDR      r1,[r4,#0x10]
        0x200170f0:    1a41        A.      SUBS     r1,r0,r1
        0x200170f2:    6920         i      LDR      r0,[r4,#0x10]
        0x200170f4:    f000f814    ....    BL       $Ven$TT$L$$crc32 ; 0x20017120
        0x200170f8:    69a1        .i      LDR      r1,[r4,#0x18]
        0x200170fa:    4281        .B      CMP      r1,r0
        0x200170fc:    d101        ..      BNE      0x20017102 ; advance_software_protect_flash_verify + 258
        0x200170fe:    2003        .       MOVS     r0,#3
        0x20017100:    e788        ..      B        0x20017014 ; advance_software_protect_flash_verify + 20
        0x20017102:    2002        .       MOVS     r0,#2
        0x20017104:    e786        ..      B        0x20017014 ; advance_software_protect_flash_verify + 20
    $d
        0x20017106:    0000        ..      DCW    0
        0x20017108:    200000f8    ...     DCD    536871160
    $t
    $Ven$TT$L$$advance_software_protect_flash_verify_init
        0x2001710c:    f6411c21    A.!.    MOV      r12,#0x1921
        0x20017110:    f6c00c00    ....    MOVT     r12,#0x800
        0x20017114:    4760        `G      BX       r12
    $Ven$TT$L$$advance_software_protect_flash_verify_check
        0x20017116:    f6410cc9    A...    MOV      r12,#0x18c9
        0x2001711a:    f6c00c00    ....    MOVT     r12,#0x800
        0x2001711e:    4760        `G      BX       r12
    $Ven$TT$L$$crc32
        0x20017120:    f6415c41    A.A\    MOV      r12,#0x1d41
        0x20017124:    f6c00c00    ....    MOVT     r12,#0x800
        0x20017128:    4760        `G      BX       r12
    $Ven$TT$L$$crc32_continue
        0x2001712a:    f6415c91    A..\    MOV      r12,#0x1d91
        0x2001712e:    f6c00c00    ....    MOVT     r12,#0x800
        0x20017132:    4760        `G      BX       r12
    $Ven$TT$L$$encrypt_g
        0x20017134:    f6440c35    D.5.    MOV      r12,#0x4835
        0x20017138:    f6c00c00    ....    MOVT     r12,#0x800
        0x2001713c:    4760        `G      BX       r12
    $Ven$TT$L$$encrypt_g_inv
        0x2001713e:    f6440c8b    D...    MOV      r12,#0x488b
        0x20017142:    f6c00c00    ....    MOVT     r12,#0x800
        0x20017146:    4760        `G      BX       r12
    $Ven$TT$L$$HAL_CRC_Calculate
        0x20017148:    f6402cb7    @..,    MOV      r12,#0xab7
        0x2001714c:    f6c00c00    ....    MOVT     r12,#0x800
        0x20017150:    4760        `G      BX       r12
    $Ven$TT$L$$HAL_CRC_Accumulate
        0x20017152:    f6402c91    @..,    MOV      r12,#0xa91
        0x20017156:    f6c00c00    ....    MOVT     r12,#0x800
        0x2001715a:    4760        `G      BX       r12
    $Ven$TT$L$$HAL_FLASHEx_OBGetConfig
        0x2001715c:    f6403c85    @..<    MOV      r12,#0xb85
        0x20017160:    f6c00c00    ....    MOVT     r12,#0x800
        0x20017164:    4760        `G      BX       r12
    $Ven$TT$L$$HAL_FLASH_Unlock
        0x20017166:    f6404cc5    @..L    MOV      r12,#0xcc5
        0x2001716a:    f6c00c00    ....    MOVT     r12,#0x800
        0x2001716e:    4760        `G      BX       r12
    $Ven$TT$L$$HAL_FLASH_OB_Unlock
        0x20017170:    f6404ca1    @..L    MOV      r12,#0xca1
        0x20017174:    f6c00c00    ....    MOVT     r12,#0x800
        0x20017178:    4760        `G      BX       r12
    $Ven$TT$L$$HAL_FLASHEx_OBProgram
        0x2001717a:    f6403ca9    @..<    MOV      r12,#0xba9
        0x2001717e:    f6c00c00    ....    MOVT     r12,#0x800
        0x20017182:    4760        `G      BX       r12
    $Ven$TT$L$$HAL_FLASH_OB_Lock
        0x20017184:    f6404c8d    @..L    MOV      r12,#0xc8d
        0x20017188:    f6c00c00    ....    MOVT     r12,#0x800
        0x2001718c:    4760        `G      BX       r12
    $Ven$TT$L$$HAL_FLASH_Lock
        0x2001718e:    f6404c71    @.qL    MOV      r12,#0xc71
        0x20017192:    f6c00c00    ....    MOVT     r12,#0x800
        0x20017196:    4760        `G      BX       r12
    $Ven$TT$L$$sissdk_ecdsa_verify
        0x20017198:    f2474ced    G..L    MOV      r12,#0x74ed
        0x2001719c:    f6c00c00    ....    MOVT     r12,#0x800
        0x200171a0:    4760        `G      BX       r12
        0x200171a2:    0000        ..      MOVS     r0,r0
        0x200171a4:    0000        ..      MOVS     r0,r0
        0x200171a6:    0000        ..      MOVS     r0,r0
        0x200171a8:    0000        ..      MOVS     r0,r0
        0x200171aa:    0000        ..      MOVS     r0,r0
        0x200171ac:    0000        ..      MOVS     r0,r0
        0x200171ae:    0000        ..      MOVS     r0,r0
        0x200171b0:    0000        ..      MOVS     r0,r0
        0x200171b2:    0000        ..      MOVS     r0,r0
        0x200171b4:    0000        ..      MOVS     r0,r0
        0x200171b6:    0000        ..      MOVS     r0,r0
        0x200171b8:    0000        ..      MOVS     r0,r0
        0x200171ba:    0000        ..      MOVS     r0,r0
        0x200171bc:    0000        ..      MOVS     r0,r0
        0x200171be:    0000        ..      MOVS     r0,r0
        0x200171c0:    0000        ..      MOVS     r0,r0
        0x200171c2:    0000        ..      MOVS     r0,r0
        0x200171c4:    0000        ..      MOVS     r0,r0
        0x200171c6:    0000        ..      MOVS     r0,r0
        0x200171c8:    0000        ..      MOVS     r0,r0
        0x200171ca:    0000        ..      MOVS     r0,r0
        0x200171cc:    0000        ..      MOVS     r0,r0
        0x200171ce:    0000        ..      MOVS     r0,r0
        0x200171d0:    0000        ..      MOVS     r0,r0
        0x200171d2:    0000        ..      MOVS     r0,r0
        0x200171d4:    0000        ..      MOVS     r0,r0
        0x200171d6:    0000        ..      MOVS     r0,r0
        0x200171d8:    0000        ..      MOVS     r0,r0
        0x200171da:    0000        ..      MOVS     r0,r0
        0x200171dc:    0000        ..      MOVS     r0,r0
        0x200171de:    0000        ..      MOVS     r0,r0
        0x200171e0:    0000        ..      MOVS     r0,r0
        0x200171e2:    0000        ..      MOVS     r0,r0
        0x200171e4:    0000        ..      MOVS     r0,r0
        0x200171e6:    0000        ..      MOVS     r0,r0
        0x200171e8:    0000        ..      MOVS     r0,r0
        0x200171ea:    0000        ..      MOVS     r0,r0
        0x200171ec:    0000        ..      MOVS     r0,r0
        0x200171ee:    0000        ..      MOVS     r0,r0
        0x200171f0:    0000        ..      MOVS     r0,r0
        0x200171f2:    0000        ..      MOVS     r0,r0
        0x200171f4:    0000        ..      MOVS     r0,r0
        0x200171f6:    0000        ..      MOVS     r0,r0
        0x200171f8:    0000        ..      MOVS     r0,r0
        0x200171fa:    0000        ..      MOVS     r0,r0
        0x200171fc:    0000        ..      MOVS     r0,r0
        0x200171fe:    0000        ..      MOVS     r0,r0
    .ARM.__at_0x20017200
    advance_software_protect_anti_debugger
        0x20017200:    b570        p.      PUSH     {r4-r6,lr}
        0x20017202:    4b14        .K      LDR      r3,[pc,#80] ; [0x20017254] = 0x20000040
        0x20017204:    4604        .F      MOV      r4,r0
        0x20017206:    691a        .i      LDR      r2,[r3,#0x10]
        0x20017208:    695d        ]i      LDR      r5,[r3,#0x14]
        0x2001720a:    6818        .h      LDR      r0,[r3,#0]
        0x2001720c:    6859        Yh      LDR      r1,[r3,#4]
        0x2001720e:    689e        .h      LDR      r6,[r3,#8]
        0x20017210:    68db        .h      LDR      r3,[r3,#0xc]
        0x20017212:    4070        p@      EORS     r0,r0,r6
        0x20017214:    4059        Y@      EORS     r1,r1,r3
        0x20017216:    4042        B@      EORS     r2,r2,r0
        0x20017218:    404d        M@      EORS     r5,r5,r1
        0x2001721a:    432a        *C      ORRS     r2,r2,r5
        0x2001721c:    d00a        ..      BEQ      0x20017234 ; advance_software_protect_anti_debugger + 52
        0x2001721e:    f000fb6f    ..o.    BL       advance_software_protect_rdp_check ; 0x20017900
        0x20017222:    b160        `.      CBZ      r0,0x2001723e ; advance_software_protect_anti_debugger + 62
        0x20017224:    2002        .       MOVS     r0,#2
        0x20017226:    47a0        .G      BLX      r4
        0x20017228:    2004        .       MOVS     r0,#4
        0x2001722a:    47a0        .G      BLX      r4
        0x2001722c:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x20017230:    f000bae6    ....    B.W      advance_software_protect_debugger_disable ; 0x20017800
        0x20017234:    46a4        .F      MOV      r12,r4
        0x20017236:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x2001723a:    2000        .       MOVS     r0,#0
        0x2001723c:    4760        `G      BX       r12
        0x2001723e:    2001        .       MOVS     r0,#1
        0x20017240:    47a0        .G      BLX      r4
        0x20017242:    f000fbdd    ....    BL       advance_software_protect_rdp_enable ; 0x20017a00
        0x20017246:    2002        .       MOVS     r0,#2
        0x20017248:    47a0        .G      BLX      r4
        0x2001724a:    2003        .       MOVS     r0,#3
        0x2001724c:    47a0        .G      BLX      r4
        0x2001724e:    f000fa57    ..W.    BL       advance_software_protect_system_reset ; 0x20017700
        0x20017252:    e7e9        ..      B        0x20017228 ; advance_software_protect_anti_debugger + 40
    $d
        0x20017254:    20000040    @..     DCD    536870976
        0x20017258:    00000000    ....    DCD    0
        0x2001725c:    00000000    ....    DCD    0
        0x20017260:    00000000    ....    DCD    0
        0x20017264:    00000000    ....    DCD    0
        0x20017268:    00000000    ....    DCD    0
        0x2001726c:    00000000    ....    DCD    0
        0x20017270:    00000000    ....    DCD    0
        0x20017274:    00000000    ....    DCD    0
        0x20017278:    00000000    ....    DCD    0
        0x2001727c:    00000000    ....    DCD    0
        0x20017280:    00000000    ....    DCD    0
        0x20017284:    00000000    ....    DCD    0
        0x20017288:    00000000    ....    DCD    0
        0x2001728c:    00000000    ....    DCD    0
        0x20017290:    00000000    ....    DCD    0
        0x20017294:    00000000    ....    DCD    0
        0x20017298:    00000000    ....    DCD    0
        0x2001729c:    00000000    ....    DCD    0
        0x200172a0:    00000000    ....    DCD    0
        0x200172a4:    00000000    ....    DCD    0
        0x200172a8:    00000000    ....    DCD    0
        0x200172ac:    00000000    ....    DCD    0
        0x200172b0:    00000000    ....    DCD    0
        0x200172b4:    00000000    ....    DCD    0
        0x200172b8:    00000000    ....    DCD    0
        0x200172bc:    00000000    ....    DCD    0
        0x200172c0:    00000000    ....    DCD    0
        0x200172c4:    00000000    ....    DCD    0
        0x200172c8:    00000000    ....    DCD    0
        0x200172cc:    00000000    ....    DCD    0
        0x200172d0:    00000000    ....    DCD    0
        0x200172d4:    00000000    ....    DCD    0
        0x200172d8:    00000000    ....    DCD    0
        0x200172dc:    00000000    ....    DCD    0
        0x200172e0:    00000000    ....    DCD    0
        0x200172e4:    00000000    ....    DCD    0
        0x200172e8:    00000000    ....    DCD    0
        0x200172ec:    00000000    ....    DCD    0
        0x200172f0:    00000000    ....    DCD    0
        0x200172f4:    00000000    ....    DCD    0
        0x200172f8:    00000000    ....    DCD    0
        0x200172fc:    00000000    ....    DCD    0
    $t
    .ARM.__at_0x20017300
    advance_software_protect_encrypt_process
        0x20017300:    e92d5fff    -.._    PUSH     {r0-r12,lr}
        0x20017304:    468a        .F      MOV      r10,r1
        0x20017306:    f04f0900    O...    MOV      r9,#0
        0x2001730a:    e03e        >.      B        0x2001738a ; advance_software_protect_encrypt_process + 138
        0x2001730c:    9800        ..      LDR      r0,[sp,#0]
        0x2001730e:    4448        HD      ADD      r0,r0,r9
        0x20017310:    4683        .F      MOV      r11,r0
        0x20017312:    6804        .h      LDR      r4,[r0,#0]
        0x20017314:    6845        Eh      LDR      r5,[r0,#4]
        0x20017316:    980e        ..      LDR      r0,[sp,#0x38]
        0x20017318:    b1b0        ..      CBZ      r0,0x20017348 ; advance_software_protect_encrypt_process + 72
        0x2001731a:    2600        .&      MOVS     r6,#0
        0x2001731c:    4627        'F      MOV      r7,r4
        0x2001731e:    0c20         .      LSRS     r0,r4,#16
        0x20017320:    f360040f    `...    BFI      r4,r0,#0,#16
        0x20017324:    aa02        ..      ADD      r2,sp,#8
        0x20017326:    f365441f    e..D    BFI      r4,r5,#16,#16
        0x2001732a:    0c28        (.      LSRS     r0,r5,#16
        0x2001732c:    4631        1F      MOV      r1,r6
        0x2001732e:    f7ffff01    ....    BL       $Ven$TT$L$$encrypt_g ; 0x20017134
        0x20017332:    1c76        v.      ADDS     r6,r6,#1
        0x20017334:    4077        w@      EORS     r7,r7,r6
        0x20017336:    f360050f    `...    BFI      r5,r0,#0,#16
        0x2001733a:    4078        x@      EORS     r0,r0,r7
        0x2001733c:    b2f6        ..      UXTB     r6,r6
        0x2001733e:    f360451f    `..E    BFI      r5,r0,#16,#16
        0x20017342:    2e20         .      CMP      r6,#0x20
        0x20017344:    d3ea        ..      BCC      0x2001731c ; advance_software_protect_encrypt_process + 28
        0x20017346:    e018        ..      B        0x2001737a ; advance_software_protect_encrypt_process + 122
        0x20017348:    261f        .&      MOVS     r6,#0x1f
        0x2001734a:    b2f7        ..      UXTB     r7,r6
        0x2001734c:    b2a8        ..      UXTH     r0,r5
        0x2001734e:    aa02        ..      ADD      r2,sp,#8
        0x20017350:    ea804815    ...H    EOR      r8,r0,r5,LSR #16
        0x20017354:    4639        9F      MOV      r1,r7
        0x20017356:    f7fffef2    ....    BL       $Ven$TT$L$$encrypt_g_inv ; 0x2001713e
        0x2001735a:    f360451f    `..E    BFI      r5,r0,#16,#16
        0x2001735e:    0c20         .      LSRS     r0,r4,#16
        0x20017360:    1c7f        ..      ADDS     r7,r7,#1
        0x20017362:    1e76        v.      SUBS     r6,r6,#1
        0x20017364:    f364441f    d..D    BFI      r4,r4,#16,#16
        0x20017368:    ea880107    ....    EOR      r1,r8,r7
        0x2001736c:    b276        v.      SXTB     r6,r6
        0x2001736e:    f360050f    `...    BFI      r5,r0,#0,#16
        0x20017372:    f361040f    a...    BFI      r4,r1,#0,#16
        0x20017376:    2e00        ..      CMP      r6,#0
        0x20017378:    dae7        ..      BGE      0x2001734a ; advance_software_protect_encrypt_process + 74
        0x2001737a:    f8cb4000    ...@    STR      r4,[r11,#0]
        0x2001737e:    f8cb5004    ...P    STR      r5,[r11,#4]
        0x20017382:    f1090908    ....    ADD      r9,r9,#8
        0x20017386:    f1aa0a08    ....    SUB      r10,r10,#8
        0x2001738a:    f1ba0f08    ....    CMP      r10,#8
        0x2001738e:    d2bd        ..      BCS      0x2001730c ; advance_software_protect_encrypt_process + 12
        0x20017390:    e8bd9fff    ....    POP      {r0-r12,pc}
        0x20017394:    0000        ..      MOVS     r0,r0
        0x20017396:    0000        ..      MOVS     r0,r0
        0x20017398:    0000        ..      MOVS     r0,r0
        0x2001739a:    0000        ..      MOVS     r0,r0
        0x2001739c:    0000        ..      MOVS     r0,r0
        0x2001739e:    0000        ..      MOVS     r0,r0
        0x200173a0:    0000        ..      MOVS     r0,r0
        0x200173a2:    0000        ..      MOVS     r0,r0
        0x200173a4:    0000        ..      MOVS     r0,r0
        0x200173a6:    0000        ..      MOVS     r0,r0
        0x200173a8:    0000        ..      MOVS     r0,r0
        0x200173aa:    0000        ..      MOVS     r0,r0
        0x200173ac:    0000        ..      MOVS     r0,r0
        0x200173ae:    0000        ..      MOVS     r0,r0
        0x200173b0:    0000        ..      MOVS     r0,r0
        0x200173b2:    0000        ..      MOVS     r0,r0
        0x200173b4:    0000        ..      MOVS     r0,r0
        0x200173b6:    0000        ..      MOVS     r0,r0
        0x200173b8:    0000        ..      MOVS     r0,r0
        0x200173ba:    0000        ..      MOVS     r0,r0
        0x200173bc:    0000        ..      MOVS     r0,r0
        0x200173be:    0000        ..      MOVS     r0,r0
        0x200173c0:    0000        ..      MOVS     r0,r0
        0x200173c2:    0000        ..      MOVS     r0,r0
        0x200173c4:    0000        ..      MOVS     r0,r0
        0x200173c6:    0000        ..      MOVS     r0,r0
        0x200173c8:    0000        ..      MOVS     r0,r0
        0x200173ca:    0000        ..      MOVS     r0,r0
        0x200173cc:    0000        ..      MOVS     r0,r0
        0x200173ce:    0000        ..      MOVS     r0,r0
        0x200173d0:    0000        ..      MOVS     r0,r0
        0x200173d2:    0000        ..      MOVS     r0,r0
        0x200173d4:    0000        ..      MOVS     r0,r0
        0x200173d6:    0000        ..      MOVS     r0,r0
        0x200173d8:    0000        ..      MOVS     r0,r0
        0x200173da:    0000        ..      MOVS     r0,r0
        0x200173dc:    0000        ..      MOVS     r0,r0
        0x200173de:    0000        ..      MOVS     r0,r0
        0x200173e0:    0000        ..      MOVS     r0,r0
        0x200173e2:    0000        ..      MOVS     r0,r0
        0x200173e4:    0000        ..      MOVS     r0,r0
        0x200173e6:    0000        ..      MOVS     r0,r0
        0x200173e8:    0000        ..      MOVS     r0,r0
        0x200173ea:    0000        ..      MOVS     r0,r0
        0x200173ec:    0000        ..      MOVS     r0,r0
        0x200173ee:    0000        ..      MOVS     r0,r0
        0x200173f0:    0000        ..      MOVS     r0,r0
        0x200173f2:    0000        ..      MOVS     r0,r0
        0x200173f4:    0000        ..      MOVS     r0,r0
        0x200173f6:    0000        ..      MOVS     r0,r0
        0x200173f8:    0000        ..      MOVS     r0,r0
        0x200173fa:    0000        ..      MOVS     r0,r0
        0x200173fc:    0000        ..      MOVS     r0,r0
        0x200173fe:    0000        ..      MOVS     r0,r0
        0x20017400:    0000        ..      MOVS     r0,r0
        0x20017402:    0000        ..      MOVS     r0,r0
        0x20017404:    0000        ..      MOVS     r0,r0
        0x20017406:    0000        ..      MOVS     r0,r0
        0x20017408:    0000        ..      MOVS     r0,r0
        0x2001740a:    0000        ..      MOVS     r0,r0
        0x2001740c:    0000        ..      MOVS     r0,r0
        0x2001740e:    0000        ..      MOVS     r0,r0
        0x20017410:    0000        ..      MOVS     r0,r0
        0x20017412:    0000        ..      MOVS     r0,r0
        0x20017414:    0000        ..      MOVS     r0,r0
        0x20017416:    0000        ..      MOVS     r0,r0
        0x20017418:    0000        ..      MOVS     r0,r0
        0x2001741a:    0000        ..      MOVS     r0,r0
        0x2001741c:    0000        ..      MOVS     r0,r0
        0x2001741e:    0000        ..      MOVS     r0,r0
        0x20017420:    0000        ..      MOVS     r0,r0
        0x20017422:    0000        ..      MOVS     r0,r0
        0x20017424:    0000        ..      MOVS     r0,r0
        0x20017426:    0000        ..      MOVS     r0,r0
        0x20017428:    0000        ..      MOVS     r0,r0
        0x2001742a:    0000        ..      MOVS     r0,r0
        0x2001742c:    0000        ..      MOVS     r0,r0
        0x2001742e:    0000        ..      MOVS     r0,r0
        0x20017430:    0000        ..      MOVS     r0,r0
        0x20017432:    0000        ..      MOVS     r0,r0
        0x20017434:    0000        ..      MOVS     r0,r0
        0x20017436:    0000        ..      MOVS     r0,r0
        0x20017438:    0000        ..      MOVS     r0,r0
        0x2001743a:    0000        ..      MOVS     r0,r0
        0x2001743c:    0000        ..      MOVS     r0,r0
        0x2001743e:    0000        ..      MOVS     r0,r0
        0x20017440:    0000        ..      MOVS     r0,r0
        0x20017442:    0000        ..      MOVS     r0,r0
        0x20017444:    0000        ..      MOVS     r0,r0
        0x20017446:    0000        ..      MOVS     r0,r0
        0x20017448:    0000        ..      MOVS     r0,r0
        0x2001744a:    0000        ..      MOVS     r0,r0
        0x2001744c:    0000        ..      MOVS     r0,r0
        0x2001744e:    0000        ..      MOVS     r0,r0
        0x20017450:    0000        ..      MOVS     r0,r0
        0x20017452:    0000        ..      MOVS     r0,r0
        0x20017454:    0000        ..      MOVS     r0,r0
        0x20017456:    0000        ..      MOVS     r0,r0
        0x20017458:    0000        ..      MOVS     r0,r0
        0x2001745a:    0000        ..      MOVS     r0,r0
        0x2001745c:    0000        ..      MOVS     r0,r0
        0x2001745e:    0000        ..      MOVS     r0,r0
        0x20017460:    0000        ..      MOVS     r0,r0
        0x20017462:    0000        ..      MOVS     r0,r0
        0x20017464:    0000        ..      MOVS     r0,r0
        0x20017466:    0000        ..      MOVS     r0,r0
        0x20017468:    0000        ..      MOVS     r0,r0
        0x2001746a:    0000        ..      MOVS     r0,r0
        0x2001746c:    0000        ..      MOVS     r0,r0
        0x2001746e:    0000        ..      MOVS     r0,r0
        0x20017470:    0000        ..      MOVS     r0,r0
        0x20017472:    0000        ..      MOVS     r0,r0
        0x20017474:    0000        ..      MOVS     r0,r0
        0x20017476:    0000        ..      MOVS     r0,r0
        0x20017478:    0000        ..      MOVS     r0,r0
        0x2001747a:    0000        ..      MOVS     r0,r0
        0x2001747c:    0000        ..      MOVS     r0,r0
        0x2001747e:    0000        ..      MOVS     r0,r0
        0x20017480:    0000        ..      MOVS     r0,r0
        0x20017482:    0000        ..      MOVS     r0,r0
        0x20017484:    0000        ..      MOVS     r0,r0
        0x20017486:    0000        ..      MOVS     r0,r0
        0x20017488:    0000        ..      MOVS     r0,r0
        0x2001748a:    0000        ..      MOVS     r0,r0
        0x2001748c:    0000        ..      MOVS     r0,r0
        0x2001748e:    0000        ..      MOVS     r0,r0
        0x20017490:    0000        ..      MOVS     r0,r0
        0x20017492:    0000        ..      MOVS     r0,r0
        0x20017494:    0000        ..      MOVS     r0,r0
        0x20017496:    0000        ..      MOVS     r0,r0
        0x20017498:    0000        ..      MOVS     r0,r0
        0x2001749a:    0000        ..      MOVS     r0,r0
        0x2001749c:    0000        ..      MOVS     r0,r0
        0x2001749e:    0000        ..      MOVS     r0,r0
        0x200174a0:    0000        ..      MOVS     r0,r0
        0x200174a2:    0000        ..      MOVS     r0,r0
        0x200174a4:    0000        ..      MOVS     r0,r0
        0x200174a6:    0000        ..      MOVS     r0,r0
        0x200174a8:    0000        ..      MOVS     r0,r0
        0x200174aa:    0000        ..      MOVS     r0,r0
        0x200174ac:    0000        ..      MOVS     r0,r0
        0x200174ae:    0000        ..      MOVS     r0,r0
        0x200174b0:    0000        ..      MOVS     r0,r0
        0x200174b2:    0000        ..      MOVS     r0,r0
        0x200174b4:    0000        ..      MOVS     r0,r0
        0x200174b6:    0000        ..      MOVS     r0,r0
        0x200174b8:    0000        ..      MOVS     r0,r0
        0x200174ba:    0000        ..      MOVS     r0,r0
        0x200174bc:    0000        ..      MOVS     r0,r0
        0x200174be:    0000        ..      MOVS     r0,r0
        0x200174c0:    0000        ..      MOVS     r0,r0
        0x200174c2:    0000        ..      MOVS     r0,r0
        0x200174c4:    0000        ..      MOVS     r0,r0
        0x200174c6:    0000        ..      MOVS     r0,r0
        0x200174c8:    0000        ..      MOVS     r0,r0
        0x200174ca:    0000        ..      MOVS     r0,r0
        0x200174cc:    0000        ..      MOVS     r0,r0
        0x200174ce:    0000        ..      MOVS     r0,r0
        0x200174d0:    0000        ..      MOVS     r0,r0
        0x200174d2:    0000        ..      MOVS     r0,r0
        0x200174d4:    0000        ..      MOVS     r0,r0
        0x200174d6:    0000        ..      MOVS     r0,r0
        0x200174d8:    0000        ..      MOVS     r0,r0
        0x200174da:    0000        ..      MOVS     r0,r0
        0x200174dc:    0000        ..      MOVS     r0,r0
        0x200174de:    0000        ..      MOVS     r0,r0
        0x200174e0:    0000        ..      MOVS     r0,r0
        0x200174e2:    0000        ..      MOVS     r0,r0
        0x200174e4:    0000        ..      MOVS     r0,r0
        0x200174e6:    0000        ..      MOVS     r0,r0
        0x200174e8:    0000        ..      MOVS     r0,r0
        0x200174ea:    0000        ..      MOVS     r0,r0
        0x200174ec:    0000        ..      MOVS     r0,r0
        0x200174ee:    0000        ..      MOVS     r0,r0
        0x200174f0:    0000        ..      MOVS     r0,r0
        0x200174f2:    0000        ..      MOVS     r0,r0
        0x200174f4:    0000        ..      MOVS     r0,r0
        0x200174f6:    0000        ..      MOVS     r0,r0
        0x200174f8:    0000        ..      MOVS     r0,r0
        0x200174fa:    0000        ..      MOVS     r0,r0
        0x200174fc:    0000        ..      MOVS     r0,r0
        0x200174fe:    0000        ..      MOVS     r0,r0
    .ARM.__at_0x20017500
    advance_software_protect_crc32
        0x20017500:    b5f8        ..      PUSH     {r3-r7,lr}
        0x20017502:    460d        .F      MOV      r5,r1
        0x20017504:    f0010403    ....    AND      r4,r1,#3
        0x20017508:    088a        ..      LSRS     r2,r1,#2
        0x2001750a:    4606        .F      MOV      r6,r0
        0x2001750c:    4601        .F      MOV      r1,r0
        0x2001750e:    480a        .H      LDR      r0,[pc,#40] ; [0x20017538] = 0x20000004
        0x20017510:    f7fffe1a    ....    BL       $Ven$TT$L$$HAL_CRC_Calculate ; 0x20017148
        0x20017514:    2c00        .,      CMP      r4,#0
        0x20017516:    d00d        ..      BEQ      0x20017534 ; advance_software_protect_crc32 + 52
        0x20017518:    1970        p.      ADDS     r0,r6,r5
        0x2001751a:    1b00        ..      SUBS     r0,r0,r4
        0x2001751c:    00e2        ..      LSLS     r2,r4,#3
        0x2001751e:    f04f31ff    O..1    MOV      r1,#0xffffffff
        0x20017522:    6800        .h      LDR      r0,[r0,#0]
        0x20017524:    4091        .@      LSLS     r1,r1,r2
        0x20017526:    4388        .C      BICS     r0,r0,r1
        0x20017528:    9000        ..      STR      r0,[sp,#0]
        0x2001752a:    2201        ."      MOVS     r2,#1
        0x2001752c:    4669        iF      MOV      r1,sp
        0x2001752e:    4802        .H      LDR      r0,[pc,#8] ; [0x20017538] = 0x20000004
        0x20017530:    f7fffe0f    ....    BL       $Ven$TT$L$$HAL_CRC_Accumulate ; 0x20017152
        0x20017534:    bdf8        ..      POP      {r3-r7,pc}
    $d
        0x20017536:    0000        ..      DCW    0
        0x20017538:    20000004    ...     DCD    536870916
        0x2001753c:    00000000    ....    DCD    0
        0x20017540:    00000000    ....    DCD    0
        0x20017544:    00000000    ....    DCD    0
        0x20017548:    00000000    ....    DCD    0
        0x2001754c:    00000000    ....    DCD    0
        0x20017550:    00000000    ....    DCD    0
        0x20017554:    00000000    ....    DCD    0
        0x20017558:    00000000    ....    DCD    0
        0x2001755c:    00000000    ....    DCD    0
        0x20017560:    00000000    ....    DCD    0
        0x20017564:    00000000    ....    DCD    0
        0x20017568:    00000000    ....    DCD    0
        0x2001756c:    00000000    ....    DCD    0
        0x20017570:    00000000    ....    DCD    0
        0x20017574:    00000000    ....    DCD    0
        0x20017578:    00000000    ....    DCD    0
        0x2001757c:    00000000    ....    DCD    0
        0x20017580:    00000000    ....    DCD    0
        0x20017584:    00000000    ....    DCD    0
        0x20017588:    00000000    ....    DCD    0
        0x2001758c:    00000000    ....    DCD    0
        0x20017590:    00000000    ....    DCD    0
        0x20017594:    00000000    ....    DCD    0
        0x20017598:    00000000    ....    DCD    0
        0x2001759c:    00000000    ....    DCD    0
        0x200175a0:    00000000    ....    DCD    0
        0x200175a4:    00000000    ....    DCD    0
        0x200175a8:    00000000    ....    DCD    0
        0x200175ac:    00000000    ....    DCD    0
        0x200175b0:    00000000    ....    DCD    0
        0x200175b4:    00000000    ....    DCD    0
        0x200175b8:    00000000    ....    DCD    0
        0x200175bc:    00000000    ....    DCD    0
        0x200175c0:    00000000    ....    DCD    0
        0x200175c4:    00000000    ....    DCD    0
        0x200175c8:    00000000    ....    DCD    0
        0x200175cc:    00000000    ....    DCD    0
        0x200175d0:    00000000    ....    DCD    0
        0x200175d4:    00000000    ....    DCD    0
        0x200175d8:    00000000    ....    DCD    0
        0x200175dc:    00000000    ....    DCD    0
        0x200175e0:    00000000    ....    DCD    0
        0x200175e4:    00000000    ....    DCD    0
        0x200175e8:    00000000    ....    DCD    0
        0x200175ec:    00000000    ....    DCD    0
        0x200175f0:    00000000    ....    DCD    0
        0x200175f4:    00000000    ....    DCD    0
        0x200175f8:    00000000    ....    DCD    0
        0x200175fc:    00000000    ....    DCD    0
    $t
    .ARM.__at_0x20017600
    advance_software_protect_get_cid
        0x20017600:    b510        ..      PUSH     {r4,lr}
        0x20017602:    2300        .#      MOVS     r3,#0
        0x20017604:    e004        ..      B        0x20017610 ; advance_software_protect_get_cid + 16
        0x20017606:    bf00        ..      NOP      
        0x20017608:    f8104b01    ...K    LDRB     r4,[r0],#1
        0x2001760c:    54d4        .T      STRB     r4,[r2,r3]
        0x2001760e:    1c5b        [.      ADDS     r3,r3,#1
        0x20017610:    428b        .B      CMP      r3,r1
        0x20017612:    dbf9        ..      BLT      0x20017608 ; advance_software_protect_get_cid + 8
        0x20017614:    bd10        ..      POP      {r4,pc}
        0x20017616:    0000        ..      MOVS     r0,r0
        0x20017618:    0000        ..      MOVS     r0,r0
        0x2001761a:    0000        ..      MOVS     r0,r0
        0x2001761c:    0000        ..      MOVS     r0,r0
        0x2001761e:    0000        ..      MOVS     r0,r0
        0x20017620:    0000        ..      MOVS     r0,r0
        0x20017622:    0000        ..      MOVS     r0,r0
        0x20017624:    0000        ..      MOVS     r0,r0
        0x20017626:    0000        ..      MOVS     r0,r0
        0x20017628:    0000        ..      MOVS     r0,r0
        0x2001762a:    0000        ..      MOVS     r0,r0
        0x2001762c:    0000        ..      MOVS     r0,r0
        0x2001762e:    0000        ..      MOVS     r0,r0
        0x20017630:    0000        ..      MOVS     r0,r0
        0x20017632:    0000        ..      MOVS     r0,r0
        0x20017634:    0000        ..      MOVS     r0,r0
        0x20017636:    0000        ..      MOVS     r0,r0
        0x20017638:    0000        ..      MOVS     r0,r0
        0x2001763a:    0000        ..      MOVS     r0,r0
        0x2001763c:    0000        ..      MOVS     r0,r0
        0x2001763e:    0000        ..      MOVS     r0,r0
        0x20017640:    0000        ..      MOVS     r0,r0
        0x20017642:    0000        ..      MOVS     r0,r0
        0x20017644:    0000        ..      MOVS     r0,r0
        0x20017646:    0000        ..      MOVS     r0,r0
        0x20017648:    0000        ..      MOVS     r0,r0
        0x2001764a:    0000        ..      MOVS     r0,r0
        0x2001764c:    0000        ..      MOVS     r0,r0
        0x2001764e:    0000        ..      MOVS     r0,r0
        0x20017650:    0000        ..      MOVS     r0,r0
        0x20017652:    0000        ..      MOVS     r0,r0
        0x20017654:    0000        ..      MOVS     r0,r0
        0x20017656:    0000        ..      MOVS     r0,r0
        0x20017658:    0000        ..      MOVS     r0,r0
        0x2001765a:    0000        ..      MOVS     r0,r0
        0x2001765c:    0000        ..      MOVS     r0,r0
        0x2001765e:    0000        ..      MOVS     r0,r0
        0x20017660:    0000        ..      MOVS     r0,r0
        0x20017662:    0000        ..      MOVS     r0,r0
        0x20017664:    0000        ..      MOVS     r0,r0
        0x20017666:    0000        ..      MOVS     r0,r0
        0x20017668:    0000        ..      MOVS     r0,r0
        0x2001766a:    0000        ..      MOVS     r0,r0
        0x2001766c:    0000        ..      MOVS     r0,r0
        0x2001766e:    0000        ..      MOVS     r0,r0
        0x20017670:    0000        ..      MOVS     r0,r0
        0x20017672:    0000        ..      MOVS     r0,r0
        0x20017674:    0000        ..      MOVS     r0,r0
        0x20017676:    0000        ..      MOVS     r0,r0
        0x20017678:    0000        ..      MOVS     r0,r0
        0x2001767a:    0000        ..      MOVS     r0,r0
        0x2001767c:    0000        ..      MOVS     r0,r0
        0x2001767e:    0000        ..      MOVS     r0,r0
        0x20017680:    0000        ..      MOVS     r0,r0
        0x20017682:    0000        ..      MOVS     r0,r0
        0x20017684:    0000        ..      MOVS     r0,r0
        0x20017686:    0000        ..      MOVS     r0,r0
        0x20017688:    0000        ..      MOVS     r0,r0
        0x2001768a:    0000        ..      MOVS     r0,r0
        0x2001768c:    0000        ..      MOVS     r0,r0
        0x2001768e:    0000        ..      MOVS     r0,r0
        0x20017690:    0000        ..      MOVS     r0,r0
        0x20017692:    0000        ..      MOVS     r0,r0
        0x20017694:    0000        ..      MOVS     r0,r0
        0x20017696:    0000        ..      MOVS     r0,r0
        0x20017698:    0000        ..      MOVS     r0,r0
        0x2001769a:    0000        ..      MOVS     r0,r0
        0x2001769c:    0000        ..      MOVS     r0,r0
        0x2001769e:    0000        ..      MOVS     r0,r0
        0x200176a0:    0000        ..      MOVS     r0,r0
        0x200176a2:    0000        ..      MOVS     r0,r0
        0x200176a4:    0000        ..      MOVS     r0,r0
        0x200176a6:    0000        ..      MOVS     r0,r0
        0x200176a8:    0000        ..      MOVS     r0,r0
        0x200176aa:    0000        ..      MOVS     r0,r0
        0x200176ac:    0000        ..      MOVS     r0,r0
        0x200176ae:    0000        ..      MOVS     r0,r0
        0x200176b0:    0000        ..      MOVS     r0,r0
        0x200176b2:    0000        ..      MOVS     r0,r0
        0x200176b4:    0000        ..      MOVS     r0,r0
        0x200176b6:    0000        ..      MOVS     r0,r0
        0x200176b8:    0000        ..      MOVS     r0,r0
        0x200176ba:    0000        ..      MOVS     r0,r0
        0x200176bc:    0000        ..      MOVS     r0,r0
        0x200176be:    0000        ..      MOVS     r0,r0
        0x200176c0:    0000        ..      MOVS     r0,r0
        0x200176c2:    0000        ..      MOVS     r0,r0
        0x200176c4:    0000        ..      MOVS     r0,r0
        0x200176c6:    0000        ..      MOVS     r0,r0
        0x200176c8:    0000        ..      MOVS     r0,r0
        0x200176ca:    0000        ..      MOVS     r0,r0
        0x200176cc:    0000        ..      MOVS     r0,r0
        0x200176ce:    0000        ..      MOVS     r0,r0
        0x200176d0:    0000        ..      MOVS     r0,r0
        0x200176d2:    0000        ..      MOVS     r0,r0
        0x200176d4:    0000        ..      MOVS     r0,r0
        0x200176d6:    0000        ..      MOVS     r0,r0
        0x200176d8:    0000        ..      MOVS     r0,r0
        0x200176da:    0000        ..      MOVS     r0,r0
        0x200176dc:    0000        ..      MOVS     r0,r0
        0x200176de:    0000        ..      MOVS     r0,r0
        0x200176e0:    0000        ..      MOVS     r0,r0
        0x200176e2:    0000        ..      MOVS     r0,r0
        0x200176e4:    0000        ..      MOVS     r0,r0
        0x200176e6:    0000        ..      MOVS     r0,r0
        0x200176e8:    0000        ..      MOVS     r0,r0
        0x200176ea:    0000        ..      MOVS     r0,r0
        0x200176ec:    0000        ..      MOVS     r0,r0
        0x200176ee:    0000        ..      MOVS     r0,r0
        0x200176f0:    0000        ..      MOVS     r0,r0
        0x200176f2:    0000        ..      MOVS     r0,r0
        0x200176f4:    0000        ..      MOVS     r0,r0
        0x200176f6:    0000        ..      MOVS     r0,r0
        0x200176f8:    0000        ..      MOVS     r0,r0
        0x200176fa:    0000        ..      MOVS     r0,r0
        0x200176fc:    0000        ..      MOVS     r0,r0
        0x200176fe:    0000        ..      MOVS     r0,r0
    .ARM.__at_0x20017700
    advance_software_protect_system_reset
        0x20017700:    f3bf8f4f    ..O.    DSB      
        0x20017704:    4805        .H      LDR      r0,[pc,#20] ; [0x2001771c] = 0xe000ed0c
        0x20017706:    6801        .h      LDR      r1,[r0,#0]
        0x20017708:    4a05        .J      LDR      r2,[pc,#20] ; [0x20017720] = 0x5fa0004
        0x2001770a:    f40161e0    ...a    AND      r1,r1,#0x700
        0x2001770e:    4311        .C      ORRS     r1,r1,r2
        0x20017710:    6001        .`      STR      r1,[r0,#0]
        0x20017712:    f3bf8f4f    ..O.    DSB      
        0x20017716:    bf00        ..      NOP      
        0x20017718:    e7fd        ..      B        0x20017716 ; advance_software_protect_system_reset + 22
    $d
        0x2001771a:    0000        ..      DCW    0
        0x2001771c:    e000ed0c    ....    DCD    3758157068
        0x20017720:    05fa0004    ....    DCD    100270084
        0x20017724:    00000000    ....    DCD    0
        0x20017728:    00000000    ....    DCD    0
        0x2001772c:    00000000    ....    DCD    0
        0x20017730:    00000000    ....    DCD    0
        0x20017734:    00000000    ....    DCD    0
        0x20017738:    00000000    ....    DCD    0
        0x2001773c:    00000000    ....    DCD    0
        0x20017740:    00000000    ....    DCD    0
        0x20017744:    00000000    ....    DCD    0
        0x20017748:    00000000    ....    DCD    0
        0x2001774c:    00000000    ....    DCD    0
        0x20017750:    00000000    ....    DCD    0
        0x20017754:    00000000    ....    DCD    0
        0x20017758:    00000000    ....    DCD    0
        0x2001775c:    00000000    ....    DCD    0
        0x20017760:    00000000    ....    DCD    0
        0x20017764:    00000000    ....    DCD    0
        0x20017768:    00000000    ....    DCD    0
        0x2001776c:    00000000    ....    DCD    0
        0x20017770:    00000000    ....    DCD    0
        0x20017774:    00000000    ....    DCD    0
        0x20017778:    00000000    ....    DCD    0
        0x2001777c:    00000000    ....    DCD    0
        0x20017780:    00000000    ....    DCD    0
        0x20017784:    00000000    ....    DCD    0
        0x20017788:    00000000    ....    DCD    0
        0x2001778c:    00000000    ....    DCD    0
        0x20017790:    00000000    ....    DCD    0
        0x20017794:    00000000    ....    DCD    0
        0x20017798:    00000000    ....    DCD    0
        0x2001779c:    00000000    ....    DCD    0
        0x200177a0:    00000000    ....    DCD    0
        0x200177a4:    00000000    ....    DCD    0
        0x200177a8:    00000000    ....    DCD    0
        0x200177ac:    00000000    ....    DCD    0
        0x200177b0:    00000000    ....    DCD    0
        0x200177b4:    00000000    ....    DCD    0
        0x200177b8:    00000000    ....    DCD    0
        0x200177bc:    00000000    ....    DCD    0
        0x200177c0:    00000000    ....    DCD    0
        0x200177c4:    00000000    ....    DCD    0
        0x200177c8:    00000000    ....    DCD    0
        0x200177cc:    00000000    ....    DCD    0
        0x200177d0:    00000000    ....    DCD    0
        0x200177d4:    00000000    ....    DCD    0
        0x200177d8:    00000000    ....    DCD    0
        0x200177dc:    00000000    ....    DCD    0
        0x200177e0:    00000000    ....    DCD    0
        0x200177e4:    00000000    ....    DCD    0
        0x200177e8:    00000000    ....    DCD    0
        0x200177ec:    00000000    ....    DCD    0
        0x200177f0:    00000000    ....    DCD    0
        0x200177f4:    00000000    ....    DCD    0
        0x200177f8:    00000000    ....    DCD    0
        0x200177fc:    00000000    ....    DCD    0
    $t
    .ARM.__at_0x20017800
    advance_software_protect_debugger_disable
        0x20017800:    4803        .H      LDR      r0,[pc,#12] ; [0x20017810] = 0x40010000
        0x20017802:    6841        Ah      LDR      r1,[r0,#4]
        0x20017804:    f02161e0    !..a    BIC      r1,r1,#0x7000000
        0x20017808:    f0416180    A..a    ORR      r1,r1,#0x4000000
        0x2001780c:    6041        A`      STR      r1,[r0,#4]
        0x2001780e:    4770        pG      BX       lr
    $d
        0x20017810:    40010000    ...@    DCD    1073807360
        0x20017814:    00000000    ....    DCD    0
        0x20017818:    00000000    ....    DCD    0
        0x2001781c:    00000000    ....    DCD    0
        0x20017820:    00000000    ....    DCD    0
        0x20017824:    00000000    ....    DCD    0
        0x20017828:    00000000    ....    DCD    0
        0x2001782c:    00000000    ....    DCD    0
        0x20017830:    00000000    ....    DCD    0
        0x20017834:    00000000    ....    DCD    0
        0x20017838:    00000000    ....    DCD    0
        0x2001783c:    00000000    ....    DCD    0
        0x20017840:    00000000    ....    DCD    0
        0x20017844:    00000000    ....    DCD    0
        0x20017848:    00000000    ....    DCD    0
        0x2001784c:    00000000    ....    DCD    0
        0x20017850:    00000000    ....    DCD    0
        0x20017854:    00000000    ....    DCD    0
        0x20017858:    00000000    ....    DCD    0
        0x2001785c:    00000000    ....    DCD    0
        0x20017860:    00000000    ....    DCD    0
        0x20017864:    00000000    ....    DCD    0
        0x20017868:    00000000    ....    DCD    0
        0x2001786c:    00000000    ....    DCD    0
        0x20017870:    00000000    ....    DCD    0
        0x20017874:    00000000    ....    DCD    0
        0x20017878:    00000000    ....    DCD    0
        0x2001787c:    00000000    ....    DCD    0
        0x20017880:    00000000    ....    DCD    0
        0x20017884:    00000000    ....    DCD    0
        0x20017888:    00000000    ....    DCD    0
        0x2001788c:    00000000    ....    DCD    0
        0x20017890:    00000000    ....    DCD    0
        0x20017894:    00000000    ....    DCD    0
        0x20017898:    00000000    ....    DCD    0
        0x2001789c:    00000000    ....    DCD    0
        0x200178a0:    00000000    ....    DCD    0
        0x200178a4:    00000000    ....    DCD    0
        0x200178a8:    00000000    ....    DCD    0
        0x200178ac:    00000000    ....    DCD    0
        0x200178b0:    00000000    ....    DCD    0
        0x200178b4:    00000000    ....    DCD    0
        0x200178b8:    00000000    ....    DCD    0
        0x200178bc:    00000000    ....    DCD    0
        0x200178c0:    00000000    ....    DCD    0
        0x200178c4:    00000000    ....    DCD    0
        0x200178c8:    00000000    ....    DCD    0
        0x200178cc:    00000000    ....    DCD    0
        0x200178d0:    00000000    ....    DCD    0
        0x200178d4:    00000000    ....    DCD    0
        0x200178d8:    00000000    ....    DCD    0
        0x200178dc:    00000000    ....    DCD    0
        0x200178e0:    00000000    ....    DCD    0
        0x200178e4:    00000000    ....    DCD    0
        0x200178e8:    00000000    ....    DCD    0
        0x200178ec:    00000000    ....    DCD    0
        0x200178f0:    00000000    ....    DCD    0
        0x200178f4:    00000000    ....    DCD    0
        0x200178f8:    00000000    ....    DCD    0
        0x200178fc:    00000000    ....    DCD    0
    $t
    .ARM.__at_0x20017900
    advance_software_protect_rdp_check
        0x20017900:    b500        ..      PUSH     {lr}
        0x20017902:    b087        ..      SUB      sp,sp,#0x1c
        0x20017904:    4668        hF      MOV      r0,sp
        0x20017906:    f7fffc29    ..).    BL       $Ven$TT$L$$HAL_FLASHEx_OBGetConfig ; 0x2001715c
        0x2001790a:    f89d0010    ....    LDRB     r0,[sp,#0x10]
        0x2001790e:    28a5        .(      CMP      r0,#0xa5
        0x20017910:    d002        ..      BEQ      0x20017918 ; advance_software_protect_rdp_check + 24
        0x20017912:    2001        .       MOVS     r0,#1
        0x20017914:    b007        ..      ADD      sp,sp,#0x1c
        0x20017916:    bd00        ..      POP      {pc}
        0x20017918:    2000        .       MOVS     r0,#0
        0x2001791a:    e7fb        ..      B        0x20017914 ; advance_software_protect_rdp_check + 20
        0x2001791c:    0000        ..      MOVS     r0,r0
        0x2001791e:    0000        ..      MOVS     r0,r0
        0x20017920:    0000        ..      MOVS     r0,r0
        0x20017922:    0000        ..      MOVS     r0,r0
        0x20017924:    0000        ..      MOVS     r0,r0
        0x20017926:    0000        ..      MOVS     r0,r0
        0x20017928:    0000        ..      MOVS     r0,r0
        0x2001792a:    0000        ..      MOVS     r0,r0
        0x2001792c:    0000        ..      MOVS     r0,r0
        0x2001792e:    0000        ..      MOVS     r0,r0
        0x20017930:    0000        ..      MOVS     r0,r0
        0x20017932:    0000        ..      MOVS     r0,r0
        0x20017934:    0000        ..      MOVS     r0,r0
        0x20017936:    0000        ..      MOVS     r0,r0
        0x20017938:    0000        ..      MOVS     r0,r0
        0x2001793a:    0000        ..      MOVS     r0,r0
        0x2001793c:    0000        ..      MOVS     r0,r0
        0x2001793e:    0000        ..      MOVS     r0,r0
        0x20017940:    0000        ..      MOVS     r0,r0
        0x20017942:    0000        ..      MOVS     r0,r0
        0x20017944:    0000        ..      MOVS     r0,r0
        0x20017946:    0000        ..      MOVS     r0,r0
        0x20017948:    0000        ..      MOVS     r0,r0
        0x2001794a:    0000        ..      MOVS     r0,r0
        0x2001794c:    0000        ..      MOVS     r0,r0
        0x2001794e:    0000        ..      MOVS     r0,r0
        0x20017950:    0000        ..      MOVS     r0,r0
        0x20017952:    0000        ..      MOVS     r0,r0
        0x20017954:    0000        ..      MOVS     r0,r0
        0x20017956:    0000        ..      MOVS     r0,r0
        0x20017958:    0000        ..      MOVS     r0,r0
        0x2001795a:    0000        ..      MOVS     r0,r0
        0x2001795c:    0000        ..      MOVS     r0,r0
        0x2001795e:    0000        ..      MOVS     r0,r0
        0x20017960:    0000        ..      MOVS     r0,r0
        0x20017962:    0000        ..      MOVS     r0,r0
        0x20017964:    0000        ..      MOVS     r0,r0
        0x20017966:    0000        ..      MOVS     r0,r0
        0x20017968:    0000        ..      MOVS     r0,r0
        0x2001796a:    0000        ..      MOVS     r0,r0
        0x2001796c:    0000        ..      MOVS     r0,r0
        0x2001796e:    0000        ..      MOVS     r0,r0
        0x20017970:    0000        ..      MOVS     r0,r0
        0x20017972:    0000        ..      MOVS     r0,r0
        0x20017974:    0000        ..      MOVS     r0,r0
        0x20017976:    0000        ..      MOVS     r0,r0
        0x20017978:    0000        ..      MOVS     r0,r0
        0x2001797a:    0000        ..      MOVS     r0,r0
        0x2001797c:    0000        ..      MOVS     r0,r0
        0x2001797e:    0000        ..      MOVS     r0,r0
        0x20017980:    0000        ..      MOVS     r0,r0
        0x20017982:    0000        ..      MOVS     r0,r0
        0x20017984:    0000        ..      MOVS     r0,r0
        0x20017986:    0000        ..      MOVS     r0,r0
        0x20017988:    0000        ..      MOVS     r0,r0
        0x2001798a:    0000        ..      MOVS     r0,r0
        0x2001798c:    0000        ..      MOVS     r0,r0
        0x2001798e:    0000        ..      MOVS     r0,r0
        0x20017990:    0000        ..      MOVS     r0,r0
        0x20017992:    0000        ..      MOVS     r0,r0
        0x20017994:    0000        ..      MOVS     r0,r0
        0x20017996:    0000        ..      MOVS     r0,r0
        0x20017998:    0000        ..      MOVS     r0,r0
        0x2001799a:    0000        ..      MOVS     r0,r0
        0x2001799c:    0000        ..      MOVS     r0,r0
        0x2001799e:    0000        ..      MOVS     r0,r0
        0x200179a0:    0000        ..      MOVS     r0,r0
        0x200179a2:    0000        ..      MOVS     r0,r0
        0x200179a4:    0000        ..      MOVS     r0,r0
        0x200179a6:    0000        ..      MOVS     r0,r0
        0x200179a8:    0000        ..      MOVS     r0,r0
        0x200179aa:    0000        ..      MOVS     r0,r0
        0x200179ac:    0000        ..      MOVS     r0,r0
        0x200179ae:    0000        ..      MOVS     r0,r0
        0x200179b0:    0000        ..      MOVS     r0,r0
        0x200179b2:    0000        ..      MOVS     r0,r0
        0x200179b4:    0000        ..      MOVS     r0,r0
        0x200179b6:    0000        ..      MOVS     r0,r0
        0x200179b8:    0000        ..      MOVS     r0,r0
        0x200179ba:    0000        ..      MOVS     r0,r0
        0x200179bc:    0000        ..      MOVS     r0,r0
        0x200179be:    0000        ..      MOVS     r0,r0
        0x200179c0:    0000        ..      MOVS     r0,r0
        0x200179c2:    0000        ..      MOVS     r0,r0
        0x200179c4:    0000        ..      MOVS     r0,r0
        0x200179c6:    0000        ..      MOVS     r0,r0
        0x200179c8:    0000        ..      MOVS     r0,r0
        0x200179ca:    0000        ..      MOVS     r0,r0
        0x200179cc:    0000        ..      MOVS     r0,r0
        0x200179ce:    0000        ..      MOVS     r0,r0
        0x200179d0:    0000        ..      MOVS     r0,r0
        0x200179d2:    0000        ..      MOVS     r0,r0
        0x200179d4:    0000        ..      MOVS     r0,r0
        0x200179d6:    0000        ..      MOVS     r0,r0
        0x200179d8:    0000        ..      MOVS     r0,r0
        0x200179da:    0000        ..      MOVS     r0,r0
        0x200179dc:    0000        ..      MOVS     r0,r0
        0x200179de:    0000        ..      MOVS     r0,r0
        0x200179e0:    0000        ..      MOVS     r0,r0
        0x200179e2:    0000        ..      MOVS     r0,r0
        0x200179e4:    0000        ..      MOVS     r0,r0
        0x200179e6:    0000        ..      MOVS     r0,r0
        0x200179e8:    0000        ..      MOVS     r0,r0
        0x200179ea:    0000        ..      MOVS     r0,r0
        0x200179ec:    0000        ..      MOVS     r0,r0
        0x200179ee:    0000        ..      MOVS     r0,r0
        0x200179f0:    0000        ..      MOVS     r0,r0
        0x200179f2:    0000        ..      MOVS     r0,r0
        0x200179f4:    0000        ..      MOVS     r0,r0
        0x200179f6:    0000        ..      MOVS     r0,r0
        0x200179f8:    0000        ..      MOVS     r0,r0
        0x200179fa:    0000        ..      MOVS     r0,r0
        0x200179fc:    0000        ..      MOVS     r0,r0
        0x200179fe:    0000        ..      MOVS     r0,r0
    .ARM.__at_0x20017A00
    advance_software_protect_rdp_enable
        0x20017a00:    b500        ..      PUSH     {lr}
        0x20017a02:    b087        ..      SUB      sp,sp,#0x1c
        0x20017a04:    4668        hF      MOV      r0,sp
        0x20017a06:    f7fffba9    ....    BL       $Ven$TT$L$$HAL_FLASHEx_OBGetConfig ; 0x2001715c
        0x20017a0a:    f7fffbac    ....    BL       $Ven$TT$L$$HAL_FLASH_Unlock ; 0x20017166
        0x20017a0e:    2800        .(      CMP      r0,#0
        0x20017a10:    d10c        ..      BNE      0x20017a2c ; advance_software_protect_rdp_enable + 44
        0x20017a12:    f7fffbad    ....    BL       $Ven$TT$L$$HAL_FLASH_OB_Unlock ; 0x20017170
        0x20017a16:    2800        .(      CMP      r0,#0
        0x20017a18:    d108        ..      BNE      0x20017a2c ; advance_software_protect_rdp_enable + 44
        0x20017a1a:    f88d0010    ....    STRB     r0,[sp,#0x10]
        0x20017a1e:    4668        hF      MOV      r0,sp
        0x20017a20:    f7fffbab    ....    BL       $Ven$TT$L$$HAL_FLASHEx_OBProgram ; 0x2001717a
        0x20017a24:    f7fffbae    ....    BL       $Ven$TT$L$$HAL_FLASH_OB_Lock ; 0x20017184
        0x20017a28:    f7fffbb1    ....    BL       $Ven$TT$L$$HAL_FLASH_Lock ; 0x2001718e
        0x20017a2c:    b007        ..      ADD      sp,sp,#0x1c
        0x20017a2e:    bd00        ..      POP      {pc}
        0x20017a30:    0000        ..      MOVS     r0,r0
        0x20017a32:    0000        ..      MOVS     r0,r0
        0x20017a34:    0000        ..      MOVS     r0,r0
        0x20017a36:    0000        ..      MOVS     r0,r0
        0x20017a38:    0000        ..      MOVS     r0,r0
        0x20017a3a:    0000        ..      MOVS     r0,r0
        0x20017a3c:    0000        ..      MOVS     r0,r0
        0x20017a3e:    0000        ..      MOVS     r0,r0
        0x20017a40:    0000        ..      MOVS     r0,r0
        0x20017a42:    0000        ..      MOVS     r0,r0
        0x20017a44:    0000        ..      MOVS     r0,r0
        0x20017a46:    0000        ..      MOVS     r0,r0
        0x20017a48:    0000        ..      MOVS     r0,r0
        0x20017a4a:    0000        ..      MOVS     r0,r0
        0x20017a4c:    0000        ..      MOVS     r0,r0
        0x20017a4e:    0000        ..      MOVS     r0,r0
        0x20017a50:    0000        ..      MOVS     r0,r0
        0x20017a52:    0000        ..      MOVS     r0,r0
        0x20017a54:    0000        ..      MOVS     r0,r0
        0x20017a56:    0000        ..      MOVS     r0,r0
        0x20017a58:    0000        ..      MOVS     r0,r0
        0x20017a5a:    0000        ..      MOVS     r0,r0
        0x20017a5c:    0000        ..      MOVS     r0,r0
        0x20017a5e:    0000        ..      MOVS     r0,r0
        0x20017a60:    0000        ..      MOVS     r0,r0
        0x20017a62:    0000        ..      MOVS     r0,r0
        0x20017a64:    0000        ..      MOVS     r0,r0
        0x20017a66:    0000        ..      MOVS     r0,r0
        0x20017a68:    0000        ..      MOVS     r0,r0
        0x20017a6a:    0000        ..      MOVS     r0,r0
        0x20017a6c:    0000        ..      MOVS     r0,r0
        0x20017a6e:    0000        ..      MOVS     r0,r0
        0x20017a70:    0000        ..      MOVS     r0,r0
        0x20017a72:    0000        ..      MOVS     r0,r0
        0x20017a74:    0000        ..      MOVS     r0,r0
        0x20017a76:    0000        ..      MOVS     r0,r0
        0x20017a78:    0000        ..      MOVS     r0,r0
        0x20017a7a:    0000        ..      MOVS     r0,r0
        0x20017a7c:    0000        ..      MOVS     r0,r0
        0x20017a7e:    0000        ..      MOVS     r0,r0
        0x20017a80:    0000        ..      MOVS     r0,r0
        0x20017a82:    0000        ..      MOVS     r0,r0
        0x20017a84:    0000        ..      MOVS     r0,r0
        0x20017a86:    0000        ..      MOVS     r0,r0
        0x20017a88:    0000        ..      MOVS     r0,r0
        0x20017a8a:    0000        ..      MOVS     r0,r0
        0x20017a8c:    0000        ..      MOVS     r0,r0
        0x20017a8e:    0000        ..      MOVS     r0,r0
        0x20017a90:    0000        ..      MOVS     r0,r0
        0x20017a92:    0000        ..      MOVS     r0,r0
        0x20017a94:    0000        ..      MOVS     r0,r0
        0x20017a96:    0000        ..      MOVS     r0,r0
        0x20017a98:    0000        ..      MOVS     r0,r0
        0x20017a9a:    0000        ..      MOVS     r0,r0
        0x20017a9c:    0000        ..      MOVS     r0,r0
        0x20017a9e:    0000        ..      MOVS     r0,r0
        0x20017aa0:    0000        ..      MOVS     r0,r0
        0x20017aa2:    0000        ..      MOVS     r0,r0
        0x20017aa4:    0000        ..      MOVS     r0,r0
        0x20017aa6:    0000        ..      MOVS     r0,r0
        0x20017aa8:    0000        ..      MOVS     r0,r0
        0x20017aaa:    0000        ..      MOVS     r0,r0
        0x20017aac:    0000        ..      MOVS     r0,r0
        0x20017aae:    0000        ..      MOVS     r0,r0
        0x20017ab0:    0000        ..      MOVS     r0,r0
        0x20017ab2:    0000        ..      MOVS     r0,r0
        0x20017ab4:    0000        ..      MOVS     r0,r0
        0x20017ab6:    0000        ..      MOVS     r0,r0
        0x20017ab8:    0000        ..      MOVS     r0,r0
        0x20017aba:    0000        ..      MOVS     r0,r0
        0x20017abc:    0000        ..      MOVS     r0,r0
        0x20017abe:    0000        ..      MOVS     r0,r0
        0x20017ac0:    0000        ..      MOVS     r0,r0
        0x20017ac2:    0000        ..      MOVS     r0,r0
        0x20017ac4:    0000        ..      MOVS     r0,r0
        0x20017ac6:    0000        ..      MOVS     r0,r0
        0x20017ac8:    0000        ..      MOVS     r0,r0
        0x20017aca:    0000        ..      MOVS     r0,r0
        0x20017acc:    0000        ..      MOVS     r0,r0
        0x20017ace:    0000        ..      MOVS     r0,r0
        0x20017ad0:    0000        ..      MOVS     r0,r0
        0x20017ad2:    0000        ..      MOVS     r0,r0
        0x20017ad4:    0000        ..      MOVS     r0,r0
        0x20017ad6:    0000        ..      MOVS     r0,r0
        0x20017ad8:    0000        ..      MOVS     r0,r0
        0x20017ada:    0000        ..      MOVS     r0,r0
        0x20017adc:    0000        ..      MOVS     r0,r0
        0x20017ade:    0000        ..      MOVS     r0,r0
        0x20017ae0:    0000        ..      MOVS     r0,r0
        0x20017ae2:    0000        ..      MOVS     r0,r0
        0x20017ae4:    0000        ..      MOVS     r0,r0
        0x20017ae6:    0000        ..      MOVS     r0,r0
        0x20017ae8:    0000        ..      MOVS     r0,r0
        0x20017aea:    0000        ..      MOVS     r0,r0
        0x20017aec:    0000        ..      MOVS     r0,r0
        0x20017aee:    0000        ..      MOVS     r0,r0
        0x20017af0:    0000        ..      MOVS     r0,r0
        0x20017af2:    0000        ..      MOVS     r0,r0
        0x20017af4:    0000        ..      MOVS     r0,r0
        0x20017af6:    0000        ..      MOVS     r0,r0
        0x20017af8:    0000        ..      MOVS     r0,r0
        0x20017afa:    0000        ..      MOVS     r0,r0
        0x20017afc:    0000        ..      MOVS     r0,r0
        0x20017afe:    0000        ..      MOVS     r0,r0
    .ARM.__at_0x20017B00
    advance_software_protect_verify_authorization
        0x20017b00:    b570        p.      PUSH     {r4-r6,lr}
        0x20017b02:    4c0a        .L      LDR      r4,[pc,#40] ; [0x20017b2c] = 0x20000064
        0x20017b04:    6860        `h      LDR      r0,[r4,#4]
        0x20017b06:    4d0a        .M      LDR      r5,[pc,#40] ; [0x20017b30] = 0x5bdb656e
        0x20017b08:    4068        h@      EORS     r0,r0,r5
        0x20017b0a:    b2c1        ..      UXTB     r1,r0
        0x20017b0c:    6820         h      LDR      r0,[r4,#0]
        0x20017b0e:    4a09        .J      LDR      r2,[pc,#36] ; [0x20017b34] = 0x200001b0
        0x20017b10:    4068        h@      EORS     r0,r0,r5
        0x20017b12:    f7fffd75    ..u.    BL       advance_software_protect_get_cid ; 0x20017600
        0x20017b16:    68a3        .h      LDR      r3,[r4,#8]
        0x20017b18:    6862        bh      LDR      r2,[r4,#4]
        0x20017b1a:    406b        k@      EORS     r3,r3,r5
        0x20017b1c:    406a        j@      EORS     r2,r2,r5
        0x20017b1e:    e8bd4070    ..p@    POP      {r4-r6,lr}
        0x20017b22:    4904        .I      LDR      r1,[pc,#16] ; [0x20017b34] = 0x200001b0
        0x20017b24:    4804        .H      LDR      r0,[pc,#16] ; [0x20017b38] = 0x8008120
        0x20017b26:    f7ffbb37    ..7.    B        $Ven$TT$L$$sissdk_ecdsa_verify ; 0x20017198
    $d
        0x20017b2a:    0000        ..      DCW    0
        0x20017b2c:    20000064    d..     DCD    536871012
        0x20017b30:    5bdb656e    ne.[    DCD    1541105006
        0x20017b34:    200001b0    ...     DCD    536871344
        0x20017b38:    08008120     ...    DCD    134250784

** Section #5 '.debug_abbrev' (SHT_PROGBITS)
    Size   : 1476 bytes


** Section #6 '.debug_frame' (SHT_PROGBITS)
    Size   : 7636 bytes


** Section #7 '.debug_info' (SHT_PROGBITS)
    Size   : 135496 bytes


** Section #8 '.debug_line' (SHT_PROGBITS)
    Size   : 50632 bytes


** Section #9 '.debug_loc' (SHT_PROGBITS)
    Size   : 28128 bytes


** Section #10 '.debug_macinfo' (SHT_PROGBITS)
    Size   : 522812 bytes


** Section #11 '.debug_pubnames' (SHT_PROGBITS)
    Size   : 8070 bytes


** Section #12 '.symtab' (SHT_SYMTAB)
    Size   : 20688 bytes (alignment 4)
    String table #13 '.strtab'
    Last local symbol no. 933


** Section #13 '.strtab' (SHT_STRTAB)
    Size   : 23952 bytes


** Section #14 '.note' (SHT_NOTE)
    Size   : 32 bytes (alignment 4)


** Section #15 '.comment' (SHT_PROGBITS)
    Size   : 104616 bytes


** Section #16 '.shstrtab' (SHT_STRTAB)
    Size   : 164 bytes


