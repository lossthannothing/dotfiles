# 🔧 脚本工具模块

> 🧭 [← 返回根目录](../CLAUDE.md)

## 概述

Windows 安装和系统优化脚本集合，使用 PowerShell 编写。

## 文件列表

| 脚本 | 用途 |
|------|------|
| `install-packages.ps1` | 通过 winget 安装必要软件包 |
| `high-ram-tuning.ps1` | 高内存系统性能优化 |
| `show-cpu-frequency-power-plan-setting.ps1` | 显示 CPU 频率电源设置 |
| `listing-font-details.ps1` | 列出已安装字体详情 |
| `Restore-old-context-menu.reg` | 恢复 Windows 11 经典右键菜单 |

## install-packages.ps1

### 必装软件

```powershell
# 窗口管理
winget install glzr-io.glazewm      # GlazeWM 平铺窗口管理器
winget install glzr-io.zebar        # Zebar 状态栏

# 开发环境
winget install MSYS2.MSYS2          # Unix 工具链
winget install jqlang.jq            # JSON 处理
winget install mikefarah.yq         # YAML 处理

# 终端工具
winget install Starship.Starship    # 提示符主题
```

### 可选软件

脚本中已注释的可选安装项，按需取消注释。

## high-ram-tuning.ps1

针对高内存（≥16GB）系统的优化：

- 禁用页面文件压缩
- 调整内存管理策略
- 优化磁盘缓存

**运行方式：**
```powershell
# 以管理员身份运行
powershell -ExecutionPolicy Bypass -File ./high-ram-tuning.ps1
```

## show-cpu-frequency-power-plan-setting.ps1

解锁隐藏的 CPU 频率控制选项，用于笔记本降温。

**运行后：**
1. 打开"编辑电源计划"
2. 更改高级电源设置
3. 处理器电源管理 → 最大处理器频率

## 执行策略

首次运行前需启用脚本执行：

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

或单次绕过：

```powershell
powershell -ExecutionPolicy Bypass -File ./script.ps1
```
