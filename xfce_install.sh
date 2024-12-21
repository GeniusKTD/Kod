#! /bin/bash
set -e

# XFCE alapcsomagok telepítése
sudo pacman -Sy xfce4 xfce4-goodies lightdm lightdm-gtk-greeter

# LightDM elindítása
sudo systemctl start lightdm.service
sudo systemctl enable lightdm.service