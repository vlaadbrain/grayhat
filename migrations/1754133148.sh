echo "Update Waybar CSS to dim unused workspaces"

if ! grep -q "#workspaces button\.empty" ~/.config/waybar/style.css; then
  grayhat-refresh-config waybar/style.css
  grayhat-restart-waybar
fi
