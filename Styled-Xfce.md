# Xfce in Style
*Kali Linux, Xubuntu, Arch, et al*

Copy and paste these commands to set Manjaro the way it aughtta be!

```
#DEV many configs are in ~/.config/xfce4/xfconf/xfce-perchannel-xml and can be found for normal xml structured queries 

## Disable lock screen & screensaver
xfconf-query -c xfce4-screensaver -np '/lock/enabled' -s 'false'
xfconf-query -c xfce4-screensaver -np '/saver/enabled' -s 'false'
xfconf-query -c xfce4-power-manager -np '/xfce4-power-manager/blank-on-ac' -s '0'
xfconf-query -c xfce4-power-manager -np '/xfce4-power-manager/blank-on-battery' -s '0'
xfconf-query -c xfce4-power-manager -np '/xfce4-power-manager/dpms-enabled' -s 'false'
xfconf-query -c xfce4-power-manager -np '/xfce4-power-manager/dpms-on-ac-sleep' -s '0'
xfconf-query -c xfce4-power-manager -np '/xfce4-power-manager/dpms-on-ac-off' -s '0'
xfconf-query -c xfce4-power-manager -np '/xfce4-power-manager/dpms-on-battery-sleep' -s '0'
xfconf-query -c xfce4-power-manager -np '/xfce4-power-manager/dpms-on-battery-off' -s '0'
### gsettings (legacy?)
/usr/bin/gsettings set apps.light-locker late-locking false
/usr/bin/gsettings set apps.light-locker lock-after-screensaver 0
/usr/bin/gsettings set apps.light-locker lock-on-suspend true

## Mouse cursor theme
gsettings set org.gnome.desktop.interface cursor-theme "DMZ-Black"

## Desktop prefer dark (works on Xfce)
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

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

## F12 / Scroll Lock for Xterminal Drop-down
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/commands/custom/F12" -t string -s 'xfce4-terminal --drop-down'
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/commands/custom/ScrLk" -t string -s 'xfce4-terminal --drop-down'
## Workspaces & windows
xfconf-query -c xfwm4 -p /general/workspace_count -s 3
xfconf-query -c xfwm4 -p /general/scroll_workspaces -s true
xfconf-query -c xfwm4 -p /general/mousewheel_rollup -s true
xfconf-query -c xfwm4 -p /general/tile_on_move -s true

## Compose Key: CapLock key
xfconf-query -n -c keyboard-layout -p /Default/XkbOptions/Compose -t string -s "compose:caps"

## Hot keys
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
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/commands/custom/<Ctrl><Alt>t" -t string -s 'xfce4-terminal'

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

## Default Xfce window Alt+Click move/resize (if it ever got changed)
xfconf-query -c xfwm4 -p /general/easy_click -t string -s 'Alt'

# ##### WARNING: ONLY FOR VIRTUALBOX #####
# Window navigation for VirtualBox: (Where Alt+Click is not captured)
## Ctrl+Alt: Move window
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Primary>Alt_L" -t string -s 'move_window_key'
## Alt+Shift: Resize window
xfconf-query -n -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Alt>Shift_L" -t string -s 'resize_window_key'

```
