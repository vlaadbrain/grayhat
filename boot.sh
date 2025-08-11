#!/bin/bash

ansi_art='                 ▄▄▄                                                   
 ▄█████▄    ▄███████████▄    ▄███████   ▄███████   ▄███████   ▄█   █▄    ▄█   █▄ 
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   ███  ███   ███  ███   ███
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   █▀   ███   ███  ███   ███
███   ███  ███   ███   ███ ▄███▄▄▄███ ▄███▄▄▄██▀  ███       ▄███▄▄▄███▄ ███▄▄▄███
███   ███  ███   ███   ███ ▀███▀▀▀███ ▀███▀▀▀▀    ███      ▀▀███▀▀▀███  ▀▀▀▀▀▀███
███   ███  ███   ███   ███  ███   ███ ██████████  ███   █▄   ███   ███  ▄██   ███
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   ███  ███   ███  ███   ███
 ▀█████▀    ▀█   ███   █▀   ███   █▀   ███   ███  ███████▀   ███   █▀    ▀█████▀ 
                                       ███   █▀                                  '

clear
echo -e "\n$ansi_art\n"

sudo pacman -Sy --noconfirm --needed git

# Use custom repo if specified, otherwise default to vlaadbrain/grayhat
GRAYHAT_REPO="${GRAYHAT_REPO:-vlaadbrain/grayhat}"

echo -e "\nCloning Grayhat from: https://github.com/${GRAYHAT_REPO}.git"
rm -rf ~/.local/share/grayhat/
git clone "https://github.com/${GRAYHAT_REPO}.git" ~/.local/share/grayhat >/dev/null

# Use custom branch if instructed
if [[ -n "$GRAYHAT_REF" ]]; then
  echo -e "\eUsing branch: $GRAYHAT_REF"
  cd ~/.local/share/grayhat
  git fetch origin "${GRAYHAT_REF}" && git checkout "${GRAYHAT_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/grayhat/install.sh
