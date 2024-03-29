# Manjaro

## Create the Linux Live USB in Windows

[Rufus](https://rufus.ie/downloads/)

...or...

## Create a Linux Live USB via terinal

1. Find the `/dev/...` name of your USB

| **1** :$ `lsblk`

2. Write the .iso file to your USB (your USB will be erased!)

| **2** :$ `sudo dd if=manjaro-gnome-20.X.X-XXXXXX-linuxXX.iso of=/dev/sdf bs=4M conv=fdatasync status=progress`

*This example assumes:*

  - *`/dev/sdf` is the device name for the USB*
  - *The .iso filename is in the present working directory as:* "**manjaro-gnome-20.X.X-XXXXXX-linuxXX.iso**"

## Or you can create the Live USB with [Etcher](https://www.balena.io/etcher/)

## Download Sources

### Manjaro
*Based on Arch, "rolling releases", slow channel stable updates, Vrk does NOT support now, but may in the future!*
- https://manjaro.org
- https://manjaro.org/get-manjaro
- [Manjaro - XFCE](https://manjaro.org/downloads/official/xfce/)
- [Manjaro - GNOME](https://manjaro.org/downloads/official/gnome/)
- [Manjaro - KDE](https://manjaro.org/downloads/official/kde/)
- [Manjaro - Architect (terminal)](https://manjaro.org/downloads/official/architect/)

### Arch Linux
*"Rolling releases", Vrk does NOT support now, but may in the future!*
- https://www.archlinux.org
- https://www.archlinux.org/download/
