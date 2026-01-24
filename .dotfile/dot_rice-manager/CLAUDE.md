# 🎨 主题系统模块

> 🧭 [← 返回根目录](../../CLAUDE.md)

## 概述

主题管理核心模块，负责一键切换 11 个主题，实现 Windows Terminal、Komorebi、Yasb、VSCode 的统一视觉体验。

## 文件结构

```
dot_rice-manager/
├── rice.sh              # 主题切换引擎（核心）
├── wallpaper.sh         # 壁纸切换脚本
├── wackground.ps1       # PowerShell 壁纸设置工具
└── rices/               # 主题配置目录
    ├── jade/            # 默认主题
    ├── wasabi/
    ├── aqua/
    ├── shuri/
    ├── julia/
    ├── khanhoa/
    ├── khlinh/
    ├── meimei/
    ├── mtram/
    ├── tlinh/
    └── arcade/
```

## 核心脚本

### rice.sh

主题切换引擎，执行以下操作：

1. `set_desktop_wallpaper()` - 随机设置主题壁纸
2. `set_windows_terminal_theme()` - 更新终端配色和字体
3. `set_komorebi_config()` - 更新 Komorebi 边框颜色/间距
4. `set_yasb_theme()` - 复制 Yasb 配置和样式
5. `set_vscode_theme()` - 合并 VSCode 主题设置

**依赖：** jq（JSON 处理）

**关键变量：**
- `RICE_SETTING_FILE_PATH` - 主题 settings.json 路径
- `WT_SETTING_FILE_PATH` - Windows Terminal 配置路径
- `KOMOREBI_CONFIG_PATH` - Komorebi 配置路径

### wallpaper.sh

独立壁纸切换，允许使用其他主题的壁纸而不改变整体主题。

## 主题配置标准

每个主题目录必须包含：

```
<theme-name>/
├── settings.json              # 必需 - 核心配置
├── config.yaml                # 必需 - Yasb 配置
├── styles.css                 # 必需 - Yasb 样式
├── wallpapers/                # 必需 - 壁纸目录
│   └── *.jpg|*.png|*.jpeg
└── vscode-theme-settings.json # 可选 - VSCode 覆盖
```

### settings.json 格式

```json
{
  "windowsTheme": "dark|light",
  "windowsTerminalTheme": "配色方案名称",
  "windowsTerminalFont": {
    "face": "SpaceMono Nerd Font",
    "size": 12,
    "cellHeight": "1.2"
  },
  "komorebiConfig": {
    "borderColours": {
      "single": "#hex",
      "stack": "#hex",
      "monocle": "#hex",
      "unfocused": "#hex",
      "floating": "#hex"
    },
    "borderWidth": 4,
    "borderStyle": "System|Rounded|Square",
    "workspacePadding": 8,
    "containerPadding": 8,
    "workAreaOffset": {
      "top": 0,
      "bottom": 48,
      "left": 0,
      "right": 0
    }
  }
}
```

## 添加新主题

1. 在 `rices/` 下创建主题目录
2. 创建 `settings.json`（参考上述格式）
3. 创建 `config.yaml` 和 `styles.css`（Yasb 配置）
4. 添加壁纸到 `wallpapers/`
5. 在 `rice.sh` 的 `availableThemes` 数组中添加主题名

```bash
# rice.sh 第 6 行
availableThemes=("jade" "wasabi" ... "your-new-theme")
```

## 常见问题

### jq 报错 "Could not open file"

**原因：** 路径变量未正确定义或路径包含空格未转义

**解决：** 确保使用双引号包裹路径变量

```bash
# 正确
jq -r '.key' "$RICE_SETTING_FILE_PATH"

# 错误
jq -r '.key' $RICE_SETTING_FILE_PATH
```

### 主题切换后配置未生效

**检查项：**
1. Komorebi 是否运行：`komorebic state`
2. Yasb 是否重启：`tasklist | grep yasb`
3. Windows Terminal 是否需要重启
