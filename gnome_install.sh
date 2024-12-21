#! /bin/bash
set -e

# Gnome alapcsomagok es wayland

sudo pacman -Sy gdm gnome-session gnome-settings-daemon gnome-terminal gnome-disk-utility gnome-system-monitor gnome-control-center gnome-browser-connector gnome-calculator ttf-ubuntu-font-family
yay -Sy gdm-tools

# gdm elinditasa

sudo systemctl start gdm.service
sudo systemctl enable gdm.service

# geo letiltasa

sudo systemctl disable geoclue.service
sudo systemctl mask geoclue.service

git clone https://aur.archlinux.org/yaru.git
cd yaru
makepkg -si --noconfirm
cd ..
rm -rf yaru