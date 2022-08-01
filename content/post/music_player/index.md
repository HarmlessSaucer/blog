---
author: "Graham Balharrie"
title: "RFID Music Player"
description: "Building a AirPlay RFID music player for my daughter using Home-Assistant."
date: 2020-08-04
draft: false
image: "summary.jpg"
tags:
- "home automation"
- "home assistant"
- "music"
- "rfid"
- "tag"
categories:
- "home automation"
- "home-assistant"
---

# RFID Music Player
## Inspiration

Before starting this project I'd seen some awesome examples of this idea online over the years, but the ones that really excited me were the ones I'd seen using [Home Assistant](https://www.home-assistant.io):

- [RFID Jukebox by hooveman on YouTube](https://www.youtube.com/watch?v=AvCseOQidSw)
- [Tweet by Paulus Schoutsen @balloob](https://twitter.com/balloob/status/1006222676644515841?s=20)

---

## Goal

I wanted to acheive a similar thing to the examples above, where someone (mainly our daughter) could 'swipe' an RFID card over a reader to start playing some music. The only difference being unlike the projects above, we don't use Sonos or Chromecasts at home: we use AirPlay and HomePods.

---

## Components
#### Hardware
- [Apple HomePod](https://www.apple.com/homepod)
- [Apple HomePod mini](https://www.apple.com/homepod-mini/)
- [ESP32 board](https://www.espressif.com/en/products/socs/esp32)


#### Software
- [Home-Assistant](https://home-assistant.io)
- [ESPHome](https://esphome.io)
- [Forked-daapd](https://github.com/ejurgensen/forked-daapd)

---

## Setup
### ESPHome

Using [ESPHome](https://esphome.io) inside Home-Assistant, I created the following yaml and flashed it to an NodeMCU board.
```
esphome:
  name: isabella_music
  platform: ESP8266
  board: nodemcuv2

wifi:
  ssid: !secret esphome_wifi_ssid
  password: !secret esphome_wifi_password
  fast_connect: true
  # Enable fallback hotspot (captive portal) in case wifi connection fails
  ap:
    ssid: "Isabella Music Fallback Hotspot"
    password: "superSecurePassword"

captive_portal:

# Enable logging, Home-Assistant API and OTA updates
logger:
api:
ota:

# Tag Reader
spi:
  clk_pin: D0
  miso_pin: D1
  mosi_pin: D2

pn532:
  cs_pin: D3
  update_interval: 1s

  # What happens when a tag is read
  on_tag:
    then:
    - homeassistant.tag_scanned: !lambda 'return x;'
```


### Home-Assistant
```
rest_command: 
  bibble_music_nick_cope_bear:
    url: "http://192.168.1.5:3689/api/queue/items/add?uris=library:track:1&clear=true&playback=start"
    method: POST
```


Automation:
```
alias: Tag A3-78-B9-03 is scanned
description: 'Tag Test'
trigger:
  - platform: tag
    tag_id: A3-78-B9-03
action:
  - service: rest_command.bibble_music_nick_cope_bear
mode: single
```