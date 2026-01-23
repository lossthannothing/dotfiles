# 任务完成检查清单

完成代码修改后，需要执行以下检查：

## 主题相关修改

- 如果你修改了主题配置 (`.dotfile/dot_rice-manager/rices/*/settings.json`)
  - 运行 `rice <theme-name>` 测试主题切换
  - 检查各组件是否正常应用新配置

- 如果你修改了 Zebar 配置
  - 重启 Zebar 使配置生效
  - 检查状态栏显示是否正常

- 如果你修改了 GlazeWM 配置
  - 运行 `glazewm command wm-reload-config` 重载配置
  - 检查窗口边框、间距等是否正常

## 脚本修改

- 如果修改了 `rice.sh` 或 `wallpaper.sh`
  - 运行脚本测试，确保不报错
  - 验证功能是否按预期工作

- 如果修改了 PowerShell 脚本
  - 在 PowerShell 中测试执行
  - 确保无语法错误

## 配置相关操作

- 添加新文件到 Chezmoi 管理：`chezmoi add <file>`
- 应用配置变更：`chezmoi apply`
- 标记文件为不可变（模板）：`chezmoi managed edit <file>`

## Git 提交（仅在用户要求时）

用户未要求时不要执行 git 操作。

用户要求提交时：
1. `git status` - 查看变更
2. `git add` - 添加变更
3. `git commit` - 提交变更
4. `git push` - 推送到远程

## 注意事项

- 项目没有自动化测试套件
- 主要依赖手动测试验证
- Windows 环境下命令可能需要使用双引号包裹路径
- MSYS2 环境和 PowerShell 环境命令不同，注意区分
