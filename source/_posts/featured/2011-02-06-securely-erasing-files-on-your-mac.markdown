---
layout: post
date: 2011-02-06
title: securely erasing files on your mac
excerpt: If you are a paranoid about selling your HD on eBay, read this.
category: tips
---
When you delete a file on your computer, you aren't actually deleting the file, you are deleting the reference or pointer to the file.   This means that it is very easy for a skilled computer person to recover that file (if it hasn't been overwritten by the OS.)  Even a file that has been overwritten many times can still be recovered because it leaves an imprint on the platter of your HD which can be examined with the right equipment.

So how do you properly erase a file?  Well, the Mac actually comes with a command called "Secure Empty Trash" which can be accessed from the *File* menu in the Finder.  This command will use the standard recommended by the U.S. Department of Defense for erasing magnetic media.  This is good enough for most people, but if you are extra paranoid, you can use Disk Utility.  

![Disk Utility][]

Disk Utility has the ability to do a 35 pass erase which should eradicate any data.  To make this work, you would delete your file by dropping it in the Trash and then use Disk Utility to erase your free space.  This could take quite some time given that it has to overwrite each file 35 times with random data.

If you want a commercial product, I recommend a product called [BCWipe][] by Jetico.  This command-line app has a lot of options and deletes files a lot faster than the built-in Secure Empty Trash command.  It doesn't use a ton of your resources like Disk Utility does and although it is a commercial product, is reasonably priced when you consider the extra security it provides you.  BCWipe can also erase your whole disk which is perfect for when you decide to Ebay your computer.

[Disk Utility]:http://joshkerr.s3.amazonaws.com/images/Disk%20Utility.png
[BCWipe]:http://www.jetico.com/wiping-bcwipe/