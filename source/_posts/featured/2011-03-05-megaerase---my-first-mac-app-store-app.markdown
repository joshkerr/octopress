---
layout: post
title: MegaErase - my first Mac App Store app
excerpt:
category:
---

I've been interested in learning more about the Mac App store so I figured I'd whip up something in my spare time.  Being security conscious I decided to write a simple secure erase program that I could access via the menu bar.  The use case is that there are several files that I need to securely erase and rather than "secure empty" my trash which could take hours, I could just drag those files into a menu bar icon which would securely erase them. 

When I say securely erase, I mean the type of delete procedure where the file cannot be retrieved (EVER.)  So I whipped me up an app.  You erase files by dropping the on the menu bar icon:

![menu bar icon][]

This is the dialog that will appear:

![delete dialog][]

You can see what is happening in the background via the console window:

![console][]

And lastly here is the preferences dialog:

![preferences][]

This is a work in progress so there are a lot of elements that need to be completed.  I wrote the app in Xcode 4 in about 6 hours a few weekends ago.  It is multi-threaded and uses the standard unix srm command to destroy the files.  I plan to make it so that you can switch up the delete command so that the app uses a different command line app (like bcwipe.)  

I want to implement a queue which would persist between launches of the app.  That way you could queue up a ton of files, turn off your computer, turn it back on and let the app continue where it left off.  You should also be able to queue up more files while it is currently operating on a series of files.

I think I'm going to give it away for free.   I haven't released it to the Mac App Store yet but plan to in the next day or so.

[menu bar icon]:http://joshkerr.s3.amazonaws.com/images/MegaErase.png
[delete dialog]:http://joshkerr.s3.amazonaws.com/images/Deleting%20files.png
[preferences]:http://joshkerr.s3.amazonaws.com/images/Preferences.png
[console]:http://joshkerr.s3.amazonaws.com/images/MegaErase%20Console.png
