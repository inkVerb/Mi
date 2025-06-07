# CentOS in Style

- There's more for [Xfce in Style](https://github.com/inkVerb/Mi/blob/main/Styled-Xfce.md)

Copy and paste these commands to make the RedHat environment less the way it aughtta not be!

```
# Lists (FYI)
sudo dnf repolist
sudo dnf list available

# Package list
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*

# Extra repos & subscription-manager
#DEV maybe not needed if below installations work
#sudo dnf install -y subscription-manager
#subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms
#sudo dnf makecache --refresh

# Update & upgrade
sudo dnf check-update
sudo dnf update -y

# Config manager
sudo dnf install -y yum-utils

# Enable all repos
sudo yum-config-manager --enable appstream baseos cr extras fasttrack ha
sudo yum install -y epel-release
sudo dnf config-manager --add-repo https://repo.skype.com/rpm/stable/skype-stable.repo

# Basics for desktop
sudo dnf install -y chromium htop gnome-tweaks filezilla gimp inkscape skypeforlinux xfce4-terminal

# Test these
sudo dnf install -y git

# VS Codium
sudo dnf install epel-release
sudo dnf install snapd --skip-broken
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install codium --classic
codium --install-extension emroussel.atomize-atom-one-dark-theme
codium --install-extension opensumi.opensumi-default-themes
codium --install-extension PenumbraTheme.penumbra
codium --install-extension timonwong.shellcheck
codium --install-extension ms-vscode.go
## May want to add these to File > Preferences > Settings > Extensions > ShellCheck > Exclude: "SC2076,SC2016,SC1090,SC2034,SC2154,SC1091,SC2206,SC2086,SC2153,SC2231"

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
gsettings set org.gnome.mutter workspaces-only-on-primary 'false'
gsettings set org.gnome.desktop.interface enable-hot-corners true
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'interactive'
gsettings set org.gnome.shell.keybindings toggle-application-view "['<Ctrl>Super_L']"
gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>']"
gsettings set org.gnome.desktop.background show-desktop-icons true

# Workspace switching (defaults)
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Alt>Right']"

# Password anytime screen turns back on (from lock or suspend)
gsettings set org.gnome.desktop.screensaver lock-enabled true

# Set Lockscreen to "never" (uint32 0)
gsettings set org.gnome.desktop.session idle-delay "uint32 0"
#gsettings set org.gnome.desktop.session idle-delay "uint32 900" # 15 minutes
#gsettings set org.gnome.desktop.session idle-delay "uint32 600" # 5 minutes

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

# Set theme & icons
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"

# Prepare 6 custom shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/']"

# Gedit
gsettings set org.gnome.gedit.preferences.editor wrap-mode none
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor scheme 'solarized-dark'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name "'Gedit Text Editor'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding "'<Ctrl><Alt>x'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command "'gedit'"

# Calculator
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ name "'Calculator'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ binding "'<Ctrl><Alt>q'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ command "'gnome-calculator'"


# Screenshot: Select area (May already be default)
#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ name "'Screenshot Selection'"
#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ binding "'<Shift>Print_Screen'"
#gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ command "'gnome-screenshot -ac'"


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
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "'xfce4-terminal  -drop-down'"
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

```
