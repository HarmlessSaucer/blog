---
author: "Graham Balharrie"
title: "Modding a Look-ALite with ESPHome and Home-Assistant"
description: "Making it smart."
date: 2022-05-26
draft: false
image: "title.jpg"
tags:
- mod
- light
- rgb
- led
- look-alite
categories:
- home automation
- mod
---

## Overview

My partner gifted me a Darth Vader Look-ALite lamp a few years back.  It looks awesome, and as a gift it's great!  A lamp themed after your favourite characters that's battery or USB powered?  Super cool.  Until you use it, and realise it's a __SINGLE__ white LED in there.  It's basically useless as a lamp.  In fairness to the company behind it, if you read their website and packaging _carefully_ it never really suggests it could be used like a normal lamp and suggests it's more a decorative thing, but still.

I wanted to upgrade it.  So I took it apart and started taking some measurements and making some plans.

## The Plan

My plan was to fit a ring of addressable RGB LEDs inside the top of the lamp, that would connect to a ESP8266 or similar board to be controllable by Home-Assistant, and in our case therefore HomeKit & Siri.

## Components

- ESP8266 based micro-controller board (NodeMCU or similar)
- RGB LED ring (12x LEDs)
- Female-to-Female Jump Wire (Sometimes refered to as "Dupont Wire")


## Wiring


## Code

```
esphome:
  name: superman

esp8266:
  board: nodemcuv2

# Enable logging/Home Assistant API/OTA Updates
logger:
api:
ota:
  password: "GeneratedAutomaticallyByESPHome"

wifi:
  ssid: !secret wifi_ssid
  password: !secret wifi_password

  # Enable fallback hotspot (captive portal) in case wifi connection fails
  ap:
    ssid: "Superman Fallback Hotspot"
    password: "GeneratedAutomaticallyByESPHome"

captive_portal:

# LED Ring
# Using Pin D4 for connectivity to the LED ring
light:
  - platform: neopixelbus
    type: GRB
    variant: WS2811
    pin: D4
    num_leds: 12
    name: "Superman"
```


## Considerations

### Power

Powering off the 3.3v rail on the NodeMCU is not a great idea, but really the LEDs are so low power that this isn't really a concern for me.  Try it at your own risk!  But consider wiring the LEDs directly to 5v from the power input if you are using any different LEDs.