#!/bin/bash

# Rice script for Yasb + Komorebi
# Modified for Komorebi + yasb

availableThemes=("jade" "wasabi" "aqua" "shuri" "arcade" "julia" "khanhoa" "khlinh" "meimei" "mtram" "tlinh")

usage() {
  printf "
Rice Script for Yasb + Komorebi

Usage:
$(basename $0)\t[jade]    \t Introspective and layered, a soul with raw edges, nostalgic warmth
\t[wasabi]  \t Mysterious and alluring, with eyes like deep ocean blue
\t[aqua]    \t Full of curiosity and charm, like ocean waves
\t[shuri]   \t A gentle presence in shades of purple, like twilight's soft embrace
\t[arcade]  \t Neon gamer vibes, electrifying and bold
\t[julia]   \t Horizon dark theme with warm colors
\t[khanhoa] \t Light theme with natural green accents
\t[khlinh]  \t Tomorrow night theme with cozy colors
\t[meimei]  \t Simple-Elegance Gruvbox dark theme with yellow accent
\t[mtram]   \t Everforest dark theme
\t[tlinh]   \t Monokai pro theme with vibrant colors
"
}

# Set Komorebi config
set_komorebi_config() {
  echo "Applying Komorebi config..."
  KOMOREBI_CONFIG_PATH="$USERPROFILE/.config/komorebi/komorebi.json"
  RICE_SETTING_FILE_PATH="./rices/$theme/settings.json"

  # Read komorebiConfig from settings.json
  border_single=$(jq -r '.komorebiConfig.borderColours.single' "$RICE_SETTING_FILE_PATH")
  border_stack=$(jq -r '.komorebiConfig.borderColours.stack' "$RICE_SETTING_FILE_PATH")
  border_monocle=$(jq -r '.komorebiConfig.borderColours.monocle' "$RICE_SETTING_FILE_PATH")
  border_unfocused=$(jq -r '.komorebiConfig.borderColours.unfocused' "$RICE_SETTING_FILE_PATH")
  border_floating=$(jq -r '.komorebiConfig.borderColours.floating' "$RICE_SETTING_FILE_PATH")
  border_width=$(jq -r '.komorebiConfig.borderWidth' "$RICE_SETTING_FILE_PATH")
  border_style=$(jq -r '.komorebiConfig.borderStyle' "$RICE_SETTING_FILE_PATH")
  workspace_padding=$(jq -r '.komorebiConfig.workspacePadding' "$RICE_SETTING_FILE_PATH")
  container_padding=$(jq -r '.komorebiConfig.containerPadding' "$RICE_SETTING_FILE_PATH")
  offset_top=$(jq -r '.komorebiConfig.workAreaOffset.top' "$RICE_SETTING_FILE_PATH")
  offset_bottom=$(jq -r '.komorebiConfig.workAreaOffset.bottom' "$RICE_SETTING_FILE_PATH")
  offset_left=$(jq -r '.komorebiConfig.workAreaOffset.left' "$RICE_SETTING_FILE_PATH")
  offset_right=$(jq -r '.komorebiConfig.workAreaOffset.right' "$RICE_SETTING_FILE_PATH")

  # Update komorebi.json
  jq ".border_colours.single = \"$border_single\" |
      .border_colours.stack = \"$border_stack\" |
      .border_colours.monocle = \"$border_monocle\" |
      .border_colours.unfocused = \"$border_unfocused\" |
      .border_colours.floating = \"$border_floating\" |
      .border_width = $border_width |
      .border_style = \"$border_style\" |
      .default_workspace_padding = $workspace_padding |
      .default_container_padding = $container_padding |
      .global_work_area_offset.top = $offset_top |
      .global_work_area_offset.bottom = $offset_bottom |
      .global_work_area_offset.left = $offset_left |
      .global_work_area_offset.right = $offset_right" \
    "$KOMOREBI_CONFIG_PATH" > tmp.json && mv tmp.json "$KOMOREBI_CONFIG_PATH"

  # Reload Komorebi configuration
  komorebic reload-configuration > /dev/null 2>&1
  echo "Komorebi config applied!"
}

# Set yasb theme (config + styles)
set_yasb_theme() {
  echo "Applying yasb theme..."
  YASB_CONFIG_PATH="$USERPROFILE/.config/yasb/config.yaml"
  YASB_STYLES_PATH="$USERPROFILE/.config/yasb/styles.css"
  RICE_YASB_CONFIG="./rices/$theme/config.yaml"
  RICE_YASB_STYLES="./rices/$theme/styles.css"

  # Copy config if exists
  if [ -f "$RICE_YASB_CONFIG" ]; then
    cp "$RICE_YASB_CONFIG" "$YASB_CONFIG_PATH"
    echo "  - Yasb config applied"
  else
    echo "  - Yasb config not found for $theme, skipping..."
  fi

  # Copy styles if exists
  if [ -f "$RICE_YASB_STYLES" ]; then
    cp "$RICE_YASB_STYLES" "$YASB_STYLES_PATH"
    echo "  - Yasb styles applied"
  else
    echo "  - Yasb styles not found for $theme, skipping..."
  fi

  # Restart yasb (use powershell for reliable process management)
  powershell.exe -Command "Stop-Process -Name yasb -Force -ErrorAction SilentlyContinue; Start-Sleep -Milliseconds 500; Start-Process yasb -WindowStyle Hidden" > /dev/null 2>&1
  echo "Yasb theme applied!"
}

