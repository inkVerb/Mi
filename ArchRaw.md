# Arch Raw
Installing Arch Linux

Make sure you have your bootable [Live Arch USB](https://github.com/inkVerb/Mi/blob/main/Arch.md)

## Arch to dual boot
*This does not partition any disks, though it formats the install partition*

*For CLI installer partitioning instructions, borrow from the VPS instructions*

1. Create the partition you want to install Arch on
  - Use a Live USB like Manjaro or XFCE, etc
  - Use the operating system itself like Windows or Mac
  - Then create the partition somewhere
  - Name and label the partition something like "Archinstall" so you can find it later
  - This reduces the likelihood of error
  - This skips most of the disk formatting steps

2. Boot into the Arch Live Environment
  - On Mac Mini, hold <kbd>Alt</kbd> or <kbd>Option</kbd> just after power-on
  - On PC, check your motherboard instructions for either BIOS or boot menu
  - Select the EFI or USB boot device
  - From the white and black menu, select Arch Linux install medium

3. Format your partition
```console
lsblk -f
```
  - `lsblk -f` lists partitions by device and name
  - You will want something like `sdb3` or `nvme1n1p1`
    - Later we will use `/dev/sdb3` or `/dev/nvme1n1p1` respectively
    - For this, we will say `/dev/sdb3`
  - `mkfs.ext4 /dev/sda3`
```console
mkfs.ext4 /dev/sda3
```

4. Mount and install base
Mount both the drive and the EFI partition, but separately
```console
mount /dev/sda3 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
```

Install base packages to the mounted, will-become Arch partition

```console
# For AMD machines
pacstrap /mnt base linux linux-firmware vim vi amd-ucode
# For Intel machines:
pacstrap /mnt base linux linux-firmware vim vi intel-ucode
# For Nvidia
pacstrap /mnt nvidia-utils nvidia-settings
```

5. Configure /etc/fstab, then chroot
```console
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
```

6. Host
```console
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
sed -i "s/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "ArchMachine" > /etc/hostname
```

7. Packages & NetworkManager
```console
pacman -S --needed --noconfirm grub efibootmgr os-prober mtools networkmanager network-manager-applet wireless_tools wpa_supplicant dialog sudo git base-devel
pacman -S --needed --noconfirm broadcom-wl-dkms xf86-video-intel # 2012 Mac Mini WiFi and video drivers
pacman -S --needed --noconfirm vulkan-radeon mesa-vdpau libva-mesa-driver # AMD GPU drivers
pacman -S --needed --noconfirm bluez bluez-utils # Bluetooth
systemctl enable NetworkManager
```

8. User & Password
```console
passwd
# Enter a password for the root user
useradd -m -G wheel yournamehere
passwd yournamehere
```

9. Login & sudo
Enter your login creds

Enable the wheel
```console
visudo
```

Uncomment this line: `# %wheel ALL=(ALL:ALL) ALL`

10. GRUB Bootloader

```console
vim /etc/default/grub
```

- Uncomment or add this line as needed: `# GRUB_DISABLE_OS_PROBER=false`

```console
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --recheck
os-prober
grub-mkconfig -o /boot/grub/grub.cfg
```

11. Restart
```console
exit
umount -R /mnt
reboot
```

12. Post-install Upgrade & GPU Drivers
After reboot, login with the user and password you created in the arch-chroot environmentos-prober

```console
sudo pacman -Syyu --needed --noconfirm
```

```console
# Intel
# sudo pacman -S --needed --noconfirm libva-intel-driver # 2008-2017 hardware
sudo pacman -S --needed --noconfirm intel-media-driver # 2014-PRESENT hardware
# AMD
sudo pacman -S --needed --noconfirm vulkan-radeon mesa-vdpau libva-mesa-driver
```

13. GNOME Desktop
*This sets up a minimalist Arch Linux GNOME desktop to help with local server management*

Run this as your normal Linux user that the desktop will be for

```console
localectl set-locale LANG=en_US.UTF-8
```
### GNOME via script

The rest of this onerous step can be done with the [Arch-GNOME install script](https://github.com/inkVerb/Mi/blob/main/Arch-GNOME-install.sh)

GNOME via script:

```console
git clone https://github.com/inkverb/mi
cd mi
chmod +x Arch-GNOME-install.sh
sudo ./Arch-GNOME-install.sh
```
AUR helpers and font packages via script:

```console
git clone https://github.com/jessesteele/yeo
cd yeo
chmod +x install.sh
sudo ./install.sh
cd ..
rm -rf yeo
sudo yeo -S --noconfirm ttf-ms-fonts ttf-mac-fonts nerd-fonts-complete
sudo yeo -S --noconfirm xfce4-terminal gnome-shell-extension-system-monitor-applet
```

### GNOME via CLI

GNOME packages, tools, and dependencies

```console
sudo pacman -S --needed --noconfirm gnome-console gnome-terminal gdm libva-utils gnome gnome-shell gnome-control-center gnome-extra gnome-tweaks extension-manager gnome-browser-connector gnome-shell-extensions gnome-shell-extension-dash-to-panel gnome-shell-extension-appindicator gnome-shell-extension-vitals gnome-text-editor gedit htop ntp guake chromium
sudo pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono ttf-fira-code ttf-hack adobe-source-code-pro-fonts inter-font ttf-ubuntu-font-family
sudo systemctl enable gdm
```

Additional fonts and packages from the AUR
- This presumes you installed [yeo](https://github.com/jessesteele/yeo)
```console
sudo yeo -S --noconfirm xfce4-terminal gnome-shell-extension-system-monitor-applet
sudo yeo -S --noconfirm ttf-ms-fonts ttf-mac-fonts nerd-fonts-complete
```

14. You're Done!
Be happy.

## Optional Screen Rotation
*For portrait orientation screens*

This rotates both the non-GUI terminal and the GRUB menu

```console
sudo vim /etc/default/grub
```

- Add to the value "inside the quotes" of the line starting with `GRUB_CMDLINE_LINUX_DEFAULT=`
  - `fbcon=rotate:1` (90° clockwise)
  - `fbcon=rotate:3` (270° clockwise)

Re-run GRUB's installer

```console
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## Optional rEFInd boot menu for MacOS
GRUB doesn't handle Apple partitions well, probably for good reason and security

On a Mac, for a great boot menu with many useful options and no hassle, run this after everything else

```console
sudo pacman -S refind
sudo refind-install
```

Next time you boot, you will get all options, including Arch, MacOS, and even recovery options

___ 

## Arch VPS on Vultr [credit](https://www.vultr.com/docs/installing-2019-arch-linux-on-a-vultr-server)
*This explains how to install Arch Linux on a Vultr VPS instance from scratch*

1. Vultr Arch ISO
2. View Console
3. In console: Boot to install Arch

## Useful commands:
lsblk # View partitions
ping -c 1 archlinux.org # See if network is working

## To set up disks: (commands by line)
Enter
```
timedatectl set-ntp true
pacman -Sy archlinux-keyring --noconfirm
fdisk /dev/vda
```
Press: n, Enter (x5), w, Enter (x1)
## Now disk is partitioned
```
mkfs.btrfs --label arch /dev/vda1
mount /dev/disk/by-label/arch /mnt
```

OR

```
mkfs.ext4 /dev/vda1
mount /dev/vda1 /mnt
```
## Now disk is mounted
```
pacstrap /mnt base linux linux-firmware --noconfirm
genfstab -L /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash
```
## Now system is ready and automatically mounted to / at startup

## Set up DHCP
```
cat <<EOF > /etc/systemd/network/enp1s0.network
[Match]
Name=enp1s0

[Network]
DHCP=ipv4
EOF
```

## DHCP, DNS, resolv forwards
```
systemctl enable systemd-networkd
systemctl enable systemd-resolved
#ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf # redundant?
```
## Hosts
```
echo 'verber' > /etc/hostname
cat <<EOF > /etc/hosts
127.0.0.1 localhost
127.0.1.1 verber.verberdomain verber
::1 localhost
EOF
```

## Rood password
```
passwd
```

## Grub
```
pacman -S grub --noconfirm
grub-install --target=i386-pc /dev/vda
sed 's/^GRUB_TIMEOUT=5$/GRUB_TIMEOUT=0/' -i /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
```

## Exit chroot & poweroff
```
exit
systemctl poweroff
```

## Use sudo
```
pacman -S sudo --noconfirm
cp /etc/sudoers /etc/sudoers.new
sed 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' -i /etc/sudoers.new
visudo -c -f /etc/sudoers.new && mv /etc/sudoers.new /etc/sudoers
```

## SSH
```
pacman -S openssh --noconfirm
sed -i 's/#Port 22/Port 1222/' /etc/ssh/sshd_config
systemctl enable --now sshd
```

## Now the server is ready to behave like a normal Arch installation
