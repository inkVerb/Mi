#!/bin/bash
# Run this with root as sudo
## This sets up a minimalist Arch Linux GNOME desktop to help with local server management

/usr/bin/sed -i "s/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen
/usr/bin/locale-gen
/usr/bin/pacman -S --needed --noconfirm gnome-console gnome-terminal gdm libva-utils gnome gnome-shell gnome-control-center gnome-extra gnome-tweaks extension-manager gnome-browser-connector gnome-shell-extensions gnome-shell-extension-dash-to-panel gnome-shell-extension-appindicator gnome-text-editor gedit htop ntp guake chromium
/usr/bin/pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono ttf-fira-code ttf-hack adobe-source-code-pro-fonts inter-font ttf-ubuntu-font-family
/usr/bin/systemctl enable gdm
