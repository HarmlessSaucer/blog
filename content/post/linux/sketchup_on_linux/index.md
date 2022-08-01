---
author: "Graham Balharrie"
title: "Sketchup on Linux"
description: "Running Sketchup on Linux using Wine."
date: 2022-05-19
draft: false
image: "banner.png"
tags:
- "linux"
- "sketchup"
- "wine"
categories:
- "linux"
---


## Overview

I've been using Sketchup on and off for a good few years now to design some of the projects at our house, including the last shed/workshop we built.  Sketchup has had a tumultuous past however and I _really_ dislike the new web-based version.

I still have a copy of the 2017 version stored on my NAS, but since my move to Linux as my daily driver I haven't been able to utilise it.


**Host OS:** Pop_OS! 22.04

**Sketchup Version:** `sketchupmake-2017-2-2555-90782-en-x64.exe`


## Basic Steps

- Update all your repository information:
`sudo apt update`

- Install Wine and Winetricks:
`sudo apt install wine winetricks`

## Configure Wine

- Run winecfg:
`winecfg`

- Switch the Windows version to `Windows 7`

## Install DotNET452 and corefonts etc

- Use WineTricks:
`winetricks vcrun2013 vcrun2015 corefonts`

- Create a new Wine prefix (for most applications, it's better to set its own prefix):

```
env WINEPREFIX=$HOME/winedotnet wineboot --ini
env WINEPREFIX=$HOME/winedotnet winetricks --force dotnet452 corefonts
```

## Install Sketchup

`wine sketchupmake-2017-2-2555-90782-en-x64.exe`

## Alternatives

- [FreeCAD](https://www.freecadweb.org/) - Steep learning curve compared to Sketchup. Doesnt have that "you can just think in 3D" aspect to it like Sketchup does. Can deal with plans and more complex setups things much better however.
  
- [BRL-CAD](https://brlcad.org/) - The ability to draw in 3D is quite similar in some ways to Sketchup.
  

## References:

- [WineHQ - SketchUp 2017](https://appdb.winehq.org/objectManager.php?sClass=version&iId=34500)
  
- [How to install Sketchup on Ubuntu | FOSS Linux](https://www.fosslinux.com/49664/install-sketchup-on-ubuntu.htm)
  
- [How to Install Sketchup3D in Ubuntu 20.04](https://linuxhint.com/install-sketchup-make-on-ubuntu/)
  
- [Sketchup on A Linux OS - #3 by DanRathbun - SketchUp - SketchUp Community](https://forums.sketchup.com/t/sketchup-on-a-linux-os/72607/3)
  
- https://www.reddit.com/r/Sketchup/comments/epmm7o/installing_sketchup_make_2017_on_linux_mint/
  
- [Download Microsoft .NET Framework 4.5.2 (Offline Installer) for Windows Vista SP2, Windows 7 SP1, Windows 8, Windows 8.1, Windows Server 2008 SP2, Windows Server 2008 R2 SP1, Windows Server 2012 and Windows Server 2012 R2 from Official Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=42642)
  
- [WineHQ - .NET Framework 4.5.2](https://appdb.winehq.org/objectManager.php?iId=31023&sClass=version)