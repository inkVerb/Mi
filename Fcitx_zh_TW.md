# Install Fcitx for Taiwan-style Mandarin typing input in Manjaro/Arch

## Install Fcitx

1. Install Input

```bash
sudo pacman -Sy --noconfirm fcitx5-im fcitx5-chinese-addons fcitx5-configtool fcitx5-chewing
```

2. Install Fonts

```bash
sudo pacman -S --noconfirm adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts noto-fonts-cjk wqy-microhei wqy-microhei-lite wqy-bitmapfont wqy-zenhei ttf-arphic-ukai ttf-arphic-uming
```
3. Run Fcitx at startup (per user)

```bash
cat <<EOF >> .xinitrc
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
EOF
```

4. Reboot

```bash
reboot
```

5. Add the input to the interface:

- New input icon in system tray > Preferences
- Uncheck the box to only show current language
- Search "Chewing"
- Refresh

6. Use:

- <key>Ctrl</key> + <key>Space</key> = Change language input

## If you have trouble and need to set the locale

1. Properly set the locale for your machine

```bash
sudo cp /etc/locale.gen /etc/locale.gen.orig
sudo echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
sudo echo "zh_TW.UTF-8 UTF-8" >> /etc/locale.gen
sudo locale-gen
```

```bash
reboot
```

2. Set locale for your user

Choose...

| **English** :

```bash
localectl set-locale LANG=en_US.UTF-8
```

OR

| **Chinese** :

```bash
localectl set-locale LANG=zh_TW.UTF-8
```

- More ways to install language packs

```bash
manjaro-settings-manager
```

```bash
yay -S --noconfirm ttf-ms-win10-zh_tw ttf-ms-win8-zh_tw
```

  - Language Packs > Install Packages





All done! Have a cookie...

###
