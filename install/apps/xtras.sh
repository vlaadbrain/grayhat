#!/bin/bash

if [ -z "$GRAYHAT_BARE" ]; then
  yay -S --noconfirm --needed \
    gnome-calculator gnome-keyring signal-desktop \
    obsidian-bin libreoffice obs-studio kdenlive \
    xournalpp localsend-bin

  # Packages known to be flaky or having key signing issues are run one-by-one
  for pkg in pinta typora spotify zoom; do
    yay -S --noconfirm --needed "$pkg" ||
      echo -e "\e[31mFailed to install $pkg. Continuing without!\e[0m"
  done

  yay -S --noconfirm --needed 1password-beta 1password-cli ||
    echo -e "\e[31mFailed to install 1password. Continuing without!\e[0m"
fi

# Copy over grayhat applications
source ~/.local/share/grayhat/bin/grayhat-refresh-applications || true
