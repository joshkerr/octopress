---
layout: post
date: 2010-11-07
title: quickly encode mkv to mv4 compatible with ipad
excerpt: a faster way to get your HD mkv files into your ios device
category: featured
---
I’m a big fan of watching movies on my Apple TV, iPad and sometimes iPhone.  There is a lot of free and legal content that is available to download from the net and I’ve been collecting it,[transcoding][] it, [tagging][] it and adding it to my iTunes library.

Since all of the device that I use to view the material support 720P, I am usually working with source content that is high-def and packaged in an [MKV][] container which is not supported by any of the IOS devices so I need to re-encode it.  In the past I used Handbrake which works wonders for taking a video in one format and transcoding it into another format.  This is a CPU intensive task and it can take an hour to encode a 40 minute video stream.

Seeking a faster way to get my videos into the correct format, I did a little research and learned that 720P MKV files actually contain a H.264 video stream.  You don’t need to transcode it.  To make these files compatible with an IOS device you just need to transcode the audio into AAC and then re-package into an MP4 or M4V container.

## MKVTools
Doing a bit more research I found [MKVTools][] which is essentially an Applescript app that will do this for you automatically resulting in a much faster conversion.  How much faster?  That same 40 minute video stream now transcodes in 4 minutes.  Since the video is already encoded, all you need to do is extract it, re-encode the audio, and then MUX it back together.

[![MKV Tools Screenshot][MKVToolsScreen]][MKVToolsScreen]

In MKVTools select the MP4 option, choose Pass Thru for video and AAC (2CH) for audio.  I also select the iPad under Device and then hit the **Convert** button.
	
I’ve been working with MKVTools for a few days now and it seems to work very well.  I haven’t noticed any strange artifacts in the video or audio, everything syncs up nicely and it even handles subtitles.  The price tag on this tool is $4.99 which I gladly paid.

## iFlicks
If you are an organization freak like myself, you probably want to tag your M4V files before you load them into iTunes.  This will ensure that they have the right descriptions, episode ID’s and even poster art.  The files will look just like the content you buy directly from the iTunes store.  I use a program called [iFlicks][] to do this.

iFlicks will take the output M4V file from MKVTools and lookup the file name in themoviedb.org and TVDB.com to try to determine what it is.  Once it determines the name of the movie or tv show, it will tag it with all the required data including the poster art.  Click the “Start” button and the results are written to the file and loaded into iTunes.  It couldn’t be easier.

[![Social Network iFlicks screenshot][SocialImage]][SocialImage]

[![iTunes Screenshot][iTunes]][iTunes]

iFlicks is $20 euros and the developer updates the application regularly.  There is however one catch in this workflow that can be easily resolved.  MKTools does not automatically load the resulting M4V files into iFlicks.  You have the manually drag them into the application.

## Hazel
This is where [Hazel][] comes into play.  Hazel is a folder watching service which can apply rules to those folders.  For me, I use it to look for processed M4V files and load them automatically into iFlicks.  You could probably achieve the same result using folder actions, but Hazel makes it so easy.

This workflow is great for getting MKV 720P files into iTunes and in a great high quality that is compatible with the latest IOS devices including the new Apple TV.  It would be really cool if someone were to build all this functionality into a single app.  (I’m talking to you Mr. MKVTools author.)

## iFlicks 1.3.0 Beta
It turns out that the newest version of iFlicks now support transcoding MKV files into M4V without the needing to re-encode the video.  This is great news and for those of you who want to try it out you can get it form their [Google Groups][].

[transcoding]:http://en.wikipedia.org/wiki/Transcoding
[tagging]:http://joshkerr.com/2010/04/21/use-iflicks-to-add-meta-data-to-your-movies
[MKV]:http://en.wikipedia.org/wiki/Matroska
[MKVTools]:http://www.emmgunn.com/mokgvm2dvd/mokgvmhome.html
[MKVToolsScreen]:http://joshkerr.s3.amazonaws.com/wp-content/uploads/MKVtools.png
[iFlicks]:http://www.iflicksapp.com/
[SocialImage]:http://joshkerr.s3.amazonaws.com/wp-content/uploads/The.Social.Network.2010.DvdScr.Xvid.AC3-THC.avi.png
[iTunes]:http://joshkerr.s3.amazonaws.com/wp-content/uploads/iTunes.png
[Hazel]:http://www.noodlesoft.com/hazel.php
[Google Groups]:href="http://groups.google.com/group/iflicks/browse_thread/thread/d10236fd31cd87f7