#!/bin/bash

#  Rice script
#  Author  :  aquapaka
#  Url     :  https://github.com/aquapaka/dotfiles
#  About   :  This file will configure and launch the rice.
#

availableThemes=("jade" "wasabi" "aqua" "shuri" "arcade" "julia" "khanhoa" "khlinh" "meimei" "mtram" "tlinh")

usage() {
  printf "
Rice Script for change rice's current wallpaper

Usage:
$(basename $0)\t[jade]    \t Introspective and layered, a soul with raw edges, nostalgic warmth
\t[wasabi]  \t Mysterious and alluring, with eyes like deep ocean blue
\t[aqua]    \t Full of curiosity and charm, like ocean waves
\t[shuri]   \t A gentle presence in shades of purple, like twilight's soft embrace
\t[arcade]  \t Neon gamer vibes, electrifying and bold
\t[julia]   \t Horizon dark theme with warm colors
\t[khanhoa] \t Light theme with natural green accents
\t[khlinh]  \t Tomorrow night theme with cozy colors
\t[meimei]  \t Simple-Elegance dark theme with yellow accent
\t[mtram]   \t Everforest dark theme
\t[tlinh]   \t Monokai pro theme with vibrant colors
"
}

# Set desktop wallpaper
set_desktop_wallpaper() {
  powershell ./wackground.ps1 ./rices/$theme/wallpapers --set-random
}

# Goes to this script location first
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

for theme in "${availableThemes[@]}"; do
  if [[ "$1" == "$theme" ]]; then
    echo "Changing wallpaper to $theme theme's wallpaper..."

    # # Apply configs
    set_desktop_wallpaper

    echo "Completed!"
    exit 0
  fi
done

usage
