---
title: PowerWriter AT 命令接口
description: PowerWriter AT Command
toc_max_heading_level: 6
keywords: [powerwriter,PowerWriter AT,AT command,icworkshop,docs]
---



# PowerWriter AT for cross-platform

PowerWriter 在Linux（Unix like ） 中的串口通道为 

```bash
/dev/ttyACM*
```

powerwriter_at_core 无需修改，只需将串口读写实现即可，其他无需修改，由于Linux （Unix like）系统用户量较少，作者并未提供sample， 如果需要请提交issues，并返回给我们。
