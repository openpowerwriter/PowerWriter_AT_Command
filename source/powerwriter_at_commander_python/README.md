# PowerWriter AT Commander（Python 版）

基于 `powerwriter_at_core` 的 Python GUI / CLI 演示程序。

用户手册：[中文](docs/USER_MANUAL_zh-CN.md) | [English](docs/USER_MANUAL_en.md)。

**设计原则：只有一份协议实现。**
AT 帧打包、CRC32、AES128-CBC、超时等待等全部由现有 C 核心完成。
Python 只负责串口收发、ctypes 绑定、界面和参数转换，不再重新实现协议，
因此后续只需要维护 C 核心这一份代码。

```
Python GUI / CLI
      │  ctypes
      ▼
libpowerwriter_at  (csrc/pwat_bridge.c + powerwriter_at_core/*.c)
      │  字节流
      ▼
串口（标准库后端：Windows Win32 API / Linux、macOS termios）
      │
      ▼
PowerWriter 烧录器
```

## 目录结构

```
powerwriter_at_commander_python/
├── CMakeLists.txt              # 编译 C 桥接动态库
├── build_windows.bat           # Windows 编译脚本
├── build_linux.sh              # Linux 编译脚本
├── build_macos.sh              # macOS 编译脚本
├── build_exe.py                # PyInstaller 打包脚本
├── build_exe_windows.bat       # Windows 打包脚本
├── csrc/
│   ├── pwat_bridge.h           # 扁平 C ABI（供 ctypes 调用）
│   ├── pwat_bridge.c           # 调用 powerwriter_at_core / 回调转换
│   ├── pwat_crypto.c/h         # 运行时 AES128-CBC Key/IV
│   └── pwat_port.c             # 跨平台时钟、休眠、CRC32
├── pw_at/
│   ├── ffi.py                  # 动态库自动查找 + ctypes 绑定
│   ├── client.py               # 高层 API（分块读写、进度、文件名编码）
│   ├── serial_backend.py       # 标准库串口后端（Win32 / termios）
│   ├── transport.py            # 串口读线程 + 发送锁
│   ├── demo.py                 # 与 powerwriter_at_samples.c 对应的示例流程
│   ├── workflow_settings.py    # 批量测试参数持久化
│   ├── models.py               # 数据模型
│   ├── constants.py            # 错误码、配置枚举、界面标签
│   ├── errors.py / utils.py
│   └── __init__.py
├── powerwriter_at_cli.py       # 命令行入口
├── powerwriter_at_gui.py       # GUI 入口（tkinter）
├── tests/                      # 自动化测试（协议 / CLI / GUI / HEX / 多语言）
├── assets/
│   └── powerwriter_at_demo_project.pkg   # 从 samples.c 提取的演示工程
├── lib/                        # 编译输出（按平台/架构分目录）
│   └── windows/x64/powerwriter_at.dll
└── dist/                       # PyInstaller 输出（自包含 EXE）
    ├── powerwriter_at_cli_python.exe
    └── powerwriter_at_gui_python.exe
```

## 环境要求

| 用途 | 要求 |
| --- | --- |
| 运行 Python 版 | Python 3.8+；**无第三方运行时依赖**（串口使用标准库实现） |
| 编译 C 库 | CMake 3.15+、C 编译器（Windows 用 VS Build Tools） |
| 打包 EXE | PyInstaller 6.x（仅构建机需要） |

## 编译 C 桥接库

```bat
:: Windows（默认 x64，也可传入 arm64 / x86）
build_windows.bat
```

```bash
# Linux
./build_linux.sh

# macOS
./build_macos.sh
```

输出位置：

```
lib/windows/x64/powerwriter_at.dll
lib/linux/x64/libpowerwriter_at.so
lib/macos/arm64/libpowerwriter_at.dylib
```

> 已在 WSL2 Ubuntu 20.04 + GCC 9.4 + Python 3.8 下实际编译 Linux `.so`
> 并通过全部测试。macOS 构建脚本已提供，但本机没有 macOS 环境未做本地实测，
> 可通过下方的 GitHub Actions 在 macOS runner 上编译验证。

