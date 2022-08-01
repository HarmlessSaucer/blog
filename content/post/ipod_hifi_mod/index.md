---
author: "Graham Balharrie"
title: "iPod HiFi Raspberry Pi AirPlay Mod"
description: "Adding some modern connectivity to my favourite speaker."
date: 2015-03-03
draft: false
image: "img_0971.jpg"
tags:
- "ipod"
- "hifi"
- "apple"
- "mod"
- "raspberry pi"
- "airplay"
- "volumio"
categories:
- "home automation"
- "mod"
- "raspberry pi"
---


# iPod HiFi Raspberry Pi AirPlay Mod

After a friend of mine fixed another friends iPod HiFi, I got to admire it’s simple beauty and slowly fell in love with it again. But it gave me an idea- if his was broken, maybe there were other broken ones, and I could fix it, and add a Raspberry Pi inside.  A quick Google later told me that no one had ever tried this (as far as I can see!) so all the more reason to give it a go!

I searched eBay and eventually came across one for ~£50.  It wasn’t in bad condition and actually still worked!  Bonus.  I won the bidding and it arrived a couple of days later – sadly, dented.  I messaged the seller and we agreed to take some money off and we were both happy.  The dent must have happened in shipping (it wasn’t in the photos) and it was on the back anyway.  I also had to pop the speaker dust cover out with some gaffa-tape.  It isn’t perfect, but it’s a definite improvement!

With the help of my good friend Cole (he fixed the original iPod HiFi mentioned above) we set to work in his shed taking it apart and deciding how best to go about modding it.  Ideally I wanted a seamless design- I wanted it to look and behave like the original device, but with the added bonus of AirPlay.  Just a note- I’m going to tell you a brief story of the mod, but I will not be giving you a step by step guide or telling you how to open it.  Use Google!

First off was the audio connection.  We took apart the aux jack assembly from the back of the casing, and tested which pins were which.  We found our ground, left and right with a multimeter and chopped the end off a jack to jack cable, soldering it in place to the pins on the back of the jack connector board. We tested that we had audio in to the iPod HiFi this way and ran in to our first problem.  The aux jack on the back of the iPod HiFi has some extra connections inside that ‘sense’ when you have a jack cable plugged in to send audio to the audio board inside- without this the internal aux we made would not work.  We fudged this by creating a make-shift ‘nubbin’ mini jack to keep plugged in the back (if anyone knows a way round this I’d be keen to find out!). Everything worked great so we moved on to power.

After toying with different ways of powering the Raspberry Pi inside the iPod HiFi, I decided to follow in the footsteps of the YouTube video creator muloburro by putting a iPad power adapter inside the iPod HiFi.  This works great because without the UK duck head adapter, I can easily butcher a standard figure-of-8 cable down to size and also use a standard USB-micro USB cable to power the Pi.  We cut the UK plug off the end of the figure of 8 cable and cut it to size.  We decided the easiest thing to do would be to cut the power input cable between the figure-8 input and the internal power supply and solder directly into this.  Some heat shrink tubing later we tested it and had power to both the speaker and the Raspberry Pi.

You can see the iPad power adapter sitting at the top of this picture.

Next came placement of the Pi board itself.  We tried both my older Raspberry Pi and the new Pi 2, and found that the best fit was the new Pi 2.  After a lot of playing around with placement of the board, we found the best place for it was in the upper left of the internals, where some foam used to reside.  We found there was a structural ‘strut’ just where we wanted to put the Pi that was getting in our way and not letting it fit.  This seemed to line up perfectly with one of the scew holes on the Pi.  Some sawing later, and we opened up the screw hole on the Pi so that it fit around this strut and the fit was much better, but not perfectly flat to the bottom.  We ended up having to snip a plastic cable guide that was getting in the way, but this was no big deal.

To make sure it fit, I took the casing off the (super cheap) audio interface.  You can also see from the picture of the Raspberry Pi, the notch that we took out of the board.

With the Pi in place we tested the fit with the USB sound card and wifi boards plugged in and it fit great.  Next was software.

I had some previous experience with running the Shairport app on Raspberry Pi from my BoomBox project, and this seemed to work well.  However after a bit of research I found two similar projects that I liked the look of.

Rune Audio – http://www.runeaudio.com/

Volumio – http://www.volumio.org/

I tested both builds on a spare Raspberry Pi I had around (1st Gen) and they worked really well.  I encountered some problems getting them both to run on the Raspberry Pi 2 however.  Rune Audio refused to boot (0.3 currently – 0.4 will soon be out and work with Pi2) and Volumio was EXTREMELY slow to boot.

For now I have put Volumio on the Pi2, until Rune Audio 0.4 is out and then I will swap over.

UPDATE:  I found a newer (unofficial) build of RuneAudio on the forums that now works great!

So far the results are excellent.  It sounds great and is all in one neat package!  Can’t ask for more!

This is the “nubbin” I end up with out the back of the unit, allowing me to play audio through.  I’ll probably spray this white to match at some point, and swap out the cable for an official Apple-white one because reasons.

Here’s a picture of the finished product:

It looks like an iPod HiFi because it is.  All the goodies are on the inside.  Massive thanks to Cole for helping me out with this project – he did all the hard work really!