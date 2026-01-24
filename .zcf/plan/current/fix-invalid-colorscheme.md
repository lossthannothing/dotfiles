# 任务：修复无效的 Windows Terminal colorScheme

> 📅 创建时间: 2026-01-23 23:45:45
> 📌 状态: 待执行

## 问题描述

Windows Terminal 加载时报错：配置文件中的 `colorScheme` 与 `schemes` 列表不匹配。

## 影响范围

6 个主题配置存在无效 colorScheme：
- `arcade` → "Arcade" (不存在)
- `khanhoa` → "Catppuccin Latte" (不存在)
- `khlinh` → "Nord" (不存在)
- `meimei` → "Gruvbox Dark" (不存在)
- `mtram` → "Everforest Dark" (不存在)
- `tlinh` → "Catppuccin Mocha" (不存在)

## 执行计划

### Step 1: 获取标准配色方案定义
- [ ] 获取 Catppuccin Latte 官方定义
- [ ] 获取 Catppuccin Mocha 官方定义
- [ ] 获取 Nord 官方定义
- [ ] 获取 Gruvbox Dark 官方定义
- [ ] 获取 Everforest Dark 官方定义
- [ ] 创建 Arcade 霓虹风格配色

### Step 2: 添加配色方案到 Windows Terminal
- [ ] 读取当前 Windows Terminal settings.json
- [ ] 添加 6 个配色方案到 schemes 数组
- [ ] 保存更新后的配置

### Step 3: 验证修复结果
- [ ] 检查所有主题的 colorScheme 是否有效
- [ ] 测试 Windows Terminal 加载是否正常

## 配色方案来源

| 方案 | 来源 |
|------|------|
| Catppuccin Latte/Mocha | catppuccin/windows-terminal |
| Nord | nordtheme/windows-terminal |
| Gruvbox Dark | 社区标准定义 |
| Everforest Dark | sainnhe/everforest |
| Arcade | 自定义霓虹风格 |
