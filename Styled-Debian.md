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
