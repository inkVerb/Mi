# Manjaro in Style

Copy and paste these commands to set Manjaro the way it aughtta be!

```
# Update & upgrade
sudo pacman -Syyu --noconfirm

# Plz don't use chsh if you're a developer
chsh -s /bin/bash # Now you must re-login
#chsh -s /bin/zsh # Changes back to native Manjaro shell

# Basics for desktop
sudo pacman -S chromium vim gnome-text-editor htop --noconfirm

# AUR package handler
sudo pacman -S base-devel git --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Developer tools
sudo pacman -S --noconfirm filezilla gitlab obsidian nextcloud-client
yay -S --noconfirm slack-desktop gitter-bin vscodium-bin
## Themes & extensions
codium --install-extension emroussel.atomize-atom-one-dark-theme
codium --install-extension opensumi.opensumi-default-themes
codium --install-extension PenumbraTheme.penumbra
codium --install-extension timonwong.shellcheck
codium --install-extension ms-vscode.go
## May want to add these to File > Preferences > Settings > Extensions > ShellCheck > Exclude: "SC2076,SC2016,SC1090,SC2034,SC2154,SC1091,SC2206,SC2086,SC2153,SC2231"

# AUR basics for desktop
yay -S google-chrome xfce4-terminal adduser gnome-shell-extension-installer discord dropbox --noconfirm

# Plz disable Wayland
sudo sed -i "s/#WaylandEnable=false/WaylandEnable=false/" /etc/gdm/custom.conf

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

# Workspace switching (defaults)
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Control><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Control><Alt>Right']"

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
gsettings set org.gnome.shell.extensions.arcmenu enable-menu-hotkey false

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
gsettings set org.gnome.shell.extensions.dash-to-panel show-appmenu false
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

# Set theme & icons
# Desktop theme for legacy applications
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-maia-compact-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Adapta-Nokto-Maia'
gsettings set org.gnome.shell.extensions.user-theme name 'Adwaita-maia-compact-dark'

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
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'Dropdown Terminal: ScrLk'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'Scroll_Lock'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'xfce4-terminal --drop-down'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "'Dropdown Terminal: F12'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "'f12'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "'xfce4-terminal --drop-down'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "'Xfce Terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "'<Ctrl><Alt>t'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "'xfce4-terminal'"
#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "'Gnome Terminal'"
#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "'<Ctrl><Alt>t'"
#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "'gnome-terminal'"

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

# Xfce-specific (not GNOME)
## Workspaces & windows
xfconf-query -c xfwm4 -p /general/workspace_count -s 3
xfconf-query -c xfwm4 -p /general/scroll_workspaces -s true
xfconf-query -c xfwm4 -p /general/mousewheel_rollup -s true
xfconf-query -c xfwm4 -p /general/tile_on_move -s true

## Hot keys
### F12 / Scroll Lock for Xterminal Drop-down
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/commands/custom/F12" -t string -s 'xfce4-terminal --drop-down'
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/commands/custom/ScrLk" -t string -s 'xfce4-terminal --drop-down'
### Whisker menu
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/commands/custom/Super_L" -t string -s 'xfce4-popup-whiskermenu'
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/commands/custom/Super_R" -t string -s 'xfce4-popup-whiskermenu'
#can't use <Super> given the above Super_L and Super_R declarations :-(
#xfconf-query -n -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>z" -t string -s 'xfce4-popup-whiskermenu'
#xfconf-query -n -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>space" -t string -s 'xfce4-popup-whiskermenu'
### Xfdashboard
#### set for both orders since order matters
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/commands/custom/<Ctrl><Alt>Super_L" -t string -s 'xfdashboard'
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/commands/custom/<Ctrl><Alt>Super_R" -t string -s 'xfdashboard'
### Window tiling
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Ctrl><Super>Up" -t string -s 'tile_up_key'
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Ctrl><Super>Down" -t string -s 'tile_down_key'
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Ctrl><Super>Left" -t string -s 'tile_left_key'
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Ctrl><Super>Right" -t string -s 'tile_right_key'
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Shift><Super>Left" -t string -s 'tile_up_left_key'
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Shift><Super>Right" -t string -s 'tile_up_right_key'
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Alt><Super>Left" -t string -s 'tile_down_left_key'
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Alt><Super>Right" -t string -s 'tile_down_right_key'
### Desktop apps
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>d" -t string -s 'gedit'
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>e" -t string -s 'thunar'
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>q" -t string -s 'gnome-calculator'

## Xfdashboard
###DEV see available options: xfconf-query -c xfdashboard -lv
## Dashboard settings
xfconf-query -n -t bool -c xfdashboard -p /always-launch-new-instance -s false
xfconf-query -n -t bool -c xfdashboard -p /components/applications-view/show-all-apps -s true
xfconf-query -n -t bool -c xfdashboard -p /components/windows-view/scroll-event-changes-workspace -s true
xfconf-query -n -t string -c xfdashboard -p /theme -s xfdashboard-dark
## Enable the hot-corner plugin by adding the hot-corner value to enabled-plugins as a new property
xfconf-query -n -c xfdashboard -p /enabled-plugins -a -t string -s hot-corner
## Enable gnome shell search provider also (this resets all plugins every time)
#xfconf-query -n -c xfdashboard -p /enabled-plugins -a -t string -s hot-corner -t string -s gnome-shell-search-provider
## Settings for hotcorner
xfconf-query -n -t string -c xfdashboard -p /plugins/hot-corner/activation-corner -s XFDASHBOARD_HOT_CORNER_SETTINGS_ACTIVATION_CORNER_TOP_LEFT
xfconf-query -n -t string -c xfdashboard -p /plugins/hot-corner/activation-duration -s 27
xfconf-query -n -t string -c xfdashboard -p /plugins/hot-corner/activation-radius -s 1
```