# Set VSCode theme
set_vscode_theme() {
  echo "Applying VSCode theme..."
  vscode_settings="$USERPROFILE/AppData/Roaming/Code/User/settings.json"
  vscode_theme_settings="./rices/$theme/vscode-theme-settings.json"

  if [ -f "$vscode_theme_settings" ]; then
    echo "$(jq -s '.[0] * .[1]' "$vscode_theme_settings" "$vscode_theme_settings")" > tmp.json && mv tmp.json "$vscode_settings"
    echo "VSCode theme applied!"
  else
    echo "VSCode theme settings not found, skipping..."
  fi
}

# Set windows terminal theme
set_windows_terminal_theme() {
  echo "Applying windows terminal theme..."
  # Rice 配置文件路径（读取主题设置）
  RICE_SETTING_FILE_PATH="./rices/$theme/settings.json"
  # Windows Terminal 真正的 settings.json 路径
  WT_SETTING_FILE_PATH="$LOCALAPPDATA/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"

  THEME_NAME=$(jq -r '.windowsTerminalTheme' "$RICE_SETTING_FILE_PATH")
  FONT_NAME=$(jq -r '.windowsTerminalFont.face' "$RICE_SETTING_FILE_PATH")
  FONT_SIZE=$(jq -r '.windowsTerminalFont.size' "$RICE_SETTING_FILE_PATH")
  FONT_CELL_HEIGHT=$(jq -r '.windowsTerminalFont.cellHeight' "$RICE_SETTING_FILE_PATH")

  echo "  Theme: $THEME_NAME"
  echo "  Font: $FONT_NAME"

  # 修改 Windows Terminal 配置
  jq ".profiles.defaults.colorScheme = \"$THEME_NAME\"" "$WT_SETTING_FILE_PATH" > tmp.json && mv tmp.json "$WT_SETTING_FILE_PATH"
  jq ".profiles.defaults.font.face = \"$FONT_NAME\"" "$WT_SETTING_FILE_PATH" > tmp.json && mv tmp.json "$WT_SETTING_FILE_PATH"
  jq ".profiles.defaults.font.size = $FONT_SIZE" "$WT_SETTING_FILE_PATH" > tmp.json && mv tmp.json "$WT_SETTING_FILE_PATH"

  if [ "$FONT_CELL_HEIGHT" != "null" ]; then
    jq ".profiles.defaults.font.cellHeight = \"$FONT_CELL_HEIGHT\"" "$WT_SETTING_FILE_PATH" > tmp.json && mv tmp.json "$WT_SETTING_FILE_PATH"
  fi

  echo "Windows terminal theme applied!"
}

# Change windows light/dark mode
change_windows_lightdark_mode() {
  echo "Changing windows color scheme..."
  WINDOWS_THEME=$(jq -r '.windowsTheme' ./rices/$theme/settings.json)
  if [ "$WINDOWS_THEME" == "dark" ]
    then powershell "New-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name SystemUsesLightTheme -Value '0' -Type Dword -Force | Out-Null";
         powershell "New-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name AppsUseLightTheme -Value '0' -Type Dword -Force | Out-Null"
  elif [ "$WINDOWS_THEME" == "light" ]
    then powershell "New-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name SystemUsesLightTheme -Value '1' -Type Dword -Force | Out-Null";
         powershell "New-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name AppsUseLightTheme -Value '1' -Type Dword -Force | Out-Null";
  else
    echo "Error: windows-theme must be light or dark"
    return 1
  fi
  echo "Restart explorer... (Taskbar might take sometime to show up)"
  powershell "taskkill /F /IM explorer.exe | Out-Null; start explorer"
  echo "Windows color scheme changed!"
}

# Set desktop wallpaper
set_desktop_wallpaper() {
  echo "Changing desktop wallpaper..."
  powershell ./wackground.ps1 ./rices/$theme/wallpapers --set-random
  echo "Desktop wallpaper changed!"
}

# Goes to this script location first
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

for theme in "${availableThemes[@]}"; do
  if [[ "$1" == "$theme" ]]; then
    echo "Applying $theme theme"
    echo " "

    # Apply configs
    set_desktop_wallpaper
    set_windows_terminal_theme
    set_komorebi_config
    set_yasb_theme
    set_vscode_theme
    # change_windows_lightdark_mode # Disabled, currently too buggy

    echo " "
    echo "Theme changing completed!"

    exit 0
  fi
done

usage
