---
author: "Graham Balharrie"
title: "Migrating my website to Hugo"
description: "Moving from MKDocs. Thank god for Markdown."
date: 2022-05-06
draft: false
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


## Making the move

Thankfully, both MKDocs and Hugo (as well as _many_ other static site generators!) use Markdown for their documents/pages/posts.  Since I am already writing my notes in Markdown and saving them on my server and in Git, it was fairly trivial to move documents over to Hugo.  A couple of peices of the 'front matter' had to change at the top of the file.  For those unaware, 'front matter' is meta data that is added to the top of a markdown file that is picked up by the static site generator to add extra content to your page or post.  A good example of this would be the title, description and date of this post are all 'front matter'.  You can read more about how Hugo handles 'front matter' [in their documentation](https://gohugo.io/content-management/front-matter/).

The 'front matter' for this post as an example (at the time of writing) is:

```
---
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
```

---

## Deploying the site

Previously, I was self-hosting the MKDocs version of this site in my homelab using a Nginx docker container containing the content, which was built by Drone CI every time I made a commit to the main branch of my Git repo (that I host with Gitea in my homelab).

I want to move away from having anything at all public-facing having any connectivity to my LAN currently, so I have decided to look into either using [Github Actions](https://github.com/features/actions) and [Github Pages](https://pages.github.com) to build and deploy the site or similarly [Cloudflare Pages](https://pages.cloudflare.com).

Once I have a concrete solution for this I will likely outline this in another post.


---

## The Hugo theme

After a __LOT__ of searching the internet for Hugo themes I liked and wanted to use, I landed on this one.  ["Stack"](https://github.com/CaiJimmy/hugo-theme-stack) by Jimmy Cai.  It's wonderfully simple, and easy to tweak (although I've not found much need to!).  Check out the [Github repo](https://github.com/CaiJimmy/hugo-theme-stack) for info on the theme.