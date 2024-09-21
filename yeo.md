# yeo
*A `yay` install helper helper for Arch distros*

## tl;dr

Just use this: `sudo yeo -S some-package` (then walk away)

Instead of this: `yay -S some-package` (then babysit to watch for `sudo` password prompts)

## Reasoning

[Yay](https://github.com/Jguer/yay) is awesome! Standardize. Avoid keyboard time and human error. But, `sudo` password prompts defeat the purpose. Enter `yeo`...

This creates a `worker` user that can run `sudo` commands. The `yeo.sh` script, linked as the `yeo` command, can be run as `sudo`, which then directs the `worker` user to run `yay` for compiling while avoiding `sudo` password prompts deep in the middle of `yay`'s package processing.

## Install `yeo`

Copy and paste at your own risk!

| **1** :$ paste into normal terminal

```
sudo groupadd worker
sudo useradd -g worker worker
sudo mkdir -p /opt/yeo/worker
sudo chown -R worker:worker /opt/yeo/worker
sudo usermod -d /opt/yeo/worker worker
sudo usermod -L worker
sudo chsh -s /usr/sbin/bash worker 1> /dev/null 2>& 1

sudo mkdir -p /opt/yeo
sudo touch /opt/yeo/yeo.sh
sudo chmod 755 /opt/yeo/yeo.sh
sudo ln -sfn /opt/yeo/yeo.sh /usr/local/bin/yeo
```

| **2** :$ this will need `su` (if you don't know how, don't do this)

```
# Below, enter the password you already knew how to make
su
echo 'worker ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/worker
# Below, paste the file below into yeo.sh
vim /opt/yeo/yeo.sh
```

| **yeo.sh** : paste this into the `vim` editor now open in the browser

```bash
#!/bin/bash
#inkVerbInk! verb.ink

# This passes on all arguments verbatim to yay, run by the "worker" user
## The purpose is to ensure that the task is always run by a non-root user, but doesn't prompt for passwords

# This requires normal users to run as "sudo"

# Usage: run "sudo yeo" instead of "yay", otherwise as you normally would

# If root or sudo
if [ "$(id -u)" != "0" ]; then
  /usr/bin/echo "Must run as root or sudo!"
  exit 1
fi

# Check for quotes
/usr/bin/echo $@ | /usr/bin/grep -q '"'
if [ "$?" != "0" ]; then
  /usr/bin/echo $@ | /usr/bin/grep -q "'"
  if [ "$?" != "0" ]; then
    args="$@"
    /usr/bin/su worker -c "/usr/bin/yay $args"
    exit $?
  else
    /usr/bin/echo "No 'quotes' allowed!"
    exit 1
  fi
else
  /usr/bin/echo "No \"quotes\" allowed!"
  exit 1
fi
```
