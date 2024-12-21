#! /bin/bash
set -e

# KDE alapcsomagok telepitese

sudo pacman -Sy plasma-desktop plasma-wayland-session kde-applications sddm sddm-kcm

# SDDM elindítása
sudo systemctl start sddm.service
sudo systemctl enable sddm.service