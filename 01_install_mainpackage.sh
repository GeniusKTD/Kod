#! /bin/bash
set -e

# Alapcsomagok telepitese

sudo pacman -Syu
sudo pacman -Sy bash-completion git wget base base-devel mc cups gvfs ntfs-3g zenity ffmpeg flatpak gedit unzip wget dialog man --noconfirm

# Eredeti sudoers fájl mentése
sudo cp /etc/sudoers /etc/sudoers.bak

# Jelszó nélküli sudo engedélyezése a makepkg parancshoz
echo '%wheel ALL=(ALL) NOPASSWD: /usr/bin/makepkg' | sudo tee -a /etc/sudoers

## yay telepites
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# cups (nyomtato)

sudo systemctl start cups.service
sudo systemctl enable cups.service


# Menü megjelenítése
CHOICE=$(dialog --clear --backtitle "Purple Background" --title "Desktop Environment Valaszto" \
                --menu "Valaszd ki s desktop environment:" 15 50 4 \
                1 "Gnome" \
                2 "KDE" \
                3 "Cinnamon" \
                4 "XFCE" \
                3>&1 1>&2 2>&3)

clear

# Kiválasztott asztali környezet telepítése
case $CHOICE in
    1)
        ./gnome_install.sh
        ;;
    2)
        ./kde_install.sh
        ;;
    3)
        ./cinnamon_install.sh
        ;;
    4)
        ./xfce_install.sh
        ;;
    *)
        echo "Invalid choice. Exiting..."
        exit 1
        ;;
esac

# Menu a gpu driverhez

GPUD=$(dialog --clear --title "AMD GPU driver telepites" \
              --menu "Szeretned telepiteni az AMD drivert?" 15 40 2 \
              1 "Igen" \
              2 "Nem" \
              3>&1 1>&2 2>&3
)
clear

# Telepites vagy nem

case $GPUD in
    1)
        ./AMDgpu_install.sh
        ;;
    2)
        echo "AMD driver telepitese kihagyva."
        ;;
    *)
        echo "Invalid choice. Exiting..."
        exit 1
        ;;
esac

# Eredeti sudoers fájl visszaállítása
sudo mv /etc/sudoers.bak /etc/sudoers

echo "Telepítés befejezve."

# ujrainditas

sudo shutdown -r now