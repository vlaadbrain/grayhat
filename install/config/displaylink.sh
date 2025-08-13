#!/bin/bash

# ==============================================================================
# Hyprland DisplayLink Setup Script for Arch Linux
# ==============================================================================
# This scirpt automates the installation of DisplayLink drivers for an IBM
# ThinkPad Docking Station with DisplayLink, kinda has to run while plugged in
#
# Author: https://github.com/Kn0ax
# Author: https://github.com/vlaadbrain
# ==============================================================================

show_logo
show_subtext "Install DisplayLink drivers..."

# Check which kernel is installed and set appropriate headers package
KERNEL_HEADERS="linux-headers" # Default
if pacman -Q linux-zen &>/dev/null; then
  KERNEL_HEADERS="linux-zen-headers"
elif pacman -Q linux-lts &>/dev/null; then
  KERNEL_HEADERS="linux-lts-headers"
elif pacman -Q linux-hardened &>/dev/null; then
  KERNEL_HEADERS="linux-hardened-headers"
fi

# force package database refresh
sudo pacman -Syy

# Install packages
PACKAGES_TO_INSTALL=(
  "${KERNEL_HEADERS}"
  "dkms"
  "evdi-dkms"
  "displaylink"
)

yay -S --needed --noconfirm "${PACKAGES_TO_INSTALL[@]}"

sudo systemctl enable displaylink.service
