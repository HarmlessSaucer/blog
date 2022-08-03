---
author: "Graham Balharrie"
title: "Removing image EXIF data in Linux"
description: "Using 'exiftool'."
date: 2021-12-13
draft: false
image: "banner.png"
tags:
- "linux"
- "image"
- "exif"
- "data"
categories:
- "linux"
---

## Overview

In creating this website, I wanted to use photos in the blog posts.
However, from a privacy point of view, I wanted to strip some of the EXIF data from the images to clear things like GPS coordinates etc.

---

## Installing EXIFTool

I am using [Pop!_OS](https://pop.system76.com), but these instructions should work for any Ubuntu/Linux Mint/Debian base etc OS.  

Check out the [EXIFTool documentation](https://www.exiftool.org/) for more information.

- Install EXIFTool:
```
sudo apt-get install libimage-exiftool-perl
```

&nbsp;

## Using EXIFTool

### Read all the EXIF data from an image:
```
exiftool image.jpg
```

&nbsp;

### Remove **all** metadata from an image:
```
exiftool -all= image.jpg
```

> You can apply this to multiple files, e.g. `exiftool -all= *` _or_ `exiftool -all= *.png` 

&nbsp;

### Remove only GPS metadata:
Once you have looked through the metadata tags that are read from the initial read command, you can remove specific ones:
```
exiftool -GPS*= -a
```
> The `-a` flag removes the same tag from different groups