---
author: "Graham Balharrie"
title: "Reolink Camera Streams"
description: "How to access the stream URLs in Home-Assistant and other apps"
date: 2021-11-20
draft: false
image: "banner.png"
tags:
- camera
- reolink
- stream
categories:
- "home automation"
- "network"
---

## Overview

I installed some Reolink cameras around my house for various uses.
Whilst their app is actually quite good, I want to keep things local-only and therefore set them up to _not_ talk to the internet through VLAN settings on my UniFi Dream Machine Pro.

This means I need an alternate way to view the the video streams, and also make these available to other apps, like Home-Assistant.

It took some Googling to find the information on how to do this, hence I am documenting it here.

---

## Stream URLs

_Low Quality Stream_

```
rtsp://admin:<password>@<IP Address>/h264Preview_01_sub
```

_High Quality Stream_

```
rtsp://admin:<password>@<IP Address>/h264Preview_01_main
```

For convenience, you can save these strings as `.asf` files and then drag them into VLC to test.