### 动态库自动选择

`pw_at/ffi.py` 会根据 `sys.platform` + `platform.machine()` 自动选择：

| 平台 | 文件名 |
| --- | --- |
| Windows | `powerwriter_at.dll`（也支持 `powerwriter_at_x64.dll` 等架构专用名） |
| Linux | `libpowerwriter_at.so` |
| macOS | `libpowerwriter_at.dylib` |

搜索顺序（`<根>` 为项目目录或 PyInstaller 解压目录）：

```
<根>/lib/<平台>/<架构>/
<根>/lib/<平台>/
<根>/lib/<架构>/
<根>/lib/
<根>/build/lib/Release/
当前工作目录及其 lib/
```

也可以用环境变量指定库文件或目录：

```bat
set POWERWRITER_AT_LIB=D:\build\powerwriter_at.dll
```

`python powerwriter_at_cli.py doctor` 会显示实际加载的库路径与 ABI 版本。

### 串口识别与过滤

PowerWriter 的 USB 标识为 **VID `0x0D28` / PID `0x0204`**（当前测试设备为
`0D28:0204`，描述为 “PowerWriter Serial Port”）。客户端会结合 VID/PID
和描述关键字（PowerWriter / ICWorkshop）识别设备：

```bash
python powerwriter_at_cli.py list              # 显示 VID:PID 和 [PowerWriter] 标记
python powerwriter_at_cli.py list --powerwriter  # 只列出识别到的 PowerWriter
python powerwriter_at_cli.py list --pw          # 同上
```

- 不指定 `--port` 时，会自动选择唯一的 PowerWriter 端口；识别到多个
  PowerWriter 时会列出并提示用 `--port` 指定。
- GUI 默认勾选“仅 PowerWriter”，刷新后自动选中识别到的设备；如果未识别到，
  会回退显示全部串口并在日志中提示。
- 部分定制型号使用不同 PID，可通过环境变量追加（逗号分隔）：

```bat
set POWERWRITER_VID_PID=0D28:0204,1234:5678
```

- Windows 通过注册表 `Enum\USB` + `SERIALCOMM` 读取活跃端口及 VID/PID；
  Linux 通过 `/sys/class/tty/<tty>/.../idVendor`、`idProduct` 读取。
- VID `0x0D28` 也被部分其他 DAPLink 设备使用；描述匹配可减少误判，
  必要时仍可用 `--port` 精确指定。macOS 暂不读取 USB 元数据，会回退为
  显示全部串口，可用 `--port` 指定。

## 命令行用法

```bash
python powerwriter_at_cli.py list                    # 枚举串口
python powerwriter_at_cli.py doctor                  # 检查动态库 / 串口 / 平台
python powerwriter_at_cli.py guide                   # 查看 API 调用顺序与依赖
python powerwriter_at_cli.py about                   # 接口介绍

python powerwriter_at_cli.py --port COM3 info        # 烧录器信息
python powerwriter_at_cli.py --port COM3 config-get  # 读取配置
python powerwriter_at_cli.py --port COM3 set-baud 115200
```

`--port`、`--baud`、`--encrypt`、`--encrypt-key`、`--encrypt-iv`、
`--debug`、`--quiet` 可以写在子命令前面或后面：

```bash
python powerwriter_at_cli.py --port COM3 info
python powerwriter_at_cli.py info --port COM3
```

加密设备需要同时提供与设备一致的 16 字节 AES Key 和 IV（各 32 个十六进制
字符）：

```bash
python powerwriter_at_cli.py --port COM3 --encrypt \
  --encrypt-key 00112233445566778899AABBCCDDEEFF \
  --encrypt-iv 0102030405060708090A0B0C0D0E0F10 info
```

### C++ CLI 风格参数（兼容）

Python CLI 同时支持 C++ 版的扁平参数，`-help` 查看完整说明：

