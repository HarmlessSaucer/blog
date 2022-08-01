---
author: "Graham Balharrie"
title: "Joggler Home-Assistant Kiosk"
description: "Turning an old O2 Joggler into a Home-Assistant Kiosk Dashboard."
date: 2020-12-04
draft: false
hideLastModified: true
image: "title.jpg"
tags:
- "home automation"
- "home assistant"
- "o2"
- "joggler"
- "dashboard"
- "linux"
- "ubuntu"
categories:
- "home automation"
- "home-assistant"
- linux
---

# O2 Joggler Home-Assistant Kiosk
## Overview

I wanted to setup a 'kiosk' style interface for our home automation setup, powered by Home-Assistant.  I managed to pickup an old [O2 Joggler](https://en.wikipedia.org/wiki/O2_Joggler) for ~£20 on eBay a while back.  It's perfect - Small, touch-screen Linux box with USB, Ethernet, WiFi and audio.

Thanks to the wonderful work of Andrew Davison of [BirdsLikeWires.net](BirdsLikeWires.net), there is already a great Ubuntu image that can easily be flashed to the Joggler.

So I'm documenting the process I used here mainly for myself, but if you find it useful - great!  

Please consider donating to Andrew on [BirdsLikeWires.net](BirdsLikeWires.net) as a thank you for the awesome work that makes this possible!

---

## Setup
### Download Ubuntu

Download the image from [BirdsLikeWires.net](https://birdslikewires.net/debian-for-openframe) (I used the 'Kernel 5.4' version).

<br>

### Flash to USB

Flash the image to a USB stick.  I used [Balena Etcher](https://www.balena.io/etcher/).

Make sure you use a USB stick large enough for the applications you want to install.  I used a 16GB drive.

<br>

### Boot

Once complete, plug the USB stick into your Joggler and power it on.

There is a USB port on the side of the Joggler that you can use.  There is also an internal USB port that you can access by removing the small clips round the edge of the screen.  By default this is occupied by an internal WiFi card.  I removed the internal USB WiFi card from my Joggler as it was going to be connected via Ethernet, so I could use this port to boot instead for a cleaner look.  But you could just use a really slim USB stick too!

> You may want to consider using a powered USB hub connected to the Joggler, so that you can plug in a keyboard and mouse for the initial setup in case you don't want to use SSH.

<br>

### Setup
Take a look at the details on:  [birdslikewires.net](https://birdslikewires.net/debian-for-openframe) for how to connect and the default username/password.

Expand the root partition:
`sudo of-expand`

Update packages and upgrade installed packages:
`sudo apt update && sudo apt upgrade -y`

Install xserver:
`sudo of-install xserver`

Install LXDE:
`sudo apt install lxde-core -y`

Install Chromium:
`sudo apt install chromium-browser -y`

Install Unclutter to hide the mouse:
`sudo apt install unclutter -y`

Installed matchbox-keyboard
`sudo apt install matchbox-keyboard -y`

Auto-start LXDE and auto login as ‘of’:`sudo of-settings autostartx of`

Reboot to check that LXDE starts up on boot:`sudo reboot`

Open Chrome and login to your Home-Assistant instance, select the dashboard etc.

Start xserver and load Chromium as ‘of’ user:
`sudo of-settings autoxrun of chromium-browser`

Edit the ‘.xinitrc’ file to add the command line switches for Chromium kiosk mode:
`nano .xinitrc`

Change the bottom line to:
```
chromium-browser harmlesssaucer.duckdns.org --window-size=800,480 --start-fullscreen —kiosk --noerrdialogs --disable-translate --no-first-run --fast --fast-start --disable-infobars --disk-cache-dir=/dev/null  --password-store=basic
```

<br>

### VNC Setup
Using [this guide](https://www.smarthomebeginner.com/setup-vnc-server-on-ubuntu-linux/#Step_3_Install_VNC_Server_on_Ubuntu) I installed VNC to aid in remote troubleshooting (so I dont have to plug in a keyboard and mouse again!)

Install TightVNC Server:
`sudo apt-get install tightvncserver -y`

To fix the error about missing fonts:
`sudo apt-get install xfonts-base -y`

<br>

### Backup!
If you got everything working, hooray!  Go you.  I would personally take this opportunity to create a backup image of the drive, so that any 'fiddling' or corruption that ensues doesn't cause you too many headaches!

---

## Links and sources

Install Ubuntu Bionic for OpenFrame/Joggler from BirdsLikeWires.net:
[https://birdslikewires.net/debian-for-openframe](https://birdslikewires.net/debian-for-openframe)

Home-Assistant Form Post:  
[https://community.home-assistant.io/t/joggler-lovelace/145500/30](https://community.home-assistant.io/t/joggler-lovelace/145500/30)