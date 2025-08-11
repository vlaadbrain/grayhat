echo "Start screensaver automatically after 1 minute and stop before locking"

if ! grep -q "grayhat-launch-screensaver" ~/.config/hypr/hypridle.conf; then
  grayhat-refresh-hypridle
  grayhat-refresh-hyprlock
fi
