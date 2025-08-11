#!/bin/bash

# Use dark mode for QT apps too (like kdenlive)
if ! yay -Q kvantum-qt5 &>/dev/null; then
  yay -S --noconfirm kvantum-qt5
fi

# Prefer dark mode everything
if ! yay -Q gnome-themes-extra &>/dev/null; then
  yay -S --noconfirm gnome-themes-extra # Adds Adwaita-dark theme
fi

# Allow icons to match the theme
if ! yay -! yaru-icon-theme &>/dev/null; then
  yay -S --noconfirm yaru-icon-theme
fi

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-blue"

# Setup theme links
mkdir -p ~/.config/grayhat/themes
for f in ~/.local/share/grayhat/themes/*; do ln -nfs "$f" ~/.config/grayhat/themes/; done

# Set initial theme
mkdir -p ~/.config/grayhat/current
ln -snf ~/.config/grayhat/themes/tokyo-night ~/.config/grayhat/current/theme
ln -snf ~/.config/grayhat/current/theme/backgrounds/1-scenery-pink-lakeside-sunset-lake-landscape-scenic-panorama-7680x3215-144.png ~/.config/grayhat/current/background

# Set specific app links for current theme
ln -snf ~/.config/grayhat/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/grayhat/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/.config/grayhat/current/theme/mako.ini ~/.config/mako/config
