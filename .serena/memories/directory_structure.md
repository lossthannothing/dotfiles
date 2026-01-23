# 项目目录结构

```
.chezmoiroot              # 指向 .dotfile
.dotfile/                 # Chezmoi 管理的文件模板
├── .chezmoimode          # Chezmoi 模式配置
├── AppData/              # Windows 应用数据
├── dot_config/           # 各种配置
│   ├── starship.toml     # Starship 提示符配置
│   └── winfetch/         # Winfetch 配置
├── dot_glzr/             # Glazr 工具配置
│   ├── glazewm/          # GlazeWM 配置
│   │   └── config.yaml
│   └── zebar/            # Zebar 配置
│       ├── dotfile-bar/  # 默认状态栏
│       └── settings.json
├── dot_local/            # 本地工具
│   ├── bin/              # 可执行文件
│   │   ├── btop/         # 系统监控
│   │   ├── winfetch.ps1  # 系统信息
│   │   └── colorscript   # ASCII 艺术
│   └── share/            # 共享资源
│       └── asciiart/     # ASCII 艺术文件
├── dot_rice-manager/     # 主题管理核心
│   ├── rice.sh           # 主题切换脚本
│   ├── wallpaper.sh      # 壁纸切换脚本
│   ├── wackground.ps1    # PowerShell 壁纸设置
│   ├── demo.ts           # 演示文件
│   └── rices/            # 各主题配置目录
│       ├── jade/         # 绿色主题
│       ├── wasabi/       # 蓝色主题
│       ├── aqua/         # 水蓝主题
│       └── shuri/        # 紫色主题
└── dot_zshrc             # Zsh 配置

scripts/                  # Windows 安装/配置脚本
├── install-packages.ps1      # 安装包脚本
├── high-ram-tuning.ps1      # 高内存调优
├── show-cpu-frequency-power-plan-setting.ps1
├── listing-font-details.ps1
└── Restore-old-context-menu.reg

rice-previews/            # 主题预览图
.github/                  # GitHub Actions 配置
.changeset/               # 版本变更记录

主要配置文件位置：
- Windows Terminal: ~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
- VSCode: ~\AppData\Roaming\Code\User\settings.json
- GlazeWM: ~\.glzr\glazewm\config.yaml
- Zebar: ~\.glzr\zebar\
```