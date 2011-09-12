--- 
wordpress_id: 2502705581
layout: post
title: Repairing your disk with PGP whole disk encryption (Mac)
wordpress_url: http://joshkerr.com/post/2502705581
---
<p>You've got your boot drive encrypted using PGP’s <a href="http://www.symantec.com/business/whole-disk-encryption">whole disk encryption</a>.  Great, you are security conscious feeling all safe and secure, but how do you fix file system errors and disk issues?<br/></p>

<p>In the past, you would boot off of your Mac OS install DVD and run Disk Utility.  If you do that now, you'll kill your disk and won’t be able to boot anymore.  The problem is that the disk needs to be decrypted in order for you to repair the filesystem, but how can you do that with the install DVD?
 Short answer, you can’t.  Long answer, there is a way to repair your disk, but it will involve using a second drive in order to do it.  This post will walk you through how you can safely and quickly repair your encrypted boot drive.</p>

<p>You will need the following:</p>

<ul>
<li>Disk Utility (comes with your mac)</li>
<li><a href="http://www.shirt-pocket.com/SuperDuper/SuperDuperDescription.html">SuperDuper!</a></li>
<li>Extra USB or Firewire HD (I recommend a thumb drive)</li>
<li>15 gigs of free space</li>
</ul>
<p>First, you will need to install Mac OSX to the extra drive.  Do a minimal install to save space (if you are short on a space.)  You really only need the core OS.<br/></p>

<p>Second, boot off the extra drive into your newly installed OS and install all of the Apple updates by running “Software Update” from the Apple menu.</p>

<p><img src="http://joshkerr.s3.amazonaws.com/images/SuperDuper%21.png" alt="SuperDuper in action"/></p>

<p>Third, install PGP.<br/></p>

<p>Now you've got a bootable version of Mac OS X with PGP installed.  If you ever want to check your drive for errors, just boot off the newly created disk, use PGP to unlock your drive, and then run Disk Utility to fix it.  I used a USB drive so I could carry it around with me in case I needed a quick fix on the road.</p>
