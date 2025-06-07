# Arch in Style

- There's more for [Xfce in Style](https://github.com/inkVerb/Mi/blob/main/Styled-Xfce.md)

Copy and paste these commands to set Arch or Manjaro the way it aughtta be!

```
# Update & upgrade
sudo pacman -Syyu --noconfirm

# Plz don't use chsh if you're a developer
chsh -s /bin/bash # Now you must re-login
#chsh -s /bin/zsh # Changes back to native Manjaro shell

# Basics for desktop
sudo pacman -S chromium vim gnome-text-editor htop --noconfirm

# More system monitors
sudo pacman -S nmon atop bpytop glances bashtop

# AUR package handler
sudo pacman -S base-devel git --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Developer tools
sudo pacman -S --noconfirm code filezilla gitlab obsidian nextcloud-client guake
yay -S --noconfirm slack-desktop gitter-bin vscodium-bin
## Themes & extensions
### Either of these will install for both Code and Codium
#### Codium
codium --install-extension emroussel.atomize-atom-one-dark-theme
codium --install-extension opensumi.opensumi-default-themes
codium --install-extension PenumbraTheme.penumbra
codium --install-extension timonwong.shellcheck
codium --install-extension ms-vscode.go
#### Code
code --install-extension emroussel.atomize-atom-one-dark-theme
code --install-extension opensumi.opensumi-default-themes
code --install-extension PenumbraTheme.penumbra
code --install-extension timonwong.shellcheck
code --install-extension ms-vscode.go
## May want to add these to File > Preferences > Settings > Extensions > ShellCheck > Exclude: "SC2076,SC2016,SC1090,SC2034,SC2154,SC1091,SC2206,SC2086,SC2153,SC2231"

# AUR basics for desktop
yay -S google-chrome microsoft-edge-stable-bin xfce4-terminal adduser gnome-shell-extension-installer discord dropbox --noconfirm

# Make Pipewire do what it should for Jack so Renoise works; replaces jack2
yay -S pipewire-jack --noconfirm

# Make Wayland work with OBS
sudo pacman -S pipewire xdg-desktop-portal xdg-desktop-portal-wlr qt5-wayland qt5ct
reboot
## We use the Wayland xdg-desktop-portal-wlr (Gnome & Xfce: xdg-desktop-portal-gtk KDE: xdg-desktop-portal-kde)
cat <<EOF >> ~/.bashrc

# Wayland
## QT5 Fix
export QT_QPA_PLATFORMTHEME="qt5ct"

## Wayland Fix
export QT_QPA_PLATFORM=wayland
EOF

# Enable Wayland
sudo sed -i "s/^WaylandEnable=false/#WaylandEnable=false/" /etc/gdm/custom.conf

# Disable Wayland (No, it works with the above packages)
#sudo sed -i "s/#WaylandEnable=false/WaylandEnable=false/" /etc/gdm/custom.conf

# Fortnite (Will not work on Linux until Epic supports it, but this is how to install it; the game will crash just after you land on the ground.)
## Method 1: Install Lutris
sudo pacman -S lutris
### > ... > Add games > Search Lutris website for "Epic Games Store" (Create what shortcuts you want)
### > Login to Epic Games in Lutris
## Method 2: Install the Heroic launcher
yay -S heroic-games-launcher-bin # Also consider: heroic-games-launcher and heroic-games-launcher-git
### Login using "Epic Alternative Login" (if reCaptcha challegne gives false fails, which it often does)

# Setup Vim for copy to clipboard
echo 'nnoremap <C-c> "+y
vnoremap <C-c> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p
syntax on
set number' > ~/.vimrc

# Desktop settings # These can be seen in dconf-editor
## Notes:
# - Compose: CapsLock
# - Activities: Top left corner mouse; Super
# - Applications: Ctrl + Left Super
# - New window: middle click on menu's app icon
# - Minimize: middle click on title bar
# - Move window: Alt + click anywhere
# - Scale window: Alt + right click near edge or corner
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:caps']"
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>F4']"
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Alt>'
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'minimize'
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,close'
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.wm.preferences focus-new-windows 'smart'
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface toolbar-detachable false
gsettings set org.gnome.desktop.notifications show-banners false
gsettings set org.gnome.desktop.notifications show-in-lock-screen false
gsettings set org.gnome.mutter workspaces-only-on-primary false
gsettings set org.gnome.desktop.interface enable-hot-corners true
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'interactive'
gsettings set org.gnome.shell.keybindings toggle-application-view "['<Ctrl>Super_L']"
gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>']"
gsettings set org.gnome.desktop.background show-desktop-icons true
dconf write /org/gtk/gtk4/settings/file-chooser/sort-directories-first true

# Workspace switching (defaults)
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Alt>Right']"

# Password anytime screen turns back on (from lock or suspend)
gsettings set org.gnome.desktop.screensaver lock-enabled true

# Set Lockscreen to "never" (uint32 0)
gsettings set org.gnome.desktop.session idle-delay "uint32 0"
#gsettings set org.gnome.desktop.session idle-delay "uint32 900" # 15 minutes
#gsettings set org.gnome.desktop.session idle-delay "uint32 600" # 5 minutes

# ArcMenu
gnome-extensions enable arcmenu@arcmenu.com
gsettings set org.gnome.shell.extensions.arcmenu menu-button-icon 'Distro_Icon'
#gsettings set org.gnome.shell.extensions.arcmenu menu-button-icon 'Arc_Menu_Icon'
gsettings set org.gnome.shell.extensions.arcmenu multi-monitor true
gsettings set org.gnome.shell.extensions.arcmenu arcmenu-hotkey '['Super_R']'

# Dash to Dock
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gsettings set org.gnome.shell.extensions.dash-to-dock autohide 'true'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed 'false'
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide 'true'
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor 'true'
gsettings set org.gnome.shell.extensions.dash-to-dock preferred-monitor 0
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash 'false'
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show false

# Dash to Panel (replaces Dash to Dock)
gnome-extensions disable dash-to-dock@micxgx.gmail.com
gnome-extensions enable dash-to-panel@jderose9.github.com
gsettings set org.gnome.shell.extensions.dash-to-panel isolate-monitors false
gsettings set org.gnome.shell.extensions.dash-to-panel hide-overview-on-startup true
gsettings set org.gnome.shell.extensions.dash-to-panel multi-monitors true
gsettings set org.gnome.shell.extensions.dash-to-panel panel-element-positions-monitors-sync true
gsettings set org.gnome.shell.extensions.dash-to-panel primary-monitor 0
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide true
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-use-pressure false
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-show-in-fullscreen false
gsettings set org.gnome.shell.extensions.dash-to-panel intellihide-only-secondary true
gsettings set org.gnome.shell.extensions.dash-to-panel panel-size 32
#gsettings set org.gnome.shell.extensions.dash-to-panel primary-monitor 1
#gsettings set org.gnome.shell.extensions.dash-to-panel panel-sizes '{"0":32,"1":32,"2":32,"3":32}'
#gsettings set org.gnome.shell.extensions.dash-to-panel panel-positions '{"0":"TOP","1":"TOP","2":"TOP","3":"TOP"}'
#gsettings set org.gnome.shell.extensions.dash-to-panel panel-lengths '{"0":100,"1":100,"2":100}'
#gsettings set org.gnome.shell.extensions.dash-to-panel panel-element-positions '{"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}],"1":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}],"2":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}'
gsettings set org.gnome.shell.extensions.dash-to-panel panel-sizes '{"0":32}'
gsettings set org.gnome.shell.extensions.dash-to-panel panel-positions '{"0":"TOP"}'
gsettings set org.gnome.shell.extensions.dash-to-panel panel-position 'TOP'
gsettings set org.gnome.shell.extensions.dash-to-panel panel-lengths '{"0":100}'
gsettings set org.gnome.shell.extensions.dash-to-panel panel-element-positions '{"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}'
gsettings set org.gnome.shell.extensions.dash-to-panel show-activities-button false
gsettings set org.gnome.shell.extensions.dash-to-panel show-favorites true
gsettings set org.gnome.shell.extensions.dash-to-panel show-favorites-all-monitors true
gsettings set org.gnome.shell.extensions.dash-to-panel isolate-monitors true
gsettings set org.gnome.shell.extensions.dash-to-panel isolate-workspaces true
gsettings set org.gnome.shell.extensions.dash-to-panel middle-click-action 'LAUNCH'
gsettings set org.gnome.shell.extensions.dash-to-panel show-favorites true
gsettings set org.gnome.shell.extensions.dash-to-panel show-favorites-all-monitors true
gsettings set org.gnome.shell.extensions.dash-to-panel dot-style-focused 'CILIORA'
gsettings set org.gnome.shell.extensions.dash-to-panel dot-style-unfocused 'CILIORA'
gsettings set org.gnome.shell.extensions.arcmenu gnome-dash-show-applications false

# OnlyOffice to Dark theme
sed -i "s/UITheme=theme-.*/UITheme=theme-dark/" ~/.config/onlyoffice/DesktopEditors.conf

# Gedit settings
gsettings set org.gnome.gedit.preferences.editor wrap-mode none
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor scheme 'solarized-dark'

# GNOME Text Editor
echo 'alias vedit=gnome-text-editor' >> ~/.bashrc
gsettings set org.gnome.TextEditor style-variant 'dark'
gsettings set org.gnome.TextEditor style-scheme 'kate-dark'
#gsettings set org.gnome.TextEditor style-scheme 'Adwaita-dark' # Default
gsettings set org.gnome.TextEditor highlight-current-line true
gsettings set org.gnome.TextEditor show-map true
gsettings set org.gnome.TextEditor show-line-numbers true
gsettings set org.gnome.TextEditor wrap-text false
gsettings set org.gnome.TextEditor restore-session false
gsettings set org.gnome.TextEditor spellcheck false

# Default text editors
cat <<EOF >> ~/.bashrc
export EDITOR='vim'
export VISUAL='gnome-text-editor'
EOF

# Prepare 6 custom shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/']"

## GNOME Text Editor
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name "'GNOME Text Editor'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding "'<Ctrl><Alt>x'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command "'gnome-text-editor'"

## Calculator
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ name "'Calculator'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ binding "'<Ctrl><Alt>q'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ command "'gnome-calculator'"

## Screenshot: Select area
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ name "'Screenshot Selection'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ binding "'<Ctrl><Shift>Print_Screen'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ command "'gnome-screenshot -ac'"

# Volume keys (Ctrl + Page Up/Down, Break)
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['<Shift>Page_Up']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['<Shift>Page_Down']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute "['<Shift>Break']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 3
#gsettings reset org.gnome.settings-daemon.plugins.media-keys volume-up
#gsettings reset org.gnome.settings-daemon.plugins.media-keys volume-down
#gsettings reset org.gnome.settings-daemon.plugins.media-keys volume-mute
#gsettings reset org.gnome.settings-daemon.plugins.media-keys volume-step
#gsettings get org.gnome.settings-daemon.plugins.media-keys volume-up
#gsettings get org.gnome.settings-daemon.plugins.media-keys volume-down
#gsettings get org.gnome.settings-daemon.plugins.media-keys volume-mute
#gsettings get org.gnome.settings-daemon.plugins.media-keys volume-step

# Terminal keyboard shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'Dropdown Terminal: Pause'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'Pause'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'xfce4-terminal --drop-down'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "'Dropdown Terminal: Ctrl+F12'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "'<Ctrl>f12'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "'xfce4-terminal --drop-down'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "'Xfce Terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "'<Ctrl><Alt>t'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "'xfce4-terminal'"
#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "'Gnome Terminal'"
#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "'<Ctrl><Alt>t'"
#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "'gnome-terminal'"

# Guake (Needs Dconf)
dconf write /org/guake/keybindings/global/show-hide "'Scroll_Lock'"
dconf write /org/guake/general/window-refocus true
dconf write /org/guake/general/window-vertical-displacement 40
dconf write /org/guake/general/use-trayicon false
dconf write /org/guake/general/start-at-login true
dconf write /org/guake/general/prompt-on-quit false
dconf write /org/guake/general/window-height 25
dconf write /org/guake/general/use-popup false
dconf write /org/guake/general/gtk-use-system-default-theme true
dconf write /org/guake/style/font/palette-name "'Ollie'"

# Reiterate the Scroll Lock for Guake (Such as if Wayland isn't deactivated)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'Guake Terminal: Scroll _Lock'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'Scroll_Lock'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'guake'"

# Nice tools (We need LibreOffice; OnlyOffice doesn't have drag and drop support from files and desktop)
sudo pacman -S gimp inkscape kid3 audacity gnome-music ffmpeg nano vlc shotcut vivaldi vivaldi-ffmpeg-codecs obs-studio libreoffice --noconfirm

# Fonts
sudo pacman -S tex-gyre-fonts ttf-ubuntu-font-family noto-fonts ttf-ibm-plex ttf-liberation ttf-dejavu ttf-junicode gnu-free-fonts ttf-droid ttf-linux-libertine gentium-plus-font ttf-cascadia-code ttf-anonymous-pro ttf-jetbrains-mono adobe-source-sans-pro-fonts --noconfirm
yay -S ttf-ms-fonts ttf-vista-fonts --noconfirm
yay -S ebgaramond-otf otf-bodoni ttf-courier-prime ttf-google-fonts-git otf-jost ttf-tahoma --noconfirm
# Chinese/Japanese/Korean
sudo pacman -S adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts --noconfirm
# Hebrew & Greek # broken package: otf-gfs
yay -S ttf-mgopen culmus --noconfirm

# BASH prompt colors
chsh -s /bin/bash
sudo cp /etc/skel/.bashrc /etc/skel/.bashrc-vrkbak
sudo cp /root/.bashrc /root/.bashrc-vrkbak
sed -i "s:\\\W:\\\[\\\033[01;34m\\\]\\\w:g" ~/.bashrc
sudo sed -i "s:\\\W:\\\[\\\033[01;34m\\\]\\\w:g" /etc/skel/.bashrc
sudo sed -i "s:\\\W:\\\[\\\033[01;34m\\\]\\\w:g" /root/.bashrc

# X-Terminal Settings
## DropdownPositionVertical=0 makes trouble for F11 & F12 in combinations (fullscreen & show/hide)
mkdir -p ~/.config/xfce4/terminal
echo "[Configuration]
FontAllowBold=FALSE
MiscAlwaysShowTabs=FALSE
MiscBell=TRUE
MiscBellUrgent=FALSE
MiscBordersDefault=FALSE
MiscCursorBlinks=FALSE
MiscCursorShape=TERMINAL_CURSOR_SHAPE_BLOCK
MiscDefaultGeometry=80x23
MiscInheritGeometry=FALSE
MiscMenubarDefault=FALSE
MiscMouseAutohide=FALSE
MiscMouseWheelZoom=TRUE
MiscToolbarDefault=FALSE
MiscConfirmClose=TRUE
MiscCycleTabs=TRUE
MiscTabCloseButtons=TRUE
MiscTabCloseMiddleClick=TRUE
MiscTabPosition=GTK_POS_TOP
MiscHighlightUrls=TRUE
MiscMiddleClickOpensUri=TRUE
MiscCopyOnSelect=FALSE
MiscShowRelaunchDialog=TRUE
MiscRewrapOnResize=TRUE
MiscUseShiftArrowsToScroll=FALSE
MiscSlimTabs=TRUE
MiscNewTabAdjacent=FALSE
MiscSearchDialogOpacity=100
MiscShowUnsafePasteDialog=FALSE
MiscRightClickAction=TERMINAL_RIGHT_CLICK_ACTION_CONTEXT_MENU
BackgroundMode=TERMINAL_BACKGROUND_TRANSPARENT
BackgroundDarkness=0.780000
ColorPalette=#0c0d0e;#e31a1c;#31a354;#dca060;#3182bd;#756bb1;#80b1d3;#b7b8b9;#737475;#e31a1c;#31a354;#dca060;#3182bd;#756bb1;#80b1d3;#fcfdfe
DropdownWidth=100
DropdownHeight=25
DropdownStatusIcon=FALSE
FontName=Monospace 11
ShortcutsNoMnemonics=TRUE
ShortcutsNoMenukey=TRUE
ShortcutsNoHelpkey=TRUE
DropdownKeepOpenDefault=TRUE
DropdownToggleFocus=TRUE
DropdownPositionVertical=4
DropdownMoveToActive=FALSE
" > ~/.config/xfce4/terminal/terminalrc
cat <<EOF > ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-terminal.xml
<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfce4-terminal" version="1.0">
  <property name="background-mode" type="string" value="TERMINAL_BACKGROUND_TRANSPARENT"/>
  <property name="background-darkness" type="double" value="0.73999999999999999"/>
  <property name="misc-borders-default" type="bool" value="false"/>
  <property name="misc-show-unsafe-paste-dialog" type="bool" value="false"/>
  <property name="misc-middle-click-opens-uri" type="bool" value="true"/>
  <property name="dropdown-width" type="uint" value="100"/>
  <property name="dropdown-keep-open-default" type="bool" value="true"/>
  <property name="dropdown-toggle-focus" type="bool" value="true"/>
  <property name="dropdown-keep-above" type="bool" value="true"/>
  <property name="dropdown-status-icon" type="bool" value="false"/>
  <property name="color-foreground" type="string" value="#ffffff"/>
  <property name="color-background" type="string" value="#000000"/>
  <property name="color-background-vary" type="bool" value="false"/>
  <property name="color-cursor-foreground" type="string" value=""/>
  <property name="color-cursor" type="string" value=""/>
  <property name="color-cursor-use-default" type="bool" value="true"/>
  <property name="color-selection" type="string" value=""/>
  <property name="color-selection-background" type="string" value=""/>
  <property name="color-selection-use-default" type="bool" value="true"/>
  <property name="color-bold" type="string" value=""/>
  <property name="color-bold-use-default" type="bool" value="true"/>
  <property name="color-palette" type="string" value="#000000;#cc0000;#4e9a06;#c4a000;#3465a4;#75507b;#06989a;#d3d7cf;#555753;#ef2929;#8ae234;#fce94f;#739fcf;#ad7fa8;#34e2e2;#eeeeec"/>
  <property name="color-bold-is-bright" type="bool" value="true"/>
  <property name="color-use-theme" type="bool" value="false"/>
  <property name="tab-activity-color" type="string" value="#aa0000"/>
  <property name="dropdown-height" type="uint" value="33"/>
  <property name="dropdown-move-to-active" type="bool" value="false"/>
  <property name="dropdown-position-vertical" type="uint" value="4"/>
</channel>
EOF

## AMD drivers
### AMD DRI driver for 3D acceleration
https://wiki.archlinux.org/title/AMDGPU
sudo pacman -S mesa --noconfirm
## AMD Pro Drivers
https://aur.archlinux.org/pkgbase/amdgpu-pro-installer
yay -S amdgpu-pro-installer # May be broken, read notes on AUR page
```
