echo "Add Catppuccin Latte light theme"
if [[ ! -L "~/.config/grayhat/themes/catppuccin-latte" ]]; then
  ln -snf ~/.local/share/grayhat/themes/catppuccin-latte ~/.config/grayhat/themes/
fi
