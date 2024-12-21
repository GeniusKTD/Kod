#! /bin/bash
set -e

# Alapcsomagok telepitese

sudo pacman -Syu
sudo pacman -Sy bash-completion git wget base base-devel mc cups gvfs ntfs-3g zenity ffmpeg flatpak gedit unzip wget --noconfirm

## yay telepites
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

sudo systemctl start cups.service
sudo systemctl enable cups.service