---
author: "Graham Balharrie"
title: "Installing Ventoy on NixOS"
description: "My method of installing Ventoy using NixOS"
date: 2025-06-22
draft: false
image: "title.jpg"
tags:
- linux
- nixos
- ventoy
categories:
- software
- linux

---

# What is Ventoy?

If you don't already know, [Ventoy](https://www.ventoy.net/) is a tool that turns a USB stick or SSD that you would normally write a single ISO image to, into a repository of them with a nice UI to select them at boot.

Imagine instead of writing your Linux or Windows ISO to the drive, you just drag and drop it on and then when you boot, you're presented with a nice UI to select one and boot it!  Amazing.


# Installing Ventoy using NixOS

I needed to recreate my [Ventoy](https://www.ventoy.net/) SSD, using my new Framework 13, running NixOS (25.04)

I struggled a little trying to install it, so I wrote my process here to help me in the future.

I didn't really need to add it to my permanent NixOS configuration, but I noticed a couple of issues when I tried to use Nix Shell.

The following are the steps I used to set it up using Nix Shell.


## Allow unfree and insecure packages

`export NIXPKGS_ALLOW_UNFREE=1`
`export NIXPKGS_ALLOW_INSECURE=1`


## Run Ventoy using Nix Shell

`nix-shell -p ventoy-full`


## Run the Ventoy web-ui

`sudo ventoy-web`