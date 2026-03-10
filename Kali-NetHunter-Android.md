# Kali NetHunter Android
## Rootless
*Rooted may be added in the future*

*You are responsible for everything; this is merely how I do it*

- Useful reference: [https://davidbombal.wiki/nhandroid]
- Useful video: [https://www.youtube.com/watch?v=KxOGyuGq0Ts]

But, you could have trouble stabilizing NetHunter Rootless, including password

- Make sure you have a bluetooth keyboard and mouse attached because Android soft keyboard input doesn't always work the same with passwords once inside the Kali NetHunter desktop


### Termux
*Don't use the Google Play store version, you need it straight from the vendor*

- Download and install the APK for ARM: [https://github.com/termux/termux-app]
  - Answer yes and approve any Android cautions or permissions requests as these are part of what it needs to work
- Enter these commands in Termux:

```console
apt update
apt upgrade -y
apt install wget -y
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux
./install-nethunter-termux
```

- When it asks if you want to delete the downloaded rootfs file, choose No
- You are finished when you see the blue KALI text art with green instructions that follow
  - You may want a screenshot
- Set the password for the NetHunter kex server

```console
nh kex passwd
```

- This will be used in the app we download from the NetHunter store

```console
nh
```
- This is the NetHunter terminal, same that the NetHunter desktop will use
  - This is not the same as the Termux terminal itself
- FYI: the `sudo` user is `kali and the password is `kali`
  - You logged in from Termux with the `nh` or `nethunter` command
- The kex password on this NetHunter server is different, the one we set with `nh kex passwd` from Termux
  - It is kept at: `~/.vnc/passwd`
  - Deleting that file will remove the password to reset it in Termux with `nh kex passwd`
- You have now installed the local server that runs in the background
- Now, you need to install an app to interface with it so Kali NetHunter desktop can run as an Android app

### NetHunter
*This is the Android app for the desktop interface*
- Install the NetHunter Store: [https://store.nethunter.com]
- Search: *NetHunter KeX*
  - Download and install *NetHunter KeX bVNC customized for NetHunter KeX*
  - This may need special permissions and double approvals in the Android interface
- Locate the newly installed android app *NetHunter KeX*

### Launch
1. Open Termux and run:
```console
nh kex &
```
- Note a PORT # like `5901` or `localhost:1` (with `1` being the last digit in `5901`)
2. Run the *NetHunter KeX* app from the Android desktop
  - Enter that port (usually `5901`) at the far end of *VNC Connection Settings* after `localhost` (usually replacing a single `1`)
  - Enter your `nh kex passwd` entry at the bottom
  - Tap *Connect*
3. The proper way to exit the desktop is:
  - Xfce menu
  - Power
  - Log Out
  - Note the Connection failure message, tap/click *Acknowledge*
- Repeat these steps to start again
4. Control notes
- In theory, you can stop it from Termux with:
```console
nh kex stop
```
- If the server fails, nuke it in Termux wtih:
```console
nh
sudo pkill -9 -f vnc
```
- Access your Kali kex terminal as `root` with no password using:
```console
nh -r
```

### Kali NetHunter Desktop Settings
*Some important things in Kali NetHunter need attention right away; do these before using the desktop as normal*
- Start and enter Kali NetHunter desktop
1. Disable the impossible lock screen
- You don't want the GUI lock screen because it might not be able to authenticate
- As soon as installed, go to Kali Xfce Settings > Xfce Screensaver > 
  - > Screensaver: Enable Screensaver: Off
  - > Lock Screen: Enable Lock Screen: Off
2. Set the DNS resolver to Google
- Open the terminal
- `kali` user `sudo` password is: `kali`
```console
sudo rm /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
```
- If you have trouble with any Internet access after this, try to see if you can access Google on the web:
```console
ping 8.8.8.8
```
- Note the desktop may say that NetworkManager is not running
  - NetHunter actually borrows the network connection from Android directly, so this is a false negative
3. Update and Upgrade
- *Only do a full upgrade!*
- **Never** use: `sudo apt upgrade`!
```console
sudo apt update
sudo apt full-upgrade -y
```

### Troubleshooting

- If you experience trouble with `full-upgrade`, try holding the kex VNC server packages first:
```console
sudo apt-mark hold tigervnc-standalone-server tigervnc-common
```

- If Android disconnects WiFi often, install the right packages and settings
  - In Termux (not NetHunter terminal as `kali`):
```console
pkg install android-tools
adb shell "device_config put activity_manager max_phantom_processes 2147483647"
```
