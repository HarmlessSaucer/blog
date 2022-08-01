---
author: "Graham Balharrie"
title: "Ubuntu 20.04 + Docker + Portainer on Proxmox"
description: "My Ubuntu VM config."
date: 2021-03-01
draft: false
image: "proxmox.jpg"
tags:
- "containers"
- "docker"
- "ubuntu"
- "linux"
- "virtualisation"
- "portainer"
- "proxmox"
categories:
- "docker"
- "linux"
---

> **NOTE** This document is evolving as I'm still writing it.  Reader beware!

## Overview
I wanted to setup a small test system on my Proxmox host to test out cool, community Docker images I find online, such as the ones from [LinuxServer.io](LinuxServer.io).

I therefore created an Ubuntu box on my Proxmox host to test them out.  This is how I did it.

---
## Setup
### Installing Proxmox

Download a [Proxmox ISO](https://proxmox.com/en/downloads/category/iso-images-pve) and flash the image to a USB drive using an app like [Balena Etcher](http://balena.io).

Follow the [setup instructions](https://www.proxmox.com/en/proxmox-ve/get-started) to install Proxmox to your machine.

<br>

### Install Ubuntu
#### Downloading Ubuntu Server

I used [Ubuntu Server 20.04.3 LTS](https://ubuntu.com/download/server) as the distrubution for this setup.

> If you are running a recent version of Proxmox VE (7.x or above) you can use the new _'Download from URL'_ function to download OS ISOs directly to the system.

- Visit your Proxmox webUI
- Click through _Datacenter > "hostname" > local (hostname)_
- Click on _'ISO Images'_
- Click _'Upload'_ and select an ISO image you downloaded to your local machine

OR

- Click _'Download from URL'_ and paste in a URL for an OS image _(e.g. `https://releases.ubuntu.com/20.04.3/ubuntu-20.04.3-live-server-amd64.iso`)
- Click _'Query URL'_
- Click _'Download'_

<br>

#### Creating the VM

- Click the blue _'Create VM'_ button in the top of the Proxmox webUI
- Enter a name in the _'name'_ field
- Click on the _'OS'_ tab
- Click on the _'ISO Image'_ drop-down and select the ISO image you downloaded previously
- Click on the _'Disks'_ tab
- Create a disk with a large enough size (I would recommend a minimum of 64GB - But you do you!)
- Click on the _'CPU'_ tab
- Explaining this section will be tricky, depending on your system hardware config.  For my simple Mac mini host, I chose `1 Socket` and `2 Cores`
- Click on the _'Memory'_ tab
- Again, this section will very much depend on the hardware in your system.  I chose to provide my VM with `8GB` of RAM.
- Click on the _'Confirm'_ tab
- Click on _'Finish'_

<br>

#### Installing Ubuntu

- Select the VM from the left hand side of the Proxmox webUI
- Click the _'Start'_ button 
- Click the _'Console'_ button to view the display of your new VM
- Follow the prompts from the Ubuntu installer to complete the installation (I kept things basic, not installing any additional software/Snaps etc.)
- Once complete, the VM will reboot and you will be at a login prompt in the console

<br>

#### Enabling QEMU Guest Agent

> There is a [guide for this](https://pve.proxmox.com/wiki/Qemu-guest-agent) also available on the Proxmox Wiki

- Select the VM from the left hand side of the Proxmox webUI
- Click the _'Shutdown'_ button to shutdown the VM safely
- Once complete, the VM name will be greyed-out on the left of the Proxmox webUI
- Click the _'Options'_ tab within the VM settings
- Click on _'QEMU Guest Agent'_ and double click on _'Disabled'_, ticking the box and pressing 'OK' to enable it
- Start the VM again and connect via the console
- Run the following commands:  
`sudo apt update`  
`sudo apt install qemu-guest-agent`
- Reboot the guest OS either by command line or the Proxmox webUI
- You will know things are working correctly once you can see the IP address for the machine in the _'Summary'_ page of the guest OS in the Proxmox webUI

<br>

### Installing Docker

SSH from your local machine to the VM, or use a console through the Proxmox web interface.

- Update your package lists:  `sudo apt update`

- Upgrade all the things: `sudo apt upgrade`

- Install the dependencies:  
```
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
```

- Import the GPG Key:
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

- Add the Docker repo: 
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

- Update package lists again: `sudo apt update`

- Install Docker: `sudo apt install docker-ce docker-ce-cli containerd.io`

- Install Docker-Compose: `sudo apt install docker-compose`

- Check Docker started okay: `sudo systemctl status docker`

- Verify the installation by starting a _'hello-world'_ container:  `docker run --rm hello-world`

<br>

#### Fixing "Permission denied" error running `docker` without root
1. Create a group called "docker" with the following command (the group may already exist):
	- `$ sudo groupadd docker`
2. Add your user to the docker group:
	- `sudo usermod -aG docker $USER`
3. After you have added the user to the docker group, logout and back in for the changes to take effect.  Otherwise, run the following command:
	- `newgrp docker`  

<br>    

### Installing Portainer

- Create a volume for Portainer to use:  `sudo docker volume create portainer_data`

- Now create the Portainer container: 
```
sudo docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /srv/portainer:/data portainer/portainer
```

- Start the container: `sudo docker start portainer`  
Portainer should now be running on port `9000` on your host.  
Check the IP address of your host with: `ip a` or `ifconfig`

- Visit the web UI for Portainer by visiting the IP with port `:9000`  (e.g.  [http://192.168.1.55:9000](http://192.168.1.55:9000))

- You'll need to create a new password for the `admin` user on first login and press `Create user`.

- Then on the next screen, select `Local` and press `Connect`.  
You should now be connected to your Portainer instance!