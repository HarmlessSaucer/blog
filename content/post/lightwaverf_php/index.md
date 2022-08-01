---
author: "Graham Balharrie"
title: "LightWaveRF (Gen1) via PHP"
description: "Control LightWaveRF (Gen1) devices via PHP script, by sending UDP to the Hub."
date: 2013-05-19
draft: false
image: "summary.jpg"
tags:
- "home automation"
- "php"
- "lightwave"
categories:
- "home automation"
---


# LightwaveRF (Gen 1) via PHP
## Overview

A while ago I bought some home automation products using the [LightWaveRF](https://lightwaverf.com/) protocol from B&Q - a couple of lights, and a 'hub'.

It works great, is cheap, and is very easy to setup.  Great.  But, their mobile app **sucked**.  No two ways about it.  They’ve posted images on their website of a new, better app… but it’s never materialised.  I have tweeted them, and they have said they are ‘working on it’ but it’s been some time now. Still nothing.

So, in an effort to make a better interface I endeavoured to find a solution for myself.  I did some digging online and found a few tutorials on how to use PHP to control it.

I created a bunch of PHP on a simple Apache web server with file names in a syntax: `room_device_on/off.php`  (e.g. `bedroom_light_on.php`)

---

## Code
Here’s an example for the bedroom light on:

```
    <?php
    // Set ROOM Parameters
    $room = “bedroom”;
    $code = “000”;
    $id = “R2”;
    $state = “on”;
    $status = “F1”;
    $device = “lights”;
    $node = “D1”;
    // ====================

    //$room = $_GET[“room”];
    //$device = $_GET[“device”];
    //$state = $_GET[“state”];

    if (!isset($room)) die(“No Room Set ?!”);
    if (!isset($device)) die(“No Device Set ?!”);
    if (!isset($state)) die(“No State Set ?!”);

    $broadcast_string = $code . “,!” . $id . $node . $status . “|”;
    $port = 9760;
    $sock = socket_create(AF_INET, SOCK_DGRAM, SOL_UDP);
    socket_set_option($sock, SOL_SOCKET, SO_BROADCAST, 1);
    socket_sendto($sock, $broadcast_string, strlen($broadcast_string), 0, ‘255.255.255.255’, $port);
    socket_close($sock);

    ?>
    You turned it on!
```