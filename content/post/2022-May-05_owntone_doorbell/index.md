---
author: "Graham Balharrie"
title: "Owntone and Home-Assistant powered doorbell"
description: "Using OwnTone to play a doorbell sound through HomePods."
date: 2022-05-05
draft: false
image: "title.jpg"
tags:
- airplay
- owntone
- doorell
categories:
- home automation
---

## Overview
[OwnTone](https://owntone.github.io/owntone-server/INSTALL.html) is the new name of **forked-daapd**.  I was previously using forked-daapd as a way to play music to my HomePods via automations in [Home-Assistant](https://home-assistant.io).

I wanted a solution to play a sound through our HomePods when someone pressed the doorbell.  It seems that OwnTone and Home-Assistant might be able to do this - let's investigate!

&nbsp;

## Investigation

The OwnTone docs discuss the API usage and here I'll demonstrate what I tried using a VM running on `192.168.1.19`:



Clear the queue, add anything of kind "music" and play:

```
curl -X POST "http://192.168.1.19:3689/api/queue/items/add?expression=media_kind+is+music&clear=true&playback=start"
```

Get a list of artists:

```
curl -X GET "http://192.168.1.19:3689/api/library/artists"
```

**'Justin's House'** (the only file I have in this test library) is artistID: `8537665808708412949`

Get all the albums by artist 'Justin's House':
```
curl -X GET "http://192.168.1.19:3689/api/library/artists/8537665808708412949/albums"
```

The album, **'CBeebies'** is albumID: ```513209088573595807```

List the album tracks:

```
curl -X GET "http://192.168.1.19:3689/api/library/albums/513209088573595807/tracks"
```

The track, **'Who's at the Door?'** is trackID: ```21```

Can we play that trackID directly?

```
curl -X POST "http://192.168.1.19:3689/api/queue/items/add?uris=library:track:21&clear=true&playback=start"
```

&nbsp;

## Playing through Home-Assistant

As a rest command in Home-Assistant that would be:

```
rest_command: 
  doorbell_ring:
    url: "http://192.168.1.19:3689/api/queue/items/add?uris=library:track:21&clear=true&playback=start" 
    method: POST
```

Putting that into an automation like:

```
alias: Doorbell
description: ''
trigger:
  - platform: state
    entity_id: binary_sensor.doorbell
    to: 'on'
condition: []
action:
  - service: rest_command.doorbell_ring
mode: single
```
