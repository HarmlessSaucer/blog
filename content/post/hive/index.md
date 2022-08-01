---
author: "Graham Balharrie"
title: "Hive Python"
description: "A script to control the Hive heating system via Python."
date: 2016-01-29
draft: false
image: "banner.png"
tags:
- "home automation"
- "python"
- "hive"
categories:
- "home automation"
---


# HivePython
- [Github](https://github.com/HarmlessSaucer/HivePython)

> NOTE:  This code is from 2016.  There have been SEVERAL changes to the Hive website, app and ecosystem since then and I stopped using their products a _long_ time ago!

---

## Overview 

This code allows you to read temperature values from the Hive website using Python.

This is a quick and dirty Python script I have put together to read temperature values from the Hive site. [https://www.hivehome.com/](https://www.hivehome.com/)

---

## Usage

The intended usage for this was for this script to run and scrape data, feeding it into [Home-Assistant](https://www.home-assistant.io/).

Change the following values: `hiveuser = "USERNAME@EMAIL.NONE"` `hivepass = "123456789"`

The script will create the following variables that you can then use: `inside` `outside` `target`