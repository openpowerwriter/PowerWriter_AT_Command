---
title: PowerWriter AT 命令接口
description: PowerWriter AT Command
toc_max_heading_level: 6
keywords: [powerwriter,PowerWriter AT,AT command,icworkshop,docs]
---



# PowerWriter AT for embedded 

1：在嵌入式系统中，如可以驱动USB ACM -CDC 则可以使用USB 端口

2：如果无法驱动USB ACM CDC 端口的硬件平台，则可以使用PowerWriter 信号端的 UART 端口进行AT 通讯 ，powerwriter_at_core 无需修改，

只需修改串口数据输入输出