```bash
python powerwriter_at_cli.py -info
python powerwriter_at_cli.py -cfg
python powerwriter_at_cli.py -setcfg -f writer_cfg.json
python powerwriter_at_cli.py -setbaud -b 115200
python powerwriter_at_cli.py -connect
python powerwriter_at_cli.py -status
python powerwriter_at_cli.py -cid
python powerwriter_at_cli.py -read -addr 0x08000000 -s 0x100
python powerwriter_at_cli.py -erase -t 10000
python powerwriter_at_cli.py -erase -t 10000 -addr 0x08000000 -s 0x1000
python powerwriter_at_cli.py -write -addr 0x08000000 -f app.bin
python powerwriter_at_cli.py -read-ob
python powerwriter_at_cli.py -write-vob -t 1000
python powerwriter_at_cli.py -write-uob -t 1000
python powerwriter_at_cli.py -reset -type 3
python powerwriter_at_cli.py -prj-info
python powerwriter_at_cli.py -prj-ld -f stm32f071.pkg
python powerwriter_at_cli.py -prj-sw -mode 1 -f stm32f071.pkg
python powerwriter_at_cli.py -prj-dis
python powerwriter_at_cli.py -start
python powerwriter_at_cli.py -offline-status
python powerwriter_at_cli.py -factory-sram-fw -t 1000
python powerwriter_at_cli.py -factory-flash-fw -t 1000
python powerwriter_at_cli.py -bcst -data "hello" -dir usbtouart
python powerwriter_at_cli.py -sleep -t 1000
python powerwriter_at_cli.py -scan
```

说明：

- `--port COMx` / `--baud 9600` 仍可配合扁平参数使用；未指定端口时自动
  选择唯一的 PowerWriter。
- 扁平参数模式不弹确认，直接执行；如需确认请使用子命令模式并加 `--yes`。
- `-write` 当前仅支持 `.bin`；`-fw-num` 参数保留但不适用。
- 广播方向：C++ 的 `usbtouart` 对应 Python 的 `cdc2uart`，`uarttousb`
  对应 `uart2cdc`。
- 原有子命令（`info`、`read`、`write` 等）继续可用。

### 在线操作（需要先连接目标芯片）

```bash
python powerwriter_at_cli.py --port COM3 connect
python powerwriter_at_cli.py --port COM3 status
python powerwriter_at_cli.py --port COM3 id
python powerwriter_at_cli.py --port COM3 read 0x08000000 256
python powerwriter_at_cli.py --port COM3 read 0x08000000 0x1000 -o dump.bin
python powerwriter_at_cli.py --port COM3 write 0x08000000 app.bin -y
python powerwriter_at_cli.py --port COM3 write 0x08000000 app.bin --verify -y
python powerwriter_at_cli.py --port COM3 write-prepare 0x10000
python powerwriter_at_cli.py --port COM3 erase -y
python powerwriter_at_cli.py --port COM3 erase-sector 0x08000000 0x1000 -y
python powerwriter_at_cli.py --port COM3 ob-read
python powerwriter_at_cli.py --port COM3 ob-write-vendor -y
python powerwriter_at_cli.py --port COM3 ob-write-user -y
python powerwriter_at_cli.py --port COM3 reset --type hw-core-reset
```

> **在线操作前置条件（重要）**：设备中必须先加载与目标芯片匹配的离线工程，
> 例如 STM32F071 使用 `stm32f071.pkg`。先执行：
>
> ```bash
> python powerwriter_at_cli.py --port COM3 project-load stm32f071.pkg -y
> python powerwriter_at_cli.py --port COM3 project-info   # 确认 active=1
> python powerwriter_at_cli.py --port COM3 connect
> ```
>
> `target_reset` 之后目标芯片会断开，继续在线操作前需要重新 `connect`。

### 离线操作（只需烧录器在线，目标芯片可以不连接）

```bash
python powerwriter_at_cli.py --port COM3 project-info
python powerwriter_at_cli.py --port COM3 project-load app.pkg -y
python powerwriter_at_cli.py --port COM3 project-load app.pkg --name "项目.pkg" --password 1234 -y
python powerwriter_at_cli.py --port COM3 project-disable -y
python powerwriter_at_cli.py --port COM3 offline-start -y     # 启动离线烧录
python powerwriter_at_cli.py --port COM3 offline-status       # 查询一次进度
python powerwriter_at_cli.py --port COM3 project-switch "项目.pkg" --reload
```

