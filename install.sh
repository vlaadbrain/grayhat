#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

GRAYHAT_INSTALL=~/.local/share/grayhat/install

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31mGrayhat installation failed!\e[0m"
  echo "You can retry by running: bash ~/.local/share/grayhat/install.sh"
}

trap catch_errors ERR

show_logo() {
  clear
  tte -i ~/.local/share/grayhat/logo.txt --frame-rate ${2:-120} ${1:-expand}
  echo
}

show_subtext() {
  echo "$1" | tte --frame-rate ${3:-640} ${2:-wipe}
  echo
}

# Install prerequisites
source $GRAYHAT_INSTALL/preflight/aur.sh
source $GRAYHAT_INSTALL/preflight/presentation.sh
source $GRAYHAT_INSTALL/preflight/migrations.sh

# Configuration
show_logo beams 240
show_subtext "Let's install Grayhat! [1/5]"
source $GRAYHAT_INSTALL/config/identification.sh
source $GRAYHAT_INSTALL/config/config.sh
source $GRAYHAT_INSTALL/config/detect-keyboard-layout.sh
source $GRAYHAT_INSTALL/config/fix-fkeys.sh
source $GRAYHAT_INSTALL/config/network.sh
source $GRAYHAT_INSTALL/config/power.sh
source $GRAYHAT_INSTALL/config/timezones.sh
source $GRAYHAT_INSTALL/config/login.sh
source $GRAYHAT_INSTALL/config/nvidia.sh
source $GRAYHAT_INSTALL/config/displaylink.sh

# Development
show_logo decrypt 920
show_subtext "Installing terminal tools [2/5]"
source $GRAYHAT_INSTALL/development/terminal.sh
source $GRAYHAT_INSTALL/development/development.sh
source $GRAYHAT_INSTALL/development/nvim.sh
source $GRAYHAT_INSTALL/development/ruby.sh
source $GRAYHAT_INSTALL/development/docker.sh
source $GRAYHAT_INSTALL/development/firewall.sh

# Desktop
show_logo slice 60
show_subtext "Installing desktop tools [3/5]"
source $GRAYHAT_INSTALL/desktop/desktop.sh
source $GRAYHAT_INSTALL/desktop/hyprlandia.sh
source $GRAYHAT_INSTALL/desktop/theme.sh
source $GRAYHAT_INSTALL/desktop/bluetooth.sh
source $GRAYHAT_INSTALL/desktop/asdcontrol.sh
source $GRAYHAT_INSTALL/desktop/fonts.sh
source $GRAYHAT_INSTALL/desktop/printer.sh

# Apps
show_logo expand
show_subtext "Installing default applications [4/5]"
source $GRAYHAT_INSTALL/apps/webapps.sh
source $GRAYHAT_INSTALL/apps/xtras.sh
source $GRAYHAT_INSTALL/apps/mimetypes.sh

# Updates
show_logo highlight
show_subtext "Updating system packages [5/5]"
sudo updatedb
sudo pacman -Syu --noconfirm

# Reboot
show_logo laseretch 920
show_subtext "You're done! So we'll be rebooting now..."
sleep 2
reboot
