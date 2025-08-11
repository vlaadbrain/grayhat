echo "Allow updating of timezone by right-clicking on the clock (or running grayhat-cmd-tzupdate)"
if ! command -v tzupdate &>/dev/null; then
  bash ~/.local/share/grayhat/install/config/timezones.sh
  grayhat-refresh-waybar
fi
