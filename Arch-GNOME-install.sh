#!/bin/bash
# Run this with root as sudo
## This sets up a minimalist Arch Linux GNOME desktop to help with local server management

/usr/bin/sed -i "s/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen
/usr/bin/locale-gen
/usr/bin/pacman -S --needed --noconfirm gnome-console gnome-terminal gdm libva-utils gnome gnome-shell gnome-control-center gnome-extra gnome-tweaks extension-manager gnome-browser-connector gnome-shell-extensions gnome-shell-extension-dash-to-panel gnome-shell-extension-appindicator gnome-text-editor gedit top ntp guake chromium
/usr/bin/pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono ttf-fira-code ttf-hack adobe-source-code-pro-fonts inter-font ttf-ubuntu-font-family
/usr/bin/git clone https://github.com/jessesteele/yeo
cd yeo
/usr/bin/chmod +x install.sh
./install.sh
cd ..
/usr/bin/rm -rf yeo
/usr/bin/sudo -u worker /bin/bash -c "/usr/bin/yay -S --noconfirm ttf-ms-fonts ttf-mac-fonts nerd-fonts-complete"
/usr/bin/sudo -u worker /bin/bash -c '/usr/bin/yay -S --noconfirm xfce4-terminal gnome-shell-extension-system-monitor-applet'
/usr/bin/systemctl enable gdm
