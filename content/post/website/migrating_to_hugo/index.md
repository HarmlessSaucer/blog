---
author: "Graham Balharrie"
title: "Migrating my website to Hugo"
description: "Moving from MKDocs. Thank god for Markdown."
date: 2022-05-06
draft: true
image: "hugo.png"
tags:
- "mkdocs"
- "hugo"
- "blog"
- "website"
categories:
- "website"
---

## History

I previously wrote about moving my website over to MKDocs, [(check out it's website)](https://mkdocs.org) from it's original home in public Wordpress.  I wanted to have something that I could self-host and I've been really getting into using Markdown for both technical writing at work and note taking at home, so having something where I could keep my writing in .md files was perfect.

Over a little bit of time though, I found that I was really stretching what MKDocs could do.  After all, it's designed for documentation.  I had tweaked a theme, but it was just not how I wanted it to be.  

That's when I thought I'd have another look at [(check out it's website)](https://gohugo.io).  For those unaware, as with MKDocs it's a static site generator.

---

## Why Hugo?

The main reason was simple:  look and feel.

MKDocs was great because I knew it and I could get it up and going quickly.  I was also able to build it programatically too, via CI/CD.  
However, it was definitely a documentation system and however much I tried, it didn't ever look or feel the way I wanted.

Hugo however is definitely designed to be a website first and the themes it has look great.

Similar to MKDocs, Hugo works with content written in Markdown (.md) files.  All my content was already in this format so the transfer was really simple.  



---