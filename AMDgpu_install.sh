#! /bin/bash
set -e

# mesa telepites

sudo pacman -Sy mesa lib32-mesa mesa-vdpau lib32-mesa-vdpau xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon mesa-utils --noconfirm --needed

# mesa git ha kell
# yay -Sy mesa-git
