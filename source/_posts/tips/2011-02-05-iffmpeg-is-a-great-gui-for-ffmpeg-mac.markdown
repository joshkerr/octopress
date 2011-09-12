---
layout: post
date: 2011-02-05
title: iffmpeg is a great gui for ffmpeg mac
excerpt: My new go-to video converter for MKV to MP4 conversions.
category: software
---
I'm big into movies and I like the [MKV][] format for storage, but iOS devices for watching.  Since Apple doesn't natively support [MKV][], I'm forced to remux into MP4.  I've tried a bunch of different tools for doing this, even came up with a [bash script][] (hosted on my [github][] account,) and now I'm using [iFFmpeg][], a new GUI for [FFmpeg][].  

[iFFmpeg][] is the first GUI That makes it possible for me to easily remux my MKV files into MP4.  Previous attempts at mastering the command-line or other GUI hacks, left me files that aren't compatible with Apple devices.  With this app (which I believe is new to the scene,) I can just select the "video stream passthrough" option, AAC conversion option and boom, my MKV's are magically (and quickly) turned into MP4 files compatible with Apple devices.  

My original files start off as 720p video encoded via h264, the audio is usually AC3 or DTS.  The final file has the exact same video with no changes, but audio re-encoded to AAC stereo.  Since my iPad and iPhone can't play 5 channel audio, there is no point for me to leave it.

![iffmpegscreen][]

Using [iFFmpeg][] is simple.  Just drag the video file into the app, choose a codec, and press start.  My favorite feature (other than the quick and high quality conversion) is the very clear indicator in the dock icon that shows how much remuxing (or encoding) is left on the current file.  The author plans to add a total batch indicator as well.

![iffmpegdock][]

The app is 8 euros and requires that you manually install the [FFmpeg][] binary.  They provide a link to a [static binary][] (I chose the 64bit variety) and installing it is as simple as dragging it into the app.  

I'm excited about this app because it uses one of the best video encoding engines [FFmpeg] and it has an author that seems to be really motivated about pushing out new features.   I'm keeping an eye on this one.

[iFFmpeg]:http://www.iffmpeg.com/
[FFmpeg]:http://www.ffmpeg.org
[iffmpegdock]:http://joshkerr.s3.amazonaws.com/images/iffmpegdock.png
[iffmpegscreen]:http://joshkerr.s3.amazonaws.com/images/iFFmpeg.png
[github]:http://github.com/joshkerr
[bash script]:https://github.com/joshkerr/mkvtom4v
[static binary]:http://ffmpeg.arrozcru.org/builds/
[MKV]:/2010/11/quickly-encode-mkv-to-mv4-compatible-with-ipad/