> **离线烧录前置条件**：与在线操作相同，必须先加载与目标匹配的工程并确认
> `project-info` 的 `active=1`。
>
> **工程 OEM 要求**：工程必须与设备型号/OEM/固件匹配。若加载时返回
> `ATErrorOfflineOem(33)`，请用官方 PowerWriter 软件确认工程 OEM 并重新
> 导出；不要修改 `.pkg` 原始数据。

### 其他

```bash
python powerwriter_at_cli.py --port COM3 broadcast "hello" --dir cdc2uart
python powerwriter_at_cli.py --port COM3 broadcast "01 02 03" --hex --wait-rsp
python powerwriter_at_cli.py --port COM3 factory-sram
python powerwriter_at_cli.py --port COM3 factory-flash
python powerwriter_at_cli.py --port COM3 benchmark             # 安全示例流程
python powerwriter_at_cli.py --port COM3 benchmark --destructive -y  # 完整示例
```

`benchmark` 与 `powerwriter_at_samples.c` 的流程对应。为满足设备的依赖关系，
现在会先检查/加载离线工程，再执行在线步骤：
读取信息/配置 → 检查工程（无有效工程时，安全模式跳过在线操作；破坏模式
先加载 `--project` 指定的工程）→ 连接目标 → 读 ID → 读内存 → 复位并重连
→ 写厂商 OptionByte → 全片擦除 → 扇区擦除 → 写准备+分块写入 → 读/写
OptionByte → 广播 → 工厂固件 → 查询工程 → 启动并轮询 → 切换工程。

> 默认示例工程 `assets/powerwriter_at_demo_project.pkg` 仅用于演示流程。
> 实际使用时请先 `project-load` 加载与目标芯片匹配的工程，并确认
> `project-info` 的 `active=1`，再运行在线/离线流程。

## GUI 用法

```bash
python powerwriter_at_gui.py
```

功能页：

| 页面 | 覆盖的 API / 功能 |
| --- | --- |
| 设备信息 | `get_writer_info`、绑定库信息、关于 |
| 设备配置 | `get_writer_config` / `set_writer_config`、`set_baudrate` |
| 在线操作 | `target_connect` / `target_status` / `target_get_id` / `target_read` / `target_write_prepare` / `target_write` / `target_erase` / `target_erase_sector` / `target_read_ob` / `target_write_vendor_ob` / `target_write_user_ob` / `target_reset` / 工厂固件 |
| 脱机编程 | `project_info` / `project_load` / `project_disable` / `offline_start` / `offline_status` / `project_switch` |
| 广播 | `broadcast`（无需应答 / 等待响应） |
| 示例流程 | 与 `samples.c` 对应的完整调用顺序，可运行安全流程或破坏性流程 |
| 日志 | 通信帧、错误、进度；可保存 |

所有耗时操作在后台线程执行，界面不会卡死；破坏性操作会二次确认。
勾选连接栏的 `AES128-CBC encryption` 会弹出密钥/IV 配置对话框，支持显示明文
和随机生成；生成的值需要同时写入设备。

“示例流程”页右侧提供 `Batch test settings` 按钮，可配置安全流程和完整流程
的每个可选步骤：读取区间地址/大小、复位类型、擦除/写入地址和大小、超时、
广播数据、工厂测试开关等。点击 `Save` 后写入当前用户设置文件，下次启动自动
恢复；完整流程的工程加载/切换使用“脱机编程”页当前工程参数。

GUI 连接栏右侧提供语言选择，首次启动自动匹配系统语言，支持 48 种语言，包括
英语、简体中文、繁体中文、日语、韩语、越南语、泰语、印度尼西亚语、马来语、
菲律宾语、俄语、阿拉伯语、德语、法语、西班牙语、葡萄牙语、意大利语、土耳其语、
印地语、孟加拉语、乌尔都语、泰米尔语、泰卢固语、马拉雅拉姆语、卡纳达语、
马拉地语、古吉拉特语、旁遮普语、波斯语、希伯来语、荷兰语、波兰语、乌克兰语、
希腊语、瑞典语、挪威语、丹麦语、芬兰语、捷克语、罗马尼亚语、匈牙利语、
保加利亚语、塞尔维亚语、斯洛伐克语、立陶宛语、斯瓦希里语、南非荷兰语和
阿塞拜疆语。翻译资源位于 `i18n/*.json`，可直接修改。CLI 保持英文。

