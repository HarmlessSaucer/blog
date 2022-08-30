---
author: "Graham Balharrie"
title: "Target Display Mode on Linux"
description: "Using my 2011 iMac as a monitor from Pop!_OS"
date: 2022-08-30
draft: true
image: "title.jpg"
tags:
- linux
- imac
- apple
- mac
- targetdisplaymode
- popos
categories:
- hardware
- software
- linux

---

## Overview

In building our shed/home office, I was looking for a both a Linux machine that I could keep down there as well as a display.

My Dad had an old (2011) 27" iMac laying around not doing much.  It's got an i5 CPU, 32GB RAM an SSD and a 2TB spinning rust drive inside.  The other great thing about this machine is that it can do [Target Display]() Mode via the included Mini Display Port.

I asked to borrow it off him to do some testing and immediately installed Pop!_OS (my current Linux distro of choice) onto it.  Everything worked great in Pop! and the machine itself is really snappy and more than usable for what I need!  However, Target Display Mode can only be triggered from macOS.

So I set about trying to find a way to do this in Pop!_OS.


Process

1. Download a copy of `smc_util`:
    [https://github.com/floe/smc_util/](https://github.com/floe/smc_util/)

2. Copy the entire `smc_util` folder to `/usr/local/bin`:

3. Edit the scripts as follows to add the full path to `SmcDumpKey` instead of `./SmcDumpKey` as was in the files originally:

    - `tdm_on.sh`:

        ```
        #!/bin/bash
        /usr/local/bin/smc_util/SmcDumpKey MVHR 1
        sleep 1
        /usr/local/bin/smc_util/SmcDumpKey MVMR 2
        sleep 2
        DISPLAY=:0.0 xrandr --output eDP --off
        ```

    - `tdm_off.sh`:

        ```
        #!/bin/bash
        /usr/local/bin/smc_util/SmcDumpKey MVHR 0
        sleep 1
        /usr/local/bin/smc_util/SmcDumpKey MVMR 2
        sleep 2
        DISPLAY=:0.0 xrandr --output eDP --auto
        ```

4. Make `root` the owner of the scripts:
```
chown root:root /usr/local/bin/smc_util/tdm_on.sh
chown root:root /usr/local/bin/smc_util/tdm_off.sh
chown root:root /usr/local/bin/smc_util/SmcDumpKey
```

5. Set the `setuid` bit on the scripts, with other desired permissions. (You should ensure the files are not writable.)

```
chmod 4755 /usr/local/bin/smc_util/tdm_on.sh
chmod 4755 /usr/local/bin/smc_util/tdm_off.sh
chmod 4755 /usr/local/bin/smc_util/SmcDumpKey
```

6. Edit the sudoers file `sudo visudo` to add the following:
```
ALL ALL=(ALL:ALL) NOPASSWD: /usr/local/bin/smc_util/tdm_on.sh
ALL ALL=(ALL:ALL) NOPASSWD: /usr/local/bin/smc_util/tdm_off.sh
ALL ALL=(ALL:ALL) NOPASSWD: /usr/local/bin/smc_util/SmcDumpKey
```

> **NOTE:** I chose to use `ALL` at the start of the above lines, as there will be multiple users running this script.  However, you should really think about whether this is needed - you could specify your own user (e.g. `graham`), or a group (e.g. `%admin`).

7. Add the custom keyboard shortcuts to execute the following commands:

    - On: `bash /usr/local/bin/smc_util/tdm_on.sh`
    - Off: `bash /usr/local/bin/smc_util/tdm_off.sh`