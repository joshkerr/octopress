---
layout: post
date: 2010-12-28
title: repairing your disk with pgp whole disk encryption mac
excerpt: if you run pgp whole disk encryption you risk killing your entire hd if you don't repair your disk correctly
category: featured
---
You've got your boot drive encrypted using PGP’s [whole disk encryption][].  Great, you are security conscious feeling all safe and secure, but how do you fix file system errors and disk issues?

In the past, you would boot off of your Mac OS install DVD and run Disk Utility.  If you do that now, you'll kill your disk and won’t be able to boot anymore.  The problem is that the disk needs to be decrypted in order for you to repair the filesystem, but how can you do that with the install DVD?
 Short answer, you can’t.  Long answer, there is a way to repair your disk, but it will involve using a second drive in order to do it.  This post will walk you through how you can safely and quickly repair your encrypted boot drive.

You will need the following:


* Disk Utility (comes with your mac)
* <a href="http://www.shirt-pocket.com/SuperDuper/SuperDuperDescription.html">SuperDuper!</a>
* Extra USB or Firewire HD (I recommend a thumb drive)
* 15 gigs of free space

First, you will need to install Mac OSX to the extra drive.  Do a minimal install to save space (if you are short on a space.)  You really only need the core OS.

Second, boot off the extra drive into your newly installed OS and install all of the Apple updates by running “Software Update” from the Apple menu.

[![superduper]][superduper]

Third, install PGP.

Now you've got a bootable version of Mac OS X with PGP installed.  If you ever want to check your drive for errors, just boot off the newly created disk, use PGP to unlock your drive, and then run Disk Utility to fix it.  I used a USB drive so I could carry it around with me in case I needed a quick fix on the road.

[whole disk encryption]:http://www.symantec.com/business/whole-disk-encryption
[superduper]:http://joshkerr.s3.amazonaws.com/images/SuperDuper%21.png