GUI 默认最大化启动，按钮会根据当前语言文字长度自适应；“在线操作”页写入
`.hex`/`.ihx` 时会自动解析多段地址并禁用地址输入框，`.bin`/`.img` 仍使用显式地址。
“脱机编程”页启动脱机烧录后自动轮询状态，并提供“停止轮询”；切换工程成功后会
显示成功提示和日志。

## 打包为独立 EXE（无外部依赖）

```bat
build_exe_windows.bat
:: 或者
python build_exe.py
```

输出：

```
dist/powerwriter_at_cli_python.exe
dist/powerwriter_at_gui_python.exe
```

两个 EXE 都是 PyInstaller `--onefile` 自包含程序，已内置：

- Python 运行时与标准库（含 tkinter）；
- `pw_at` 包；
- C 桥接动态库（`lib/<平台>/<架构>/`）；
- 演示工程 `assets/powerwriter_at_demo_project.pkg`。

目标机器**不需要安装 Python、pip、pyserial 或 VC 运行库**。
（C 库使用静态 CRT 链接。）

已验证：

```bat
dist\powerwriter_at_cli_python.exe --version
dist\powerwriter_at_cli_python.exe doctor       :: 会从 _MEI 临时目录加载内置 DLL
dist\powerwriter_at_cli_python.exe list
dist\powerwriter_at_gui_python.exe --smoke-test :: 自检后退出，返回码 0
```

> Linux/macOS 也可以执行 `python build_exe.py` 生成对应平台的可执行文件；
> GUI 在 macOS 上会生成 `.app`。如果构建机的 Python 没有 tkinter，
> 脚本会跳过 GUI、只生成 CLI（并打印警告）。

### GitHub Actions 云端编译（含 macOS）

仓库根目录已提供 `.github/workflows/powerwriter_at_python.yml`：

- 在 `windows-latest`、`ubuntu-latest`、`macos-latest` 三个 runner 上：
  1. 编译对应平台的 C 动态库；
  2. 运行全部测试；
  3. 使用 PyInstaller 生成独立可执行文件；
  4. 上传 `powerwriter-at-<platform>` 构建产物。
- 在 GitHub 仓库的 **Actions** 页面手动触发（`workflow_dispatch`），
  或在推送代码时自动运行；运行结束后在该次运行页面底部下载各平台产物。
- 创建/发布 GitHub Release 时，会自动把各平台产物打包为 zip 附加到该 Release。

因此即使没有 macOS 电脑，也可以借助 GitHub 的 macOS runner 完成编译验证。

## 测试

```bash
python -m unittest discover -s tests -v
```

当前共 77 项测试，覆盖：

- C 动态库加载、ABI 版本、回调桥接；
- 帧解析、CRC、垃圾数据重同步；
- 信息/配置读取与写入（全部字段，含复位引脚控制 0-7）；
- 目标连接/状态/ID/读写/擦除/OptionByte/复位；
- 写准备、波特率切换；
- 离线工程加载、查询、禁用、启动、状态轮询、切换；
- 广播（有/无应答）、工厂固件；
- AES128-CBC 加密通信（默认 Key/IV 与自定义 Key/IV）；
- CLI 加密参数、十六进制 Key/IV 解析、GUI 加密配置状态；
- C 核心超时行为（100 ms 超时）；
- 标准库串口后端与读线程；
- CLI 参数解析（`--port` 前后两种写法、命令完整性）；
- CLI 全命令在“正常应答”下的端到端逻辑（模拟设备返回正确数据）；
- GUI 全流程在“正常应答”下的控件状态、配置回填、进度、文件读写、广播响应；
- Intel HEX 解析：数据记录、扩展段/线性地址、校验和、重叠检测、多段合并；
- GUI 多段 HEX 写入、地址自动取自文件、逐段校验；
- GUI 启动脱机烧录后的自动状态轮询与停止轮询；
- 批量测试参数：步骤开关、读取/写入地址大小、持久化与恢复；
- 48 种语言资源完整性、占位符签名、元数据、系统语言检测与保存；
- **每个 API 的异常返回值注入**：逐一注入设备错误码，验证客户端抛出
  正确的 `PowerWriterATError`、CLI 错误提示、GUI 错误弹窗；
