# Debian in Style
*Kali Linux, Ubuntu, et al*

- There's more for [Xfce in Style](https://github.com/inkVerb/Mi/blob/main/Styled-Xfce.md)

Copy and paste these commands to set Manjaro the way it aughtta be!

```
# Update & upgrade
sudo apt-get update && sudo apt-get upgrade -y

# Install X-Terminal
sudo apt-get install -y xfce4-terminal

## Disable lock screen
### GNOME
/usr/bin/gsettings set org.gnome.desktop.session idle-delay "uint32 0"
### Xfce
xfconf-query -c xfce4-screensaver -np '/lock/enabled' -s 'false'

## Mouse cursor theme
gsettings set org.gnome.desktop.interface cursor-theme "DMZ-Black"

## Desktop prefer dark
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

```
