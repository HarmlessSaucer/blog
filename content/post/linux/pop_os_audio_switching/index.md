---
author: "Graham Balharrie"
title: "Pop!_OS Audio Switching"
description: "Setting the default audio device in Pop."
date: 2021-11-29
draft: false
image: "banner.png"
tags:
- linux
- pop os
- audio
categories:
- linux
---

## Overview

A little while back I switched to using [Pop!_OS](https://pop.system76.com/) for my _'daily driver'_ OS of choice on my home PC.  I have a bunch of different audio devices connected to my system: display speakers via HDMI, USB sound card, USB headphones etc.

I was finding that I would set my prefered output (usually my display speakers) in the system settings, and then after either reboot or coming out of sleep, Pop!_OS would have selected a different audio device seemingly for no reason.

Looking into this it seems it's not unusual for the way Pulse Audio is setup, and so doing a bit of digging I found this fix.

> __*NOTE!*__ :  
This was only tested on Pop!_OS 21.10.  I have yet to test it on 22.04 (or later) as my audio setup changed so I had no need for this anymore!

&nbsp;

## Fix
I found [a post on Reddit](reddit.com/r/pop_os/comments/l2uvmy/guide_fixing_audio_inputoutput_automatically/) with some information on this.

### Steps
- `sudo gedit /etc/pulse/default.pa`
- Comment out:  `load-module module-switch-on-connect`
- Comment out:  `load-module module-switch-on-port-available`
- Reboot.

From this point on, I have (so far) not had any issues with my device changing.  However, I would say that disabling these settings _does_ mean that audio won't be switched automatically when a new device is plugged in (say some headphones) and for some people that might be frustrating!

&nbsp;