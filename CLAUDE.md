# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 概述

这是一个使用 Chezmoi 管理的 Windows 11 桌面美化（ricing）配置仓库。核心工具栈：Windows Terminal + Zsh (MSYS2) + GlazeWM (平铺窗口管理器) + Zebar (状态栏)。

## 目录结构

```
.chezmoiroot       # 指向 .dotfile
.dotfile/          # Chezmoi 管理的文件模板
  dot_rice-manager/    # 主题管理核心
    rice.sh            # 主题切换脚本
    wallpaper.sh       # 壁纸切换脚本
    wackground.ps1     # PowerShell 壁纸设置
    rices/             # 各主题配置目录
scripts/           # Windows 安装/配置脚本
```

## 主题系统

### 可用主题
- `jade` - 默认主题，绿色系
- `wasabi` - 蓝色系
- `aqua` - 水蓝色系
- `shuri` - 紫色系

### 主题切换

从 Zsh 终端执行：
```bash
rice <theme-name>    # 切换完整主题
wallpaper <theme-name>  # 仅切换壁纸
```

### 主题配置文件结构

每个主题位于 `.dotfile/dot_rice-manager/rices/<theme-name>/`，包含：

| 文件 | 用途 |
|------|------|
| `settings.json` | 核心配置（终端主题、GlazeWM 颜色、Windows 模式等） |
| `dotfile-bar/` | Zebar 状态栏配置 (HTML/CSS/zpack.json) |
| `vscode-theme-settings.json` | VSCode 主题覆盖配置 |
| `wallpapers/` | 该主题的壁纸集 |

### 主题配置格式 (settings.json)

```json
{
  "windowsTheme": "dark|light",
  "windowsTerminalTheme": "Terminal配置中的配色名称",
  "windowsTerminalFont": {"face": "字体名", "size": 12},
  "glazewmConfig": {
    "focusedWindowsColor": "#hex",
    "otherWindowsColor": "#hex",
    "windowsGap": "12px",
    "cornerStyle": "small_rounded|square|rounded"
  }
}
```

## Zsh 配置

### 别名
- `cmsp` - 快速跳转到 chezmoi 源目录
- `rice` - 主题切换
- `wallpaper` - 壁纸切换
- `update` - 更新 winget 和 pacman
- `btop` - 运行 btop 监控

### 插件（手动加载，位于 ~/.config/zsh/plugins/）
- zsh-autosuggestions
- zsh-history-substring-search
- fast-syntax-highlighting

## 安装与更新

### 包安装
```powershell
powershell ./scripts/install-packages.ps1
```

### Chezmoi 操作
```bash
chezmoi init --apply jade-tam    # 初始化并应用
chezmoi add <file>               # 添加新配置
chezmoi apply                    # 应用变更
```

## 关键工具

| 工具 | 版本 | 用途 |
|------|------|------|
| GlazeWM | 3.9.1 | 平铺窗口管理器 |
| Zebar | 随 GlazeWM | 状态栏 |
| jq/yq | - | JSON/YAML 配置解析 |
| MSYS2 | - | Unix 工具链，Zsh 运行环境 |
