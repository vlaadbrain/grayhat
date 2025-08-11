echo "Change reload Waybar on unlock command to prevent stacking"

if ! grep -q 'on_unlock_cmd *= *grayhat-restart-waybar' ~/.config/hypr/hypridle.conf; then
  sed -i \
    '/^    on_unlock_cmd = pkill -SIGUSR2 waybar[[:space:]]*# prevent stacking of waybar when waking$/c\
    on_unlock_cmd = grayhat-restart-waybar  # prevent stacking of waybar when waking' \
    ~/.config/hypr/hypridle.conf

  grayhat-restart-waybar
fi
