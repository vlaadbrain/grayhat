echo "Add icon theme coloring"

if ! yay -! yaru-icon-theme &>/dev/null; then
  yay -S --noconfirm yaru-icon-theme

  if [[ -f ~/.config/grayhat/current/theme/icons.theme ]]; then
    gsettings set org.gnome.desktop.interface icon-theme "$(<~/.config/grayhat/current/theme/icons.theme)"
  fi
fi
