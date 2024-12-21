#! /bin/bash
set -e

# Cinnamon alapcsomagok telepítése
sudo pacman -Sy cinnamon nemo-fileroller cinnamon-translations

# LightDM elindítása
sudo systemctl start lightdm.service
sudo systemctl enable lightdm.service