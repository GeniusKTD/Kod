#! /bin/bash
set -e

# Alapcsomagok telepitese

sudo pacman -Syu
sudo pacman -S bash-completion git wget base base-devel mc gvfs ntfs-3g zenity
