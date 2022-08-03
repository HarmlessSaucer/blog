---
author: "Graham Balharrie"
title: "Owntone"
description: "AirPlay as part of my home automation setup."
date: 2021-12-13
# date: 2021-11-29
draft: false
image: "title.jpg"
tags:
- airplay
- owntone
categories:
- home automation
---

## Overview
[OwnTone](https://owntone.github.io/owntone-server/INSTALL.html) is the new name of **forked-daapd**.  I was previously using forked-daapd as a way to play music to my HomePods via automations in [Home-Assistant](https://home-assistant.io).

Since then I've changed a lot in my HomeLab infrastructure and I never got round to rebuilding my forked-daapd setup.  I've since found out that the project has changed pretty significantly so I'm giving OwnTone a go!

> __*NOTE*!__ : This post is a work-in-progress as I am currently changing my Owntone setup.  I have therefore removed some of the steps that failed in more recent versions for me and may revisit this again.

---

## Setup

I am running OwnTone in a CT within [Proxmox](https://proxmox.com).
Following the [Installation Instructions](https://owntone.github.io/owntone-server/INSTALL.html) from OwnTone:

- Updated packages:  
```
sudo apt update
```

- Upgrade packages:
```
sudo apt upgrade
```

- Install required tools and libraries:
```
sudo apt-get install \
  build-essential git autotools-dev autoconf automake libtool gettext gawk \
  gperf antlr3 libantlr3c-dev libconfuse-dev libunistring-dev libsqlite3-dev \
  libavcodec-dev libavformat-dev libavfilter-dev libswscale-dev libavutil-dev \
  libasound2-dev libmxml-dev libgcrypt20-dev libavahi-client-dev zlib1g-dev \
  libevent-dev libplist-dev libsodium-dev libjson-c-dev libwebsockets-dev \
  libcurl4-openssl-dev libprotobuf-c-dev
```

- Clone the project repo:
```
git clone https://github.com/owntone/owntone-server.git
```