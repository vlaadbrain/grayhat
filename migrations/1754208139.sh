echo "Ensure screensaver doesn't start while the computer is locked"
if ! grep -q "pidof hyprlock || grayhat-launch-screensaver" ~/.config/hypr/hypridle.conf; then
  grayhat-refresh-hypridle
fi
