---
author: "Graham Balharrie"
title: "Updating Docker Containers on Synology DSM"
description: "My method for keeping things up to date."
date: 2020-12-12
draft: false
image: "synology_docker.png"
tags:
- "synology"
- "docker"
- "update"
categories:
- "docker"
---

## Overview

Personally, I think the Synology DSM Docker implementation is **awesome**.  It's the UI that I wish Docker Desktop on macOS was _(with a few tweaks)_.

It's a super simple interface to use if you are new to Docker.  However, if you **are** new to Docker, it can be a little confusing to work out how to update a container/image.

Here I'll outline the steps I use (mostly for myself so I don't forget!) to update the containers you have running on your Synology.

> For reference I was originally running DSM 6.x when I wrote this, but these same steps have since worked successfully on DSM 7.x

---

## Steps

1. Login to your Synology DSM web interface
2. Open Docker
3. Find the container you want to update in the 'Container' tab and note the name of the image  
(e.g. `linuxserver/booksonic`)
4. Click on the 'Registry' tab and search for the image you noted in _Step 3_.
5. Double click the image and download the _'latest'_ using the popup.
6. Once the download is complete, in the _'Container'_ tab, stop the original container from _Step 3_.
7. Edit the name of the container to include something new, like "-backup"  
(e.g. `booksonic-backup`).
8. Right click the container and choose _"Settings > Duplicate settings"_.  Pick a name for the new container (you can use the original name, e.g. `booksonic`).  This will create a new container using the _new_ (latest) Docker image.  
9. Start the new container and verify that the application functions as expected. 
> _You will note that if you specified a port in the orignal container config, since it is "in use" Docker will pick a random port to use - View the config by viewing the details of the running container to find this._ 
10. Once you are happy, you can remove the _"-backup"_ container.  
11. You will need to specify a port in the new container config if you were using one previously.  If something goes wrong, you can revert to the _"-backup"_ container.