- 错误响应类型、CRC 错误帧、超时、坏帧后正常帧恢复；
- PowerWriter VID/PID 识别、过滤与自动选口；
- 安全/破坏性示例流程。

## 模拟测试数据（正常 / 异常）

测试中的 `FakeDevice` 完全按照 C 核心的帧格式返回数据（仅测试代码使用，
产品代码不包含协议实现）：

- **正常响应**：`"PWAT" + length + cmdType + cmdSize + property + CRC32`
  - `WriterInfo`：`cmdType=2`，property 64 字节；
  - `StatusOK`：`cmdType=0x7FFFFF9B`，`cmdSize=4`，property 为 0；
  - `TargetMemory`：property 264 字节（地址 + 长度 + 256 字节数据）；
  - `OptionByte`：property 1028 字节；
  - `ProjectInfo`：property 9 字节（激活 + 大小 + CRC32）；
  - 进度：`cmdType=0x7FFFFF9D`，property 为 total/processed。
- **异常响应**：`cmdType=0x7FFFFF9C`（`ATCmdStatusError`），
  `cmdSize=4`，property 为设备错误码；客户端转换为 `PowerWriterATError`，
  CLI 输出 `[错误] ...`，GUI 弹窗并在日志中记录。
- 测试通过 `device.error_overrides[command] = error_code` 为每个 API
  注入异常；例如 `config-get` 注入 `0x24`（`OFFLINE_DISABLE`）、
  `connect` 注入 `0x09`（`TARGET_CONNECT`）。
- CRC 错误帧会被 C 核心丢弃并触发错误事件；如果正常帧随后单独到达，
  命令可以恢复成功。
- 点击 `benchmark`/GUI“示例流程”时，正常响应会驱动完整的分块读写、
  进度回调、工程加载和离线状态轮询逻辑。

## API 覆盖对照

| C API (`powerwriter_at_api.h`) | CLI | GUI |
| --- | --- | --- |
| `powerwriter_at_init` / `datain` | 打开串口时内部完成 | 连接时内部完成 |
| `last_error` / `received_frame` | 错误输出、`status` | 状态栏/日志 |
| `get_writerinfo` | `info` | 设备信息 |
| `get_writerconfig` / `set_writerconfig` | `config-get` / `config-set` | 设备配置 |
| `set_baudrate` | `set-baud` | 设备配置 → AT 接口 |
| `target_connect` / `target_status` / `target_id` | `connect` / `status` / `id` | 目标芯片 |
| `target_read` | `read` | 读取目标内存 |
| `target_write_prepare` / `target_write` | `write-prepare` / `write` | 写准备 / 写入 |
| `target_erase` / `target_erase_sector` | `erase` / `erase-sector` | 擦除 |
| `target_read_ob` / `write_vendor_ob` / `write_user_ob` | `ob-read` / `ob-write-vendor` / `ob-write-user` | OptionByte |
| `target_reset` | `reset` | 复位 |
| `project_info` / `project_load` / `project_disable` | 同名命令 | 离线项目 |
| `offline_start` / `offline_status` | `offline-start` / `offline-status` | 离线烧录 |
| `project_switch` | `project-switch` | 切换工程 |
| `easy_broadcast_no_rsp` / `broadcast` | `broadcast`（`--wait-rsp`） | 广播 |
| `factory_run_sram_fw` / `_flash_fw` | `factory-sram` / `factory-flash` | 工厂测试 |
| `introduction` | `about` | 关于 |
| `benchmark` | `benchmark` | 示例流程 |

