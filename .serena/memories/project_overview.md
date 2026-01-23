# 项目概述

这是一个使用 Chezmoi 管理的 Windows 11 桌面美化（ricing）配置仓库。

## 项目目的

- 在 Windows 11 上实现类似 Linux 的桌面定制化体验
- 无需 WSL，使用 MSYS2 运行原生 shell 脚本
- 实现一键切换桌面主题和壁纸
- 为 ricing/unixporn 爱好者提供完整的 Windows 美化解决方案

## 核心技术栈

| 组件 | 版本/类型 | 用途 |
|------|----------|------|
| Windows Terminal | - | 终端模拟器 |
| Shell | Zsh (MSYS2) | 交互式 shell |
| Tiling Window Manager | GlazeWM 3.9.1 | 平铺窗口管理 |
| Bar | Zebar 3.1.1 | 状态栏 |
| Package Manager | Winget, Pacman | 包管理 |
| Dotfiles Manager | Chezmoi | 配置管理 |
| Prompt | Starship | 提示符主题 |

## 项目语言

- **Bash** - 主题切换脚本 (rice.sh, wallpaper.sh)
- **PowerShell** - Windows 配置脚本
- **YAML** - GlazeWM, Zebar 配置
- **JSON** - 主题配置
- **TOML** - Starship 配置