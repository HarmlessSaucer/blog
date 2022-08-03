---
author: "Graham Balharrie"
title: "Switching my website to MKDocs"
description: "Getting rid of Wordpress and self-hosting my site."
date: 2021-12-12
draft: false
image: "mkdocs.png"
tags:
- "mkdocs"
- "website"
- "blog"
categories:
- "website"
---

## What is MKDocs?

If you have never heard of MKDocs, [(check out it's website)](https://mkdocs.org) it's a static site generator, that's really geared towards use in the creation of documentation.

---

## Why MKDocs?

I first encountered it through my work, and investigating Open Source projects that I could use for a documentation platform.  I really liked how I could spin up a system that would be really easy to develop and create content on, but also my inner DevOps engineer loved that I could create a Docker environment for it and setup some sexy CI/CD to build everything for me.

After some success in work, and after a lot of failings with using [Gatsby](https://www.gatsbyjs.com) and [Hugo](https://gohugo.io) trying to build my own site all-over-again, (nothing against those frameworks, it was my own ignorance that meant I couldn't get my head around them!) I decided to give MKDocs a go for this task. 

I found that my previous successes with it really helped, and I got going to a place I liked _REALLY_ quickly.

---

## What other tools am I using?

Getting going fast was due mainly to the wonderful [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) by Squidfunk (Martin Donath).  If you are trying out MkDocs, be sure to check out this theme - it's beautiful and super easy to use.

Aside from that I setup a small development environment in my homelab around a couple of Docker containers to build the site and serve it up.  I am committing my code to a local [Gitea](https://gitea.com) instance in my homelab for source control, and CI/CD is being handled by [Drone](https://drone.io), again running in my homelab.

This is great, because I get automated test builds of the site for every code comit and I can still use the `mkdocs serve` command on my local machine to test.

## Resources

Here are some resources I found useful in this process:

- [MkDocs User Guide](https://www.mkdocs.org/user-guide/)
- [Material for MkDocs by Squidfunk on GitHub](https://github.com/squidfunk/mkdocs-material)
- ['Build a Blog With GitHub and MkDocs' by BetterProgramming.pub](https://betterprogramming.pub/build-a-blog-with-github-and-mkdocs-cf47914affa7)
- ['Deploying mkdocs using DroneCI and Gitea' by Alex Kretzschmar](https://blog.ktz.me/deploying-mkdocs-using-droneci/)

&nbsp;