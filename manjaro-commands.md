```
# Get the proper shell
chsh -s /bin/bash # Now you must re-login
#chsh -s /bin/zsh # Changes back to native Manjaro shell

sudo pacman -Sy archlinux-keyring --noconfirm
sudo pacman -Syyu --noconfirm
sudo pacman -Scc # Clean cache
yay -Syyu --noconfirm # Update UAR packages https://open.spotify.com/track/76zDfyiV5XwzjItm9vulRO
yay -Scc --noconfirm # Clean cache

sudo pacman -S chromium --noconfirm
sudo pacman -S vivaldi vivaldi-ffmpeg-codecs --noconfirm
sudo pacman -S thunderbird --noconfirm
sudo pacman -S filezilla --noconfirm
sudo pacman -S gpodder --noconfirm
sudo pacman -S rhythmbox --noconfirm
sudo pacman -S vlc --noconfirm
sudo pacman -S kdenlive --noconfirm
sudo pacman -S shotcut --noconfirm
sudo pacman -S musescore --noconfirm
sudo pacman -S audacity --noconfirm
sudo pacman -S kid3 --noconfirm
sudo pacman -S gnome-music --noconfirm
sudo pacman -S ffmpeg --noconfirm
sudo pacman -S gimp --noconfirm
sudo pacman -S mypaint --noconfirm
sudo pacman -S inkscape --noconfirm
sudo pacman -S blender --noconfirm
sudo pacman -S synfigstudio --noconfirm
sudo pacman -S libreoffice --noconfirm
sudo pacman -S git --noconfirm
sudo pacman -S htop --noconfirm
sudo pacman -S gpaste --noconfirm
sudo pacman -S vim --noconfirm
sudo pacman -S nano --noconfirm
sudo pacman -S nextcloud-client --noconfirm
sudo pacman -S gnome-tweak-tool --noconfirm
sudo pacman -S discord --noconfirm
sudo pacman -S obsidian --noconfirm
sudo pacman -S tex-gyre-fonts ttf-ubuntu-font-family font-bh-ttf noto-fonts ttf-ibm-plex ttf-liberation ttf-dejavu ttf-junicode gnu-free-fonts ttf-droid ttf-linux-libertine font-bh-ttf gentium-plus-font ttf-cascadia-code ttf-anonymous-pro ttf-jetbrains-mono adobe-source-sans-pro-fonts --noconfirm
sudo pacman -S adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts --noconfirm # Chinese/Japanese/Korean

# AUR package manager
sudo pacman -S base-devel git --noconfirm # Dependencies
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# AMD drivers
#yay -Sy --noconfirm vulkan-amdgpu-pro
#yay -Sy --noconfirm opencl-amdgpu-pro-pal # Or the OpenCL PAL

# AMD Radeon
## From running around in https://wiki.archlinux.org/title/AMDGPU
yay -S --noconfirm vulkan-amdgpu-pro
###  vulkan-amdgpu-pro handles:
#### yay -S amdgpu-pro-installer
#### pacman -S --noconfirm mesa vulkan-radeon

# AUR Packages
yay -S google-chrome --noconfirm
yay -S skype --noconfirm
yay -S dropbox --noconfirm
yay -S subtitlecomposer --noconfirm
yay -S adduser --noconfirm
yay -S twinkle --noconfirm
yay -S atom --noconfirm
yay -S ttf-ms-fonts ttf-vista-fonts --noconfirm
yay -S ebgaramond-otf otf-bodoni ttf-courier-prime ttf-google-fonts-git otf-jost ttf-tahoma --noconfirm
yay -S otf-gfs ttf-mgopen opensiddur-hebrew-fonts culmus --noconfirm # Hebrew & Greek
yay -S rss-glx --noconfirm
yay -S key-mon --noconfirm
yay -S slack-desktop --noconfirm

# OBS (choose)
## OBS for AMD (to use GPU)
yay -S obs-studio-amf
## OBS for Nvidia
sudo pacman -S obs-studio --noconfirm

# OBS virtualcam
#https://github.com/Fenrirthviti/obs-virtual-cam/releases
# yay -S obs-virtual-cam-filter # broken?
# https://forum.manjaro.org/t/howto-install-an-obs-studio-virtual-camera/67317

# RSS Screensavers
## GUI settings
xscreensaver-settings # settings window

## RSS-GLX screensaver install
killall xscreensaver
/usr/bin/rss-glx_install.pl # installs more screensavers, including Helios

## terminal settings ## May not work properly, open xscreensaver-settings to ensure it is correct
sed -i "s/^unfade:.*/unfade:         False/" ~/.xscreensaver
sed -i "s/^fade:.*/fade:         False/" ~/.xscreensaver
sed -i "s/^mode:.*/mode:           one/" ~/.xscreensaver
sed -i "s/^selected:.*/selected:       $(grep -wn helios ~/.xscreensaver | cut -d: -f1)/" ~/.xscreensaver

## start the daemon first
xscreensaver &
## activate now
xscreensaver-command -a

## Run Helios as a window
helios

# Spotify
yay -S spotify --noconfirm
## Fix Spotify bugs:
pamac install xdg-desktop-portal-gtk
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous

# Wine
sudo pacman -S wine winetricks --noconfirm

# Terminals
yay -S xfce4-terminal --noconfirm

# Keyboard shortcut: xfce4-terminal --drop-down
# Make permanent autostart: sudo cp /usr/share/applications/NAME.desktop /etc/xdg/autostart/

# GNOME
## Turn off Wayland
sudo sed -i "s/#WaylandEnable=false/WaylandEnable=false/" /etc/gdm/custom.conf

# Setup Vim for copy to clipboard
echo 'nnoremap <C-c> "+y
vnoremap <C-c> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p
syntax on' > ~/.vimrc

# PlayStation controller
sudo modprobe hid-playstation

## Desktop # These can be seen in dconf-editor
dconf write /org/gnome/desktop/input-sources/xkb-options "['compose:caps']"
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Alt>'
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'minimize'
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,close'
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.wm.preferences focus-new-windows 'smart'
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface toolbar-detachable false
gsettings set org.gnome.desktop.interface toolbar-icons-size 'small'
gsettings set org.gnome.desktop.notifications show-banners false
gsettings set org.gnome.desktop.notifications show-in-lock-screen false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide 'true'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'left'
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed 'false'
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide 'true'
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor 'false'
gsettings set org.gnome.shell.extensions.dash-to-dock preferred-monitor 0
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash 'false'
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.mutter workspaces-only-on-primary 'false'
gsettings set org.gnome.desktop.background show-desktop-icons true

#gsettings set org.gnome.desktop.background show-desktop-icons true

## Set Lockscreen to "never" (uint32 0)
gsettings set org.gnome.desktop.session idle-delay "uint32 0"
#gsettings set org.gnome.desktop.session idle-delay "uint32 900" # 15 minutes
#gsettings set org.gnome.desktop.session idle-delay "uint32 600" # 5 minutes

## Set theme & icons
gsettings set org.gnome.desktop.interface gtk-theme "Matcha-dark-sea"
#gsettings set org.gnome.desktop.interface gtk-theme "Yosemite-dark"
#gsettings set org.gnome.desktop.interface icon-theme "Surfn-Majestic"
#gsettings set org.gnome.desktop.interface cursor-theme "DMZ-Black"

# Gedit
gsettings set org.gnome.gedit.preferences.editor wrap-mode none
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor scheme 'solarized-dark'
gsettings set org.gnome.gedit.preferences.editor scheme 'atom-one'
## Copy themes to dir
sudo cp atom-one.xml /usr/share/gtksourceview-4/styles/

## Terminal keyboard shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'Dropdown Terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'f12'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'xfce4-terminal  --drop-down'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "'Gnome Terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "'<Ctrl><Alt>t'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "'gnome-terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "'Xfce Terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "'<Ctrl><Alt>x'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "'xfce4-terminal'"

# LibreOffice Spellcheck Extension
https://sourceforge.net/projects/aoo-extensions/files/17102/62/dict-en-20210201.oxt/download

# BASH prompt
chsh -s /bin/bash
sudo cp /etc/skel/.bashrc /etc/skel/.bashrc-vrkbak
sudo cp /root/.bashrc /root/.bashrc-vrkbak
sed -i "s:\\\W:\\\[\\\033[01;34m\\\]\\\w:g" ~/.bashrc
sed -i "s:\\\W:\\\[\\\033[01;34m\\\]\\\w:g" /etc/skel/.bashrc
sed -i "s:\\\W:\\\[\\\033[01;34m\\\]\\\w:g" /root/.bashrc


# Mount Disk at boot
1. sudo blkid # Get info of device (UUID & TYPE)
2. sudo mkdir /mnt/sda3 # Create the mount directory
3. sudo vim /etc/fstab # Add the following entry:
# Format: UUID=<uuid-of-your-drive>  <mount-point>  <file-system-type>  <mount-option>  <dump>  <pass>
# Exampl: UUID=7953d115-6c12-4810-80a8-68ab94995e96  /mnt/sda3  ext4  defaults,noatime 0 2
4. sudo mount -a # reload

# Remove an unwanted user from the Xwindow login screen
## Each user with a login to the GUI at boot has a file in: /var/lib/AccountsService/users
ls /var/lib/AccountsService/users/
# If the user no longer exists: Remove the file named after the user
# If the user exists, but to remove from login (ie root), add a line: SystemAccount=true

# CLI video streamer
## https://skillfulness.blogspot.com/2010/03/mjpg-streamer-documentation.html
yay -S mjpg-streamer
mjpg_streamer --input "input_uvc.so --help"

# to find the available settings in gsettings, for instance: `dash-to-dock`
gsettings list-schemas
gsettings list-keys org.gnome.shell.extensions.dash-to-dock
gsettings range org.gnome.shell.extensions.dash-to-dock dock-position
gsettings range org.gnome.shell.extensions.dash-to-panel multi-monitors
gnome-extensions list
gnome-extensions disable dash-to-dock@micxgx.gmail.com
gnome-extensions enable dash-to-dock@micxgx.gmail.com

# GNOME Shell prefs GUI
gnome-shell-extension-prefs

# See how settings happen
dconf watch /

# gsettings vs dconf
dconf write /org/gnome/desktop/input-sources/xkb-options "['compose:caps']"
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:caps']"
dconf write /org/gnome/desktop/wm/keybindings/close "['<Alt>F4']"
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>F4']"
```

| **gsettings-iterate-all** :

```bash
#!/bin/bash
# Gnome 3 can be customised from the command line via the gsettings command
# This script should help you to find what you're looking for by
# listing the ranges for all keys for each schema

for schema in $(gsettings list-schemas | sort)
do
    for key in $(gsettings list-keys $schema | sort)
    do
        value="$(gsettings range $schema $key | tr "\n" " ")"
        echo "$schema :: $key :: $value"
    done
done
```

```
gsettings-iterate-all | grep dash-to-dock
```