## 注意事项

1. **AT 模式**：使用前需在 PowerWriter 设备首选项中开启 AT 模式。
2. **离线工程依赖**：在线操作、离线烧录和 `config-get` 都要求设备中存在
   有效工程。未加载时可能返回 `ATErrorOfflineDisable (0x24)`；先执行
   `project-load` 加载与目标匹配的工程并确认 `project-info` 的 `active=1`。
3. **USB-CDC 与硬件 UART**：USB-CDC 不需要匹配波特率；硬件 UART 默认
   9600。`set-baud` 会先收到旧波特率的应答，然后主机自动切换。
   **PWX1 不支持硬件 UART 口 AT**，`broadcast --wait-rsp` 可能返回
   `ATErrorAtUartDisable (0x60)`，属于设备限制。
4. **固件自定义错误码**：大于 `0x99` 的错误码（例如 0x3F6、0x3FC、
   0x41D）不在开源 `powerwriter_at_error.h` 中，属于设备固件自定义，
   需要结合固件版本/官方软件确认。
5. **AES 加密**：C 核心编译时已启用 `POWERWRITER_AT_ENCRYPT_ENABLE`。
   CLI 用 `--encrypt-key` / `--encrypt-iv` 配置 16 字节密钥和 IV；GUI 勾选
   `AES128-CBC encryption` 后弹出配置对话框。只有设备端也启用了 AT 加密时
   才可使用；不传 Key/IV 时使用 `powerwriter_at_config.h` 的默认值。
6. **文件名编码**：PW200/PW300 使用 GBK，PWX1 使用 UTF-8；客户端会根据
   设备 OEM 自动选择，也可用 `--name-encoding` 强制指定。
7. **破坏性操作**：擦除、写入、写 OptionByte、加载工程、离线烧录会修改
   设备或目标芯片数据；CLI 需要 `--yes`，GUI 会弹窗确认。
8. **超时**：C 核心对普通命令固定 5 秒超时；`target_write` 使用
   `PW_AT_TIMEOUT_WRITE`（20 秒），擦除/OptionByte/工厂命令的超时由参数传入。
   `pwat_port.c` 使用单调时钟替代原始 `clock()`，保证 Linux/macOS 上的
   超时行为正确。
9. **PWX1 专用**：`project-switch` 文档说明仅 PWX1 支持。
10. **C 核心修复/调整**：桥接层通过 `csrc/pwat_bridge.c` 调用原始 API，
    并用 `pwat_port.c` 提供单调时钟/休眠/CRC 移植函数。
    - `powerwriter_at_api.c`：帧头初始化由 `strcpy` 改为 `memcpy`，
      避免把结尾 `\0` 写入 4 字节帧头之外（Linux `_FORTIFY_SOURCE` 会终止进程）。
    - `3rd/crc/crc32.c`：CRC 类型由 `unsigned long` 改为 `uint32_t`，
      避免 LP64 平台（Linux/macOS）上 `unsigned long` 为 64 位导致 CRC 错误。
    - `powerwriter_at_config.h` / `powerwriter_at_api.c`：`ATCmdWriteTargetMemory`
      的超时由固定 5 秒调整为 `PW_AT_TIMEOUT_WRITE`（20 秒），避免 OTP/慢速
      器件在设备完成写入前被主机提前判定为超时。
    前两处为平台兼容修复，第三处为写入超时调整；已在 Windows 和 WSL2 Linux
    上通过同一套测试，并在真实 OTP 芯片上验证了写入成功返回。
11. **OTP 芯片**：OTP 不可擦除。`target_erase` 可能返回成功但不会真正擦除；
    `target_erase_sector` 可能返回 `ATErrorPrivateAlg (0x07)`；写入和离线烧录
    会永久改变 OTP 内容，已写入的位无法恢复。测试前请确认芯片可牺牲。
12. **离线进度哨兵**：部分固件在离线开始阶段返回
    `processed=0xFFFFFFFF` 的“准备中”值；CLI/GUI 会显示“准备中...”，
    不会显示异常百分比。
