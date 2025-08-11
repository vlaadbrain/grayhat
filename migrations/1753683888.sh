echo "Adding Grayhat version info to fastfetch"
if ! grep -q "grayhat" ~/.config/fastfetch/config.jsonc; then
  cp ~/.local/share/grayhat/config/fastfetch/config.jsonc ~/.config/fastfetch/
fi

