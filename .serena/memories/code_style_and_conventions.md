# 代码风格与约定

## 命名约定

- **函数名**: 小写 + 下划线 (snake_case), 如 `set_zebar_theme`, `set_desktop_wallpaper`
- **变量名**: 小写或大写常量, 如 `theme`, `avaiableThemes`
- **脚本文件**: 小写, 如 `rice.sh`, `wallpaper.sh`
- **配置目录**: 小写 + 连字符, 如 `dotfile-bar`

## 代码风格

### Bash 脚本

- 使用 `#!/bin/bash` shebang
- 函数定义使用传统的 bash 语法
- 多行命令使用 `\` 续行
- 错误输出重定向到 `/dev/null 2>&1`

### 配置文件

- JSON 文件使用双引号
- YAML 缩进使用 2 空格
- 使用 jq 处理 JSON 配置
- 使用 yq 处理 YAML 配置

## 主题配置约定

每个主题目录结构：
```
.<theme-name>/
├── settings.json           # 核心配置（终端主题、GlazeWM 颜色等）
├── dotfile-bar/            # Zebar 状态栏
│   ├── bar.html
│   ├── styles.css
│   └── zpack.json
├── vscode-theme-settings.json  # VSCode 主题覆盖
└── wallpapers/                # 壁纸图片
```

## 代码模板

主题 `settings.json` 格式：
```json
{
  "windowsTheme": "dark|light",
  "windowsTerminalTheme": "配色名称",
  "windowsTerminalFont": {"face": "字体名", "size": 12},
  "glazewmConfig": {
    "focusedWindowsColor": "#hex",
    "otherWindowsColor": "#hex",
    "windowsGap": "12px",
    "cornerStyle": "small_rounded|square|rounded"
  }
}
```
