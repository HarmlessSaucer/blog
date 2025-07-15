---
author: "Graham Balharrie"
title: "Downloading thumbnails and descriptions from YouTube"
description: "Using 'ytdlp'"
date: 2025-07-15
draft: false
image: "title.jpg"
tags:
- linux
- nixos
- framework
- laptop
categories:
- hardware
- linux

---

# Why?

In writing my previous post about my new Framework 13 laptop, I needed a title image to put up with it.  However I didn't have easy access to the photos I'd taken of my new machine.

As a quick hack, I knew the thumbnail I created had a decent picture, but how could I download it?

I found the following flags for `ytdlp`:

```
yt-dlp --skip-download --write-thumbnail --write-description "URL"
```

(Where, `URL`, is the full YouTube video URL)

- `--write-thumbnail` - Will write the video thumbail to your disk, usually in '.webp' format
- `--write-description` - Will write a text file of the video description to your disk