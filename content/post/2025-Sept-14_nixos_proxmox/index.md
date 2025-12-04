---
author: "Graham Balharrie"
title: "Creating NixOS images for Proxmox"
description: "Building NixOS LXC containers for Proxmox"
date: 2025-09-14
draft: false
image: "title.jpg"
tags:
- linux
- nixos
- proxmox
categories:
- software
- linux

---

# About NixOS

For those unaware, NixOS is a declarative OS based on the Nix package manager.
I've been exploring it recently on my Framework 13" laptop and I wanted to try it out in my homelab.

You can read more about NixOS [on the website](https://nixos.org/).

&nbsp;


# Using NixOS in the homelab

I tried to use NixOS in my homelab previously, creating a full blown NixOS VM and configuring it.  This worked but seemed a bit cumbersome and whilst it worked, I didn't see much advantage over the docker VM/CT images I had already created. 

I came accross this blog post by Josh Lee about using the `nixos-generate` package to create a VM image:
https://www.joshuamlee.com/nixos-proxmox-vm-images/

This solution uses the `nixos-generate` command to create a whole VM image based on a Nix configuration file that can then be restored on to your Proxmox host.

The benefit of this is that you end up with hosts that are stateless, configuration can be centrally contained via Git and updates can be triggered remotely.


&nbsp;

# Steps

1. Create the container image:
`nixos-generate -f proxmox -c configuration.nix`
Where `configuration.nix` is your Nix config file for the host.  [Josh Lee has a great example on his blog.](https://www.joshuamlee.com/nixos-proxmox-vm-images/)
The output will be a `.vma.zst` file in your `/nix/store/` folder

2. Copy the file to Proxmox with `scp` (or similar):
`scp /nix/store/9...-proxmox-nixos-25.11pre-git/vzdump-qemu-nixos-25.11pre-git.vma.zst root@<yourProxmoxHost>:/tmp`

4. Login to your Proxmox host via SSH or visit the shell in the web UI (Datacenter > PVE Hostname > Shell) 

5. Change to `/tmp`: `cd /tmp`

6. Uncompress the file with:
`unzstd vzdump-qemu-nixos-25.11pre-git.vma`

7. Import into Proxmox, specifying a VM/CT number:
`qmrestore vzdump-qemu-nixos-25.11pre-git.vma 105`